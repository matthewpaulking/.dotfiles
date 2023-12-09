vim.keymap.set('n', '<leader>tcr', ':TextCaseOpenTelescopeLSPChange<CR>')
vim.keymap.set('n', '<leader>tcs', ":lua require('textcase').current_word('to_snake_case')<CR>")
vim.keymap.set('n', '<leader>tcc', ":lua require('textcase').current_word('to_camel_case')<CR>")
vim.keymap.set('n', '<leader>tcd', ":lua require('textcase').current_word('to_dash_case')<CR>")

vim.keymap.set('n', 'gas', ":lua require('textcase').current_word('to_snake_case')<CR>")
vim.keymap.set('n', 'gac', ":lua require('textcase').current_word('to_camel_case')<CR>")
vim.keymap.set('n', 'gad', ":lua require('textcase').current_word('to_dash_case')<CR>")

vim.keymap.set('n', 'gaS', ":lua require('textcase').lsp_rename('to_snake_case')<CR>")
vim.keymap.set('n', 'gaC', ":lua require('textcase').lsp_rename('to_camel_case')<CR>")
vim.keymap.set('n', 'gaD', ":lua require('textcase').lsp_rename('to_dash_case')<CR>")

vim.keymap.set('n', 'ges', ":lua require('textcase').operator('to_snake_case')<CR>")
vim.keymap.set('n', 'gec', ":lua require('textcase').operator('to_camel_case')<CR>")
vim.keymap.set('n', 'ged', ":lua require('textcase').operator('to_dash_case')<CR>")
