local keymap = require('lib.utils').keymap
require('nvim-tree').setup()

keymap('n', '<leader>e', ':NvimTreeToggle<cr>')
