#!/usr/bin/env npx tsx

import "zx/globals";
import { existsSync } from "fs";

// ── Settings ────────────────────────────────────────────────────────────────

const SETTINGS_PATH = `${os.homedir()}/.claude/settings.json`;

const DESIRED_SETTINGS = {
	permissions: {
		ask: ["Bash(git commit:*)"],
		defaultMode: "plan",
	},
	model: "opusplan",
	fastMode: false,
	fastModePerSessionOptIn: false,
	alwaysThinkingEnabled: true,
	autoMemoryEnabled: false,
	enableAllProjectMcpServers: false,
	spinnerTipsEnabled: true,
	respectGitignore: true,
	effortLevel: "medium",
	availableModels: ["opusplan"],
};

// ── Plugins ──────────────────────────────────────────────────────────────────

const DESIRED_PLUGINS = [
	"superpowers@claude-plugins-official",
	"skill-creator@claude-plugins-official",
	"code-review@claude-plugins-official",
	"frontend-design@claude-plugins-official",
	// "typescript-lsp@claude-plugins-official",
	// "csharp-lsp@claude-plugins-official",
	"serena@claude-plugins-official",
];

// ── MCP Servers ───────────────────────────────────────────────────────────────

type StdioMcp = {
	name: string;
	transport?: never;
	command: string;
	args?: string[];
};

type HttpMcp = {
	name: string;
	transport: "http";
	url: string;
};

type McpServer = StdioMcp | HttpMcp;

const DESIRED_MCP_SERVERS: McpServer[] = [
	{
		name: "chrome-devtools",
		command: "pnpm",
		args: ["dlx", "chrome-devtools-mcp@latest"],
	},
];

// ── Helpers ───────────────────────────────────────────────────────────────────

function deepMerge(
	target: Record<string, unknown>,
	source: Record<string, unknown>,
): Record<string, unknown> {
	const result = { ...target };
	for (const key of Object.keys(source)) {
		const sourceVal = source[key];
		const targetVal = target[key];
		if (
			sourceVal !== null &&
			typeof sourceVal === "object" &&
			!Array.isArray(sourceVal) &&
			targetVal !== null &&
			typeof targetVal === "object" &&
			!Array.isArray(targetVal)
		) {
			result[key] = deepMerge(
				targetVal as Record<string, unknown>,
				sourceVal as Record<string, unknown>,
			);
		} else {
			result[key] = sourceVal;
		}
	}
	return result;
}

// ── Collect pending changes ───────────────────────────────────────────────────

const pending: (() => Promise<void>)[] = [];

// settings.json
const settingsDir = path.dirname(SETTINGS_PATH);
let existing: Record<string, unknown> = {};
if (existsSync(SETTINGS_PATH)) {
	const raw = await fs.readFile(SETTINGS_PATH, "utf-8");
	existing = JSON.parse(raw);
}
const merged = deepMerge(existing, DESIRED_SETTINGS);

// plugins
type PluginEntry = { id: string; status: string };
const installedPluginsRaw = await $`claude plugin list --json`.quiet();
const installedPlugins: Set<string> = new Set(
	(JSON.parse(installedPluginsRaw.stdout) as PluginEntry[]).map((p) => p.id),
);
const desiredPluginSet = new Set(DESIRED_PLUGINS);
const missingPlugins = DESIRED_PLUGINS.filter((p) => !installedPlugins.has(p));
const extraPlugins = [...installedPlugins].filter(
	(p) => !desiredPluginSet.has(p),
);

// Remove extra plugins from the merged settings preview
if (merged.enabledPlugins && typeof merged.enabledPlugins === "object") {
	for (const extra of extraPlugins) {
		delete (merged.enabledPlugins as Record<string, unknown>)[extra];
	}
}
const settingsChanged = JSON.stringify(existing) !== JSON.stringify(merged);

// MCP servers
const mcpListRaw = await $`claude mcp list`.quiet();
const configuredMcpNames: Set<string> = new Set(
	mcpListRaw.stdout
		.split("\n")
		.map((line) => line.match(/^(.+?):/)?.[1]?.trim())
		.filter(Boolean) as string[],
);
const missingMcp = DESIRED_MCP_SERVERS.filter(
	(s) => !configuredMcpNames.has(s.name),
);

// ── Preview ───────────────────────────────────────────────────────────────────

console.info(chalk.blue("\n── settings.json ──"));
if (settingsChanged) {
	console.info(chalk.yellow("final state:"));
	console.info(JSON.stringify(merged, null, 2));
} else {
	console.info(chalk.grey("already up to date"));
}

console.info(chalk.blue("\n── plugins ──"));
for (const p of DESIRED_PLUGINS) {
	if (installedPlugins.has(p)) {
		console.info(chalk.grey(`  ✓ ${p}`));
	} else {
		console.info(chalk.yellow(`  + ${p}`));
	}
}
for (const p of extraPlugins) {
	console.info(chalk.red(`  - ${p}`));
}

console.info(chalk.blue("\n── MCP servers ──"));
for (const s of DESIRED_MCP_SERVERS) {
	if (configuredMcpNames.has(s.name)) {
		console.info(chalk.grey(`  ✓ ${s.name}`));
	} else {
		console.info(chalk.yellow(`  + ${s.name}`));
	}
}

// ── Confirm ───────────────────────────────────────────────────────────────────

const hasChanges =
	settingsChanged ||
	missingPlugins.length > 0 ||
	extraPlugins.length > 0 ||
	missingMcp.length > 0;

if (!hasChanges) {
	console.info(chalk.green("\n✓ everything already configured"));
	process.exit(0);
}

const answer = await question(chalk.bold("\napply changes? (y/N) "));
if (answer.toLowerCase() !== "y") {
	console.info(chalk.grey("aborted"));
	process.exit(0);
}

// ── Apply ─────────────────────────────────────────────────────────────────────

if (settingsChanged) {
	if (!existsSync(settingsDir)) {
		await fs.mkdir(settingsDir, { recursive: true });
	}
	await fs.writeFile(SETTINGS_PATH, JSON.stringify(merged, null, 2));
	console.info(chalk.green("settings updated"));
}

for (const plugin of missingPlugins) {
	console.info(chalk.blue(`installing: ${plugin}`));
	await $`claude plugin install ${plugin}`;
	console.info(chalk.green(`installed: ${plugin}`));
}

for (const plugin of extraPlugins) {
	console.info(chalk.blue(`uninstalling: ${plugin}`));
	await $`claude plugin uninstall ${plugin}`;
	console.info(chalk.green(`uninstalled: ${plugin}`));
}

for (const server of missingMcp) {
	console.info(chalk.blue(`adding MCP server: ${server.name}`));
	if (server.transport === "http") {
		await $`claude mcp add --transport http ${server.name} ${server.url}`;
	} else {
		const args = server.args ?? [];
		await $`claude mcp add ${server.name} -- ${server.command} ${args}`;
	}
	console.info(chalk.green(`added: ${server.name}`));
}

console.info(chalk.green("\n✓ claude code configured"));
