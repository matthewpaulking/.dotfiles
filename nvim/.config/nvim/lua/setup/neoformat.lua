vim.g.neoformat_try_node_exe = 1
-- vim.g.neoformat_run_all_formatters = 1
-- Autoformat on save
-- vim.api.nvim_exec(
--     [[
--         augroup fmt
--           autocmd!
--           autocmd BufWritePre * undojoin | Neoformat
--         augroup END
--     ]],
--     true
-- )
vim.api.nvim_exec(
    [[
        augroup fmt
          autocmd!
          autocmd BufWritePre * try | undojoin | catch /E790/ | endtry | Neoformat
        augroup END
    ]],
    true
)

-- Statamic Antlers format
vim.g.neoformat_enabled_html = { 'antlersformat', 'prettier' }
vim.api.nvim_exec(
    [[
        let g:neoformat_html_antlersformat = {
            \ 'exe': 'antlersformat',
            \ 'args': ['format'],
            \ 'replace': 1,
            \ }
    ]],
    true
)
vim.api.nvim_exec(
    [[
        let g:neoformat_html_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin-filepath', '"%:p"', '--parser', 'html', '--plugin', 'prettier-plugin-tailwindcss'],
            \ 'stdin': 1,
            \ 'try_node_exe': 1,
            \ }
    ]],
    true
)

vim.api.nvim_exec(
    [[
        let g:neoformat_enabled_javascript = ['prettier']
        let g:neoformat_enabled_typescript = ['prettier']
        let g:neoformat_enabled_php = ['pint', 'phpcsfixer']

        let g:neoformat_php_pint = {
            \ 'exe': './vendor/bin/pint',
            \ 'replace': 1,
            \ }
        
        let g:neoformat_php_phpcsfixer = {
            \ 'exe': './vendor/bin/php-cs-fixer',
            \ 'args': ['fix', '-q'],
            \ 'replace': 1,
            \ }
    ]],
    true
)
