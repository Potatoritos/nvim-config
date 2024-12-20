---@diagnostic disable: undefined-global

local split = function(match)
    local index = string.find(match, '/')
    if index == nil then
        return {
            left = string.sub(match, 1, 1),
            right = string.sub(match, 2),
        }
    end
    return {
        left = string.sub(match, 1, index-1),
        right = string.sub(match, index+1),
    }
end

local replace = function(s)
    if s == 'inf' then
        return '\\infty'
    elseif s == 'fni' then
        return '-\\infty'
    end
    return s
end

local after_space = '[%w%c%p]+$'

return {
    postfix({ trig = ';v', snippetType = 'autosnippet' }, {
        f(function(_, parent)
            return '\\mathbf{' .. parent.snippet.env.POSTFIX_MATCH .. '}'
        end, {}),
    }),
    postfix({ trig = ';ca', snippetType = 'autosnippet' }, {
        f(function(_, parent)
            return '\\mathcal{' .. parent.snippet.env.POSTFIX_MATCH .. '}'
        end, {}),
    }),
    postfix({ trig = ';bv', snippetType = 'autosnippet' }, {
        f(function(_, parent)
            return '\\mathbb{' .. parent.snippet.env.POSTFIX_MATCH .. '}'
        end, {}),
    }),
    postfix({ trig = ';f', snippetType = 'autosnippet', match_pattern = after_space }, {
        f(function(_, parent)
            local spl = split(parent.snippet.env.POSTFIX_MATCH)
            return string.format('\\frac{%s}{%s}', spl.left, spl.right)
        end),
    }),
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
    postfix({ trig = ';li', snippetType = 'autosnippet', match_pattern = after_space }, {
        f(function(_, parent)
            local spl = split(parent.snippet.env.POSTFIX_MATCH)
            spl.right = replace(spl.right)
            return string.format('\\lim_{%s \\to %s}', spl.left, spl.right)
        end),
    }),
    postfix({ trig = ';it', snippetType = 'autosnippet', match_pattern = after_space }, {
        f(function(_, parent)
            local spl = split(parent.snippet.env.POSTFIX_MATCH)
            if spl.right == 'inf' then
                spl.right = '\\infty'
            end
            return string.format('\\lim_{%s \\to %s}', spl.left, spl.right)
        end),
    }),
}

