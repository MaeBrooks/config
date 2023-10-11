local function path()
  return vim.fn.expand("%:p")
end

vim.api.nvim_create_user_command("Path", function()
  print(path())
end, {})

return path
