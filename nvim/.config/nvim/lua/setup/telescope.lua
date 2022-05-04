local keymap = require('lib.utils').keymap

keymap('n', '<leader>f', ':Telescope git_files<cr>')
keymap('n', '<leader>F', ':Telescope find_files<cr>')
keymap('n', '<leader>g', ':Telescope live_grep<cr>')
keymap('n', '<leader>b', ':Telescope buffers<cr>')

-- List methods in a file
keymap('n', '<leader>ls', ":lua require('telescope.builtin').lsp_document_symbols({symbols = 'method'})<cr>")
