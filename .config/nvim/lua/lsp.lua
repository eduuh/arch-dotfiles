local nvim_lsp = require('lspconfig')

local lsputils = require('vim.lsp.util')
local api = vim.api

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<leader>ld', '<cmd>Telescope lsp_definitions<CR>', { noremap = true })
end

-- yamlls - for kubernetes and docker-compose I could override the schemas
--'omnisharp'
--install lua server : https://github.com/sumneko/lua-language-server/wiki/Build-and-Run
-- lua stuff

local servers = { 'tsserver','html', 'clangd', 'tailwindcss', 'dockerls', 'yamlls'}
for _, lsp in ipairs(servers) do
  if lsp == 'omnisharp' then
    local pid = vim.fn.getpid()
    local omnisharp_bin = "/home/edd/.vscode-insiders/extensions/ms-dotnettools.csharp-1.23.17/.omnisharp/1.37.17/run"
    nvim_lsp[lsp].setup {
      capabilities = capabilities,
       cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
       on_attach = on_attach
     }
     elseif lsp == 'html' then
    nvim_lsp[lsp].setup {
      capabilities = capabilities,
       filetypes = { "html", "razor","blazor" ,"aspnetcorerazor"},
       on_attach = on_attach
     }
   else
    nvim_lsp[lsp].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
  }
end
end


vim.cmd([[
augroup lsp
  autocmd!
  autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.cs lua vim.lsp.buf.formatting_sync(nil, 100)
augroup end
]])
