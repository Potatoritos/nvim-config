local opts = {
    ensure_installed = {
        'asm',
        'bash',
        'c',
        'cmake',
        'cpp',
        'css',
        'csv',
        'diff',
        'gitignore',
        'html',
        'java',
        'javascript',
        'json',
        'latex',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'regex',
        'rust',
        'sql',
        'toml',
        'typescript',
        'typst',
        'vim',
        'vimdoc',
        'vue',
        'xml',
        'yaml',
    },
    auto_install = false,
    sync_install = false,
    highlight = {
        enable = true,
    },
    indent = {
        enable = false,
    },
    autopairs = {
        enable = false,
    },
    autotag = {
        enable = false,
    },
}

return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup(opts)
        end,
    },
}
