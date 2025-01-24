---@diagnostic disable: undefined-global

local snippets = {
    sfmt(
        'tm',
        [[
        #import "/template.typ": *
        #show: template

        = {}


        ]],
        {
            f(function(_, parent)
                local name = parent.snippet.env.TM_FILENAME:sub(1, -5)
                return name:gsub('_', ' '):gsub('^%l', string.upper)
            end),
        }
    ),
}

local add = function(trig, sub)
    table.insert(snippets, s(trig, t(sub)))
end

for _, l in ipairs(greek_letters) do
    local trig = l.name:sub(1, 2)
    add(trig, l.name .. ' ')
    if l.has_capital then
        add(trig:upper(), capitalize(l.name) .. ' ')
    end
end

return snippets
