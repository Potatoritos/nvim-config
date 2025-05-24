return {
    capabilities = {
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        },
    },
    on_attach = function()
        vim.api.nvim_create_user_command('Daily', function(args)
            local input = args.args

            vim.lsp
                .get_clients({ name = 'markdown_oxide' })[1]
                :exec_cmd({ command = 'jump', arguments = { input }, title = 'daily note' })
        end, { desc = 'Open daily note', nargs = '*' })
    end,
}
