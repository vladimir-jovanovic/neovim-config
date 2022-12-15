local lspconfig_installed, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_installed then return end

local lsp_signature_installed, lsp_signature = pcall(require, 'lsp-overloads')
if not lsp_signature_installed then return end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
    update_in_insert = true,
}
)

local on_attach = function(client, bufnr)

    local keymap = vim.keymap
    local lsp = vim.lsp
    local opts = { noremap = true, silent = true }

    keymap.set('n', '<leader>f', lsp.buf.format, opts)
    keymap.set('v', '<leader>f', lsp.buf.format, opts)
    keymap.set('n', 'gd', lsp.buf.definition, opts)

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    if client.server_capabilities.signatureHelpProvider then
        lsp_signature.setup(client, {})
    end
end

vim.lsp.set_log_level(vim.log.levels.OFF)

lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            }
        },
    },
    on_attach = on_attach
}

lspconfig.pyright.setup {
    on_attach = on_attach
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.g.OmniSharp_server_use_mono = 1

lspconfig.omnisharp.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    enable_editorconfig_support = true,
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true,
    analyze_open_documents_only = false,
    filetypes = { "cs", "vb" },
}
