return {
    'vim-test/vim-test',
    keys = {
        { '<Leader>tn', ':w<cr>:TestNearest<CR>', { silent = true } },
        { '<Leader>tf', ':w<cr>:TestFile<CR>', { silent = true } },
        { '<Leader>ts', ':w<cr>:TestSuite<CR>', { silent = true } },
        { '<Leader>tl', ':w<cr>:TestLast<CR>', { silent = true } },
        { '<Leader>tv', ':w<cr>:TestVisit<CR>', { silent = true } },
    },
    config = function()
        vim.cmd([[
          let g:test#strategy = 'neovim'
          let test#neovim#term_position = 'vert'
        ]])
    end,
}
