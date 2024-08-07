return {
    "nvim-neo-tree/neo-tree.nvim",
    tag = 'v2.71',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
    },
    keys = {
        { '\\', ':Neotree reveal<CR>' }
    },
    opts = {
        filesystem = {
            window = {
                mappings = {
                    ['\\'] = 'close_window'
                }
            }
        }
    }
}

