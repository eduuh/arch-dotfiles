vim.cmd[[
    function! s:defx_my_settings() abort
      " Define mappings
    nnoremap <silent><buffer><expr> <CR> defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('open', 'wincmd p \| drop')
    nnoremap <silent><buffer><expr> o defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('open', 'wincmd p \| drop')
      nnoremap <silent><buffer><expr> s defx#do_action('open', 'wincmd p \| split')
      nnoremap <silent><buffer><expr> v defx#do_action('open', 'wincmd p \| vsplit')
      nnoremap <silent><buffer><expr> t defx#do_action('open', 'tabnew')
      nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
      nnoremap <silent><buffer><expr> x defx#do_action('close_tree')
      " nnoremap <silent><buffer><expr> go defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> C defx#do_action('cd', defx#get_candidate().action__path)
      nnoremap <silent><buffer><expr> u defx#do_action('cd', '..')
      nnoremap <silent><buffer><expr> a defx#do_action('new_file')
      nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
      nnoremap <silent><buffer><expr> c defx#do_action('copy')
      nnoremap <silent><buffer><expr> p defx#do_action('paste')
      nnoremap <silent><buffer><expr> m defx#do_action('move')
      nnoremap <silent><buffer><expr> r defx#do_action('rename')
      nnoremap <silent><buffer><expr> dd defx#do_action('remove')
      nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
      nnoremap <silent><buffer><expr> H defx#do_action('toggle_ignored_files')
      nnoremap <silent><buffer><expr> R defx#do_action('redraw')
      " nnoremap <silent><buffer><expr> u defx#do_action('cd', ['..'])
      nnoremap <silent><buffer><expr> q defx#do_action('quit')
    endfunction

autocmd FileType defx call s:defx_my_settings()
nnoremap <silent> <c-d> :Defx<CR>
  call defx#custom#option('_', {
      \ 'columns': 'git:indent:icon:filename',
      \ 'winwidth':30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': 'Files',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ 'root_marker': '‣‣‣ ',
      \ })
  call defx#custom#column('indent', { 'indent': '  ' })

call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })

hi Defx_git_Untracked guifg=#FF0000
]]
