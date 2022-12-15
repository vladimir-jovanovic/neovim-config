local installed, telescope = pcall(require, "telescope")
if not installed then return end

local actions = require "telescope.actions"
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", builtin.find_files, {})

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                ["<C-j>"] = actions.move_selection_next, -- move to next result
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
            },
        },
    },
})

telescope.load_extension("fzf")
