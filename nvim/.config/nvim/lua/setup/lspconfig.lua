-- Keymaps
vim.keymap.set('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { silent = true })
vim.keymap.set('n', '<Leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', { silent = true })
vim.keymap.set('n', '<Leader>cd', '<cmd>lua vim.lsp.buf.definition()<CR>', { silent = true })
vim.keymap.set('n', '<leader>cd', ":lua require('telescope.builtin').lsp_definitions()<cr>")
vim.keymap.set('n', '<Leader>cD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { silent = true })
vim.keymap.set('n', '<Leader>cf', '<cmd>lua vim.lsp.buf.references()<CR>', { silent = true })
vim.keymap.set('n', '<Leader>ch', '<cmd>lua vim.lsp.buf.hover()<CR>', { silent = true })
vim.keymap.set('n', '<Leader>cs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { silent = true })
vim.keymap.set('n', '<Leader>ci', '<cmd>lua vim.diagnostic.open_float()<CR>', { silent = true })
vim.keymap.set('n', '<Leader>cn', '<cmd>lua vim.diagnostic.goto_next()<CR>', { silent = true })
vim.keymap.set('n', '<Leader>cp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { silent = true })

-- Config
require('neodev').setup()
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
-- Lua
lspconfig.lua_ls.setup({})

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

lspconfig.phpactor.setup({
    init_options = {
        ['language_server_phpstan.enabled'] = false,
        ['language_server_psalm.enabled'] = false,
    },
})

-- HTML, CSS, JS
lspconfig.html.setup({
    capabilities = capabilities,
    filetypes = { 'html', 'blade', 'antlers' },
})
lspconfig.antlersls.setup({})

lspconfig.cssls.setup({
    capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
    capabilities = capabilities,
})

lspconfig.astro.setup({})

lspconfig.tsserver.setup({
    capabilities = capabilities,
})

lspconfig.volar.setup({
    cmd = { 'vue-language-server', '--stdio' },
    init_options = {
        typescript = {
            tsdk = '/Users/making/.nvm/versions/node/v18.16.0/lib/node_modules/typescript/lib',
        },
    },
    capabilities = capabilities,
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
})

-- lspconfig.rust_analyzer.setup({})
rt = require('rust-tools')
rt.setup({
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})
--
-- lspconfig.marksman.setup({
--     cmd = { 'marksman', 'server' },
--     filetypes = { 'markdown' },
-- })

require('zk').setup({})
