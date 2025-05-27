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
    sfmt(
        'pf',
        [[
        #proof[
          {}
        ]
        ]],
        { i(1) }
    ),
    s('sc', t('"since" ')),
    s('sca', {
        t('& ["since" '),
        i(1),
        t(']'),
    }),
    s('dfa', {
        t('& ["defn. of" '),
        i(1),
        t(']'),
    }),
    s('ba', {
        t('& ["by" '),
        i(1),
        t(']'),
    }),
    s('im', t('==> ')),
    s('ima', t('==> && ')),
    s('ex', t('exists ')),
    s('fa', t('forall ')),
    s('tfo', t('$therefore$ ')),
    s('tf', t('therefore ')),
    s('lea', t('<=& ')),
    s('lta', t('<& ')),
    s('gea', t('>=& ')),
    s('gta', t('>& ')),
    s('ea', t('=& ')),
}

local add = function(trig, sub)
    table.insert(snippets, s(trig, t(sub)))
end

for _, l in ipairs(greek_letters) do
    local trig = l.name:sub(1, 2)
    add(trig, l.name)
    if l.has_capital then
        add(trig:upper(), capitalize(l.name))
    end
end

return snippets
