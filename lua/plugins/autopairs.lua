local rules = function()
    local pairs = require('nvim-autopairs')
    local Rule = require('nvim-autopairs.rule')
    local cond = require('nvim-autopairs.conds')

    pairs.add_rules({
        Rule('$', '$', 'typst')
            :with_move(cond.done())
            :replace_map_cr(function(_) return '<CR><Esc>O<Tab>' end),
    })

    pairs.add_rule(
        Rule('<', '>', {
            '-html',
            '-javascriptreact',
            '-typescriptreact',
        }):with_pair(cond.before_regex('%a+%.?:?:?$', 3)):with_move(
            function(opts) return opts.char == '>' end
        )
    )

    -- pairs.add_rules({
    --     Rule('$', '$', { 'markdown', 'tex' }):with_move(function(opts)
    --         local col = vim.api.nvim_win_get_cursor(0)[2]
    --         local prev = opts.line:sub(col, col)
    --         return prev ~= '$'
    --     end),
    -- })

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
                :with_move(function(opts) return opts.char == bracket[2] end)
                :with_del(cond.none())
                :use_key(bracket[2])
                :replace_map_cr(function(_) return '<C-c>"_2s<CR><C-c>O' end),
        })
    end
end

return {
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        keys = {
            {
                '<C-p>',
                function() require('nvim-autopairs').toggle() end,
                desc = 'Toggle autopairs',
                mode = { 'i', 'n' },
            },
        },
        config = function()
            require('nvim-autopairs').setup({
                disable_in_macro = true,
                ignored_next_char = [=[[%w%%%'%[%"%.%`]]=],
                enable_bracket_in_quote = false,
                fast_wrap = {
                    map = '<C-0>',
                    chars = { '{', '[', '(', '"', "'" },
                    pattern = [=[[%'%"%>%]%)%}%,]]=],
                    end_key = '$',
                    before_key = 'h',
                    after_key = 'l',
                    cursor_pos_before = true,
                    keys = 'asdfjk;qwertyuiopzxcvbnmhl',
                    manual_position = true,
                    highlight = 'Search',
                    highlight_grey = 'Comment',
                },
            })
            rules()
        end,
    },
    {
        'windwp/nvim-ts-autotag',
        lazy = false,
        opts = {
            opts = {
                enable_rename = false,
            },
        },
    },
}
