return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    keys = {
        { '<cr>', '<cmd>:lua require("flash").jump()<cr>', mode = { 'n' } },
        { 's', '<cmd>lua require("flash").treesitter()<cr>', mode = { 'n' } },
        { '<c-s>', '<cmd>lua require("flash").toggle()<cr>', mode = { 'c' } },
        { 'r', '<cmd>lua require("flash").remote()<cr>', mode = { 'o' } },
        { 'R', '<cmd>lua require("flash").treesitter_search()<cr>', mode = { 'o', 'x' } },
    },
}
