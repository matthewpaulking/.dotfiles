return {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    keys = {
        { ']h', ':Gitsigns next_hunk<CR>' },
        { '[h', ':Gitsigns prev_hunk<CR>' },
        { '<leader>hr', ':Gitsigns reset_hunk<CR>' },
        { '<leader>gs', ':Gitsigns stage_hunk<CR>' },
        { '<leader>gS', ':Gitsigns undo_stage_hunk<CR>' },
        { '<leader>gp', ':Gitsigns preview_hunk<CR>' },
        { '<leader>gb', ':Gitsigns blame_line<CR>' },
    },
    opts = {
        preview_config = {
            border = { '', '', '', ' ' },
        },
        current_line_blame = true,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
        },
        signs = {
            add = { text = '█' },
            change = { text = '█' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
            untracked = { text = '░' },
        },
    },
}
