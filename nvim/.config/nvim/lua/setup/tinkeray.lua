vim.api.nvim_exec(
    [[
        let g:tinkeray#disable_bufenter_autocmd = 1
    ]],
    true
)
local keymap = require('lib.utils').keymap

keymap('n', '<leader>r', ':TinkerayRun<CR>')

