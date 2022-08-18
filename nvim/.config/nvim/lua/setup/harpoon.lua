local keymap = require('lib.utils').keymap

require('telescope').load_extension('harpoon')
keymap('n', '<leader>;a', '<cmd>lua require("harpoon.mark").add_file()<cr>')
keymap('n', '<leader>;m', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
keymap('n', '<leader>tl;', '<cmd>Telescope harpoon marks<cr>')
keymap('n', '<leader>;j', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>')
keymap('n', '<leader>;k', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>')
keymap('n', '<leader>;l', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>')
keymap('n', '<leader>;;', '<cmd>lua require("harpoon.ui").nav_file(4)<cr>')
