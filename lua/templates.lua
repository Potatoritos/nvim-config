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
    local lines, folds, cursor_index, fold_stack, marks
    local function reset()
        lines = {}
        cursor_index = nil
        folds = {}
        fold_stack = {}
        marks = {}
    end
    reset()

    local split = vim.split(data, '\n')

    local index = 1
    for _, line in ipairs(split) do
        local _, i = line:find('template!')
        if i == nil then
            table.insert(lines, line)
            index = index + 1
        else
            i = i + 1
            if line:find('^begin', i) ~= nil then
                reset()
            elseif line:find('^foldbegin', i) ~= nil then
                table.insert(fold_stack, index)
            elseif line:find('^foldend', i) ~= nil then
                assert(#fold_stack > 0)
                local f = {
                    from = table.remove(fold_stack, #fold_stack),
                    to = index,
                }
                assert(f.from < f.to)
                table.insert(folds, f)
            elseif line:find('^mark', i) ~= nil then
                local m = line:match('^%((%l)%)', i + 4)
                assert(m ~= nil)
                table.insert(marks, { name = m, index = index })
            elseif line:find('^cursor', i) ~= nil then
                cursor_index = index
            end
        end
    end

    assert(#fold_stack == 0)

    return {
        lines = lines,
        cursor_index = cursor_index,
        folds = folds,
        marks = marks,
    }
end

local function insert(template)
    local index = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, index, index, false, template.lines)

    for _, mark in ipairs(template.marks) do
        vim.api.nvim_buf_set_mark(0, mark.name, index + mark.index, 0, {})
    end

    local key_table = {}

    for _, fold in ipairs(template.folds) do
        table.insert(key_table, ('%dggzf%dgg'):format(index + fold.from, index + fold.to))
    end

    table.insert(key_table, (index + template.cursor_index) .. 'gg')

    local keys = table.concat(key_table)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), 'n', false)

    -- vim.api.nvim_win_set_cursor(0, { index + template.cursor_index, 0 })
end

local function confirm(picker)
    picker:close()
    local file = picker:current().file
    read_file(
        file,
        vim.schedule_wrap(function(data)
            local template = parse(data)
            insert(template)
        end)
    )
end

function M.pick()
    local path = vim.fn.expand('~') .. '/cp/template'
    Snacks.picker.files({
        dirs = { path },
        ft = 'cpp',
        confirm = confirm,
    })
end

return M
