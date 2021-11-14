require('plugins')
require('keymappings')
require('sets')

require'nvim-tree'.setup()
require('lsp')
require('compe-config')

require('telescope-config')

require('autosave').setup(
  {
        events = {"InsertLeave","TextChanged", "BufLeave"},
  }
)

-- tree sitter
require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  }

require('harpoon-config')

--set theme
vim.cmd([[
   colorscheme nightfox
]])

-- remove whitespaces
vim.cmd([[
   autocmd BufWritePre * %s/\s\+$//e
   autocmd BufWritePre * %s/\n\+\%$//e
   autocmd BufWritePre *.[ch] %s/\%$/\r/e
   autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])


--Run xrdb whenever xdefault or xresources changes
vim.cmd([[
   autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
   autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
]])

vim.cmd([[
  nnoremap silent <leader>vl :call vimspector#Launch()<CR>
  nnoremap silent <leader>vc :call GotoWindow(g:vimspector_session_windows.code)<CR>
  nnoremap silent <leader>vt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
  nnoremap silent <leader>vv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
  nnoremap silent <leader>vw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
  nnoremap silent <leader>vs :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
  nnoremap silent <leader>vo :call GotoWindow(g:vimspector_session_windows.output)<CR>
  nnoremap silent <leader>vq :call vimspector#Reset()<CR>
  nnoremap silent <leader>vi <Plug>VimspectorStepInto
  nnoremap silent <leader>vu <Plug>VimspectorStepOver
  nnoremap silent <leader>vn <Plug>VimspectorStepOut
  nnoremap silent <leader>vr <Plug>VimspectorRestart
  nnoremap silent <leader>tc :call vimspector#Continue()<CR>
  nnoremap silent <leader><F11> <Plug>VimspectorUpFrame
  nnoremap silent <leader><F12> <Plug>VimspectorDownFrame
  nnoremap silent <leader>rc <Plug>VimspectorRunToCursor
  nnoremap silent <leader>tb <Plug>VimspectorToggleBreakpoint
  nnoremap silent <leader>cb <Plug>VimspectorToggleConditionalBreakpoint

  let g:vimspector_sign_priority = {
  \    'vimspectorBP':         998,
  \    'vimspectorBPCond':     997,
  \    'vimspectorBPDisabled': 996,
  \    'vimspectorPC':         999,
  \ }
]])
