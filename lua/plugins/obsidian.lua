local utils = require("utils")
local workspaces = {}

local vaults = {
  {
    name = "work",
    path = os.getenv("HOME") .. "/obsidian/work",
  },
  {
    name = "personal",
    path = os.getenv("HOME") .. "/obsidian/vault",
  },
}

for _, vault in pairs(vaults) do
  if utils.directory_exists(vault.path) then
    table.insert(workspaces, vault)
  end
end

local wk = require("which-key")
local function add_obsidian_keybindings()
  wk.add({
    { "<leader>o", group = "[O]bsidian" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc = "[B]acklinks" },
    { "<leader>od", "<cmd>ObsidianDailies<CR>", desc = "[D]ailies" },
    { "<leader>of", "<cmd>ObsidianFollowLink<CR>", desc = "[F]ollow link" },
    { "<leader>oi", "<cmd>ObsidianTemplate<CR>", desc = "[I]nsert template" },
    { "<leader>ol", "<cmd>ObsidianLinks<CR>", desc = "[L]inks" },
    { "<leader>on", "<cmd>ObsidianNewFromTemplate<CR>", desc = "[N]ew" },
    { "<leader>oo", "<cmd>ObsidianQuickSwitch<CR>", desc = "[O]pen (Quickswitch)" },
    { "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "[S]earch" },
    { "<leader>or", "<cmd>ObsidianRename<CR>", desc = "[R]ename" },
    { "<leader>ot", "<cmd>ObsidianTags<CR>", desc = "[T]ags" },
  })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown", -- Trigger only for Markdown files
  callback = add_obsidian_keybindings,
})

return {
  "epwalsh/obsidian.nvim",
  tag = "v3.9.0",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    daily_notes = {
      folder = "Daily notes",
      template = "daily.md",
    },
    notes_subdir = "inbox",
    new_notes_location = "notes_subdir",
    workspaces = workspaces,
    templates = {
      folder = "templates",
    },
    note_id_func = function(title)
      if title ~= nil then
        return title
      end
      local suffix = ""
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
      return tostring(os.time()) .. "-" .. suffix
    end,
    note_frontmatter_func = function(note)
      local util = require("utils")
      -- Add the title of the note as an alias.
      if note.title then
        note:add_alias(note.title)
      end

      -- note: missing out tags. My Zettelkasten uses notes as tags
      local out = { id = note.id, aliases = note.aliases }

      if note.metadata == nil then
        note.metadata = {}
      end

      local parent_folder = string.match(note.path.filename, ".*/([^/]+)/[^/]+%.md$")
      local excluded_for_date = { "tags", "books" }

      -- add in a date field to the frontmatter if required
      if not util.table_contains(excluded_for_date, parent_folder) then
        if note.metadata.date == nil then
          note.metadata.date = os.date("%Y-%m-%d")
        end
      end

      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      return out
    end,
  },
}
