local installed, nvimtree = pcall(require, 'nvim-tree')
if not installed then return end

local nvim_tree_config = require "nvim-tree.config"

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local icons = require "icons"

local tree_cb = nvim_tree_config.nvim_tree_callback

nvimtree.setup {
    hijack_directories = {
        enable = true,
        auto_open = true
    },
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {
        "man",
        "git",
        "help",
    },
    filters = {
        custom = { "\\.git$" },
        exclude = { ".gitignore" },
        dotfiles = false
    },
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = true,
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":t",
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "after",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = icons.ui.ArrowOpen,
                    arrow_closed = icons.ui.ArrowClosed,
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = icons.diagnostics.Hint,
            info = icons.diagnostics.Information,
            warning = icons.diagnostics.Warning,
            error = icons.diagnostics.Error,
        },
        show_on_dirs = false
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = { 'fzf', 'help', 'git' },
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        hide_root_folder = false,
        side = "left",
        adaptive_size = true,
        mappings = {
            custom_only = false,
            list = {
                { key = "v", cb = tree_cb "vsplit" },
            },
        },
        number = false,
        relativenumber = false,
        signcolumn = 'yes'
    },
}
