vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>", { noremap = true, silent = true })

-- Resize with arrows
vim.keymap.set("n", "<A-Up>", ":resize +2<cr>", { noremap=true, silent=true })
vim.keymap.set("n", "<A-Down>", ":resize -2<cr>", { noremap=true, silent=true })
vim.keymap.set("n", "<A-Left>", ":vertical resize +2<cr>", { noremap=true, silent=true })
vim.keymap.set("n", "<A-Right>", ":vertical resize -2<cr>", { noremap=true, silent=true })

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<cr>", { noremap=true, silent=true })
vim.keymap.set("n", "<S-h>", ":bprevious<cr>", { noremap=true, silent=true })
vim.keymap.set("n", "<leader><leader>o", ":%bd|e#<cr>")

-- Copy
vim.keymap.set("n", "<leader>y", 'gg0"+yG', { noremap = true, silent = true, desc = "Yank All Buffer" })

-- Tmux
vim.keymap.set("n", "<leader>t", "", { desc = "+Tmux" })
vim.keymap.set( "v", "<leader>tc", 'y<cr>:call system("tmux load-buffer -", @0)<cr>gv', { noremap = true, silent = true, desc = "Copy Visual" })
vim.keymap.set( "n", "<leader>tc", ':call system("tmux load-buffer -", @0)', { noremap = true, silent = true, desc = "Copy Normal" })
vim.keymap.set( "n", "<leader>tp", ':let @0 = system("tmux save-buffer -")<cr>"0p<cr>g;', { noremap = true, silent = true, desc = "Paste" })

-- Insert --
-- Press jj,kk fast to enter
vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "kk", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-c>", "<ESC>l", { noremap = true, silent = true })

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<cr>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m .-2<cr>==", { noremap = true, silent = true })
vim.keymap.set("v", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<cr>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "K", ":move '<-2<cr>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "<A-j>", ":move '>+1<cr>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "<A-k>", ":move '<-2<cr>gv-gv", { noremap = true, silent = true })

vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No Highlight" })

vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word cursor is on globally" })
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

vim.keymap.set("n", "<leader>so", "<cmd>restart<cr>", { desc = "Restart config :restart)" })

-- native undotree
vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })


vim.keymap.set("c", "w!!", "w !sudo tee % >/dev/null", { silent = true, desc = "Write to file with sudo permissions" })
vim.keymap.set("n", "<leader>c", "<cmd>bdelete<CR>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>w", "<cmd>w!<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit" })

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("com! W w")
vim.cmd("com! Wq wq")

