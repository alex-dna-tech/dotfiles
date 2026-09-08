vim.opt.backup = false
vim.opt.clipboard:append("unnamedplus")
vim.opt.colorcolumn = "0"
vim.opt.completeopt = "menu,menuone,preselect,noinsert,fuzzy,nosort"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.isfname:append("@-@")
vim.opt.laststatus = 3
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c")
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true
vim.opt.wrap = true

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
    callback = function()
        if vim.bo.modifiable and vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" then
            vim.cmd("silent! write")
        end
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    callback = function()
        vim.hl.hl_op()
    end,
})

vim.g.netrw_banner = 0
vim.cmd("let g:netrw_liststyle = 3")
vim.opt.shell = "bash --login -c"


-- Alternative visual block mode: Alt+v
vim.keymap.set('n', '<A-v>', '<C-v>', { noremap = true })
