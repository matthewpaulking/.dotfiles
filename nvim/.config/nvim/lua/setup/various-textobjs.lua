require('various-textobjs').setup({
    useDefaultKeymaps = false,
})

vim.keymap.set({ 'o', 'x' }, 'iS', '<cmd>lua require("various-textobjs").subword("inner")<CR>')
vim.keymap.set({ 'o', 'x' }, 'aS', '<cmd>lua require("various-textobjs").subword("outer")<CR>')
