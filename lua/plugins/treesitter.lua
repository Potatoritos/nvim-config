return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
        local ensure_installed = {
            'asm',
            'bash',
            'c',
            'cmake',
            'cpp',
            'css',
            'csv',
            'diff',
            'dockerfile',
            'gitignore',
            'html',
            'http',
            'ini',
            'java',
            'javascript',
            'json',
            'latex',
            'lua',
            'make',
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
            'xcompose',
            'xml',
            'yaml',
        }
        local already_installed = require('nvim-treesitter.config').installed_parsers()
        local to_install = vim.iter(ensure_installed)
            :filter(function(parser)
                return not vim.tbl_contains(already_installed, parser)
            end)
            :totable()
        require('nvim-treesitter').install(to_install)
    end,
}
