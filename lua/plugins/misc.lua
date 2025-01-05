return {
    {
        'kylechui/nvim-surround',
        version = '*',
        event = 'VeryLazy',
        opts = {
            move_cursor = 'sticky',
        },
    },
    {
        'smoka7/hop.nvim',
        version = '*',
        opts = {
            keys = 'sdklqwertyuiopzxcvnmbhgfja;',
        },
    },
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            default_file_explorer = true,
            columns = {
                'icon',
                -- 'size',
            },
            delete_to_trash = true,
            skip_confirm_for_simple_edits = false,
            view_options = {
                show_hidden = true,
            },
        },
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
    {
        'ibhagwan/fzf-lua',
        config = function()
            require('fzf-lua').setup({
                highlights = {
                    fzf_colors = {
                        ['hl'] = false,
                        ['hl+'] = false,
                    },
                },
            })
        end,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
    {
        'folke/trouble.nvim',
        opts = {},
        cmd = 'Trouble',
    },
    -- {
    --     'akinsho/toggleterm.nvim',
    --     version = '*',
    --     opts = {
    --         open_mapping = '<F3>',
    --     },
    -- },
    {
        'lervag/vimtex',
        lazy = false,
        config = function()
            vim.g.vimtex_syntax_enabled = 0
        end
    },
    {
        'nyoom-engineering/oxocarbon.nvim'
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

