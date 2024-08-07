--[[ Modes:
normal_mode = "n",
insert_mode = "i",
visual_mode = "v",
visual_block_mode = "x",
term_mode = "t",
command_mode = "c", ]]

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
vim.g.mapleader = " "
keymap("n", "<leader>e", vim.cmd.Ex)
keymap("", "<Space>", "<Nop>", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Copy
keymap("n", "<leader>y", "+y", opts)
keymap("v", "<leader>y", "+y", opts)
keymap("n", "<leader>Y", 'gg0"+yG', opts)
keymap("v", "<leader>tc", 'y<cr>:call system("tmux load-buffer -", @0)<cr>gv', opts)
keymap("n", "<leader>tc", ':call system("tmux load-buffer -", @0)', opts)
keymap("n", "<leader>tp", ':let @0 = system("tmux save-buffer -")<cr>"0p<cr>g;', opts)

-- Insert --
-- Press jj,kk fast to enter
keymap("i", "jj", "<ESC>", opts)
keymap("i", "kk", "<ESC>", opts)
keymap("i", "<C-c>", "<ESC>l", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "d", '"_d', opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Refresh config
keymap("n", "<Leader>r", ":so $MYVIMRC<CR>", term_opts)

keymap("c", "w!!", "w !sudo tee % >/dev/null", term_opts)

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "com! W w"
vim.cmd "com! Wq wq"
vim.cmd "com! Q q"
vim.cmd "com! Qa qa"
