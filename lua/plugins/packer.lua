local status, packer = pcall(require, 'packer')
if not status then
    print('Packer is not installed')
    return
end

return packer.startup(function(use)
        use 'wbthomason/packer.nvim'

        use "nvim-lua/plenary.nvim"

        --colorscheme
        use 'Mofiqul/vscode.nvim'

        use 'kyazdani42/nvim-web-devicons'

        use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
        use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

        use 'nvim-tree/nvim-tree.lua'

        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use { 'windwp/nvim-ts-autotag' }

        -- fuzzy finding w/ telescope
        use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
        use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

        -- lsp helpers
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use 'neovim/nvim-lspconfig'
        use 'Issafalcon/lsp-overloads.nvim'

        -- autocompletion
        use 'onsails/lspkind-nvim'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-nvim-lua'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'

        use 'windwp/nvim-autopairs'

        use({ 'CosmicNvim/cosmic-ui', requires = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' } })
    end
    )
