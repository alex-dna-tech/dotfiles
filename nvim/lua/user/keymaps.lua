--[[ Modes:
normal_mode = "n",
insert_mode = "i",
visual_mode = "v",
visual_block_mode = "x",
term_mode = "t",
command_mode = "c", ]]

-- Shorten function name
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--Remap space as leader key
local k = vim.keymap
vim.g.mapleader = " "
k.set("n", "<Space>", "<Nop>", term_opts)

-- Resize with arrows
k.set("n", "<A-Up>", ":resize +2<cr>", opts)
k.set("n", "<A-Down>", ":resize -2<cr>", opts)
k.set("n", "<A-Left>", ":vertical resize +2<cr>", opts)
k.set("n", "<A-Right>", ":vertical resize -2<cr>", opts)

-- Navigate buffers
k.set("n", "<S-l>", ":bnext<cr>", opts)
k.set("n", "<S-h>", ":bprevious<cr>", opts)

-- Move text up and down
k.set("n", "<A-j>", "<Esc>:m .+1<cr>==gi", opts)
k.set("n", "<A-k>", "<Esc>:m .-2<cr>==gi", opts)

-- Copy
k.set("n", "<leader>y", 'gg0"+yG', { noremap = true, silent = true, desc = "Yank All Buffer" })

-- Tmux
k.set("n", "<leader>t", "", { desc = "+Tmux" })
k.set(
	"v",
	"<leader>tc",
	'y<cr>:call system("tmux load-buffer -", @0)<cr>gv',
	{ noremap = true, silent = true, desc = "Copy Visual" }
)
k.set(
	"n",
	"<leader>tc",
	':call system("tmux load-buffer -", @0)',
	{ noremap = true, silent = true, desc = "Copy Normal" }
)
k.set(
	"n",
	"<leader>tp",
	':let @0 = system("tmux save-buffer -")<cr>"0p<cr>g;',
	{ noremap = true, silent = true, desc = "Paste" }
)

-- Insert --
-- Press jj,kk fast to enter
k.set("i", "jj", "<ESC>", opts)
k.set("i", "kk", "<ESC>", opts)
k.set("i", "<C-c>", "<ESC>l", opts)

-- Visual --
-- Stay in indent mode
k.set("v", "<", "<gv", opts)
k.set("v", ">", ">gv", opts)

-- Move text up and down
k.set("v", "<A-j>", ":m .+1<cr>==", opts)
k.set("v", "<A-k>", ":m .-2<cr>==", opts)
k.set("v", "d", '"_d', opts)
k.set("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
k.set("x", "J", ":move '>+1<cr>gv-gv", opts)
k.set("x", "K", ":move '<-2<cr>gv-gv", opts)
k.set("x", "<A-j>", ":move '>+1<cr>gv-gv", opts)
k.set("x", "<A-k>", ":move '<-2<cr>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
k.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
k.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
k.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
k.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Refresh config
k.set("n", "<leader>so", ":so $MYVIMRC<cr>", { desc = "Refresh Neovim Config" })

k.set("c", "w!!", "w !sudo tee % >/dev/null", term_opts)

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("com! W w")
vim.cmd("com! Wq wq")
vim.cmd("com! Q q")
vim.cmd("com! Qa qa")
