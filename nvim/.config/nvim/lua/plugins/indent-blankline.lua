return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {
        enabled = false,
    },
    keys = {
        { '<Leader>ib', '<cmd>IBLToggle<CR>', { silent = true } },
    },
}
