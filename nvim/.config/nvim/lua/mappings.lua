vim.g.mapleader = ' '

-- Config
vim.keymap.set('n', '<leader>ve', ':e ~/.config/nvim/init.lua<cr>')
vim.keymap.set('n', '<leader>vo', ':e ~/.config/nvim/lua/options.lua<cr>')
vim.keymap.set('n', '<leader>vm', ':e ~/.config/nvim/lua/mappings.lua<cr>')
vim.keymap.set('n', '<leader>vp', ':e ~/.config/nvim/lua/plugins.lua<cr>')
vim.keymap.set(
    'n',
    '<leader>vs',
    ':so ~/.config/nvim/init.lua<cr>:so ~/.config/nvim/lua/options.lua<cr>:so ~/.config/nvim/lua/mappings.lua<cr>:so ~/.config/nvim/lua/plugins.lua<cr>'
)

-- Files
vim.keymap.set('n', '<leader>w', ':w<cr>', { silent = true })
vim.keymap.set('n', '<leader>q', ':bwipeout<cr>')
vim.keymap.set('n', '<leader>Q', ':bufdo bwipeout<cr>')

-- Line bubbling
vim.keymap.set('n', '<c-j>', ':m .+1<cr>==', { silent = true })
vim.keymap.set('n', '<c-k>', ':m .-2<cr>==', { silent = true })
vim.keymap.set('v', '<c-j>', ":m '>+1<cr>==gv=gv", { silent = true })
vim.keymap.set('v', '<c-k>', ":m '<-2<cr>==gv=gv", { silent = true })

-- Make visual yanks place the cursor back where started
vim.keymap.set('v', 'y', 'ygv<Esc>')

-- Keep search results centred
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mzJ`z')

--After searching, pressing escape stops the highlight
vim.keymap.set('n', '<esc>', ':noh<cr><esc>', { silent = true })

-- Keep visual selection when indenting
vim.keymap.set('x', '>', '>gv')
vim.keymap.set('x', '<', '<gv')

-- Easy end of line stuff
vim.keymap.set('i', ';;', '<Esc>A;<Esc>', { noremap = false })
vim.keymap.set('i', ',,', '<Esc>A,<Esc>', { noremap = false })

-- Split navigation
vim.keymap.set('n', '<c-h>', '<c-w><c-h>')
vim.keymap.set('n', '<c-j>', '<c-w><c-j>')
vim.keymap.set('n', '<c-k>', '<c-w><c-k>')
vim.keymap.set('n', '<c-l>', '<c-w><c-l>')

-- Macros
vim.keymap.set('n', 'Q', '@q')
vim.keymap.set('x', 'Q', ':norm @q')

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Toggle Numbers
function toggleNumber()
    numberVal = vim.api.nvim_get_option_value('number', {})
    relativenumberVal = vim.api.nvim_get_option_value('relativenumber', {})
    vim.api.nvim_set_option_value('number', not numberVal, {})
    vim.api.nvim_set_option_value('relativenumber', not relativenumberVal, {})
end
vim.keymap.set('n', '<leader>nu', '<cmd>lua toggleNumber()<cr>')
vim.keymap.set('n', '<leader>cta', "<cmd>s/\\(->\\)\\(\\w*\\)/['\\2']/g<cr>")
vim.keymap.set('n', '<leader>atc', "<cmd>s/\\(\\['\\)\\(\\w*\\)\\('\\]\\)/->\\2/g<cr>")

-- Find Pest tests in file
vim.keymap.set('n', '<leader>lt', '/\\v(^test)|(^it)|(^describe)<cr>')

-- skip over matching brace
function EscapePair()
    local closers = { ')', ']', '}', '>', "'", '"', '`', ',' }
    local line = vim.api.nvim_get_current_line()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local after = line:sub(col + 1, -1)
    local closer_col = #after + 1
    local closer_i = nil
    for i, closer in ipairs(closers) do
        local cur_index, _ = after:find(closer)
        if cur_index and (cur_index < closer_col) then
            closer_col = cur_index
            closer_i = i
        end
    end
    if closer_i then
        vim.api.nvim_win_set_cursor(0, { row, col + closer_col })
    else
        vim.api.nvim_win_set_cursor(0, { row, col + 1 })
    end
end

vim.api.nvim_set_keymap('i', '<C-l>', '<cmd>lua EscapePair()<CR>', { noremap = true, silent = true })
