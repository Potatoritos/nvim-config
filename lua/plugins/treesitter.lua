return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'bash',
                'c',
                'cpp',
                'diff',
                'html',
                'java',
                'javascript',
                'json',
                'latex',
                'lua',
                'markdown',
                'python',
                'rust',
                'toml',
                'typescript',
                'vim',
                'vimdoc',
                'vue',
            },
            auto_install = false,
            sync_install = false,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            autopairs = {
                enable = true,
            },
            autotag = {
                enable = false,
            },
        })
    end,
}

