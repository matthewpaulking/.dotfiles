vim.keymap.set('n', '<Leader>mz', '<cmd>ZenMode<CR>', { silent = true })

require('zen-mode').setup({
    window = {
        width = 80,
        options = {
            number = false,
            relativenumber = false,
        },
    },
})
