require('ibl').setup({
    enabled = false,
})

vim.keymap.set('n', '<Leader>ib', '<cmd>IndentBlanklineToggle<CR>', { silent = true })
