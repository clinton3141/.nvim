local utils = require('utils')
local workspaces = {}

local vaults = {
    {
        name = "work",
        path = os.getenv("HOME") .. "/obsidian/work"
    },
    {
        name = "personal",
        path = os.getenv("HOME") .. "/obsidian/vault"
    }
}

for _, vault in pairs(vaults) do
    if utils.directory_exists(vault.path) then
        table.insert(workspaces, vault)
    end
end

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
        note_frontmatter_func = function(note)
          -- Add the title of the note as an alias.
          if note.title then
            note:add_alias(note.title)
          end

          local out = { id = note.id, aliases = note.aliases, tags = note.tags }

          -- `note.metadata` contains any manually added fields in the frontmatter.
          -- So here we just make sure those fields are kept in the frontmatter.
          if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
            for k, v in pairs(note.metadata) do
              out[k] = v
            end
          end

          return out
        end,
    }
}

