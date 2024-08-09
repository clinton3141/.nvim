local wk = require("which-key")

-- Harpoon
local harpoon = require("harpoon")
wk.add({
    { "<leader>h", group = "[H]arpoon" },
    { "<leader>ha", function() harpoon:list():add() end, desc= "[A]dd Buffer" },
    { "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc= "[L]ist Buffers" },
    { "<leader>1", function() harpoon:list():select(1) end, desc= "which_key_ignore" },
    { "<leader>2", function() harpoon:list():select(2) end, desc= "which_key_ignore" },
    { "<leader>3", function() harpoon:list():select(3) end, desc= "which_key_ignore" },
    { "<leader>4", function() harpoon:list():select(4) end, desc= "which_key_ignore" },
    { "<leader>5", function() harpoon:list():select(5) end, desc= "which_key_ignore" },
    { "<leader>6", function() harpoon:list():select(6) end, desc= "which_key_ignore" },
    { "<leader>7", function() harpoon:list():select(7) end, desc= "which_key_ignore" },
    { "<leader>8", function() harpoon:list():select(8) end, desc= "which_key_ignore" },
    { "<leader>9", function() harpoon:list():select(9) end, desc= "which_key_ignore" },
})

-- LSP
wk.add({
    { "K", vim.lsp.buf.hover },
    { "gd", vim.lsp.buf.definition },
    { "gr", vim.lsp.buf.references },
    { "<leader>ca", vim.lsp.buf.code_action, desc="[C]ode [Action]" },
});

-- Telescope
local telescope = require("telescope.builtin")
wk.add({
    { "<leader>f", group = "Telescope" },
    { "<leader>ff", telescope.find_files, desc="Find files" },
    { "<leader>fg", telescope.live_grep, desc="Live [G]rep" }
})

