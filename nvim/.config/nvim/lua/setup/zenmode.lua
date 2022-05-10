local keymap = require('lib.utils').keymap

keymap('n', '<Leader>mz', '<cmd>ZenMode<CR>', { silent = true })

require('zen-mode').setup()
