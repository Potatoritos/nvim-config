---@diagnostic disable: undefined-global

local split = function(str)
    local res = {}
    local token = {}
    local index = 1

    local open = 0

    while index <= #str do
        local c = str:sub(index, index)
        if c == ' ' and open == 0 then
            table.insert(res, table.concat(token, ''))
            token = {}
        else
            table.insert(token, c)

            if c == '{' then
                open = open + 1
            elseif c == '}' then
                open = math.max(open - 1, 0)
            end
        end

        if index == #str then
            table.insert(res, table.concat(token, ''))
        end

        index = index + 1
    end
    return res
end

return {
    postfix(
        {
            trig = ';ma',
            snippetType = 'autosnippet',
            match_pattern = '^.*$',
        },
        f(function(_, parent)
            local match = parent.snippet.env.POSTFIX_MATCH
            local spl = split(match)

            local info = table.remove(spl, 1)
            local index = 1

            local cols
            if info:match('^%d') then
                cols = tonumber(info:sub(1, 1))
                index = index + 1
            else
                cols = 1
            end

            local rows = math.floor(#spl / cols)

            local type
            if info:match('^%a', index) then
                type = info:sub(index, index)
            else
                type = 'b'
            end

            local res = { '\\begin{' .. type .. 'matrix}' }
            local line = nil

            for i = 1, rows * cols do
                local word = spl[i]
                if word == nil then
                    word = ''
                end
                if line == nil then
                    line = '\t' .. word
                else
                    line = line .. ' & ' .. word
                end

                if i % cols == 0 then
                    if i ~= rows * cols then
                        line = line .. ' \\\\'
                    end
                    table.insert(res, line)
                    line = nil
                end
            end

            table.insert(res, '\\end{' .. type .. 'matrix}')
            return res
        end)
    ),
}
