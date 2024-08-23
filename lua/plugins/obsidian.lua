return {
    "epwalsh/obsidian.nvim",
    tag = "v3.9.0",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        daily_notes = {
            folder = "Daily notes",
        },
        workspaces = {
            {
                name = "work",
                path = "~/obsidian/work"
            },
            {
                name = "personal",
                path = "~/obsidian/vault",
            }
        },
    }
}

