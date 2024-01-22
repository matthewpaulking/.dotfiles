vim.keymap.set('n', '<Leader>zz', '<cmd>ZenMode<CR>', { silent = true })

require('zen-mode').setup({
    window = {
        width = 80,
        options = {
            number = false,
            relativenumber = false,
        },
    },
})
