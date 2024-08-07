return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() 
        local config = require("nvim-treesitter.configs")
        config.setup({
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
        })
    end
}
