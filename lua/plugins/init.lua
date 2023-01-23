local utils = require("utils")

local current_dir = utils.get_current_dir(...)

require(current_dir .. '.packer')
require(current_dir .. '.vscode')
require(current_dir .. '.telescope')
require(current_dir .. '.treesitter')
require(current_dir .. '.nvim-tree')
require(current_dir .. '.bufferline')
require(current_dir .. '.lualine')
require(current_dir .. '.autopairs')
require(current_dir .. '.lsp-kind')
require(current_dir .. '.cmp')
require(current_dir .. '.mason-lsp')
require(current_dir .. '.lspsaga')
require(current_dir .. '.lsp')
