return {
    'goolord/alpha-nvim',
    dependencies = {
        'echasnovski/mini.icons',
        'nvim-lua/plenary.nvim'
    },
    config = function ()
        local alpha = require("alpha")
        local theta = require("alpha.themes.theta")
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

        theta.buttons.val = {}

        alpha.setup(theta.config)
    end
};
