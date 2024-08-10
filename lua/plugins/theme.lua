return {
    "folke/tokyonight.nvim",
    tag = 'v4.8.0',
    name = 'tokyonight',
    priority = 1000,
    config = function()
        vim.cmd.colorscheme "tokyonight-moon"
    end
}

