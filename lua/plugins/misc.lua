return {
    {
        'smoka7/hop.nvim',
        version = '*',
        opts = {
            keys = 'sdklqwertyuiopzxcvnmbhgfja;',
        },
    },
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        event = {
            'InsertEnter',
            'VeryLazy',
        },
        config = function()
            require('luasnip').config.set_config({
                enable_autosnippets = true,
            })
            require('luasnip.loaders.from_snipmate').lazy_load()
            require('luasnip.loaders.from_lua').load({
                ---@diagnostic disable-next-line: assign-type-mismatch
                paths = '~/.config/nvim/snippets'
            })
        end,
    },
    -- {
    --     'stevearc/oil.nvim',
    --     ---@module 'oil'
    --     ---@type oil.SetupOpts
    --     opts = {
    --         default_file_explorer = true,
    --         columns = {
    --             'icon',
    --             'size',
    --         },
    --         delete_to_trash = true,
    --         skip_confirm_for_simple_edits = false,
    --         view_options = {
    --             show_hidden = true,
    --         },
    --     },
    --     dependencies = {
    --         'nvim-tree/nvim-web-devicons',
    --     },
    -- },
    {
        'folke/trouble.nvim',
        opts = {},
        cmd = 'Trouble',
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {
            open_mapping = '<F3>',
        },
    },
    {
        'lervag/vimtex',
        lazy = false,
    },
    {
        'nyoom-engineering/oxocarbon.nvim'
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {},
    },
    {
        'nvim-tree/nvim-web-devicons'
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            icons = {
                mappings = true,
                keys = {},
            },
        },
    },
    {
        'norcalli/nvim-colorizer.lua',
        opts = {},
    },
}

