require('nvim-tree').setup({
    view = {
        width = 120,
    },
})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>te', ':NvimTreeFindFileToggle<cr>')
