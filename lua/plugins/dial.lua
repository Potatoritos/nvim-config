local function dial(increment, g)
    local mode = vim.fn.mode(true)
    -- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
    local is_visual = mode == 'v' or mode == 'V' or mode == '\22'
    local func = (increment and 'inc' or 'dec') .. (g and '_g' or '_') .. (is_visual and 'visual' or 'normal')
    local group = vim.g.dials_by_ft[vim.bo.filetype] or 'default'
    return require('dial.map')[func](group)
end

return {
    'monaqa/dial.nvim',
    -- stylua: ignore
    keys = {
        { '<C-a>', function() return dial(true) end, expr = true, desc = 'Increment', mode = { 'n', 'v' } },
        { '<C-x>', function() return dial(false) end, expr = true, desc = 'Decrement', mode = { 'n', 'v' } },
        { 'g<C-a>', function() return dial(true, true) end, expr = true, desc = 'Increment', mode = { 'n', 'v' } },
        { 'g<C-x>', function() return dial(false, true) end, expr = true, desc = 'Decrement', mode = { 'n', 'v' } },
    },
    opts = function()
        local augend = require('dial.augend')

        -- stylua: ignore
        local cardinals = { 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen' }
        local tens = { 'twenty', 'thirty', 'fourty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety' }
        local cardinal_map = {}
        for _, l in ipairs(tens) do
            table.insert(cardinals, l)
            for r = 1, 9 do
                table.insert(cardinals, l .. '-' .. cardinals[r])
            end
        end

        local ordinals = {}
        local ordinal_map = {}
        for i, cardinal in ipairs(cardinals) do
            local ordinal = cardinal
                :gsub('([nrx])$', '%1th')
                :gsub('t$', 'th')
                :gsub('one$', 'first')
                :gsub('two$', 'second')
                :gsub('ree$', 'ird')
                :gsub('ve$', 'fth')
                :gsub('e$', 'th')
                :gsub('y$', 'ieth')
            table.insert(ordinals, ordinal)
            cardinal_map[cardinal] = i
            ordinal_map[ordinal] = i
        end

        cardinals[0] = 'zero'
        cardinal_map['zero'] = 0

        local numerals = augend.user.new({
            find = function(line, cursor)
                local idx_start = 1

                while idx_start <= #line do
                    local s, e = line:find('%a+%-?%a*', idx_start)
                    if s == nil then
                        return
                    end
                    idx_start = e + 2

                    local n = line:sub(s, e):lower()
                    if (cursor == nil or cursor <= e) and (ordinal_map[n] ~= nil or cardinal_map[n] ~= nil) then
                        return { from = s, to = e }
                    end
                end
            end,
            add = function(text, addend, cursor)
                local capitalized = text:match('^%u')
                local screaming = text:match('^%u%u')
                local function format(s)
                    return capitalized and s:gsub('^(%a)', string.upper) or (screaming and s:upper() or s)
                end
                text = text:lower()

                local n = ordinal_map[text]
                if n ~= nil then
                    text = ordinals[math.min(99, math.max(1, n + addend))]
                    return { text = format(text), cursor = #text }
                end

                n = cardinal_map[text]
                text = cardinals[math.min(99, math.max(0, n + addend))]
                return { text = format(text), cursor = #text }
            end,
        })

        local int_ordinals = augend.user.new({
            find = function(line, cursor)
                local idx_start = 1

                while idx_start <= #line do
                    local s, e = line:find('%d+%a%a', idx_start)
                    if s == nil then
                        return
                    end
                    idx_start = e + 1

                    if
                        (cursor == nil or cursor <= e)
                        and vim.tbl_contains({ 'st', 'nd', 'rd', 'th' }, line:sub(-2):lower())
                    then
                        return { from = s, to = e }
                    end
                end
            end,
            add = function(text, addend, cursor)
                local n = math.max(1, tonumber(text:sub(0, -3)) + addend)
                local a = n % 10
                local teen = (n % 100) - a == 10
                text = n .. (teen and 'th' or (a == 1 and 'st' or (a == 2 and 'nd') or (a == 3 and 'rd' or 'th')))
                return { text = text, cursor = #text }
            end,
        })

        return {
            dials_by_ft = {
                markdown = 'markup',
                tex = 'markup',
            },
            groups = {
                --stylua: ignore
                default = {
                    augend.integer.alias.binary,
                    augend.integer.alias.octal,
                    augend.integer.alias.decimal,
                    augend.integer.alias.decimal_int,
                    augend.integer.alias.hex,
                    augend.date.alias['%Y/%m/%d'],
                    augend.date.alias['%Y-%m-%d'],
                    augend.date.alias['%m/%d'],
                    augend.date.new({ pattern = '%m-%d', default_kind = 'day', only_valid = true, word = false }),
                    augend.date.alias['%H:%M:%S'],
                    augend.date.alias['%H:%M'],
                    augend.constant.new({ elements = { 'jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'nov', 'oct', 'dec' } }),
                    augend.constant.new({ elements = { 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' } }),
                    augend.constant.new({ elements = { 'mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun' }, preserve_case = true }),
                    augend.constant.new({ elements = { 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday' }, preserve_case = true }),
                    augend.semver.alias.semver,
                    augend.constant.new({ elements = { 'true', 'false' }, preserve_case = true }),
                    augend.constant.alias.alpha,
                    augend.constant.alias.Alpha,
                    augend.constant.new({ elements = { '&&', '||' }, word = false }),
                    augend.constant.new({ elements = { 'and', 'or' }, preserve_case = true}),
                    numerals,
                    int_ordinals,
                },
                markup = {
                    augend.constant.new({ elements = { '[ ]', '[x]' }, word = false }),
                    augend.misc.alias.markdown_header,
                    augend.constant.new({ elements = { 'forall', 'exists' } }),
                    augend.constant.new({ elements = { 'land', 'lor' } }),
                    augend.constant.new({ elements = { 'cup', 'cap' } }),
                    augend.constant.new({ elements = { 'bigcup', 'bigcap' } }),
                },
            },
        }
    end,
    config = function(_, opts)
        -- copy defaults to each group
        for name, group in pairs(opts.groups) do
            if name ~= 'default' then
                vim.list_extend(group, opts.groups.default)
            end
        end
        require('dial.config').augends:register_group(opts.groups)
        vim.g.dials_by_ft = opts.dials_by_ft
    end,
}
