return {
    {
        "williamboman/mason.nvim",
        tag = 'v1.10.0',
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        tag = 'v1.30.0',
        opts = {
            auto_install = false,
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "phpactor" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        tag = 'v0.1.8',
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.phpactor.setup({})
            lspconfig.lua_ls.setup({})

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
