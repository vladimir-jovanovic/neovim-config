local mason_installed, mason = pcall(require, 'mason')
if not mason_installed then return end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        'pyright',
        'lua_ls',
        "omnisharp"
    }
})
