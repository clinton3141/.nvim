local wk = require("which-key")
local telescope = require("telescope.builtin")

-- Harpoon
local harpoon = require("harpoon")
wk.add({
    { "<leader>h", group = "[h]arpoon" },
    { "<leader>ha", function() harpoon:list():add() end, desc= "[a]dd Buffer" },
    { "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc= "[l]ist Buffers" },
    { "<leader>1", function() harpoon:list():select(1) end, hidden = true },
    { "<leader>2", function() harpoon:list():select(2) end, hidden = true },
    { "<leader>3", function() harpoon:list():select(3) end, hidden = true },
    { "<leader>4", function() harpoon:list():select(4) end, hidden = true },
    { "<leader>5", function() harpoon:list():select(5) end, hidden = true },
    { "<leader>6", function() harpoon:list():select(6) end, hidden = true },
    { "<leader>7", function() harpoon:list():select(7) end, hidden = true },
    { "<leader>8", function() harpoon:list():select(8) end, hidden = true },
    { "<leader>9", function() harpoon:list():select(9) end, hidden = true },
})

-- LSP
wk.add({
    { "K", vim.lsp.buf.hover },
    { "<leader>cgd", telescope.lsp_definitions, desc="go [d]efinition" },
    { "<leader>cgr", telescope.lsp_references, desc="go [r]eferences" },

    { "<leader>c", group="[c]ode (lsp)" },
    { "<leader>ca", vim.lsp.buf.code_action, desc="[a]ction" },
    { "<leader>cr", vim.lsp.buf.rename, desc="[r]ename" },
    { "<leader>@", telescope.lsp_document_symbols, desc="[@] symbols" },
    { "<C-p>", vim.lsp.buf.toggle_float_win, desc="Signature help", mode="n" }
})

-- Telescope
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

-- git
local gitsigns = require("gitsigns")
wk.add({
    { "<leader>g", group="[g]it", icon=require("nvim-web-devicons").get_icon("git", "git") },
    { "<leader>g", group="[g]it", icon=require("nvim-web-devicons").get_icon("git", "git"), mode="v" },

    { "<leader>gp", gitsigns.preview_hunk, desc="[p]review hunk" },
    { "]c", function()
        if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
        else
            gitsigns.nav_hunk 'next'
        end
    end, desc = "next [c]hange" },
    { "[c", function()
        if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
        else
            gitsigns.nav_hunk 'prev'
        end
    end, desc = "previous [c]hange" },

    { '<leader>gs', gitsigns.stage_hunk, desc = '[s]tage hunk' },
    { '<leader>gr', gitsigns.reset_hunk, desc = '[r]eset hunk' },
    { '<leader>gS', gitsigns.stage_buffer, desc = '[S]tage buffer' },
    { '<leader>gu', gitsigns.undo_stage_hunk, desc = '[u]ndo stage hunk' },
    { '<leader>gR', gitsigns.reset_buffer, desc = '[R]eset buffer' },
    { '<leader>gp', gitsigns.preview_hunk, desc = '[p]review hunk' },
    { '<leader>gb', gitsigns.blame_line, desc = '[b]lame line' },
    { '<leader>gd', gitsigns.diffthis, desc = '[d]iff against index' },
    { '<leader>gD', function()
      gitsigns.diffthis '@'
    end, desc = '[D]iff against last commit' },

    -- visual mode
    { "<leader>gs", function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end, desc="[s]tage hunk", mode = "v" },
    { "<leader>gr", function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end, desc="[r]eset hunk", mode = "v" },
})

-- ToggleTerm
wk.add({
    { "<C-`>", "<cmd>ToggleTerm<CR>", desc="Open terminal" }
});

-- Undo
wk.add({
    { "<leader>u", vim.cmd.UndotreeToggle, desc="[u]ndo tree" }
});

-- Toggles
wk.add({
    { "<leader>t", group="[T]oggles" },
    { "<leader>td", function()
        vim.diagnostic.enable(not vim.diagnostic.is_enabled())
    end, desc="[d]iagnostics" },
    { "<leader>tD", gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' } }
})

-- Obsidian
-- TODO: this will activate on _any_ markdown file. Want it to just be inside vaults?
local function add_obsidian_keybindings()
    local obsidian = require("obsidian")
    wk.add({
        { "<leader>o", group="[O]bsidian" },
        { "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc="[B]acklinks" },
        { "<leader>od", "<cmd>ObsidianDailies<CR>", desc="[D]ailies" },
        { "<leader>of", "<cmd>ObsidianFollowLink<CR>", desc="[F]ollow link" },
        { "<leader>ol", "<cmd>ObsidianLinks<CR>", desc="[L]inks" },
        { "<leader>on", "<cmd>ObsidianNew<CR>", desc="[N]ew" },
        { "<leader>oo", "<cmd>ObsidianQuickSwitch<CR>", desc="[O]pen (Quickswitch)" },
        { "<leader>os", "<cmd>ObsidianSearch<CR>", desc="[S]earch" },
        { "<leader>or", "<cmd>ObsidianRename<CR>", desc="[R]ename" },
        { "<leader>ot", "<cmd>ObsidianTags<CR>", desc="[T]ags" },
    })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",  -- Trigger only for Markdown files
  callback = add_obsidian_keybindings
})
