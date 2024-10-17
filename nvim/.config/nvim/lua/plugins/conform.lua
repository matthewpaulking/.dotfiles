return {
    'stevearc/conform.nvim',
    config = function()
        ---@param bufnr integer
        ---@param ... string
        ---@return string
        local function first(bufnr, ...)
            local conform = require('conform')
            for i = 1, select('#', ...) do
                local formatter = select(i, ...)
                if conform.get_formatter_info(formatter, bufnr).available then
                    return formatter
                end
            end
            return select(1, ...)
        end

        require('conform').setup({
            formatters_by_ft = {
                sh = { 'shfmt' },
                lua = { 'stylua' },
                javascript = { 'prettierd', 'prettier', stop_after_first = true },
                blade = function(bufnr)
                    return { first(bufnr, 'prettierd', 'prettier'), 'pint' }
                end,
                vue = { 'prettierd', 'prettier', stop_after_first = true },
                php = { 'pint', 'php-cs-fixer', stop_after_first = true },
            },
            format_on_save = {
                timeout_ms = 2000,
                lsp_format = 'fallback',
            },
        })
    end,
}
