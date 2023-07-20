vim.g.mapleader = " "

vim.o.guicursor = ""

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.o.iskeyword = "@,48-57,192-255"

vim.o.smartindent = true

vim.o.wrap = false

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.gdefault = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.laststatus = 2
vim.o.showmode = false

vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.relativenumber = true
vim.o.number = true

vim.o.termguicolors = true

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

vim.opt.isfname:append("@-@")

vim.o.updatetime = 50
vim.o.colorcolumn = "90"

vim.o.ttimeoutlen = 100

vim.o.foldlevel = 3
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

vim.g.rustfmt_autosave = 1
