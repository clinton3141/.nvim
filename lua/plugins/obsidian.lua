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
        },
        workspaces = workspaces,
    }
}

