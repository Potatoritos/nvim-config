return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'asm',
                'bash',
                'c',
                'cpp',
                'css',
                'diff',
                'html',
                'java',
                'javascript',
                'json',
                'latex',
                'lua',
                'markdown',
                'markdown_inline',
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
                enable = false,
            },
            autotag = {
                enable = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = 'gnn',
                    node_incremental = 'grn',
                    scope_incremental = 'grc',
                    node_decremental = 'grm',
                },
            },
        })
    end,
}
