local keymap = require('lib.utils').keymap
local actions = require('telescope.actions')
local layout_actions = require('telescope.actions.layout')

keymap('n', '<leader>f', ':Telescope git_files<cr>')
keymap('n', '<leader>F', ':Telescope find_files<cr>')
keymap('n', '<leader>g', ':Telescope live_grep<cr>')
keymap('n', '<leader>b', ':Telescope buffers<cr>')

-- List methods in a file
keymap(
    'n',
    '<leader>ls',
    ":lua require('telescope.builtin').lsp_document_symbols({symbols = 'method', symbol_width = 100})<cr>"
)
keymap('n', '<leader>tlg', ':Telescope git_status<cr>')
keymap('n', '<leader>tlh', ':Telescope help_tags<cr>')

require('telescope').setup({
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            prompt_position = 'top',
        },
        sorting_strategy = 'ascending',
        initial_mode = 'insert',
        file_ignore_patterns = { 'node_modules ' },
        mappings = {
            n = {
                ['q'] = 'smart_send_to_qflist',
                ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
                ['p'] = layout_actions.toggle_preview,
            },
            i = {
                ['<c-p>'] = layout_actions.toggle_preview,
            },
        },
    },
    pickers = {
        find_files = {
            theme = 'dropdown',
        },
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
