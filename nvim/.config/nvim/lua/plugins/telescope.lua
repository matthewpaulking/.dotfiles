local actions = require('telescope.actions')
local layout_actions = require('telescope.actions.layout')

return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
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
    },
    keys = {
        {
            '<leader>f',
            ':Telescope git_files<cr>',
            desc = 'Git Files',
        },
        {
            '<leader>F',
            ':Telescope find_files<cr>',
        },
        {
            '<leader>g',
            '<cmd>lua require("telescope.builtin").live_grep({ additional_args = { "-j1" }})<CR>',
        },

        -- Find files in Laravel vendor directory
        {
            '<leader>v',
            '<cmd>lua require("telescope.builtin").live_grep({ additional_args = { "-j1" }, search_dirs = {"./vendor/laravel"}})<CR>',
        },
        {
            '<leader>vf',
            '<cmd>lua require("telescope.builtin").find_files({ search_dirs = {"./vendor/laravel"}})<CR>',
        },

        -- Find files in vendor directory
        {
            '<leader>V',
            '<cmd>lua require("telescope.builtin").live_grep({ additional_args = { "-j1" }, search_dirs = {"./vendor"}})<CR>',
        },
        {
            '<leader>Vf',
            '<cmd>lua require("telescope.builtin").find_files({ search_dirs = {"./vendor"}})<CR>',
        },

        {
            '<leader>b',
            ':Telescope buffers<cr>',
        },

        -- List methods in a file
        {
            '<leader>ls',
            ":lua require('telescope.builtin').lsp_document_symbols({symbols = 'method', symbol_width = 100})<cr>",
        },
        -- List expression statements in a file
        {
            '<leader>lc',
            ":lua require('telescope.builtin').lsp_document_symbols({symbols = 'closure', symbol_width = 100})<cr>",
        },
        {
            '<leader>tlg',
            ':Telescope git_status<cr>',
        },
        {
            '<leader>tlh',
            ':Telescope help_tags<cr>',
        },
    },
}
