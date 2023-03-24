local cmp_installed, cmp = pcall(require, "cmp")
if not cmp_installed then return end

local lspkind = require 'lspkind'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local handlers = require('nvim-autopairs.completion.handlers')

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done({
        filetypes = {
            ["*"] = {
                ["("] = {
                    kind = {
                        cmp.lsp.CompletionItemKind.Function,
                        cmp.lsp.CompletionItemKind.Method,
                    },
                    handler = handlers["*"]
                }
            },
            lua = {
                ["("] = {
                    kind = {
                        cmp.lsp.CompletionItemKind.Function,
                        cmp.lsp.CompletionItemKind.Method
                    },
                }
            },
            tex = false
        }
    })
)

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

vim.opt.completeopt = 'noinsert,menuone,noselect'

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        },
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'nvim_lua' },
    }),
    formatting = {
        format = function(entry, vim_item)
            if vim.tbl_contains({ 'path' }, entry.source.name) then
                local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
                if icon then
                    vim_item.kind = icon
                    vim_item.kind_hl_group = hl_group
                    return vim_item
                end
            end
            return lspkind.cmp_format({ with_text = true })(entry, vim_item)
        end
    },
    window = {
        documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
    },
})
