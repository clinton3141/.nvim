return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    commit = 'fabf5fe',
    opts = {
        theme = "hyper",
        config = {
            week_header = {
                enable = true
            },
            shortcut = {},
            packages = {
                enable = false
            }
        }
    },
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
