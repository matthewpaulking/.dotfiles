vim.keymap.set('n', '<Leader>xx', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', { silent = true })
vim.keymap.set('n', '<Leader>xs', '<cmd>Trouble my_symbols toggle<CR>', { silent = true })
vim.keymap.set('n', '<Leader>xq', '<cmd>Trouble quickfix toggle<CR>', { silent = true })
vim.keymap.set('n', '<Leader>xl', '<cmd>Trouble loclist toggle<CR>', { silent = true })

require('trouble').setup({
    focus = true,
    modes = {
        my_symbols = {
            mode = 'lsp_document_symbols',
            filter = {
                any = {
                    kind = { 'Method' },
                },
            },
            win = { position = 'right' },
        },
    },
})
local actions = require('telescope.actions')
-- local open_with_trouble = require('trouble.sources.telescope').open

-- Use this to add more results without clearing the trouble list
-- local add_to_trouble = require('trouble.sources.telescope').add

-- local next_skip_groups = function()
--     require('trouble').next({ skip_groups = true })
-- end
--
-- local previous_skip_groups = function()
--     require('trouble').previous({ skip_groups = true })
-- end
--
-- vim.api.nvim_create_autocmd({ 'FileType' }, {
--     pattern = { 'Trouble' },
--     callback = function(args)
--         vim.api.nvim_buf_set_keymap(args.buf, 'n', 'j', '', {
--             callback = next_skip_groups,
--         })
--         vim.api.nvim_buf_set_keymap(args.buf, 'n', 'k', '', {
--             callback = previous_skip_groups,
--         })
--     end,
-- })
--
-- vim.api.nvim_create_augroup('WhichKeyTelescope', { clear = true })
-- vim.api.nvim_create_autocmd({ 'FileType' }, {
--     pattern = 'Trouble',
--     callback = function(event)
--         local bufopts = { noremap = true, silent = true, buffer = event.buf }
--         local trouble_config = require('trouble.config')
--
--         if trouble_config.options.mode == 'telescope' then
--             vim.keymap.set('n', 'D', function()
--                 require('trouble.providers.telescope').results = {}
--                 require('trouble').close()
--             end, bufopts)
--
--             local delete_entry = function()
--                 local win = vim.api.nvim_get_current_win()
--                 local cursor = vim.api.nvim_win_get_cursor(win)
--                 local line = cursor[1]
--                 -- Can use Trouble.get_items()
--                 local results = require('trouble.providers.telescope').results
--                 local folds = require('trouble.folds')
--
--                 local filenames = {}
--                 for _, result in ipairs(results) do
--                     if filenames[result.filename] == nil then
--                         filenames[result.filename] = 1
--                     else
--                         filenames[result.filename] = 1 + filenames[result.filename]
--                     end
--                 end
--
--                 local index = 1
--                 local cursor_line = 1
--                 local seen_filename = {}
--                 while cursor_line < line do
--                     local result = results[index]
--                     local filename = result.filename
--
--                     if seen_filename[filename] == nil then
--                         seen_filename[filename] = true
--                         cursor_line = cursor_line + 1
--
--                         if folds.is_folded(filename) then
--                             index = index + filenames[filename]
--                         end
--                     else
--                         cursor_line = cursor_line + 1
--                         index = index + 1
--                     end
--                 end
--
--                 local index_filename = results[index].filename
--                 local is_filename = (seen_filename[index_filename] == nil)
--
--                 if is_filename then
--                     local filtered_results = {}
--                     for _, result in ipairs(results) do
--                         if result.filename ~= index_filename then
--                             table.insert(filtered_results, result)
--                         end
--                     end
--
--                     require('trouble.providers.telescope').results = filtered_results
--                 else
--                     table.remove(results, index)
--                 end
--
--                 if #require('trouble.providers.telescope').results == 0 then
--                     require('trouble').close()
--                 else
--                     require('trouble').refresh({ provider = 'telescope', auto = false })
--                 end
--             end
--
--             vim.keymap.set('n', 'd', delete_entry, bufopts)
--         end
--     end,
-- })
