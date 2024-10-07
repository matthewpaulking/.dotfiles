return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        view = {
            width = 120,
        },
    },
    keys = {
        { '<leader>e', ':NvimTreeToggle<cr>', desc = 'Nvim-tree' },
        { '<leader>te', ':NvimTreeFindFileToggle<cr>', desc = 'Nvim-tree on File' },
    },
}
