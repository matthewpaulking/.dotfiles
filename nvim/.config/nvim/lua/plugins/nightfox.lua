return {
    "EdenEast/nightfox.nvim",
    lazy = false,
    opts = {
        palettes = {
            nightfox = {
                bg1 = '#11161d',
            },
        },
        options = {
            dim_inactive = true,
            styles = {
                comments = 'italic,bold',
                keywords = 'bold',
                functions = 'italic,bold',
            },
            inverse = {
                match_paren = true,
                visual = true,
                search = true,
            },
        },
    },
    init = function()
        vim.cmd('colorscheme nightfox')
    end
}
