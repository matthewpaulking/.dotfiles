-- require('nvim-treesitter.install').compilers = { 'gcc', 'cc' }
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
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'q',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
})

-- Autopairs
require('nvim-autopairs').setup({})
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp = require('cmp')
-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
