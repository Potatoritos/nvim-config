vim.g.rustaceanvim = {
    server = {
        capabilities = {
            textDocument = {
                completion = {
                    completionItem = {
                        snippetSupport = false,
                    },
                },
            },
        },
    },
}

return {
    {
        'neovim/nvim-lspconfig',
        event = {
            'BufReadPre',
            'BufNewFile',
        },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = false

            -- disable lua_ls snippets
            -- ---@diagnostic disable-next-line inject-field
            -- capabilities.textDocument.completion.callSnippet = 'Disable'
            -- ---@diagnostic disable-next-line inject-field
            -- capabilities.textDocument.completion.keywordSnippet = 'Disable'

            local lsp = require('lspconfig')
            lsp.basedpyright.setup({ capabilities = capabilities })
            lsp.eslint.setup({ capabilities = capabilities })
            lsp.lua_ls.setup({ capabilities = capabilities })
            lsp.ts_ls.setup({
                capabilities = capabilities,
                init_options = {
                    plugins = {
                        -- 'npm install -g @vue/language-server @vue/typescript-plugin'
                        {
                            name = '@vue/typescript-plugin',
                            location = '/usr/local/lib/node_modules/@vue/language-server',
                            languages = { 'vue' },
                        },
                    },
                },
                filetypes = {
                    'javascript',
                    'javascriptreact',
                    'typescript',
                    'typescriptreact',
                    'vue',
                },
            })
            lsp.volar.setup({ capabilities = capabilities })
        end,
        dependencies = {
            'saghen/blink.cmp',
        },
    },
    {
        'williamboman/mason.nvim',
        opts = {},
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            ensure_installed = {
                'basedpyright',
                'eslint',
                'lua_ls',
                'rust_analyzer',
                'ts_ls',
                'volar',
            },
        },
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5',
        lazy = false,
    },
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
