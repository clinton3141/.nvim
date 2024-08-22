return {
    'goolord/alpha-nvim',
    dependencies = {
        'echasnovski/mini.icons',
        'nvim-lua/plenary.nvim'
    },
    config = function ()
        local alpha = require("alpha")
        local theta = require("alpha.themes.theta")
        local dashboard = require("alpha.themes.dashboard")

        theta.header.val = {
            [[ ⬜⬜🟨⬜🟨⬜🟨⬜⬜ ]],
            [[ ⬜⬜🟨🟨🟨🟨🟨⬜⬜ ]],
            [[ ⬜⬜⬛⬛⬛⬛⬛⬜⬜ ]],
            [[ ⬜⬛⬛⬛⬛⬛⬛⬛⬜ ]],
            [[ ⬜⬛⬜⬜⬛⬜⬜⬛⬜ ]],
            [[ ⬜⬛⬛⬜⬜⬜⬛⬛⬜ ]],
            [[ ⬛⬛⬜⬜🟨⬜⬜⬛⬛ ]],
            [[ ⬛⬛⬜⬜⬜⬜⬜⬛⬛ ]],
            [[ ⬛⬜⬜⬜⬜⬜⬜⬜⬛ ]],
            [[ ⬜⬛⬜⬜⬜⬜⬜⬛⬜ ]],
            [[ ⬜⬛⬛⬛⬛⬛⬛⬛⬜ ]],
            [[ ⬜⬜🟨🟨⬜🟨🟨⬜⬜ ]],
        }

        theta.buttons.val = {
            dashboard.button("e", "  New file", "<cmd>ene<CR>"),
            dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
        }

        alpha.setup(theta.config)
    end
};
