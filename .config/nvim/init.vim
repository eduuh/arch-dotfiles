" leader key: space
nnoremap <SPACE> <Nop>
let mapleader =" "

set completeopt=menuone,noselect

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'ayu-theme/ayu-vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-git'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'puremourning/vimspector'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
"debuggin setup
Plug 'szw/vim-maximizer'
" change the working directory to the files root directory
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'
" syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'camgraff/telescope-tmux.nvim'
" async stuff
Plug 'tpope/vim-dispatch'
Plug 'nathanmsmith/nvim-ale-diagnostic'
"Plug 'OmniSharp/omnisharp-vim'
Plug 'stevearc/vim-arduino'
Plug 'Pocco81/AutoSave.nvim'
Plug 'vim-airline/vim-airline'
Plug 'github/copilot.vim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'tpope/vim-commentary'
Plug 'jlcrochet/vim-razor'
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'nickspoons/vim-sharpenup'
Plug 'SirVer/ultisnips'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'SirVer/ultisnips'

Plug 'rstacruz/vim-closer'
call plug#end()

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %

" Recompile dwmblocks on config edit.
autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" loading my ayu theme
set termguicolors
let ayucolor="dark"
colorscheme ayu

" source  $HOME/.config/nvim/coc.vim

nnoremap <leader>h :call ToggleHiddenAll()<CR>

"Usage: telescope
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <C-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"configuration reload
nnoremap <leader>cs :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>co :e ~/.config/nvim/init.vim<CR>


nnoremap <C-_> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown())<cr>

nnoremap <leader>sc <cmd>lua require("telescope.builtin").find_files({hidden=true,search_dirs={'~/.local//bin'} ,layout_config={prompt_position="top"}})<cr>
nnoremap <leader>src :Telescope find_browser cwd=~/.local/src <cr>


let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger remaps


nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>vl :call vimspector#Launch()<CR>
nnoremap <leader>vc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>vt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>vv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>vw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>vs :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>vo :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>vq :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>vi <Plug>VimspectorStepInto
nmap <leader>vu <Plug>VimspectorStepOver
nmap <leader>vn <Plug>VimspectorStepOut
nmap <leader>vr <Plug>VimspectorRestart
nnoremap <leader>tc :call vimspector#Continue()<CR>
nmap <leader><F11> <Plug>VimspectorUpFrame
nmap <leader><F12> <Plug>VimspectorDownFrame


nmap <leader>rc <Plug>VimspectorRunToCursor
nmap <leader>tb <Plug>VimspectorToggleBreakpoint
nmap <leader>cb <Plug>VimspectorToggleConditionalBreakpoint

nnoremap <silent> <leader>qn :cnext<CR>
nnoremap <silent> <leader>qp :cprev<CR>


" <Plug>VimspectorStop
" <Plug>VimspectorPause
" <Plug>VimspectorAddFunctionBreakpoint

let g:vimspector_sign_priority = {
  \    'vimspectorBP':         998,
  \    'vimspectorBPCond':     997,
  \    'vimspectorBPDisabled': 996,
  \    'vimspectorPC':         999,
  \ }

lua require("telescope").load_extension("git_worktree")

nnoremap <leader>sc :Telescope find_files cwd=~/.local/bin <cr>
nnoremap <leader>src :Telescope find_browser cwd=~/.local/src <cr>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

"harpoon
nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-t> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-n> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-s> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <C-h> :lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>
nnoremap <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>

lua <<EOF
require("harpoon").setup({
     global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = true,
    },
    projects = {
        ["/home/edd/repos/catalog.git/master"] = {
            term = {
                cmds = {
                    "dotnet build && dotnet watch run"
                }
            }
        }
      }
      })
EOF

lua require('telescope').load_extension('fzf')

lua <<EOF
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF


lua <<EOF
require('telescope').setup{
  defaults = {
     prompt_prefix = "> ",
  file_ignore_patterns = {"obj", "bin", "node_modules"},
  mappings= {
     n = {
      ["<leader><leader>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
      ["<leader>q"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist
      }
    },
     extensions = {
         fzf = {
            fuzzy = true,
            override_file_sorter = true,
      case_mode = "smart_case",
           }
       }
  }
}
EOF

lua <<EOF
require("autosave").setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave","TextChanged", "BufLeave"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = true,
        on_off_commands = true,
        clean_command_line_interval = 0,
		    debounce_delay = 135
    }
)
EOF


"remove exta space with keybinding
nnoremap <silent> <leader>q :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

autocmd FileType cs nnoremap <leader>rc :Dispach dotnet run<cr>
autocmd FileType cs nnoremap <leader>rb :Dispach dotnet build<cr>
autocmd FileType cs nnoremap <leader>rt :OmniSharpRunTest<cr>
let g:OmniSharp_highlighting = 0
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>

let g:ale_linters = {
\ 'cs': ['OmniSharp'],
  \ 'sh': ['language_server'],
\}


set incsearch
set smartindent
set shiftwidth=2
set tabstop=2 softtabstop=2 expandtab
set noswapfile
set updatetime=50
set breakindent
set breakindentopt=shift:2,min:40,sbr
set colorcolumn=80
set textwidth=100
set wrap
set linebreak
" Some basics:
nnoremap c "_c
filetype plugin on
syntax on
set encoding=utf-8
set nohlsearch
set mouse=a
set noshowmode
set noruler
set noshowcmd
" ifind
set path+=**
set wildignore+=**/coverage/*
" Enable
set wildmode=longest,list,full
set wildmenu
set mouse=a
set noswapfile
set incsearch
set hidden
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/obj*
set wildignore+=**/bin*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>
" move lines up or down
  " move down
vnoremap N :m '>+1<CR>gv=gv
  " move up
vnoremap E :m '<-2<CR>gv=gv
set signcolumn=yes
" Toggle between alternate files
nmap <BS> <C-^>
" Open my bibliography file in split
map <leader>b :vsp<space>$BIB<CR>
map <leader>r :vsp<space>$REFER<CR>
" Replace all is aliased to S
nnoremap S :%s//g<Left><Left>
xnoremap <leader>p "_dP
" getting out of terminal mode
tnoremap <Esc> <C-\><C-n>
"great remap
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" delete without putting in register
nnoremap <leader>d "_d
vnoremap <leader>d "_d


" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.cs lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()

source  $HOME/.config/nvim/defx.vim
luafile $HOME/.config/nvim/lsp.lua
luafile $HOME/.config/nvim/compe-config.lua
