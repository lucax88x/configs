--  _                 _                     _
-- | |               | |                   (_)
-- | |_   _  ___ __ _| |_ _ __ __ _ _________
-- | | | | |/ __/ _` | __| '__/ _` |_  /_  / |
-- | | |_| | (_| (_| | |_| | | (_| |/ / / /| |
-- |_|\__,_|\___\__,_|\__|_|  \__,_/___/___|_|
--
if vim.g.vscode then
else
  require("lt.defaults")
  require("lt.neovide")
  require("lt.project")
  require("lt.lazy")
end
