return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'c',
                'cpp',
                'html',
                'java',
                'javascript',
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