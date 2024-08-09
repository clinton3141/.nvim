return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    commit = 'fabf5fe',
    config = function()
        require('dashboard').setup {
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
        }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
