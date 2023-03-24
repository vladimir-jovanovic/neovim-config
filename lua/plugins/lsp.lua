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

local cosmic_ui_installed, cosmic_ui = pcall(require, 'cosmic-ui')
if not cosmic_ui_installed then return end

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>d', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

    --
    --vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    --vim.keymap.set('n', '<space>wl', function()
    --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --end, bufopts)
    --
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', cosmic_ui.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', cosmic_ui.code_actions, bufopts)
    vim.keymap.set('v', '<leader>ca', cosmic_ui.range_code_actions, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)

    if client.server_capabilities.signatureHelpProvider then
        lsp_signature.setup(client, {})
    end
end

vim.lsp.set_log_level(vim.log.levels.OFF)

lspconfig.lua_ls.setup {
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
    cmd = { "/usr/local/bin/omnisharp-roslyn/OmniSharp" },
    capabilities = capabilities,
    on_attach = on_attach,
    enable_editorconfig_support = true,
    enable_roslyn_analyzers = false,
    organize_imports_on_format = true,
    enable_import_completion = true,
    analyze_open_documents_only = false,
    filetypes = { "cs", "vb" },
}

lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
}


local default_node_modules = vim.fn.getcwd() .. "/node_modules"

local ngls_cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    default_node_modules,
    "--ngProbeLocations",
    default_node_modules,
    "--experimental-ivy",
}

lspconfig.angularls.setup {
    cmd = ngls_cmd,
    on_new_config = function(new_config)
        new_config.cmd = ngls_cmd
    end,
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.html.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.jsonls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
