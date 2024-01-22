vim.keymap.set('n', '<Leader>xx', '<cmd>TroubleToggle<CR>', { silent = true })
vim.keymap.set('n', '<Leader>xw', '<cmd>TroubleToggle workspace_diagnostics<CR>', { silent = true })
vim.keymap.set('n', '<Leader>xd', '<cmd>TroubleToggle document_diagnostics<CR>', { silent = true })
vim.keymap.set('n', '<Leader>xr', '<cmd>TroubleToggle lsp_references<CR>', { silent = true })
vim.keymap.set('n', '<Leader>xq', '<cmd>TroubleToggle quickfix<CR>', { silent = true })
vim.keymap.set('n', '<Leader>xl', '<cmd>TroubleToggle loclist<CR>', { silent = true })

require('trouble').setup({
    position = 'bottom', -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = 'workspace_diagnostics', -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = '', -- icon used for open folds
    fold_closed = '', -- icon used for closed folds
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = 'q', -- close the list
        cancel = '<esc>', -- cancel the preview and get back to your last window / buffer / cursor
        refresh = 'r', -- manually refresh
        jump = { '<cr>', '<tab>' }, -- jump to the diagnostic or open / close folds
        open_split = { '<c-x>' }, -- open buffer in new split
        open_vsplit = { '<c-v>' }, -- open buffer in new vsplit
        open_tab = { '<c-t>' }, -- open buffer in new tab
        jump_close = { 'o' }, -- jump to the diagnostic and close the list
        toggle_mode = 'm', -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = 'P', -- toggle auto_preview
        hover = 'K', -- opens a small popup with the full multiline message
        preview = 'p', -- preview the diagnostic location
        close_folds = { 'zM', 'zm' }, -- close all folds
        open_folds = { 'zR', 'zr' }, -- open all folds
        toggle_fold = { 'zA', 'za' }, -- toggle fold of current file
        previous = 'k', -- preview item
        next = 'j', -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    auto_jump = { 'lsp_definitions' }, -- for the given modes, automatically jump if there is only a single result
    signs = {
        -- icons / text used for a diagnostic
        error = '☠️',
        warning = '⚠',
        hint = '●',
        information = '',
        other = '●',
    },
    use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
})

local next_skip_groups = function()
    require('trouble').next({ skip_groups = true })
end

local previous_skip_groups = function()
    require('trouble').previous({ skip_groups = true })
end

vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = { 'Trouble' },
    callback = function(args)
        vim.api.nvim_buf_set_keymap(args.buf, 'n', 'j', '', {
            callback = next_skip_groups,
        })
        vim.api.nvim_buf_set_keymap(args.buf, 'n', 'k', '', {
            callback = previous_skip_groups,
        })
    end,
})

vim.api.nvim_create_augroup('WhichKeyTelescope', { clear = true })
vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = 'Trouble',
    callback = function(event)
        local bufopts = { noremap = true, silent = true, buffer = event.buf }
        local trouble_config = require('trouble.config')

        if trouble_config.options.mode == 'telescope' then
            vim.keymap.set('n', 'D', function()
                require('trouble.providers.telescope').results = {}
                require('trouble').close()
            end, bufopts)

            local delete_entry = function()
                local win = vim.api.nvim_get_current_win()
                local cursor = vim.api.nvim_win_get_cursor(win)
                local line = cursor[1]
                -- Can use Trouble.get_items()
                local results = require('trouble.providers.telescope').results
                local folds = require('trouble.folds')

                local filenames = {}
                for _, result in ipairs(results) do
                    if filenames[result.filename] == nil then
                        filenames[result.filename] = 1
                    else
                        filenames[result.filename] = 1 + filenames[result.filename]
                    end
                end

                local index = 1
                local cursor_line = 1
                local seen_filename = {}
                while cursor_line < line do
                    local result = results[index]
                    local filename = result.filename

                    if seen_filename[filename] == nil then
                        seen_filename[filename] = true
                        cursor_line = cursor_line + 1

                        if folds.is_folded(filename) then
                            index = index + filenames[filename]
                        end
                    else
                        cursor_line = cursor_line + 1
                        index = index + 1
                    end
                end

                local index_filename = results[index].filename
                local is_filename = (seen_filename[index_filename] == nil)

                if is_filename then
                    local filtered_results = {}
                    for _, result in ipairs(results) do
                        if result.filename ~= index_filename then
                            table.insert(filtered_results, result)
                        end
                    end

                    require('trouble.providers.telescope').results = filtered_results
                else
                    table.remove(results, index)
                end

                if #require('trouble.providers.telescope').results == 0 then
                    require('trouble').close()
                else
                    require('trouble').refresh({ provider = 'telescope', auto = false })
                end
            end

            vim.keymap.set('n', 'd', delete_entry, bufopts)
        end
    end,
})
