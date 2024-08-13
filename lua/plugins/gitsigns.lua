return {
    "lewis6991/gitsigns.nvim",
    tag = "v0.9.0",
    config = function ()
        require("gitsigns").setup({
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 300
            }
        })
    end
}
