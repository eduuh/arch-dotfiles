local api = vim.api

api.nvim_set_keymap("n","<Space>","<NOP>",{ noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.termguicolors = true
api.nvim_set_keymap("n","<Leader>h",  ":set hlsearch!<CR>",  { noremap = true, silent = true } )
--remapping movements
api.nvim_set_keymap("n","n","h",{ noremap = true, silent = true })
api.nvim_set_keymap("n","e","j",{ noremap = true, silent = true })
api.nvim_set_keymap("n","i","l",{ noremap = true, silent = true })
api.nvim_set_keymap("n","u","k",{ noremap = true, silent = true })

api.nvim_set_keymap("n","l","i",{ noremap = true, silent = true })
api.nvim_set_keymap("n","k","n",{ noremap = true, silent = true })
api.nvim_set_keymap("n","h","u",{ noremap = true, silent = true })

api.nvim_set_keymap("t","<Esc>","<C-><C-n>",{ noremap = true, silent = true })

--plugin remaps
api.nvim_set_keymap("n","<C-b>",":NvimTreeToggle<cr>",{ noremap = true, silent = true })

api.nvim_set_keymap("n","<BS>","<C-^>",{ noremap = true, silent = true })

api.nvim_set_keymap("n","<leader>t",":vsp<space>$todo<CR>",{ noremap = true, silent = true })
api.nvim_set_keymap("n","<leader>n",":cnext<CR>",{ noremap = true, silent = true })
api.nvim_set_keymap("n","<leader>p",":cprev<CR>",{ noremap = true, silent = true })

api.nvim_set_keymap("n","<leader>cs",":so ~/.config/nvim/init.lua<CR>",{ noremap = true, silent = true })
api.nvim_set_keymap("n","<leader>co",":e ~/.config/nvim/init.lua<CR>",{ noremap = true, silent = true })


vim.cmd([[
  vnoremap U :m '<-2<CR>gv=gv
  vnoremap E :m '>+1<CR>gv=gv
  cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
]])