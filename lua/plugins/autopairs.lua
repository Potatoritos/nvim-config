local keymaps = function()
    local pairs = require('nvim-autopairs')
    local Rule = require('nvim-autopairs.rule')
    local cond = require('nvim-autopairs.conds')

    local brackets = {
        { '(', ')' },
        { '{', '}' },
    }
    local brackets_concat = {}
    local brackets_spaced = {}
    for _, bracket in ipairs(brackets) do
        table.insert(brackets_concat, table.concat(bracket))
        table.insert(brackets_spaced, table.concat(bracket, '  '))
    end

    pairs.add_rules({
        Rule(' ', ' ')
            :with_pair(function(opts)
                local pair = opts.line:sub(opts.col - 1, opts.col)
                return vim.tbl_contains(brackets_concat, pair)
            end)
            :with_move(cond.none())
            :with_cr(cond.none())
            :with_del(function(opts)
                local col = vim.api.nvim_win_get_cursor(0)[2]
                local context = opts.line:sub(col - 1, col + 2)
                return vim.tbl_contains(brackets_spaced, context)
            end)
    })

    for _, bracket in ipairs(brackets) do
        pairs.add_rules({
            Rule(bracket[1] .. ' ', ' ' .. bracket[2])
                :with_pair(cond.none())
                :with_move(function(opts) return opts.char == bracket[2] end)
                :with_del(cond.none())
                :use_key(bracket[2])
                :replace_map_cr(function(_) return '<C-c>2xi<CR><C-c>O' end)
        })
    end
end

return {
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function()
            require('nvim-autopairs').setup({
                disable_in_macro = true,
            })
            keymaps()
        end
    },
    {
        'windwp/nvim-ts-autotag',
        event = 'InsertEnter',
    },
}

