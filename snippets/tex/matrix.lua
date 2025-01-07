---@diagnostic disable: undefined-global

local split_char = function(str, char)
    local res = {}
    local token = {}
    local index = 1

    while index <= #str do
        local c = string.sub(str, index, index)
        if c == char then
            table.insert(res, table.concat(token, ''))
            token = {}
        else
            table.insert(token, c)
        end

        if index == #str then
            table.insert(res, table.concat(token, ''))
        end

        index = index + 1
    end
    return res
end

return {
    postfix({ trig = ';ma', snippetType = 'autosnippet', match_pattern = '^.*$' }, {
        f(function(_, parent)
            local match = parent.snippet.env.POSTFIX_MATCH
            local spl = split_char(match, ' ')

            local info = table.remove(spl, #spl)
            local index = 1

            local cols
            if string.match(info, '^%d') then
                cols = tonumber(string.sub(info, 1, 1))
                index = index + 1
            else
                cols = 1
            end

            local rows = math.floor(#spl / cols)

            local type
            if string.match(info, '^%a', index) then
                type = string.sub(info, index, index)
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
        end),
    }),
}
