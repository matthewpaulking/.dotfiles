local keymap = require('lib.utils').keymap

keymap('n', '<cr>', '<cmd>:lua require("flash").jump()<cr>', { silent = true })
-- keymap('n', 's', '<cmd>:lua require("flash").treesitter()<cr>', { silent = true })
keymap('c', '<c-s>', '<cmd>:lua require("flash").toggle()<cr>', { silent = true })
keymap('o', 'r', '<cmd>:lua require("flash").remote()<cr>', { silent = true })
keymap('o', 'R', '<cmd>:lua require("flash").treesitter_search()<cr>', { silent = true })
keymap('x', 'R', '<cmd>:lua require("flash").treesitter_search()<cr>', { silent = true })

require('flash').setup({
})
