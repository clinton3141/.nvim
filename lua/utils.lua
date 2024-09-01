local M = {}

local uv = vim.loop

M.directory_exists = function(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "directory" or false
end

M.table_contains = function(table, value)
    for _, v in pairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

return M
