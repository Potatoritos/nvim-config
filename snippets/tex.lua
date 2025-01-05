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
    local sub = string.sub(str, index, index+2)
    if sub == 'inf' or sub == 'fni' then
        return {
            match = replace(sub),
            index = index + 3
        }
    end

    local match = string.match(str, '^%-[%d%w]', index)
    if match == nil then
        return {
            match = str.sub(str, index, index),
            index = index + 1
        }
    else
        return {
            match = str.sub(str, index, index+1),
            index = index + 2
        }
    end
end

local split_noslash = function(str)
    local res = {}
    local first = next(str, 1)
    res.left = first.match
    res.right = replace(string.sub(str, first.index))
    return res
end

local split = function(str)
    local index = string.find(str, '/')
    if index == nil then
        return split_noslash(str)
    end
    return {
        left = replace(string.sub(str, 1, index-1)),
        right = replace(string.sub(str, index+1)),
    }
end

local equals_split = function(str)
    if string.len(str) == 1 then
        return {
            left = str,
            right = ''
        }
    end
    local equals = string.find(str, '=')
    if equals == nil then
        local n = next(str, 1)
        local spl = split(string.sub(str, n.index))
        return {
            left = n.match .. '=' .. spl.left,
            right = spl.right
        }
    end

    local spl = split(string.sub(str, equals+1))
    spl.left = string.sub(str, 1, equals) .. spl.left
    return spl
end

local after_space = '[%w%c%p]+$'

local s_split = function(trig, format)
    return postfix({ trig = trig, snippetType = 'autosnippet', match_pattern = after_space }, {
        f(function(_, parent)
            local spl = split(parent.snippet.env.POSTFIX_MATCH)
            return string.format(format, spl.left, spl.right)
        end),
    })
end

local s_equals_split = function(trig, left, right)
    return postfix({ trig = trig, snippetType = 'autosnippet', match_pattern = after_space }, {
        f(function(_, parent)
            local spl = equals_split(parent.snippet.env.POSTFIX_MATCH)
            if spl.right == '' then
                return string.format(left, spl.left)
            end
            return string.format(left, spl.left) .. string.format(right, spl.right)
        end),
    })
end

local wrap = function(trig, left, right)
    return postfix({ trig = trig, snippetType = 'autosnippet' }, {
        f(function(_, parent)
            return left .. parent.snippet.env.POSTFIX_MATCH .. right
        end, {})
    })
end

local snippets = {
    s_split(';f', '\\frac{%s}{%s}'),
    s_split(';li', '\\lim{%s \\to %s}'),
    s_split(';it', '\\int_{%s}^{%s}'),
    postfix({ trig = ';dx', snippetType = 'autosnippet', match_pattern = after_space }, {
        f(function(_, parent)
            local spl = split(parent.snippet.env.POSTFIX_MATCH)
            if spl.right == '' then
                spl.right = spl.left
                spl.left = ''
            end
            return string.format('\\frac{\\mathrm{d}%s}{\\mathrm{d}%s}', spl.left, spl.right)
        end),
    }),
    s_equals_split(';su', '\\sum_{%s}', '^{%s}'),
    s_equals_split(';pr', '\\prod_{%s}', '^{%s}'),
    s_equals_split(';bu', '\\bigcup_{%s}', '^{%s}'),
    s_equals_split(';ba', '\\bigcap_{%s}', '^{%s}'),
    s_equals_split(';bw', '\\bigwedge_{%s}', '^{%s}'),
    s_equals_split(';bv', '\\bigvee_{%s}', '^{%s}'),
    wrap(';v', '\\mathbf{', '}'),
    wrap(';ca', '\\mathcal{', '}'),
    wrap(';bb', '\\mathbb{', '}'),
    wrap(';ab', '\\left\\lvert', '\\right\\rvert'),
    wrap(';nr', '\\left\\lVert', '\\right\\rVert'),
}

return snippets
