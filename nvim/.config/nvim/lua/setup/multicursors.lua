local N = require('multicursors.normal_mode')
local I = require('multicursors.insert_mode')
require('multicursors').setup({
    normal_keys = {
        -- to change default lhs of key mapping change the key
        [','] = {
            -- assigning nil to method exits from multi cursor mode
            method = N.clear_others,
            -- you can pass :map-arguments here
            opts = { desc = 'Clear others' },
        },
    },
    insert_keys = {
        -- to change default lhs of key mapping change the key
        ['<CR>'] = {
            -- assigning nil to method exits from multi cursor mode
            method = I.Cr_method,
            -- you can pass :map-arguments here
            opts = { desc = 'New line' },
        },
    },
})

vim.keymap.set(
    { 'v', 'n' },
    '<Leader>mc',
    require('multicursors').start,
    { desc = 'Create a selection for selcted text or word under the cursor' }
)
