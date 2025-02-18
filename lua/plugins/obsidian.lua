return {
    'epwalsh/obsidian.nvim',
    version = '*',
    event = {
        'BufReadPre /home/potatoritos/notes/*.md',
        'BufNewFile /home/potatoritos/notes/*.md',
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- 'ibhagwan/fzf-lua',
        'nvim-treesitter/nvim-treesitter',
        'saghen/blink.cmp',
    },
    keys = {
        {
            '<Leader>oj',
            '<Cmd>ObsidianFollowLink<CR>',
            mode = 'n',
            desc = 'Follow link',
            ft = 'markdown',
        },
        {
            '<Leader>of',
            '<Cmd>ObsidianLinks<CR>',
            mode = 'n',
            desc = 'Pick buffer links',
            ft = 'markdown',
        },
        {
            '<Leader>ob',
            '<Cmd>ObsidianBacklinks<CR>',
            mode = 'n',
            desc = 'Pick backlinks',
            ft = 'markdown',
        },
        {
            '<Leader>oo',
            '<Cmd>ObsidianOpen<CR>',
            mode = 'n',
            desc = 'Open note in obsidian',
            ft = 'markdown',
        },
        -- {
        --     '<F8>',
        --     '<Cmd>ObsidianQuickSwitch<CR>',
        --     mode = 'n',
        --     desc = 'Switch to note',
        -- },
        {
            '<Leader>ox',
            function()
                require('obsidian').util.toggle_checkbox()
            end,
            mode = 'n',
            desc = 'Toggle checkbox',
            ft = 'markdown',
        },
        {
            '<Leader>on',
            '<Cmd>ObsidianLinkNew<CR>',
            mode = 'n',
            desc = 'Create and link note',
            ft = 'markdown',
        },
    },
    -- ---@module 'obsidian'
    -- ---@type obsidian.config.ClientOpts
    opts = {
        workspaces = {
            {
                name = 'notes',
                path = '~/notes',
            },
        },
        completion = {
            nvim_cmp = true,
        },
        -- picker = {
        --     name = 'fzf-lua',
        -- },
        ui = {
            enable = false,
            bullets = { hl_group = 'RenderMarkdownBullet' },
            external_link_icon = { char = '' },
            hl_groups = {
                ObsidianTodo = { fg = 'NONE', bg = 'NONE' },
                ObsidianDone = { fg = 'NONE', bg = 'NONE' },
                ObsidianBullet = { fg = 'NONE', bg = 'NONE' },
                ObsidianRefText = { fg = COLORS.pink, bg = 'NONE', underline = true },
                ObsidianHighlightText = { fg = 'NONE', bg = 'NONE' },
            },
        },
        note_id_func = function(title)
            return string.gsub(string.lower(title), '%s', '_')
        end,
        note_frontmatter_func = function(note)
            if note.title ~= note.id then
                note:add_alias(note.title)
            end

            local out = {
                id = note.id,
                aliases = note.aliases,
                tags = note.tags,
            }
            -- `note.metadata` contains any manually added fields in the frontmatter.
            -- So here we just make sure those fields are kept in the frontmatter.
            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end

            return out
        end,
        mappings = {},
    },
}
