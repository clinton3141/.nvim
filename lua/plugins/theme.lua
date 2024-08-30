return {
    "catppuccin/nvim",
    tag = 'v1.9.0',
    priority = 1000,
    config = function ()
        require('catppuccin').setup({
            flavor = 'frappe',
            default_integrations = true,
        });
        vim.cmd.colorscheme "catppuccin"
    end
}

