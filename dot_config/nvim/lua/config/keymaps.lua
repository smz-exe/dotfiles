local keymap = vim.keymap

-- ============================================================================
-- General
-- ============================================================================

-- Save and quit
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- ============================================================================
-- Window Navigation
-- ============================================================================

-- Navigate between windows
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- ============================================================================
-- Terminal
-- ============================================================================

-- Open terminal
keymap.set("n", "<leader>t", ":belowright 10split | terminal<CR>i",
    { noremap = true, silent = true, desc = "Open terminal at bottom" })

-- Terminal mode: exit to normal mode
keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })
keymap.set('t', '<C-[>', [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })

-- Terminal mode: window navigation
keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { noremap = true, silent = true, desc = "Move to left window" })
keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { noremap = true, silent = true, desc = "Move to bottom window" })
keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { noremap = true, silent = true, desc = "Move to top window" })
keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { noremap = true, silent = true, desc = "Move to right window" })

-- ============================================================================
-- Visual Mode
-- ============================================================================

-- Move lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- ============================================================================
-- Insert Mode
-- ============================================================================

-- Quick navigation
keymap.set("i", "<C-]>", "<Esc>]}a", { desc = "Jump out of current block" })
keymap.set("i", ";;", "<End>;", { desc = "Jump to end and add semicolon" })
