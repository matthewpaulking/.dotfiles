return {
    'cbochs/grapple.nvim',
    dependencies = {
        { 'nvim-tree/nvim-web-devicons', lazy = true },
    },
    keys = {
        { '<leader>m', '<cmd>lua require("grapple").toggle()<cr>' },
        { '<leader>M', '<cmd>lua require("grapple").toggle_tags()<cr>' },
        { '<leader>k', '<cmd>Grapple cycle_tags next<cr>' },
        { '<leader>j', '<cmd>Grapple cycle_tags prev<cr>' },
    },
}
