return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'c',
                'cpp',
                'html',
                'java',
                'javascript',
                'latex',
                'lua',
                'markdown',
                'python',
                'rust',
                'toml',
                'typescript',
                'vim',
                'vimdoc',
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}

