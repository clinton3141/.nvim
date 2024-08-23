return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.2",
    build = ":TSUpdate",
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
