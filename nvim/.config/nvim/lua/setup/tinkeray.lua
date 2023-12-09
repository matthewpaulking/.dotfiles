vim.api.nvim_exec(
    [[
        let g:tinkeray#disable_bufenter_autocmd = 1
    ]],
    true
)
vim.keymap.set('n', '<leader>r', ':TinkerayRun<CR>')
