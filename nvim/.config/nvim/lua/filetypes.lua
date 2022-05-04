vim.api.nvim_exec(
    [[
        augroup framework_filetype_settings
            autocmd!
            autocmd BufRead,BufNewFile *.blade.php setlocal commentstring={{--\ %s\ --}} filetype=html
            autocmd BufRead,BufNewFile *.astro setlocal commentstring={{--\ %s\ --}} filetype=astro
            autocmd BufRead,BufNewFile *.njk setlocal commentstring={{--\ %s\ --}} filetype=njk
            autocmd BufRead,BufNewFile *.antlers.html setlocal commentstring={{#\ %s\ #}} filetype=html
        augroup END
    ]],
    true
)
