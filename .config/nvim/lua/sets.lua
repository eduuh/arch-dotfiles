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
opt.signcolumn = "yes"
opt.linebreak = true
opt.colorcolumn = "80"
opt.swapfile = false
opt.clipboard = "unnamedplus"
opt.wildmode= { "list", "longest"}
opt.smartcase = true
opt.mouse = "a"

vim.cmd([[
    set noscrollbind
    set nocompatible
    set backspace=indent,eol,start
    set noerrorbells
    set termguicolors
    set cursorline
    "set cursorcolumn
    set ignorecase
    set incsearch
    set shiftwidth=2
    set softtabstop=2
    set expandtab
    set textwidth=100
    set signcolumn=yes
    set linebreak
    set wrap
    "reqular expressions
    set magic
    set encoding=utf-8
    set lazyredraw
    au CursorHold * checktime
    set display+=lastline
]])

vim.cmd([[
" trigger `autoread` when files changes on disk
      set autoread
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
    " notification after file change
      autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]])
