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
            "php",
            "scala",
            "typescript"
        },
        highlight = { enable = true },
        indent = { enable = true }
    }
}
