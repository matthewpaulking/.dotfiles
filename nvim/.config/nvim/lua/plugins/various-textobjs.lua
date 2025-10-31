return {
    'chrisgrieser/nvim-various-textobjs',
    event = 'UIEnter',
    opts = {
        keymaps = {
            useDefaults = true,
        },
    },
    keys = {
        { 'iS', '<cmd>lua require("various-textobjs").subword("inner")<CR>', mode = { 'o', 'x' } },
        { 'aS', '<cmd>lua require("various-textobjs").subword("outer")<CR>', mode = { 'o', 'x' } },
    },
}
