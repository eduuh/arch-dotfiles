require('plugins')
require('keymappings')
require('sets')
require('lsp')
require('telescope-config')
require('defx')
--require('colemak')

vim.cmd([[
set omnifunc=ale#completion#OmniFunc
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1
let g:ale_linters = { 'cs': ['OmniSharp'] }
]])

require('autosave').setup(
  {
       events = {"TextChanged", "BufLeave"},
  }
)

require('harpoon-config')

require 'colorizer'.setup {
  'css';
  'javascript';
  'xdefaults';
  html = {
    mode = 'foreground';
  }
}

require('lualine').setup{
   options = {
          theme = 'codedark'
   }
}

local neogit = require('neogit')
neogit.setup()

require('nvim_comment').setup()

--set theme
vim.o.background = "dark"
vim.cmd([[
   "colorscheme gruvbox
    colorscheme dracula
]])

--remove whitespaces ff
vim.cmd([[
augroup whitespaces
   autocmd!
  "autocmd BufWritePre * %s/\s\+$//e
  "autocmd BufWritePre * %s/\n\+\%$//e
  "autocmd BufWritePre *.[ch] %s/\%$/\r/e
augroup end
]])


--Run xrdb whenever xdefault or xresources changes
vim.cmd([[
  augroup xrdb
     autocmd!
     autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
     autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb -merge %
   augroup end
]])

vim.cmd([[
  nnoremap <leader>vl :call vimspector#Launch()<CR>
  nnoremap  <leader>vq :call vimspector#Reset()<CR>
  nnoremap  <leader>i :call vimspector#StepInto()<CR>
  nnoremap  <leader>u :call vimspector#StepOver()<CR>
  nnoremap  <leader>o :call vimspector#StepOut()<CR>
  nnoremap  <leader>r :call vimspector#Restart()<CR>
  nnoremap  <leader>c :call vimspector#Continue()<CR>
  nnoremap  <leader>su :call vimspector#UpFrame()<CR>
  nnoremap  <leader>sd :call vimspector#DownFrame()<CR>
  nnoremap  <leader>rc :call vimspector#RunToCursor()<CR>
  nnoremap  <leader>tb :call vimspector#ToggleBreakpoint()<CR>
  nnoremap  <leader>cb :call vimspector#ClearBreakpoints()<CR>
  

  let g:vimspector_sign_priority = {
  \    'vimspectorBP':         998,
  \    'vimspectorBPCond':     997,
  \    'vimspectorBPDisabled': 996,
  \    'vimspectorPC':         999,
  \ }
]])

vim.cmd([[
  command -nargs=* -complete=help Help vertical belowright help <args>
  command! -nargs=0 Format :call CocAction('format')
]])


--org mode
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}


-- tree sitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    disable = {'org'},
    additional_vim_regex_highlighting = false,
  },
  ensure_installed = {'org'}
}

-- require('orgmode').setup({
--   org_agenda_files = {'~/projects/notes/*', '~/projects/notes/**/*'},
--   org_default_notes_file = '~/projects/notes/refile.org',
--   org_archive_location = '~/projects/notes/archivetodos.org',
--   org_todo_keywords = {'TODO', 'ACTIVE', 'NEXT', 'TESTING', 'DONE'},
--   mappings = {
--   org = {
--       org_toggle_checkbox = '<leader><leader>',
--   }
--   }
-- })
-- 

vim.cmd([[
  map f <Plug>Sneak_f
  map F <Plug>Sneak_F
  map t <Plug>Sneak_t
  map T <Plug>Sneak_T
 let g:closetag_xhtml_filetypes = 'xhtml,tsx'
]])

vim.cmd([[
   command! -nargs=? Run :!g++ -g % -o /tmp/test && /tmp/test <CR>
]])

require('cmp-config')
