return {
    'folke/flash.nvim',
    event = "VeryLazy",
    keys = {
        { '<cr>',  mode = { 'n' },      '<cmd>:lua require("flash").jump()<cr>', },
        { 's',     mode = { 'n' },      '<cmd>lua require("flash").treesitter()<cr>', },
        { '<c-s>', mode = { 'c' },      '<cmd>lua require("flash").toggle()<cr>', },
        { 'r',     mode = { 'o' },      '<cmd>lua require("flash").remote()<cr>', },
        { 'R',     mode = { 'o', 'x' }, '<cmd>lua require("flash").treesitter_search()<cr>', },
    }
}
