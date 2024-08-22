return {
    "epwalsh/obsidian.nvim",
    tag = "v3.9.0",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/obsidian"
            }
        }
    }
}

