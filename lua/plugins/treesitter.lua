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
        'scheme',
        'sql',
        'toml',
        'typescript',
        'typst',
        'vim',
        'vimdoc',
        'vue',
        'xml',
        'yaml',
        'zathurarc',
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
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['am'] = { query = '@function.outer', desc = 'function' },
                ['im'] = { query = '@function.inner', desc = 'function' },
                ['af'] = { query = '@call.outer', desc = 'call' },
                ['if'] = { query = '@call.inner', desc = 'call' },
                ['aa'] = { query = '@parameter.outer', desc = 'parameter' },
                ['ia'] = { query = '@parameter.inner', desc = 'parameter' },
                ['ak'] = { query = '@block.outer', desc = 'block' },
                ['ik'] = { query = '@block.inner', desc = 'block' },
                ['ac'] = { query = '@class.outer', desc = 'class' },
                ['ic'] = { query = '@class.inner', desc = 'class' },
                ['il'] = { query = '@assignment.lhs', desc = 'lhs' },
                ['ir'] = { query = '@assignment.rhs', desc = 'rhs' },
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                [']m'] = { query = '@function.outer', desc = 'Next function start' },
                [']f'] = { query = '@call.outer', desc = 'Next call start' },
                [']a'] = { query = '@parameter.inner', desc = 'Next parameter start' },
                [']k'] = { query = '@block.outer', desc = 'Next block start' },
                [']c'] = { query = '@class.outer', desc = 'Next class start' },
            },
            goto_next_end = {
                [']M'] = { query = '@function.outer', desc = 'Next function end' },
                [']F'] = { query = '@call.outer', desc = 'Next call end' },
                [']A'] = { query = '@parameter.inner', desc = 'Next parameter end' },
                [']K'] = { query = '@block.outer', desc = 'Next block end' },
                [']C'] = { query = '@class.outer', desc = 'Next class end' },
            },
            goto_previous_start = {
                ['[m'] = { query = '@function.outer', desc = 'Previous function start' },
                ['[f'] = { query = '@call.outer', desc = 'Previous call start' },
                ['[a'] = { query = '@parameter.inner', desc = 'Previous parameter start' },
                ['[k'] = { query = '@block.outer', desc = 'Previous block start' },
                ['[c'] = { query = '@class.outer', desc = 'Previous class start' },
            },
            goto_previous_end = {
                ['[M'] = { query = '@function.outer', desc = 'Previous function end' },
                ['[F'] = { query = '@call.outer', desc = 'Previous call end' },
                ['[A'] = { query = '@parameter.inner', desc = 'Previous parameter end' },
                ['[K'] = { query = '@block.outer', desc = 'Previous block end' },
                ['[C'] = { query = '@class.outer', desc = 'Previous class end' },
            },
        },
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
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')
            vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
            vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

            vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
            vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
            vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
            vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
        end,
    },
}
