local packer = require('lib.packer-init')

packer.startup(function(use)
    use({ 'wbthomason/packer.nvim' }) -- Let packer manage itself

    use({ 'tpope/vim-surround' })
    use({ 'tpope/vim-repeat' })
    use({ 'tpope/vim-unimpaired' })
    use({ 'tpope/vim-commentary' })
    use({ 'nelstrom/vim-visual-star-search' })
    use({ 'numToStr/Comment.nvim' })
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
    use({ 'mhinz/vim-signify' })

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

    -- LSP
    use({
        'neovim/nvim-lspconfig',
        config = function()
            require('setup.lspconfig')
        end,
    })

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
end)
