local actions = require('telescope.actions')
local layout_actions = require('telescope.actions.layout')

vim.keymap.set('n', '<leader>f', ':Telescope git_files<cr>')
vim.keymap.set('n', '<leader>F', ':Telescope find_files<cr>')
vim.keymap.set('n', '<leader>g', '<cmd>lua require("telescope.builtin").live_grep({ additional_args = { "-j1" }})<CR>')

-- Find files in Laravel vendor directory
vim.keymap.set(
    'n',
    '<leader>v',
    '<cmd>lua require("telescope.builtin").live_grep({ additional_args = { "-j1" }, search_dirs = {"./vendor/laravel"}})<CR>'
)
vim.keymap.set(
    'n',
    '<leader>vf',
    '<cmd>lua require("telescope.builtin").find_files({ search_dirs = {"./vendor/laravel"}})<CR>'
)

-- Find files in vendor directory
vim.keymap.set(
    'n',
    '<leader>V',
    '<cmd>lua require("telescope.builtin").live_grep({ additional_args = { "-j1" }, search_dirs = {"./vendor"}})<CR>'
)
vim.keymap.set('n', '<leader>Vf', '<cmd>lua require("telescope.builtin").find_files({ search_dirs = {"./vendor"}})<CR>')

vim.keymap.set('n', '<leader>b', ':Telescope buffers<cr>')

-- List methods in a file
vim.keymap.set(
    'n',
    '<leader>ls',
    ":lua require('telescope.builtin').lsp_document_symbols({symbols = 'method', symbol_width = 100})<cr>"
)
vim.keymap.set('n', '<leader>tlg', ':Telescope git_status<cr>')
vim.keymap.set('n', '<leader>tlh', ':Telescope help_tags<cr>')

require('telescope').setup({
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            prompt_position = 'top',
        },
        vimgrep_arguments = {
            'rg',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--hidden',
            '--column',
            '--smart-case',
        },
        sorting_strategy = 'ascending',
        initial_mode = 'insert',
        file_ignore_patterns = { 'node_modules ' },
        mappings = {
            n = {
                ['q'] = 'smart_send_to_qflist',
                ['<c-r>'] = actions.delete_buffer + actions.move_to_top,
                ['p'] = layout_actions.toggle_preview,
            },
            i = {
                ['<c-p>'] = layout_actions.toggle_preview,
            },
        },
    },
    pickers = {
        -- find_files = {
        --     theme = 'dropdown',
        -- },
        buffers = {
            initial_mode = 'normal',
        },
        lsp_document_symbols = {
            initial_mode = 'normal',
            -- theme = 'dropdown',
            symbol_width = 100,
        },
        lsp_definitions = {
            initial_mode = 'normal',
        },
        git_status = {
            initial_mode = 'normal',
        },
    },
})
