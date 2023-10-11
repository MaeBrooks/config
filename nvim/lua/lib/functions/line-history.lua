local path = require "lib/functions/path"

local function open_split(buf)
  vim.cmd ":vsplit"
  vim.api.nvim_win_set_buf(0, buf)
  return vim.api.nvim_get_current_win()
end

local function open_scratch_buffer()
  local buf = vim.api.nvim_create_buf(true, true)

  if buf == 0 then
    error("unable to open listed scratch buffer")
  end

  return buf
end

local function line_history()
  local buf_is_modified = vim.api.nvim_buf_get_option(0, "modified")

  if buf_is_modified then
    error("Unable to check line history of current buffer, has unsaved changes")
  end

  local file_path = path();
  local cursor = vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())
  local line_number = cursor[1]

  local cmd = string.format(
    ":!git log -L %d,+1:%s",
    line_number,
    file_path
  )

  return vim.fn.split(vim.api.nvim_exec2(cmd, { output = true }).output, "\n")
end

vim.api.nvim_create_user_command("LineHistory", function()
  local buf = open_scratch_buffer()

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, line_history())

  open_split(buf)
  vim.cmd ":set filetype=git"
end, {})

return line_history
