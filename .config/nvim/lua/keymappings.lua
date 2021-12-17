local opts = { noremap = true, silent = true }
local cmd_opts = { expr = true, noremap = true }
-- shorten function name
local keymap = vim.api.nvim_set_keymap

--Modes
-- normal_mode = "n"
-- Insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x"
-- term_mode = "t"
-- command_mode = "c"

keymap("n","<Space>","<NOP>",opts)

vim.g.mapleader = ' '
vim.g.termguicolors = true
keymap("n","<Leader>h",  ":set hlsearch!<CR>",  opts )

--remapping movements
-- Normal Mode
-- Remaps to my Custom Keyboard
keymap("n","n","h",opts)
keymap("n","e","j",opts)
keymap("n","i","l",opts)
keymap("n","u","k",opts)
keymap("n","l","i",opts)
keymap("n","k","n",opts)
keymap("n","h","u",opts)

-- Terminal --
-- harpoon --
keymap("t","<Esc>","<C-><C-n>",opts)

-- quickfix list
keymap("n","<leader>n",":cnext<CR>",opts)
keymap("n","<leader>p",":cprev<CR>",opts)

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- Alternate file
keymap("n","<BS>","<C-^>",opts)
keymap("i","<c-o>","<C-x><C-x>",opts)

-- Toggle File Manaeger
keymap("n","<c-t>",":Defx<cr>",opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "U", ":m '<-2<CR>gv=gv", opts)
keymap("v", "E", ":m '>+1<CR>gv=gv", opts)
keymap("n", "<leader>cd", ":cd %:p:h<CR>", opts) 

-- Builds can run asynchoronousul with vim dispatch installed
keymap("n", "<leader>b", ":wa!<cr>:OmniSharpBuildAsync<cr>", opts)
keymap("n", "<C-b>", ":wa!<cr>:OmniSharpBuildAsync<cr>", opts)


-- Command --
-- Menu navigation
keymap("c", "<C-j>",  'pumvisible() ? "\\<C-n>" : "\\<C-j>"', cmd_opts )
keymap("c", "<C-k>",  'pumvisible() ? "\\<C-p>" : "\\<C-k>"', cmd_opts )
keymap("c", "w!!",  'execute "silent! write !sudo tee % >/dev/null" <bar> edit!', cmd_opts)

vim.cmd([[
  autocmd FileType cs nmap <silent> <buffer> <Leader>b :!dotnet build
  autocmd FileType cpp nmap  <buffer> <Leader>b :!g++ -g -Wall % -o program <cr>
  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
]])

-- TODO force omnisharp to reload server when switching branches
-- noremap <leader>rl :OmniSharpReloadSolution<cr>
-- nnoremap <leader>cf :OmniSharpCodeFormat<cr>

