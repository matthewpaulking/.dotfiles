vim.api.nvim_exec(
    [[
        augroup framework_filetype_settings
            autocmd!
            autocmd BufRead,BufNewFile *.blade.php setlocal commentstring={{--\ %s\ --}} filetype=blade
            autocmd BufRead,BufNewFile *.njk setlocal commentstring={{--\ %s\ --}} filetype=njk
            " autocmd BufRead,BufNewFile *.antlers.html setlocal commentstring={{#\ %s\ #}} filetype=html
            autocmd FileType markdown setlocal spell
            autocmd FileType markdown setlocal textwidth=80
        augroup END

    ]],
    true
)
