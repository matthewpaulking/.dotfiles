local keymap = require('lib.utils').keymap

keymap('n', '<leader>tn', ':w<cr>:TestNearest<cr>')
keymap('n', '<leader>tf', ':w<cr>:TestFile<cr>')
keymap('n', '<leader>ts', ':w<cr>:TestSuite<cr>')
keymap('n', '<leader>tl', ':w<cr>:TestLast<cr>')

vim.api.nvim_exec([[ let test#strategy = "neovim" ]], false)
vim.api.nvim_exec([[ let test#neovim#term_position = "vert" ]], false)
vim.api.nvim_exec([[ let test#php#phpunit#executable = 'vendor/bin/phpunit' ]], false)
