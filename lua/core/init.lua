local utils = require("utils")

local current_dir = utils.get_current_dir(...)

require(current_dir .. '.options')
require(current_dir .. '.keymaps')
require(current_dir .. '.colorscheme')
require(current_dir .. '.autocmd')
