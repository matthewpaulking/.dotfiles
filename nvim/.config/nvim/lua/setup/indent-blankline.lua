require('ibl').setup({
    enabled = false,
})

vim.keymap.set('n', '<Leader>ib', '<cmd>IBLToggle<CR>', { silent = true })
