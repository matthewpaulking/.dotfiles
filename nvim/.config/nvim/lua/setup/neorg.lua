require('neorg').setup({
    load = {
        ['core.defaults'] = {},
        ['core.keybinds'] = {
            config = {
                hook = function(keybinds)
                    keybinds.map_event_to_mode('norg', {
                        n = {
                            { '<Tab>', 'core.integrations.treesitter.next.heading' },
                            { '<S-Tab>', 'core.integrations.treesitter.previous.heading' },
                        },
                    }, {
                        silent = true,
                        noremap = true,
                    })
                end,
            },
        },
        ['core.norg.concealer'] = {},
        ['core.export'] = {},
        ['core.norg.completion'] = {
            config = { engine = 'nvim-cmp' },
        },
        ['core.integrations.nvim-cmp'] = {},
        ['core.integrations.telescope'] = {},
        ['core.norg.dirman'] = {
            config = {
                workspaces = {
                    work = '~/notes/work',
                    home = '~/notes/home',
                },
            },
        },
    },
})
