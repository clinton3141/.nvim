return {
    "ThePrimeagen/harpoon",
    commit = "0378a6c",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require 'harpoon'
        harpoon:setup()

        vim.keymap.set('n', '<leader>0a', function()
            harpoon:list():add()
        end, { desc = 'add buffer' })

        for i = 1, 9 do
            vim.keymap.set('n', '<leader>' .. i, function()
                harpoon:list():select(i)
            end, { desc = 'which_key_ignore' })
        end

        vim.keymap.set('n', '<leader>00', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = 'list buffers' })
    end

}
