local dap = require('dap')
local keymap = require('lib.utils').keymap

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/Users/mpk/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003
  }
}

keymap('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<cr>")
keymap('n', '<leader>dc', ":lua require'dap'.continue()<cr>")
keymap('n', '<leader>do', ":lua require'dap'.step_over()<cr>")
keymap('n', '<leader>dx', ":lua require'dap'.step_out()<cr>")
keymap('n', '<leader>di', ":lua require'dap'.step_into()<cr>")
keymap('n', '<leader>dr', ":lua require'dap'.repl.toggle()<cr>")

