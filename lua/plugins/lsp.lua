return {
    {
        "williamboman/mason.nvim",
        tag = 'v1.10.0',
        lazy = false,
        opts = {}
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        tag = 'v1.30.0',
        opts = {
            auto_install = false,
            ensure_installed = { "lua_ls", "phpactor" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        tag = 'v0.1.8',
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.phpactor.setup({})
            lspconfig.lua_ls.setup({})
        end,
    },
}
