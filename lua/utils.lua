local M = {}

local uv = vim.loop

M.directory_exists = function(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "directory" or false
end

return M
