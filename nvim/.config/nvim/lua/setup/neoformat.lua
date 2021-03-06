vim.g.neoformat_try_node_exe = 1
-- Autoformat on save
vim.api.nvim_exec(
    [[
        augroup fmt
          autocmd!
          autocmd BufWritePre * undojoin | Neoformat
        augroup END
    ]],
    true
)

-- Statamic Antlers format
vim.g.neoformat_enabled_html = {'prettier', 'antlersformat' }
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
