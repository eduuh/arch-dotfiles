local opt = vim.opt

local options = {
   backup = false,                                  -- creates a backup file
   clipboard = "unnamedplus",                       -- allow neovim to access the system clipboard
   cmdheight = 1,                                   -- more space in nvim command line for displaying messages
   completeopt = "menuone,noinsert,menu",           -- mostly for cmp
   fileencoding = "utf-8",                          -- the encoding of written file
   hidden = true,                                   -- required to keep multiple buffers and open multiple buffers
   hlsearch = true,                                 -- highlight all matches on previous search pattern
   incsearch=true,
   mouse = "a",                                     -- allow the mouse to be used in neovim
   showmode = false,                                -- no need to see -- INSERT-- anymore
   smartcase = true,                                -- smart case
   smartindent = true,                              -- Making identing smarter
   splitbelow= true,                                -- force all horizontal splits to go below current window
   splitright = true,                               -- force all vertical splits to go to the right of current window.
   swapfile = false,                                -- creates a swapfile; disables
   termguicolors = true,                            -- set term gui colors (most terminal support this)
   timeoutlen= 500,                                 -- time to wait for a mapped sequence to complete (in milliseconds)
   undofile=true,                                   -- enables persistent undo
   updatetime=300,                                  -- faster completion (4000 ms default)
   writebackup=false,                               -- if a file is being edited by another program
   expandtab = true,                                -- convert tabs to spaces
   tabstop = 4,                                     -- Insert 2 spaces for tab
   softtabstop=2,
   shiftwidth = 4,                                  -- the number of space inserted for each indetntation
   cursorline = true,                               -- highlight the current line
   signcolumn = "yes",                              -- always show the sign colum, otherwise it would shift text each time
   scrolloff = 8,
   colorcolumn = "80",
   autoindent= true,
}

vim.cmd "let g:sharpenup_map_prefix = '<leader>'"
vim.opt.shortmess:append "c"


for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd[[
    set nocompatible
    set backspace=indent,eol,start
    set history=1000
    set showcmd
    set autoread
    set ignorecase
    set confirm
]]

vim.cmd([[
    if !isdirectory($HOME . "/.nvim/swp/")
        call mkdir($HOME . "/.nvim/swp/", "p", 0700)
    endif

    if !isdirectory($HOME . "/.nvim/undodir/")
        call mkdir($HOME . "/.nvim/undodir/", "p", 0700)
    endif

    set directory=$HOME/.nvim/swp//
    set undodir=~/.nvim/undodir
]])

