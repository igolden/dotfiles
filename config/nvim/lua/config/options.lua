-- Disable mouse
vim.opt.mouse = ""


-- Shell and encoding
vim.opt.shell = "zsh"
vim.opt.encoding = "utf-8"

-- Editor UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cmdheight = 4
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.showmatch = true
vim.opt.showtabline = 1
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 3
vim.opt.numberwidth = 3
vim.opt.winwidth = 70

-- Indentation and tabs
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Folds
vim.opt.foldmethod = "manual"
vim.opt.foldnestmax = 10
vim.opt.foldenable = false
vim.opt.foldlevel = 1
vim.opt.foldminlines = 0

-- Buffers & files
vim.opt.hidden = true
vim.opt.history = 1000
vim.opt.backspace = { "eol", "indent", "start" }
---vim.opt.noswapfile = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.switchbuf = "useopen"

-- Wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = { "longest", "list" }
vim.opt.wildignore:append({ "vendor/**", ".bundle*", "*node_modules*" })

-- Disable terminal control codes that mess up Neovim
----vim.opt.t_te = ""
----vim.opt.t_ti = ""
