return {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
        { 'williamboman/mason.nvim', version = 'v1.11.0' },
        { 'williamboman/mason-lspconfig.nvim', version = 'v1.32.0' },
        'b0o/schemastore.nvim',
    },
    config = function()
        -- Setup Mason to automatically install LSP servers
        require('mason').setup({
            ui = {
                height = 0.8,
            },
        })
        require('mason-lspconfig').setup({ automatic_installation = true })

        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

        -- PHP (intelephense)
        vim.lsp.config.intelephense = {
            cmd = { 'intelephense', '--stdio' },
            filetypes = { 'php' },
            root_markers = { 'composer.json', '.git' },
            capabilities = capabilities,
            init_options = {
                licenseKey = os.getenv('INTELEPHENSE_LICENSE_KEY'),
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
        }
        vim.lsp.enable('intelephense')

        -- Vue (vue_ls, formerly volar)
        vim.lsp.config.vue_ls = {
            cmd = { 'vue-language-server', '--stdio' },
            filetypes = { 'vue' },
            root_markers = { 'package.json' },
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end,
        }
        vim.lsp.enable('vue_ls')

        -- TypeScript/JavaScript (ts_ls)
        local mason_registry = require('mason-registry')
        local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path()
            .. '/node_modules/@vue/language-server'

        vim.lsp.config.ts_ls = {
            cmd = { 'typescript-language-server', '--stdio' },
            filetypes = {
                'javascript',
                'javascriptreact',
                'javascript.jsx',
                'typescript',
                'typescriptreact',
                'typescript.tsx',
                'vue',
            },
            root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
            capabilities = capabilities,
            init_options = {
                plugins = {
                    {
                        name = '@vue/typescript-plugin',
                        location = vue_language_server_path,
                        languages = { 'javascript', 'typescript', 'vue' },
                    },
                },
            },
        }
        vim.lsp.enable('ts_ls')

        -- Tailwind CSS
        vim.lsp.config.tailwindcss = {
            cmd = { 'tailwindcss-language-server', '--stdio' },
            filetypes = {
                'html',
                'blade',
                'django-html',
                'erb',
                'handlebars',
                'css',
                'scss',
                'postcss',
                'javascript',
                'typescript',
                'javascriptreact',
                'typescriptreact',
                'vue',
                'svelte',
                'astro',
            },
            root_markers = {
                'tailwind.config.js',
                'tailwind.config.cjs',
                'tailwind.config.mjs',
                'tailwind.config.ts',
                'postcss.config.js',
                'postcss.config.cjs',
                'postcss.config.mjs',
                'postcss.config.ts',
                'package.json',
            },
            capabilities = capabilities,
        }
        vim.lsp.enable('tailwindcss')

        -- JSON
        vim.lsp.config.jsonls = {
            cmd = { 'vscode-json-language-server', '--stdio' },
            filetypes = { 'json', 'jsonc' },
            root_markers = { '.git' },
            capabilities = capabilities,
            settings = {
                json = {
                    schemas = require('schemastore').json.schemas(),
                },
            },
        }
        vim.lsp.enable('jsonls')

        -- Lua
        vim.lsp.config.lua_ls = {
            cmd = { 'lua-language-server' },
            filetypes = { 'lua' },
            root_markers = {
                '.luarc.json',
                '.luarc.jsonc',
                '.luacheckrc',
                '.stylua.toml',
                'stylua.toml',
                'selene.toml',
                'selene.yml',
                '.git',
            },
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            '${3rd}/luv/library',
                            unpack(vim.api.nvim_get_runtime_file('', true)),
                        },
                    },
                },
            },
        }
        vim.lsp.enable('lua_ls')

        -- Astro
        vim.lsp.config.astro = {
            cmd = { 'astro-ls', '--stdio' },
            filetypes = { 'astro' },
            root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
            capabilities = capabilities,
        }
        vim.lsp.enable('astro')

        -- Go
        vim.lsp.config.gopls = {
            cmd = { 'gopls' },
            filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
            root_markers = { 'go.work', 'go.mod', '.git' },
            capabilities = capabilities,
        }
        vim.lsp.enable('gopls')

        -- Keymaps
        -- vim.keymap.set('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { silent = true })
        -- vim.keymap.set('n', '<Leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', { silent = true })
        -- vim.keymap.set('n', '<leader>cd', ":lua require('telescope.builtin').lsp_definitions()<cr>", { silent = true })
        -- vim.keymap.set('n', '<Leader>cD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { silent = true })
        -- vim.keymap.set('n', '<Leader>cf', '<cmd>lua vim.lsp.buf.references()<CR>', { silent = true })
        -- vim.keymap.set('n', '<Leader>ch', '<cmd>lua vim.lsp.buf.hover()<CR>', { silent = true })
        -- vim.keymap.set('n', '<Leader>cs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { silent = true })
        -- vim.keymap.set('n', '<Leader>ci', '<cmd>lua vim.diagnostic.open_float()<CR>', { silent = true })
        -- vim.keymap.set('n', '<Leader>cn', '<cmd>lua vim.diagnostic.goto_next()<CR>', { silent = true })
        -- vim.keymap.set('n', '<Leader>cp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { silent = true })
        -- vim.keymap.set('n', '<leader><leader>i', '<cmd>LspInfo<CR>', { silent = true })
        -- vim.keymap.set('n', '<leader><leader>r', '<cmd>LspRestart<CR>', { silent = true })

        -- LSP Keymaps (modern Lua style with desc)
        vim.keymap.set('n', '<Leader>ca', function()
            vim.lsp.buf.code_action()
        end, { silent = true, desc = 'LSP Code Action' })

        vim.keymap.set('n', '<Leader>cr', function()
            vim.lsp.buf.rename()
        end, { silent = true, desc = 'LSP Rename' })

        -- Use native go-to-definition to avoid Telescope 0.11 issue
        vim.keymap.set('n', '<leader>cd', function()
            vim.lsp.buf.definition()
        end, { silent = true, desc = 'LSP Definition' })

        vim.keymap.set('n', '<Leader>cD', function()
            vim.lsp.buf.declaration()
        end, { silent = true, desc = 'LSP Declaration' })

        vim.keymap.set('n', '<Leader>cf', function()
            vim.lsp.buf.references()
        end, { silent = true, desc = 'LSP References' })

        vim.keymap.set('n', '<Leader>ch', function()
            vim.lsp.buf.hover()
        end, { silent = true, desc = 'LSP Hover' })

        vim.keymap.set('n', '<Leader>cs', function()
            vim.lsp.buf.signature_help()
        end, { silent = true, desc = 'LSP Signature Help' })

        vim.keymap.set('n', '<Leader>ci', function()
            vim.diagnostic.open_float()
        end, { silent = true, desc = 'Diagnostics Float' })

        vim.keymap.set('n', '<Leader>cn', function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, { silent = true, desc = 'Diagnostics Next' })

        vim.keymap.set('n', '<Leader>cp', function()
            vim.diagnostic.jump({ count = 1, float = false })
        end, { silent = true, desc = 'Diagnostics Prev' })

        vim.keymap.set('n', '<leader><leader>i', '<cmd>LspInfo<CR>', { silent = true, desc = 'LSP Info' })
        vim.keymap.set('n', '<leader><leader>r', '<cmd>LspRestart<CR>', { silent = true, desc = 'LSP Restart' })

        -- Commands
        vim.api.nvim_create_user_command('Format', function()
            vim.lsp.buf.format({ timeout_ms = 5000 })
        end, {})

        -- Diagnostic configuration
        -- Note: virtual_text is now opt-in by default in Neovim 0.11, explicitly disabled here
        vim.diagnostic.config({
            virtual_text = false,
            float = {
                source = true,
            },
        })

        -- Sign configuration
        -- vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
        -- vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
        -- vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
        -- vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '',
                    [vim.diagnostic.severity.WARN] = '',
                    [vim.diagnostic.severity.INFO] = '',
                    [vim.diagnostic.severity.HINT] = '',
                },
                -- optional: number column highlights
                numhl = {
                    [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
                    [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
                    [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
                    [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
                },
            },
            virtual_text = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })
    end,
}
