local M = {}
M.on_windows = function (callback)
  if vim.fn.has("win32") then
    callback()
  end
end
return M
