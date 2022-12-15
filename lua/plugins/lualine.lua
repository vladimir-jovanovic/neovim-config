local installed, lualine = pcall(require, 'lualine')
if not installed then return end

local icons = require 'icons'

lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'vscode',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'packer', 'NVimTree' }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { {
            'filename',
            file_status = true, --
            path = 0
        } },
        lualine_x = {
            {
                'diagnostics',
                sources = { "nvim_diagnostic" },
                symbols = {
                    error = icons.diagnostics.Error,
                    warn = icons.diagnostics.Warning,
                    info = icons.diagnostics.Info,
                    hint = icons.diagnostics.Hint
                }
            },
            'encoding',
            'filetype'
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { {
            'filename',
            file_status = true,
            path = 1
        } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = { 'fugitive' }
})
