return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    commit = "0f6be799628589c2576194f5735924138f537c2f",
    opts = {
        ensure_installed = {
            "css",
            "haskell",
            "html",
            "javascript",
            "lua",
            "markdown",
            "markdown_inline",
            "php",
            "scala",
            "typescript"
        },
        highlight = { enable = true },
        indent = { enable = true }
    }
}
