local dap = require('dap')

dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { '/Users/making/vscode-php-debug/out/phpDebug.js' },
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9003,
    },
}

vim.keymap.set('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<cr>")
vim.keymap.set('n', '<leader>dc', ":lua require'dap'.continue()<cr>")
vim.keymap.set('n', '<leader>do', ":lua require'dap'.step_over()<cr>")
vim.keymap.set('n', '<leader>dx', ":lua require'dap'.step_out()<cr>")
vim.keymap.set('n', '<leader>di', ":lua require'dap'.step_into()<cr>")
vim.keymap.set('n', '<leader>dr', ":lua require'dap'.repl.toggle()<cr>")
