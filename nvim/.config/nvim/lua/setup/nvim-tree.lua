local keymap = require('lib.utils').keymap
require('nvim-tree').setup({
    view = {
        width = 120,
    },
})

keymap('n', '<leader>e', ':NvimTreeToggle<cr>')
