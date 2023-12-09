local keymap = require('lib.utils').keymap

require('ibl').setup({
    enabled = false,
})

keymap('n', '<Leader>ib', '<cmd>IndentBlanklineToggle<CR>', { silent = true })
