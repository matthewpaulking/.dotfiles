return {
    'chrisgrieser/nvim-various-textobjs',
    event = 'UIEnter',
    opts = { useDefaultKeymaps = false },
    keys = {
        { 'iS', '<cmd>lua require("various-textobjs").subword("inner")<CR>', mode = { 'o', 'x' } },
        { 'aS', '<cmd>lua require("various-textobjs").subword("outer")<CR>', mode = { 'o', 'x' } },
    },
}
