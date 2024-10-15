return {
    'jesseleite/vim-tinkeray',
    branch = 'feature/multiple-scratch-files',
    event = 'VeryLazy',
    keys = {
        { '<leader>to', '<cmd>TinkerayOpen<cr>' },
        { '<leader>tr', '<cmd>TinkerayRun<cr>' },
    },
    depenedencies = {
        { 'cbochs/grapple.nvim', lazy = true },
    },
    init = function()
        vim.api.nvim_exec(
            [[
            let g:tinkeray#disable_bufenter_autocmd = 1
        ]],
            true
        )
        local grapple = require('grapple')
        grapple.define_scope({
            name = 'tinkeray',
            desc = 'Tinkeray Files',
            fallback = 'cwd',
            resolver = function()
                return 'tinkeray', vim.fn.getcwd(), nil
            end,
        })
        local init_tinkeray_scope = function()
            -- unload all tags in the 'tinkeray' scope
            grapple.reset({ scope = 'tinkeray' })
            -- list all files in project directory that follow the pattern tinkeray*.php
            local files = vim.fn.globpath(vim.fn.getcwd(), 'tinkeray*.php', 0, 1)
            -- for each file, tag in in the 'tinkeray' scope
            for _, file in ipairs(files) do
                require('grapple').tag({ path = file, scope = 'tinkeray' })
            end
        end
        init_tinkeray_scope()
        vim.keymap.set('n', '<leader><leader>t', '<cmd>lua require("grapple").toggle_tags({scope = "tinkeray"})<cr>')

        -- WARN: can't get these working yet (index out-of-bounds error). Maybe a bug in Grapple?
        --
        -- vim.keymap.set(
        --     'n',
        --     '<leader><leader>k',
        --     '<cmd>lua require("grapple").cycle_tags("next", {scope = "tinkeray"})<cr>'
        -- )
        -- vim.keymap.set(
        --     'n',
        --     '<leader><leader>j',
        --     '<cmd>lua require("grapple").cycle_tags("prev", {scope = "tinkeray"})<cr>'
        -- )
    end,
}
