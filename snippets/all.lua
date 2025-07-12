---@diagnostic disable: undefined-global

return {
    s('na', f(function() return vim.fn.expand('%:t:r') end)),
}
