---@diagnostic disable: undefined-global

local replace = function(s)
    if s == 'inf' then
        return '\\infty'
    elseif s == 'fni' then
        return '-\\infty'
    end
    return s
end

local next = function(str, index)
    local sub = str:sub(index, index + 2)
    if sub == 'inf' or sub == 'fni' then
        return {
            match = replace(sub),
            index = index + 3,
        }
    end

    local match = str:match('^%-[%d%w]', index)
    if match == nil then
        return {
            match = str:sub(index, index),
            index = index + 1,
        }
    else
        return {
            match = str:sub(index, index + 1),
            index = index + 2,
        }
    end
end

local split_noslash = function(str)
    local res = {}
    local first = next(str, 1)
    res.left = first.match
    res.right = replace(str:sub(first.index))
    return res
end

local split = function(str)
    local index = str:find('/')
    if index == nil then
        return split_noslash(str)
    end
    return {
        left = replace(str:sub(1, index - 1)),
        right = replace(str:sub(index + 1)),
    }
end

local equals_split = function(str)
    if str:len() == 1 then
        return {
            left = str,
            right = '',
        }
    end
    local equals = str:find('=')
    if equals == nil then
        local n = next(str, 1)
        local spl = split(str:sub(n.index))
        return {
            left = n.match .. '=' .. spl.left,
            right = spl.right,
        }
    end

    local spl = split(str:sub(equals + 1))
    spl.left = str:sub(1, equals) .. spl.left
    return spl
end

local match_line = '^.*$'
local start_index = function(line)
    local open = 0
    local last_viable = #line + 1

    for i = #line, 1, -1 do
        local c = line:sub(i, i)
        if c == '}' then
            open = open + 1
        elseif c == '{' then
            open = open - 1
            if open < 0 then
                return last_viable
            end
        elseif c == ' ' then
            if open == 0 then
                return last_viable
            end
        end

        if open == 0 then
            last_viable = i
        end
    end

    return last_viable
end

local s_split = function(trig, format)
    return postfix(
        {
            trig = trig,
            snippetType = 'autosnippet',
            match_pattern = match_line,
        },
        f(function(_, parent)
            local line = parent.snippet.env.POSTFIX_MATCH
            local start = start_index(line)
            local spl = split(line:sub(start))
            return line:sub(1, start - 1) .. format:format(spl.left, spl.right)
        end)
    )
end

local s_equals_split = function(trig, left, right)
    return postfix(
        {
            trig = trig,
            snippetType = 'autosnippet',
            match_pattern = match_line,
        },
        f(function(_, parent)
            local line = parent.snippet.env.POSTFIX_MATCH
            local start = start_index(line)
            local spl = equals_split(line:sub(start))
            if spl.right == '' then
                return left:format(spl.left)
            end
            return line:sub(1, start - 1) .. left:format(spl.left) .. right:format(spl.right)
        end)
    )
end

local derivative = function(trig, symbol)
    return postfix(
        {
            trig = trig,
            snippetType = 'autosnippet',
            match_pattern = match_line,
        },
        f(function(_, parent)
            local line = parent.snippet.env.POSTFIX_MATCH
            local start = start_index(line)
            local spl = split(line:sub(start))
            if spl.right == '' then
                spl.right = spl.left
                spl.left = ''
            end

            return line:sub(1, start - 1) .. ('\\frac{%s}{%s}'):format(symbol .. spl.left, symbol .. spl.right)
        end)
    )
end

local snippets = {
    s('f', { t('\\frac{'), i(1), t('}{'), i(2), t('}') }),
    s_split(';f', '\\frac{%s}{%s}'),
    s_split(';li', '\\lim{%s \\to %s}'),
    s_split(';it', '\\int_{%s}^{%s}'),
    derivative(';dx', '\\mathrm{d}'),
    derivative(';par', '\\partial '),
    s_equals_split(';su', '\\sum_{%s}', '^{%s}'),
    s_equals_split(';pd', '\\prod_{%s}', '^{%s}'),
    s_equals_split(';bu', '\\bigcup_{%s}', '^{%s}'),
    s_equals_split(';ba', '\\bigcap_{%s}', '^{%s}'),
    s_equals_split(';bw', '\\bigwedge_{%s}', '^{%s}'),
    s_equals_split(';bv', '\\bigvee_{%s}', '^{%s}'),
}

local postfix_wrap = function(trig, left, right)
    return postfix(
        {
            trig = trig,
            snippetType = 'autosnippet',
            match_pattern = match_line,
        },
        f(function(_, parent)
            local line = parent.snippet.env.POSTFIX_MATCH
            local start = start_index(line)

            return line:sub(1, start - 1) .. left .. line:sub(start) .. right
        end, {})
    )
end

local tab_wrap = function(trig, left, right)
    return s(trig, {
        t({ left }),
        i(1),
        t({ right }),
    })
end

local add = function(trig, left, right)
    table.insert(snippets, postfix_wrap(';' .. trig, left, right))
    table.insert(snippets, tab_wrap(trig, left, right))
end

add('v', '\\mathbf{', '}')
add('ca', '\\mathcal{', '}')
add('bb', '\\mathbb{', '}')
add('tx', '\\text{', '}')

add('2r', '\\sqrt{', '}')
add('3r', '\\sqrt[3]{', '}')
add('ov', '\\overline{', '}')
add('bx', '\\boxed{', '}')

add('pr', '\\left(', '\\right)')
add('br', '\\left[', '\\right]')
add('set', '\\left\\{', '\\}\\right]')
add('ab', '\\left\\lvert{', '}\\right\\rvert')
add('nr', '\\left\\lVert{', '}\\right\\rVert')

add('sc', '\\text{ (}', '\\text{)}')

local fn_p = {
    'ker',
    'image',
    'dim',
    'det',
    'rev',
}

for _, name in ipairs(fn_p) do
    add(name, ('\\mathrm{%s}\\left('):format(name), '\\right)')
end

local fn_b = {
    'max',
    'min',
}

for _, name in ipairs(fn_b) do
    add(name, ('\\mathrm{%s}\\{'):format(name), '\\}')
end

local trig = {
    'sin',
    'cos',
    'tan',
    'csc',
    'sec',
    'cot',
}

for _, name in ipairs(trig) do
    add(name, ('\\%s{\\left('):format(name), '\\right)}')
    add('2' .. name, ('\\%s^2{\\left('):format(name), '\\right)}')
    add('a' .. name, ('\\arc%s{\\left('):format(name), '\\right)}')
end

return snippets
