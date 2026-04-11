vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.providers").setup()
require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")
