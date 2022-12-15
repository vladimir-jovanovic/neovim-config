local mason_installed, mason = pcall(require, 'mason')
if not mason_installed then return end

local mason_lspconfig_installed, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_installed then return end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        'pyright',
        'sumneko_lua',
        "omnisharp"
    }
})
