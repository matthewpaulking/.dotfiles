local dap, dapui = require("dap"), require("dapui")
local keymap = require('lib.utils').keymap

dapui.setup()
keymap('n', '<leader>du', ":lua require'dapui'.toggle()<cr>")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
