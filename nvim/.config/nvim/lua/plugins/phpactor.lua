return {
    'phpactor/phpactor',
    build = 'composer install --no-dev --optimize-autoloader',
    ft = 'php',
    keys = {
        { '<Leader>pm', ':PhpactorContextMenu<CR>' },
        { '<Leader>pc', ':PhpactorClassNew<CR>' },
        { '<Leader>pn', ':PhpactorTransform<CR>' },
        { '<Leader>pm', ':PhpactorMoveFile<CR>' },
        { '<Leader>pi', ':PhpactorImportClass<CR>' },
        { '<Leader>pa', ':PhpactorImportMissingClasses<CR>' },
    },
}
