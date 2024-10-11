return {
    'folke/trouble.nvim',
    opts = {
        modes = {
            lsp_document_symbols = {
                format = '{kind_icon} {symbol.name}',
            },
        },
    },
    cmd = 'Trouble',
    keys = {
        {
            '<leader>xa',
            '<cmd>Trouble diagnostics toggle focus=true<cr>',
            desc = 'Diagnostics (Trouble)',
        },
        {
            '<leader>xx',
            '<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>',
            desc = 'Buffer Diagnostics (Trouble)',
        },
        {
            '<leader>xs',
            '<cmd>Trouble symbols toggle focus=true<cr>',
            desc = 'Symbols (Trouble)',
        },
        {
            '<leader>cl',
            '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
            desc = 'LSP Definitions / references / ... (Trouble)',
        },
        {
            '<leader>xl',
            '<cmd>Trouble loclist toggle<cr>',
            desc = 'Location List (Trouble)',
        },
        {
            '<leader>xq',
            '<cmd>Trouble qflist toggle<cr>',
            desc = 'Quickfix List (Trouble)',
        },
    },
}
