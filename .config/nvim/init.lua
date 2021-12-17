require('plugins')
require('keymappings')
require('sets')
require('lsp')
require('compe-config')
require('telescope-config')
require('defx')
require('csharpSource')


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

-- tree sitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}


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
     autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
   augroup end
]])

vim.cmd([[
  nnoremap <leader>vl :call vimspector#Launch()<CR>
  nnoremap  <leader>vc :call GotoWindow(g:vimspector_session_windows.code)<CR>
  nnoremap  <leader>vt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
  nnoremap  <leader>vv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
  nnoremap  <leader>vw :call GotoWndow(g:vimspector_session_windows.watches)<CR>
  nnoremap  <leader>vs :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
  nnoremap  <leader>vo :call GotoWindow(g:vimspector_session_windows.output)<CR>
  nnoremap  <leader>vq :call vimspector#Reset()<CR>
  nnoremap  <leader>vi :call vimspector#StepInto()<CR>
  nnoremap  <leader>vu <Plug>VimspectorStepOver<CR>
  nnoremap  <leader>vn <Plug>VimspectorStepOut
  nnoremap  <leader>vr <Plug>VimspectorRestart
  nnoremap  <leader>tc :call vimspector#Continue()<CR>
  nnoremap  <leader><F11> <Plug>VimspectorUpFrame
  nnoremap  <leader><F12> <Plug>VimspectorDownFrame
  nnoremap  <leader>rc <Plug>VimspectorRunToCursor
  nnoremap  <leader>tb :call vimspector#ToggleBreakpoint()<CR>
  nnoremap  <leader>cb <Plug>VimspectorToggleConditionalBreakpoint

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


vim.cmd([[
    lua require 'tagfunc_nvim_lsp'
    setlocal tagfunc=v:lua.tagfunc_nvim_lsp
]])
