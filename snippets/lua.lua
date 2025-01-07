---@diagnostic disable: undefined-global

local not_after_dot = function(line)
    return string.find(line, '%.[%w_]*$') == nil
end

return {
    s({ trig = 'then', show_condition = not_after_dot }, {
        t({ 'then', '\t' }),
        i(0),
        t({ '', 'end' }),
    }),
    s({ trig = 'do', show_condition = not_after_dot }, {
        t({ 'do', '\t' }),
        i(0),
        t({ '', 'end' }),
    }),
    s({ trig = 'fn', show_condition = not_after_dot }, {
        t('function('),
        i(1),
        t({ ')', '\t' }),
        i(0),
        t({ '', 'end' }),
    }),
    s({ trig = 'fe', show_condition = not_after_dot }, {
        t({ 'function()', '\t' }),
        i(0),
        t({ '', 'end' }),
    }),
}
