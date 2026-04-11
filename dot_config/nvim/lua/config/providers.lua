local M = {}

function M.setup()
  local data = vim.fn.stdpath("data")
  local host = data .. "/python-host/.venv/bin/python"
  if vim.fn.executable(host) == 1 then
    vim.g.python3_host_prog = host
  else
    vim.schedule(function()
      vim.notify(("python3_host_prog not found: %s"):format(host), vim.log.levels.WARN)
    end)
  end
end

return M
