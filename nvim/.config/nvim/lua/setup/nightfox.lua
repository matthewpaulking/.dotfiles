require('nightfox').setup({
    options = {
        dim_inactive = true,
        styles = {
            comments = 'italic',
            keywords = 'bold',
            functions = 'italic,bold',
        },
        inverse = {
            match_paren = true,
            visual = true,
            search = true,
        },
    },
})

vim.cmd('colorscheme nightfox')
