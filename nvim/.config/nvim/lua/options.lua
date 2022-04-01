local opt = vim.opt

opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.cursorline = true
opt.mouse = 'a'

opt.number = true
opt.relativenumber = true

opt.hlsearch = true
opt.smartcase = true
opt.inccommand = 'split'
opt.incsearch = true

opt.list = true
opt.listchars = { tab = '→ ', trail = '▪' }

opt.smartindent = true
opt.cc = '80'

opt.signcolumn = 'yes:1'

opt.scrolloff = 8
opt.completeopt = 'menu,menuone,noselect'

opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
