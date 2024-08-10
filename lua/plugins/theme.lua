return {
    "folke/tokyonight.nvim",
    tag = 'v4.8.0',
    name = 'tokyonight',
    priority = 1000,
    config = function()
        local colors = require("tokyonight.colors").setup()
        vim.cmd.colorscheme "tokyonight-moon"
        vim.api.nvim_set_hl(0, 'LineNr', {
            fg = colors.yellow,
            bg = colors.fg_dark
        })
        vim.api.nvim_set_hl(0, 'LineNrBelow', {
            fg = colors.yellow,
            bg = colors.bg_dark
        })
        vim.api.nvim_set_hl(0, 'LineNrAbove', {
            fg = colors.yellow,
            bg = colors.bg_dark
        })
        vim.api.nvim_set_hl(0, 'CursorLine', {
            bg = colors.fg_gutter
        })
    end
}

