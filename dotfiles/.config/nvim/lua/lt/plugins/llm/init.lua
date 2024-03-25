return {
  "huggingface/llm.nvim",
  opts = {
    -- lsp
    lsp = {
      bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls",
    },

    -- backend
    backend = "ollama",
    url = "http://localhost:11434/api/generate",
    request_body = {
      options = {
        -- max_new_tokens = 60,
        temperature = 0.2,
        top_p = 0.95,
      },
    },

    tokens_to_clear = { "<|endoftext|>" },
    fim = {
      enabled = true,
      prefix = "<fim_prefix>",
      middle = "<fim_middle>",
      suffix = "<fim_suffix>",
    },
    -- model = "bigcode/starcoder",
    model = "pxlksr/bigcode_starcoder2-15b:Q2_K",
    -- model = "starcoder2:7b",
    context_window = 8192,
    tokenizer = {
      repository = "bigcode/starcoder",
    },
    -- -- model
    -- model = "codellama:13b",
    -- tokens_to_clear = { "<EOT>" },
    -- fim = {
    --   enabled = true,
    --   prefix = "<PRE> ",
    --   middle = " <MID>",
    --   suffix = " <SUF>",
    -- },
    -- -- model = "mistral",
    -- context_window = 4096,
    -- tokenizer = {
    --   repository = "codellama/CodeLlama-13b-hf",
    -- },
    --
  },
}
-- return {
--   "David-Kunz/gen.nvim",
--   config = function()
--     require("chatgpt").setup()
--   end,
--   dependencies = {
--     "MunifTanjim/nui.nvim",
--     "nvim-lua/plenary.nvim",
--     "nvim-telescope/telescope.nvim",
--   },
--   keys = {
--     { "<leader>cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
--     { "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction", mode = { "n", "v" } },
--     { "<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", mode = { "n", "v" } },
--     { "<leader>ct", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", mode = { "n", "v" } },
--     { "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords", mode = { "n", "v" } },
--     { "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring", mode = { "n", "v" } },
--     { "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests", mode = { "n", "v" } },
--     { "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
--     { "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", mode = { "n", "v" } },
--     { "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
--     { "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },
--     { "<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit", mode = { "n", "v" } },
--     {
--       "<leader>cl",
--       "<cmd>ChatGPTRun code_readability_analysis<CR>",
--       desc = "Code Readability Analysis",
--       mode = { "n", "v" },
--     },
--   },
-- }
