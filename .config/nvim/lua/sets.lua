local opt = vim.opt

opt.completeopt = {'menuone', 'noinsert', 'noselect'}
opt.expandtab = true
opt.hidden = true
opt.ignorecase = true
opt.incsearch = true
opt.smartindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop=2
opt.expandtab = true
opt.textwidth = 100
opt.mouse = "a"
opt.signcolumn = "yes"
opt.wrap = true
opt.linebreak = true
opt.colorcolumn = "80"
opt.swapfile = false
opt.clipboard = "unnamedplus"
opt.wildmenu = true
opt.wildmode= { "list", "longest"}
opt.smartcase = true

vim.cmd([[
    set nocompatible
    set backspace=indent,eol,start
    set autoindent
    set cursorline
    "set cursorcolumn
    set ignorecase
    set incsearch
    set shiftwidth=2
    set tabstop=2
    set softtabstop=2
    set expandtab
    set textwidth=100
    set signcolumn=yes
    set wrap
    set linebreak
    set clipboard=unnamedplus
    "reqular expressions
    set magic
    set encoding=utf-8
]])
