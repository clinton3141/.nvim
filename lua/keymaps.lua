local wk = require("which-key")

-- Harpoon
local harpoon = require("harpoon")
wk.add({
    { "<leader>h", group = "[h]arpoon" },
    { "<leader>ha", function() harpoon:list():add() end, desc= "[a]dd Buffer" },
    { "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc= "[l]ist Buffers" },
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
    { "gd", vim.lsp.buf.definition, desc="go [d]efinition" },
    { "gr", vim.lsp.buf.references, desc="go [r]eferences" },
    { "<leader>ca", vim.lsp.buf.code_action, desc="[c]ode [action]" },
});

-- Telescope
local telescope = require("telescope.builtin")
wk.add({
    { "<leader>s", group = "Tele[s]cope" },

    { "<leader>s ", telescope.buffers, desc="Buffers" },

    { "<leader>s/",  group = "Text search" },
    { "<leader>s//", function ()
        telescope.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
            previewer = false
        })
    end, desc="[/] Fuzzy" },
    { "<leader>s/g", function()
        telescope.live_grep {
            grep_open_files = true,
            prompt_title = 'grep open files'
        }
    end, desc="[g]rep open" },
    { "<leader>s/G", function()
        telescope.live_grep {
            prompt_title = 'grep all files'
        }
    end, desc="[G]rep all" },

    { "<leader>sg", group="[s]earch [g]it", icon=require("nvim-web-devicons").get_icon("git", "git") },
    { "<leader>sgb", telescope.git_branches, desc="[b]ranches" },
    { "<leader>sgc", telescope.git_commits, desc="[c]ommits" },
    { "<leader>sgC", telescope.git_bcommits, desc="buffer [C]ommits" },

    { "<leader>sf", telescope.find_files, desc="Find files" },
    { "<leader>sh", telescope.help_tags, desc="[h]elp" },
    { "<leader>sk", telescope.keymaps, desc="[k]eymaps" },
    { "<leader>sr", telescope.resume, desc="[r]esume" },
    { "<leader>st", telescope.builtin, desc="[t]elescope" }
})

