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
            ---@diagnostic disable-next-line inject-field
            capabilities.textDocument.completion.callSnippet = 'Disable'
            ---@diagnostic disable-next-line inject-field
            capabilities.textDocument.completion.keywordSnippet = 'Disable'

            local lsp = require('lspconfig')
            lsp.lua_ls.setup({ capabilities = capabilities })
            lsp.basedpyright.setup({ capabilities = capabilities })
        end,
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
                'lua_ls',
                'rust_analyzer',
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

