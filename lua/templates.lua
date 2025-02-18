---@module 'snacks'

local M = {}

local function read_file(path, callback)
    vim.uv.fs_open(path, 'r', 438, function(err_open, fd)
        assert(not err_open, err_open)
        vim.uv.fs_fstat(fd, function(err_fstat, stat)
            assert(not err_fstat, err_fstat)
            assert(stat ~= nil)
            vim.uv.fs_read(fd, stat.size, 0, function(err_read, data)
                assert(not err_read, err_read)
                vim.uv.fs_close(fd, function(err_close)
                    assert(not err_close, err_close)
                    return callback(data)
                end)
            end)
        end)
    end)
end

local function parse(data)
    local lines, manual_folds, folds, cursor_index, fold_stack, marks, index
    local function reset()
        lines = {}
        cursor_index = nil
        manual_folds = {}
        folds = {}
        fold_stack = {}
        marks = {}
        index = 1
    end
    reset()

    local split = vim.split(data, '\n')

    for _, line in ipairs(split) do
        local _, cmd_index = line:find('template!')
        if cmd_index == nil then
            table.insert(lines, line)
            index = index + 1
        else
            cmd_index = cmd_index + 1
            local function find(s)
                return line:find('^' .. s, cmd_index) ~= nil
            end

            if find('begin') then
                reset()
            elseif find('foldbegin') then
                table.insert(fold_stack, index)
            elseif find('foldend') then
                assert(#fold_stack > 0)
                local f = {
                    from = table.remove(fold_stack, #fold_stack),
                    to = index,
                }
                assert(f.from < f.to)
                table.insert(manual_folds, f)
            elseif find('fold') then
                table.insert(folds, index)
            elseif find('mark') then
                local m = line:match('^%((%l)%)', cmd_index + 4)
                assert(m ~= nil)
                table.insert(marks, { name = m, index = index })
            elseif find('cursor') then
                cursor_index = index
            end
        end
    end

    assert(#fold_stack == 0)

    return {
        lines = lines,
        cursor_index = cursor_index,
        folds = folds,
        manual_folds = manual_folds,
        marks = marks,
    }
end

local function insert(template)
    local cursor = vim.api.nvim_win_get_cursor(0)
    local line = cursor[1]
    if cursor[2] == 0 and #vim.api.nvim_get_current_line() == 0 then
        line = line - 1
    end
    vim.api.nvim_buf_set_lines(0, line, line, false, template.lines)

    for _, mark in ipairs(template.marks) do
        vim.api.nvim_buf_set_mark(0, mark.name, line + mark.index, 0, {})
    end

    local keys = {}

    -- for _, fold_index in ipairs(template.folds) do
    --     table.insert(keys, ('%dGzc'):format(line + fold_index))
    -- end

    for _, fold in ipairs(template.manual_folds) do
        table.insert(keys, ('%dGzf%dG'):format(line + fold.from, line + fold.to))
    end

    if template.cursor_index == nil then
        template.cursor_index = #template.lines
    end
    table.insert(keys, (line + template.cursor_index) .. 'G')
    vim.api.nvim_feedkeys(table.concat(keys), 'n', false)

    -- vim.api.nvim_win_set_cursor(0, { index + template.cursor_index, 0 })
end

local function confirm(picker)
    picker:close()
    local file = picker:current().file
    read_file(
        file,
        vim.schedule_wrap(function(data)
            insert(parse(data))
        end)
    )
end

function M.insert_template()
    local home = vim.fn.expand('~')

    Snacks.picker.files({
        dirs = {
            home .. '/cp/templates',
        },
        ft = vim.fn.expand('%:e'),
        confirm = confirm,
        title = 'Templates',
        auto_confirm = true,
    })
end

return M
