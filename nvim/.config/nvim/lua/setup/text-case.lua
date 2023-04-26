local keymap = require('lib.utils').keymap

keymap('n', '<leader>tcr', ':TextCaseOpenTelescopeLSPChange<CR>')
keymap('n', '<leader>tcs', ":lua require('textcase').current_word('to_snake_case')<CR>")
keymap('n', '<leader>tcc', ":lua require('textcase').current_word('to_camel_case')<CR>")
keymap('n', '<leader>tcd', ":lua require('textcase').current_word('to_dash_case')<CR>")

keymap('n', 'gas', ":lua require('textcase').current_word('to_snake_case')<CR>")
keymap('n', 'gac', ":lua require('textcase').current_word('to_camel_case')<CR>")
keymap('n', 'gad', ":lua require('textcase').current_word('to_dash_case')<CR>")

keymap('n', 'gaS', ":lua require('textcase').lsp_rename('to_snake_case')<CR>")
keymap('n', 'gaC', ":lua require('textcase').lsp_rename('to_camel_case')<CR>")
keymap('n', 'gaD', ":lua require('textcase').lsp_rename('to_dash_case')<CR>")

keymap('n', 'ges', ":lua require('textcase').operator('to_snake_case')<CR>")
keymap('n', 'gec', ":lua require('textcase').operator('to_camel_case')<CR>")
keymap('n', 'ged', ":lua require('textcase').operator('to_dash_case')<CR>")
