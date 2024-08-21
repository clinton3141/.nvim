return {
    "nvim-treesitter/nvim-treesitter",
    commit = "3722e3d",
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
