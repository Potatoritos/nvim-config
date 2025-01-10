local toggle_hidden = function(_, args)
    if args.cmd:find('--hidden') then
        args.cmd = args.cmd:gsub('--hidden', '', 1)
    else
        args.cmd = args.cmd .. ' --hidden'
    end
    require('fzf-lua').files(args)
end

return {
    'ibhagwan/fzf-lua',
    event = 'VeryLazy',
    keys = {
        {
            '<F1>',
            function()
                require('fzf-lua').files({
                    fzf_colors = true,
                    actions = {
                        ['ctrl-h'] = { toggle_hidden },
                    },
                })
            end,
            mode = 'n',
        },
        {
            '<F3>',
            function()
                require('fzf-lua').buffers({ fzf_colors = true })
            end,
            mode = 'n',
        },
    },
    config = function()
        require('fzf-lua').setup({
            highlights = {
                fzf_colors = {
                    ['hl'] = false,
                    ['hl+'] = false,
                },
            },
        })
    end,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
}
