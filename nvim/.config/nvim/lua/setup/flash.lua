vim.keymap.set('n', '<cr>', '<cmd>:lua require("flash").jump()<cr>', { silent = true })
vim.keymap.set('n', 's', '<cmd>lua require("flash").treesitter()<cr>', { silent = true })
vim.keymap.set('c', '<c-s>', '<cmd>lua require("flash").toggle()<cr>', { silent = true })
vim.keymap.set('o', 'r', '<cmd>lua require("flash").remote()<cr>', { silent = true })
vim.keymap.set('o', 'R', '<cmd>lua require("flash").treesitter_search()<cr>', { silent = true })
vim.keymap.set('x', 'R', '<cmd>lua require("flash").treesitter_search()<cr>', { silent = true })

require('flash').setup({})
