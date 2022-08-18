local keymap = require('lib.utils').keymap

-- <leader>
vim.g.mapleader = ' '

-- Config
keymap('n', '<leader>ve', ':e ~/.config/nvim/init.lua<cr>')
keymap('n', '<leader>vo', ':e ~/.config/nvim/lua/options.lua<cr>')
keymap('n', '<leader>vm', ':e ~/.config/nvim/lua/mappings.lua<cr>')
keymap('n', '<leader>vp', ':e ~/.config/nvim/lua/plugins.lua<cr>')
keymap(
    'n',
    '<leader>vs',
    ':so ~/.config/nvim/init.lua<cr>:so ~/.config/nvim/lua/options.lua<cr>:so ~/.config/nvim/lua/mappings.lua<cr>:so ~/.config/nvim/lua/plugins.lua<cr>'
)

-- Files
keymap('n', '<leader>w', ':w<cr>')
keymap('n', '<leader>q', ':bwipeout<cr>')
keymap('n', '<leader>Q', ':bufdo bwipeout<cr>')

-- Line bubbling
keymap('n', '<c-j>', ':m .+1<cr>==', { silent = true })
keymap('n', '<c-k>', ':m .-2<cr>==', { silent = true })
keymap('v', '<c-j>', ":m '>+1<cr>==gv=gv", { silent = true })
keymap('v', '<c-k>', ":m '<-2<cr>==gv=gv", { silent = true })

-- Make visual yanks place the cursor back where started
keymap('v', 'y', 'ygv<Esc>')

-- Keep search results centred
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')
keymap('n', 'J', 'mzJ`z')

--After searching, pressing escape stops the highlight
keymap('n', '<esc>', ':noh<cr><esc>', { silent = true })

-- Keep visual selection when indenting
keymap('x', '>', '>gv')
keymap('x', '<', '<gv')

-- Easy end of line stuff
keymap('i', ';;', '<Esc>A;<Esc>', { noremap = false })
keymap('i', ',,', '<Esc>A,<Esc>', { noremap = false })

-- Split navigation
keymap('n', '<c-h>', '<c-w><c-h>')
keymap('n', '<c-j>', '<c-w><c-j>')
keymap('n', '<c-k>', '<c-w><c-k>')
keymap('n', '<c-l>', '<c-w><c-l>')

-- Toggle Numbers
function toggleNumber()
    numberVal = vim.api.nvim_get_option_value('number', {})
    relativenumberVal = vim.api.nvim_get_option_value('relativenumber', {})
    vim.api.nvim_set_option_value('number', not numberVal, {})
    vim.api.nvim_set_option_value('relativenumber', not relativenumberVal, {})
end
keymap('n', '<leader>nu', '<cmd>lua toggleNumber()<cr>')
