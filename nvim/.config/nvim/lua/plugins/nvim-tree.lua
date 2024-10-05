return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
  keys = {
      { "<leader>e",  ':NvimTreeToggle<cr>', desc = "Nvim-tree"},
      { "<leader>te",  ':NvimTreeFindFileToggle<cr>', desc = "Nvim-tree on File"}
  }
}
