return {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    keys = {
        { '<leader>dv', '<cmd>DiffviewOpen<cr>', desc = 'Diffview Open' },
        { '<leader>dd', '<cmd>DiffviewClose<cr>', desc = 'Diffview Close' },
        { '<leader>df', '<cmd>DiffviewFileHistory %<cr>', desc = 'Diffview Current File' },
        { '<leader>dr', '<cmd>DiffviewOpen origin/main..HEAD<cr>', desc = 'Diffview Code Review' },
    },
}
