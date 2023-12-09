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
    -- use({ 'rebelot/kanagawa.nvim' })
    --
    -- use({
    --     'sam4llis/nvim-tundra',
    --     config = function()
    --         require('setup.tundra-color')
    --     end,
    -- })

    -- Git
    use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })
    -- use({ 'mhinz/vim-signify' })

    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-tree/nvim-web-devicons', tag = "nerd-v2-compat" },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            { 'nvim-telescope/telescope-live-grep-raw.nvim' },
        },
        config = function()
            require('setup.telescope')
        end,
    })

    -- nvim tree
    use({
        'nvim-tree/nvim-tree.lua',
        requires = {
            { 'nvim-tree/nvim-web-devicons', tag = "nerd-v2-compat" },
        },
        config = function()
            require('setup.nvim-tree')
            -- require('setup.web-devicons')
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
    use({ 'nvim-treesitter/nvim-treesitter-textobjects' })
    use({
        'chrisgrieser/nvim-various-textobjs',
        config = function()
            require('various-textobjs').setup({ useDefaultKeymaps = true })
        end,
    })
    use({ 'nvim-treesitter/playground' })
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
    -- use({ 'hrsh7th/nvim-cmp' })
    use({
        'hrsh7th/nvim-cmp',
        config = function()
            require('setup.cmp')
        end,
    })
    use({
        'L3MON4D3/LuaSnip',
        config = function()
            require('setup.luasnip')
        end,
    })
    use({ 'saadparwaiz1/cmp_luasnip' })
    -- use({
    --     'L3MON4D3/LuaSnip',
    --     tag = 'v<CurrentMajor>.*',
    --     config = function()
    --         require('setup.luasnip')
    --     end,
    -- })
    -- use({
    --     'hrsh7th/vim-vsnip',
    --     config = function()
    --         require('setup.cmp')
    --     end,
    -- })

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
        requires = { 'nvim-tree/nvim-web-devicons', tag = "nerd-v2-compat" },
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
    -- use({
    --     'ggandor/leap.nvim',
    --     config = function()
    --         require('leap').add_default_mappings()
    --         -- require('setup.leap')
    --     end,
    -- })
    use({
        'folke/flash.nvim',
        config = function()
            require('setup.flash')
        end,
    })
    -- use({
    --     'ggandor/flit.nvim',
    --     config = function()
    --         require('flit').setup({
    --             keys = { f = 'f', F = 'F', t = 't', T = 'T' },
    --             -- A string like "nv", "nvo", "o", etc.
    --             labeled_modes = 'v',
    --             multiline = true,
    --             -- Like `leap`s similar argument (call-specific overrides).
    --             -- E.g.: opts = { equivalence_classes = {} }
    --             opts = {},
    --         })
    --     end,
    -- })
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
        requires = { 'nvim-tree/nvim-web-devicons', tag = "nerd-v2-compat" },
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
    use({ 'jesseleite/vim-tinkeray',
        config = function()
            require('setup.tinkeray')
        end,
    })
    use({ 'mickael-menu/zk-nvim' })
    use({
        'johmsalas/text-case.nvim',
        config = function()
            require('setup.text-case')
        end,
    })
    use({
        'epwalsh/obsidian.nvim',
        config = function()
            require('setup.obsidian')
        end,
    })
    -- use({
    --     'nvim-neorg/neorg',
    --     config = function()
    --         require('setup.neorg')
    --     end,
    --     requires = { 'nvim-lua/plenary.nvim', 'nvim-neorg/neorg-telescope' },
    -- })
    -- use({
    --     'folke/noice.nvim',
    --     config = function()
    --         require('setup.noice-options')
    --     end,
    --     requires = {
    --         'MunifTanjim/nui.nvim',
    --         -- 'rcarriga/nvim-notify',
    --     },
    -- })
    use('simrat39/rust-tools.nvim')
    use({
        'iamcco/markdown-preview.nvim',
        run = 'cd app && npm install',
        setup = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
        ft = { 'markdown' },
    })
    use({
        'danymat/neogen',
        config = function()
            require('neogen').setup({})
        end,
        requires = 'nvim-treesitter/nvim-treesitter',
    })
    use({ 'github/copilot.vim' })
    use({ 'folke/neodev.nvim' })
    -- Bookmarked to try later
    -- use({ 'windwp/nvim-spectre' })
end)
