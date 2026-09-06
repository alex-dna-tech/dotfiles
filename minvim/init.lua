-- OPTIONS
local options = {
  backup = false,            -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 2,             -- more space in the neovim command line for displaying messages
  conceallevel = 2,          -- so that `` is visible in markdown files
  cursorline = true,         -- highlight the current line
  expandtab = true,          -- convert tabs to spaces
  fileencoding = "utf-8",    -- the encoding written to a file
  guicursor = "",            -- always fat cursor
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  hlsearch = true,           -- highlight all matches on previous search pattern
  ignorecase = true,         -- ignore case in search patterns
  mouse = "a",               -- allow the mouse to be used in neovim
  number = true,             -- set numbered lines
  numberwidth = 4,           -- set number column width to 2 {default 4}
  pumheight = 10,            -- pop up menu height
  relativenumber = true,     -- set relative numbered lines
  scrolloff = 8,             -- keep 8 lines above and below the cursor
  shiftwidth = 2,            -- the number of spaces inserted for each indentation
  showmode = false,          -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,           -- always show tabs
  sidescrolloff = 8,         -- leave space on scroll
  signcolumn = "yes",        -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,          -- smart case
  smartindent = true,        -- make indenting smarter again
  splitbelow = true,         -- force all horizontal splits to go below current window
  splitright = true,         -- force all vertical splits to go to the right of current window
  swapfile = false,          -- creates a swapfile
  tabstop = 2,               -- insert 2 spaces for a tab
  termguicolors = true,      -- set term gui colors (most terminals support this)
  timeoutlen = 1000,         -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,           -- enable persistent undo
  updatetime = 50,           -- faster completion (4000ms default)
  wrap = true,               -- wrap long lines
  writebackup = false,       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("let g:netrw_liststyle = 3")
vim.opt.shell = "bash --login -c"

-- KEYMAPS
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
k.set("n", "<leader><leader>o", ":%bd|e#<cr>")

-- Move text up and down
k.set("n", "<A-j>", "<Esc>:m .+1<cr>==gi", opts)
k.set("n", "<A-k>", "<Esc>:m .-2<cr>==gi", opts)

-- Copy
k.set("n", "<leader>y", 'gg0"+yG', { noremap = true, silent = true, desc = "Yank All Buffer" })

-- Tmux
k.set("n", "<leader>t", nil, { desc = "+Tmux" })
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

-- PLUGINS
vim.pack.add({
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
vim.cmd("set completeopt+=noselect")

require("mini.pick").setup()
require("nvim-treesitter.configs").setup({
  ensure_installed = { "go", "typescript", "javascript" },
  highlight = { enable = true },
})
require("oil").setup()

vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>o", ":Oil<CR>")

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.lsp.enable({ "lua_ls", "biome", "tinymist", "emmetls" })

require("vague").setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
