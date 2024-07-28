-- vim.opt.guicursor = ''

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- vim.opt.smartindent = true

vim.opt.wrap = false

-- vim.opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.ul = 10000

-- Set highlight on search
vim.opt.hlsearch = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- makes @ and - valid characters in file names.
vim.opt.isfname:append '@-@'

vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 7
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 50

vim.opt.colorcolumn = '80'

-- conceallevel
vim.o.conceallevel = 1

return {}
