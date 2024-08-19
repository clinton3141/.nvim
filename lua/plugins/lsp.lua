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
    {
        "nvimtools/none-ls.nvim",
        commit = "cfa65d8",
        config = function()
            local null_ls = require("null-ls")
            local sources = {
                null_ls.builtins.diagnostics.phpstan,
            }

            if vim.fn.executable("phpcs") == 1 then
                table.insert(sources, null_ls.builtins.diagnostics.phpcs)
            end

            null_ls.setup({
                sources = sources
            })
        end
    }
}
