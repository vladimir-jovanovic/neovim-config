
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for k, p in pairs(disabled_built_ins) do
  vim.g["loaded" .. p] = 1
end

if vim.g.vscode then
    require("core.keymaps")
else
    require('plugins')
    require('core')
end

