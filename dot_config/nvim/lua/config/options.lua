local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.wrap = false

-- Undo
opt.undofile = true
local undodir = vim.fn.expand("~/.config/nvim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
opt.undodir = undodir

-- Clipboard
opt.clipboard = "unnamedplus"

-- Other
opt.scrolloff = 8
opt.updatetime = 50
opt.timeoutlen = 300

-- Disable unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

