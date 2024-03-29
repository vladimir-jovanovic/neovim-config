local installed, vscode = pcall(require, 'vscode')
if not installed then return end

local vscodeColors = require('vscode.colors')

vscode.setup({
    -- Enable transparent background
    transparent = false,
    -- Enable italic comment
    italic_comments = true,
    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,
    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#000000',
    },
    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg = vscodeColors.vscDarkBlue, bg = vscodeColors.vscLightGreen, bold = true },
    }
})

vscode.load()
