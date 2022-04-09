-- Keymaps
local keymap = require('lib.utils').keymap

keymap('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { silent = true })
keymap('n', '<Leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', { silent = true })
keymap('n', '<Leader>cd', '<cmd>lua vim.lsp.buf.definition()<CR>', { silent = true })
keymap('n', '<Leader>cD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { silent = true })
keymap('n', '<Leader>ch', '<cmd>lua vim.lsp.buf.hover()<CR>', { silent = true })
keymap('n', '<Leader>cs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { silent = true })
keymap('n', '<Leader>ci', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { silent = true })
keymap('n', '<Leader>cn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { silent = true })
keymap('n', '<Leader>cp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { silent = true })

-- Config
local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    },
}

-- PHP
lspconfig.intelephense.setup({
    capabilities = capabilities,
    init_options = {
        licenseKey = os.getenv('INTELEPHENSE_LICENSE_KEY'), -- this is tested and working as intended
        licenceKey = '00P5X2K9NL7QCE3',
    },
    settings = {
        intelephense = {
            telemetry = {
                enabled = false,
            },
            completion = {
                fullyQualifyGlobalConstantsAndFunctions = false,
            },
            returnVoid = false,
        },
    },
})

-- HTML, CSS, JS
lspconfig.html.setup({
    capabilities = capabilities,
    filetypes = { 'html', 'blade', 'antlers' },
})

lspconfig.cssls.setup({
    capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
    capabilities = capabilities,
})

lspconfig.tsserver.setup({
    capabilities = capabilities,
})

lspconfig.volar.setup({
    cmd = { 'vue-language-server', '--stdio' },
    init_options = {
        typescript = {
            serverPath = '/Users/mpk/.nvm/versions/node/v17.3.0/lib/node_modules/typescript/lib/tsserverlibrary.js',
        },
    },
    capabilities = capabilities,
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
})
