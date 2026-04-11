-- Python-specific settings and keymaps
local opts = { buffer = true, silent = true }

-- Run current file
vim.keymap.set("n", "<leader>pr", function()
  vim.cmd("split | terminal python3 %")
end, vim.tbl_extend("force", opts, { desc = "Run Python file" }))

-- Run with debugger (pdb)
vim.keymap.set("n", "<leader>pd", function()
  vim.cmd("split | terminal python3 -m pdb %")
end, vim.tbl_extend("force", opts, { desc = "Debug Python file with pdb" }))

-- Insert breakpoint
vim.keymap.set("n", "<leader>pb", function()
  local line = "breakpoint()  # DEBUG"
  vim.api.nvim_put({ line }, "l", true, true)
end, vim.tbl_extend("force", opts, { desc = "Insert breakpoint()" }))

-- Run pytest on current file
vim.keymap.set("n", "<leader>pt", function()
  vim.cmd("split | terminal pytest -v %")
end, vim.tbl_extend("force", opts, { desc = "Run pytest on file" }))

-- Run pytest on current function (cursor on function)
vim.keymap.set("n", "<leader>pT", function()
  local func_name = vim.fn.expand("<cword>")
  vim.cmd("split | terminal pytest -v % -k " .. func_name)
end, vim.tbl_extend("force", opts, { desc = "Run pytest on function" }))
