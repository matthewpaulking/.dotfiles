return {
    'folke/zen-mode.nvim',
    opts = {
        window = {
            width = 120,
            options = {
                number = false,
                relativenumber = false,
            },
        },
        plugins = {
            gitsigns = { enabled = true },
        },
    },
    keys = {
        { '<leader><leader>z', '<cmd>ZenMode<cr>', desc = 'Zen Mode' },
    },
}
