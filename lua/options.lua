vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = 'a'

vim.o.showmode = false
vim.o.showtabline = 0
vim.o.ruler = false

vim.o.breakindent = true
vim.o.autoindent = true
vim.g.python_indent = {
    open_paren = 4,
    closed_paren_align_last_line = false,
}
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 500

vim.o.timeoutlen = 1000

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = false
vim.opt.listchars = { tab = '➜ ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split'

vim.o.cursorline = true

vim.o.scrolloff = 5

vim.o.background = 'dark'

-- vim.opt.completeopt = { 'menuone', 'noinsert' }
-- vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.o.cursorline = false

vim.o.pumheight = 10

vim.o.conceallevel = 2
vim.o.signcolumn = 'yes:1'

vim.o.wrap = true
vim.o.linebreak = true
vim.o.textwidth = 80

-- vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
vim.o.sessionoptions = 'blank,buffers,curdir,help,tabpages,winsize,winpos,terminal'

vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldtext = ''
vim.opt.foldcolumn = '0'
vim.opt.fillchars:append({ fold = '·', vert = '+' })
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'Set LSP folding if supported',
    group = vim.api.nvim_create_augroup('lsp-folding', { clear = true }),
    callback = function(ctx)
        local client = assert(vim.lsp.get_client_by_id(ctx.data.client_id))
        if client:supports_method('textDocument/foldingRange') then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end
    end,
})

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        },
        linehl = {},
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
            [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
            [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
        },
    },
    virtual_text = false,
    severity_sort = true,
    underline = true,
})

vim.o.winborder = 'rounded'

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight on yank',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual' })
    end,
})

vim.api.nvim_create_autocmd('TabEnter', {
    desc = 'Display tab number',
    group = vim.api.nvim_create_augroup('display-tab-number', { clear = true }),
    callback = function()
        local tabid = vim.api.nvim_get_current_tabpage()
        local tabs = vim.api.nvim_list_tabpages()
        local chunks = {}
        for _, id in ipairs(tabs) do
            local num = vim.api.nvim_tabpage_get_number(id)
            local win = vim.api.nvim_tabpage_get_win(id)
            local buf = vim.api.nvim_win_get_buf(win)
            local name = vim.api.nvim_buf_get_name(buf)
            local n = vim.fn.fnamemodify(name, ':t')

            if name == '' then
                name = '---'
            elseif n ~= '' then
                name = n
            end

            if name:len() > 12 then
                name = name:sub(1, 11) .. '…'
            end

            if id == tabid then
                table.insert(chunks, { '[', 'TabpageActive' })
                table.insert(chunks, { '' .. num, 'TabpageActive' })
                table.insert(chunks, { ' ' .. name .. ']', 'TabpageActive' })
            else
                table.insert(chunks, { ' ', 'TabpageInactive' })
                table.insert(chunks, { '' .. num, 'TabpageInactive' })
                table.insert(chunks, { ' ' .. name .. ' ', 'TabpageInactive' })
            end
        end
        vim.api.nvim_echo(chunks, false, {})
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function(details)
        local bufnr = details.buf
        if not pcall(vim.treesitter.start, bufnr) then
            return
        end
    end,
})

vim.lsp.enable({
    'basedpyright',
    'biome',
    'clangd',
    'lua_ls',
    'markdown_oxide',
    'tinymist',
})
