local keymap = require('lib.utils').keymap

require('indent_blankline').setup({
    enabled = false,
})

keymap('n', '<Leader>ib', '<cmd>IndentBlanklineToggle<CR>', { silent = true })
