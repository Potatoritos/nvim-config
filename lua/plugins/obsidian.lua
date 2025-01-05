return {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    event = {
        'BufReadPre /home/potatoritos/notes/*.md',
        'BufNewFile /home/potatoritos/notes/*.md',
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'ibhagwan/fzf-lua',
        'nvim-treesitter/nvim-treesitter',
        'saghen/blink.cmp',
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
            nvim_cmp = false,
        },
        picker = {
            name = 'fzf-lua',
        },
        ui = {
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
                tags = note.tags
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
    config = function(_, opts)
        require('obsidian').setup(opts)

        -- manually register sources until obsidian.nvim supports blink.cmp
        local cmp = require('cmp')
        cmp.register_source('obsidian', require('cmp_obsidian').new())
        cmp.register_source('obsidian_new', require('cmp_obsidian_new').new())
        cmp.register_source('obsidian_tags', require('cmp_obsidian_tags').new())
    end,
}
