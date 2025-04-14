local rules = function()
    local pairs = require('nvim-autopairs')
    local Rule = require('nvim-autopairs.rule')
    local cond = require('nvim-autopairs.conds')

    pairs.add_rules({
        Rule('$', '$', 'typst'):with_move(cond.done()):replace_map_cr(function(_)
            return '<CR><Esc>O<Tab>'
        end),
    })

    pairs.add_rules({
        Rule(' ', ' ')
            :with_pair(function(opts)
                local pair = opts.line:sub(opts.col - 1, opts.col)
                if vim.bo.filetype == 'typst' and pair == '$$' then
                    return true
                end
                return pair == '{}'
            end)
            :with_move(cond.none())
            :with_cr(cond.none())
            :with_del(function(opts)
                local col = vim.api.nvim_win_get_cursor(0)[2]
                local context = opts.line:sub(col - 1, col + 2)
                if vim.bo.filetype == 'typst' and context == '$  $' then
                    return true
                end
                return context == '{  }'
            end),
    })

    local brackets = {
        { '{', '}' },
        { '$', '$', filetype = { 'tex', 'typst', 'markdown' } },
    }

    for _, bracket in ipairs(brackets) do
        pairs.add_rules({
            Rule(bracket[1] .. ' ', ' ' .. bracket[2], bracket.filetype)
                :with_pair(cond.none())
                :with_move(function(opts)
                    return opts.char == bracket[2]
                end)
                :with_del(cond.none())
                :use_key(bracket[2])
                :replace_map_cr(function(_)
                    return '<Esc>"_2xi<CR><Esc>O'
                end),
        })
    end
end

return {
    {
        'windwp/nvim-autopairs',
        enabled = true,
        event = {
            'InsertEnter',
            'VeryLazy',
        },
        keys = {
            {
                '<C-p>',
                function()
                    require('nvim-autopairs').toggle()
                end,
                mode = { 'i', 'n' },
                desc = 'Toggle autopairs',
            },
        },
        config = function()
            require('nvim-autopairs').setup({
                disable_in_macro = true,
                fast_wrap = {
                    map = '<C-0>',
                },
                ignored_next_char = [=[[%w%%%'%[%"%.%`]]=],
                enable_bracket_in_quote = false,
            })
            rules()
        end,
    },
    {
        'windwp/nvim-ts-autotag',
        ft = {
            'html',
            'javascript',
            'jsx',
            -- 'markdown',
            'svelte',
            'tsx',
            'typescript',
            'vue',
            'xml',
        },
        config = function()
            ---@diagnostic disable-next-line missing-fields
            require('nvim-ts-autotag').setup({
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = false,
            })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
    },
}
