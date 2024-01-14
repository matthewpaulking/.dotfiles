vim.keymap.set('n', '<leader>tn', ':w<cr>:TestNearest<cr>', { silent = true })
vim.keymap.set('n', '<leader>tf', ':w<cr>:TestFile<cr>', { silent = true })
vim.keymap.set('n', '<leader>ts', ':w<cr>:TestSuite<cr>', { silent = true })
vim.keymap.set('n', '<leader>tl', ':w<cr>:TestLast<cr>', { silent = true })

vim.api.nvim_exec([[ let test#strategy = "neovim" ]], false)
vim.api.nvim_exec([[ let test#neovim#term_position = "vert" ]], false)
vim.api.nvim_exec([[ let test#php#phpunit#executable = 'vendor/bin/phpunit' ]], false)
