---@diagnostic disable: undefined-global

local auto = function(trig, sub)
    return postfix({
        trig = trig,
        snippetType = 'autosnippet',
        match_pattern = '',
    }, {
        t(sub),
    })
end

local snippets = {
    s('st', t('\\text{ s.t. }')),
    s('if', t('\\text{if }')),
    s('fa', t('\\forall ')),
    s('ex', t('\\exists ')),
    s('im', t('\\implies ')),
    s('emps', t('\\emptyset ')),
    s('neg', t('\\neg ')),
    s('sub', t('\\subseteq ')),
    s('nsub', t('\\nsubseteq ')),
    s('psub', t('\\subsetneq ')),
    s('inf', t('\\infty ')),
    s('na', t('\\nabla ')),
    s('eq', t('={}& ')),
    s('tf', t('\\therefore ')),
    s('bc', t('\\because ')),
    s('cd', t('\\cdot ')),
    s('cds', t('\\cdots ')),
    s('bp', t('\\boxplus ')),
    s('op', t('\\oplus ')),
    s('bd', t('\\boxdot ')),
    s('od', t('\\odot ')),
    s('in', t('\\in ')),
    s('ti', t('\\times ')),
    s('ci', t('\\circ ')),
    s('we', t('\\wedge ')),
    s('ve', t('\\vee ')),
    s('cup', t('\\cup ')),
    s('cap', t('\\cap ')),
    s('geq', t('\\geq ')),
    s('leq', t('\\leq ')),
    s('vd', t('\\vdash ')),
    s('ra', t('\\Rightarrow ')),
    auto(' ^', '^'),
    auto(' _', '_'),
}

local add = function(trig, sub)
    table.insert(snippets, s(trig, t(sub)))
end

for c in ('cfinqrz'):gmatch('.') do
    add(c .. c, ('\\mathbb{%s}'):format(c))
end

local greek = {
    { 'a', 'alpha' },
    { 'b', 'beta' },
    { 'g', 'gamma', true },
    { 'd', 'delta', true },
    { 'e', 'epsilon' },
    { 'z', 'zeta' },
    { 'h', 'eta' },
    { 't', 'theta', true },
    { 'i', 'iota' },
    { 'k', 'kappa' },
    { 'l', 'lambda' },
    { 'm', 'mu' },
    { 'n', 'nu' },
    { 'x', 'xi', true },
    { 'p', 'pi', true },
    { 'r', 'rho' },
    { 's', 'sigma', true },
    { 'ta', 'tau' },
    { 'y', 'upsilon' },
    { 'f', 'phi', true },
    { 'c', 'chi' },
    { 'ps', 'psi' },
    { 'o', 'omega', true },
}

for _, x in ipairs(greek) do
    local trig, sub, has_capital = unpack(x)
    add('g' .. trig, ('\\%s '):format(sub))
    if has_capital then
        add('G' .. trig:upper(), ('\\%s '):format(sub:gsub('^%l', string.upper)))
    end
end

return snippets
