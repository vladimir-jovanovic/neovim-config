local opt = vim.opt

opt.title = true

vim.scriptencoding = 'UTF-8'
opt.encoding = 'UTF-8'
opt.fileencoding = 'UTF-8'

opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.si = true
opt.smarttab = true
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

--opt.cursorline = true

opt.termguicolors = true
opt.background = 'light'
opt.signcolumn = 'yes'

opt.backspace = 'indent,eol,start'

opt.path:append { '**' }
opt.clipboard:append('unnamedplus')

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append('-')

opt.guicursor = 'n-v-c-i:ver100-iCursor,n-v-c:blinkon0,i:blinkwait700-blinkoff400-blinkon250'
