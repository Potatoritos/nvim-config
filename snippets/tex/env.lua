---@diagnostic disable: undefined-global

local snippets = {
    s('lk', { t('$'), i(0), t('$') }),
    s('lj', { t({ '$$', '' }), i(0), t({ '', '$$' }) }),
    s('beg', {
        t('\\begin{'),
        i(1),
        t({ '}', '\t' }),
        i(2),
        t({ '', '\\end{' }),
        extras.rep(1),
        t('}'),
    }),
    s('enums', {
        t('\\begin{enumerate}['),
        i(1),
        t({ ']', '\t' }),
        i(2),
        t({ '', '\\end{enumerate}' }),
    }),
    s('pl', {
        t({
            '\\documentclass[11pt]{article}',
            '\\usepackage{amsmath, amsfonts, amsthm, amssymb, color, fullpage, hyperref}',
            '\\setlength{\\parindent}{0pt}',
            '\\begin{document}',
            '',
        }),
        i(0),
        t({ '', '\\end{document}' }),
    }),
}

local add = function(trig, env)
    table.insert(
        snippets,
        s(trig, {
            t({ ('\\begin{%s}'):format(env), '\t' }),
            i(1),
            t({ '', ('\\end{%s}'):format(env) }),
        })
    )
end

add('a*', 'align*')
add('e*', 'eqnarray*')
add('enum', 'enumerate')
add('item', 'itemize')
add('pf', 'proof')
add('ca', 'cases')

local types = { 'p', 'b', 'B', 'v', 'V', '' }

for _, type in ipairs(types) do
    add(type .. 'ma', type .. 'matrix')
end

return snippets
