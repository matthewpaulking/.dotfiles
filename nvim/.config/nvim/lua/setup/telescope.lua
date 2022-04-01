local keymap = require('lib.utils').keymap

keymap('n', '<leader>f', ':Telescope git_files<cr>')
keymap('n', '<leader>F', ':Telescope find_files<cr>')
keymap('n', '<leader>g', ':Telescope live_grep<cr>')
keymap('n', '<leader>b', ':Telescope buffers<cr>')
