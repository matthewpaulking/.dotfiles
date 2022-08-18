require('nvim-treesitter.configs').setup({
    indent = {
        enable = true,
    },
    highlight = {
        enable = { 'astro' },
    },
    autotag = {
        enable = true,
        filetypes = {
            'html',
            'antlers',
            'blade',
            'javascript',
            'typescript',
            'markdown',
            'vue',
        },
    },
})

-- Autopairs
require('nvim-autopairs').setup({})
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp = require('cmp')
-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
