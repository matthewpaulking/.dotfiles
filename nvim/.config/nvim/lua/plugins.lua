local packer = require('lib.packer-init')

packer.startup(function(use)
    use({ 'wbthomason/packer.nvim' }) -- Let packer manage itself

    use({ 'tpope/vim-surround' })
    use({ 'tpope/vim-repeat' })
    use({ 'tpope/vim-unimpaired' })
    -- use({ 'tpope/vim-commentary' })
    use({ 'nelstrom/vim-visual-star-search' })
    use({
        'numToStr/Comment.nvim',
        config = function()
            require('setup.comment')
        end,
    })
    use({ 'wellle/targets.vim' })
    use({
        'mattn/emmet-vim',
        config = function()
            require('setup.emmet')
        end,
    })

    -- Colorscheme
    use({
        'EdenEast/nightfox.nvim',
        config = function()
            require('setup.nightfox')
        end,
    })

    -- Git
    -- use({ 'mhinz/vim-signify' })

    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'kyazdani42/nvim-web-devicons' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            { 'nvim-telescope/telescope-live-grep-raw.nvim' },
        },
        config = function()
            require('setup.telescope')
        end,
    })

    -- nvim tree
    use({
        'kyazdani42/nvim-tree.lua',
        requires = {
            { 'kyazdani42/nvim-web-devicons' },
        },
        config = function()
            require('setup.nvim-tree')
        end,
    })

    -- Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('setup.treesitter')
        end,
    })
    use({ 'windwp/nvim-ts-autotag' })
    use({ 'windwp/nvim-autopairs' })
    use({
        'simrat39/symbols-outline.nvim',
        config = function()
            require('setup.symbols-outline')
        end,
    })

    -- LSP
    use({
        'neovim/nvim-lspconfig',
        config = function()
            require('setup.lspconfig')
        end,
    })

    -- PHP
    use({ 'phpactor/phpactor' })

    -- Autocompletion
    use({ 'hrsh7th/cmp-nvim-lsp' })
    use({ 'hrsh7th/cmp-buffer' })
    use({ 'hrsh7th/cmp-path' })
    use({ 'hrsh7th/cmp-cmdline' })
    use({ 'hrsh7th/nvim-cmp' })
    use({ 'hrsh7th/cmp-vsnip' })
    use({
        'hrsh7th/vim-vsnip',
        config = function()
            require('setup.cmp')
        end,
    })

    -- Debugging
    use({
        'mfussenegger/nvim-dap',
        config = function()
            require('setup.dap')
        end,
    })
    use({
        'rcarriga/nvim-dap-ui',
        requires = { 'mfussenegger/nvim-dap' },
        config = function()
            require('setup.dap-ui')
        end,
    })

    -- Formatting
    use({
        'sbdchd/neoformat',
        config = function()
            require('setup.neoformat')
        end,
    })

    -- Git
    use({
        'kdheepak/lazygit.nvim',
        config = function()
            require('setup.git')
        end,
    })

    -- Testing
    use({
        'vim-test/vim-test',
        config = function()
            require('setup.vimtest')
        end,
    })
    use({ 'tpope/vim-dispatch' })

    use({
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('setup.indent-blankline')
        end,
    })

    use({
        'karb94/neoscroll.nvim',
        config = function()
            require('setup.neoscroll')
        end,
    })
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('setup.lualine')
        end,
    })
    use({
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('setup.colorizer')
        end,
    })
    use({ 'ggandor/lightspeed.nvim' })
    use({ 'L3MON4D3/LuaSnip' })
    use({
        'lewis6991/gitsigns.nvim',
        config = function()
            require('setup.gitsigns')
        end,
    })

    -- Writing
    use({
        'dkarter/bullets.vim',
        config = function()
            require('setup.markdown')
        end,
    })
    use({
        'npxbr/glow.nvim',
        config = function()
            require('setup.glow')
        end,
    })
    use({
        'folke/zen-mode.nvim',
        config = function()
            require('setup.zenmode')
        end,
    })
    use({
        'folke/twilight.nvim',
        config = function()
            require('setup.twilight')
        end,
    })

    use({
        'folke/trouble.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('setup.trouble')
        end,
    })
    use({
        'folke/todo-comments.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('setup.todocomments')
        end,
    })
    use({
        'ThePrimeagen/harpoon',
        config = function()
            require('setup.harpoon')
        end,
    })

    -- Bookmarked to try later
    -- use({ 'windwp/nvim-spectre' })
end)
