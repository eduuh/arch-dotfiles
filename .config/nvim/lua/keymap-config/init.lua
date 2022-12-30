local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

vim.g.mapleader = " " -- leader key

--> Goyo <--
--> nvim tree mappings <--
map("n", "<leader>t", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>gt", ":NvimTreeFocus<CR>", opts)

--> telescope mappings <--
map("n", "<leader>sb", ":lua require('telescope.builtin').buffers()<CR>", opts)
map("n", "<leader>lg", ":lua require('telescope.builtin').live_grep()<CR>", opts)
map("n", "<C-p>", ":lua require('telescope.builtin').find_files()<CR>", opts)
map("n", "<leader>sr", ":lua require('telescope.builtin').lsp_references()<CR>", opts)
map("n", "<leader>ss", ":lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)
map("n", "<leader>ca", ":lua require('telescope.builtin').lsp_code_actions()<CR>", opts)
map("n", "<leader>sd", ":lua require('telescope.builtin').lsp_definitions()<CR>", opts)
map("n", "<leader>lD", ":lua require('telescope.builtin').lsp_type_definitions()<CR>", opts)
map("n", "<leader>co", ":Telescope find_files cwd=~/AppData/Local/nvim <CR>", opts)
map("n", "<leader>fd", ":lua vim.lsp.buf.formatting_sync() <CR>", opts)

map("n", "<A-,>", ":BufferPrevious<CR>", opts)
map("n", "<A-.>", ":BufferNext<CR>", opts)
map("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
map("n", "<A->>", ":BufferMoveNext<CR>", opts)
map("n", "<A-1>", ":BufferGoto 1<CR>", opts)
map("n", "<A-2>", ":BufferGoto 2<CR>", opts)
map("n", "<A-3>", ":BufferGoto 3<CR>", opts)
map("n", "<A-4>", ":BufferGoto 4<CR>", opts)
map("n", "<A-5>", ":BufferGoto 5<CR>", opts)
map("n", "<A-6>", ":BufferGoto 6<CR>", opts)
map("n", "<A-7>", ":BufferGoto 7<CR>", opts)
map("n", "<A-8>", ":BufferGoto 8<CR>", opts)
map("n", "<A-9>", ":BufferGoto 9<CR>", opts)
map("n", "<A-0>", ":BufferLast<CR>", opts)
map("n", "<A-c>", ":BufferClose<CR>", opts)
map("n", "<C-b>", ":BufferPick<CR>", opts)
map("n", "<leader>bb", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", ":BufferOrderByLanguage<CR>", opts)


-- Move text up and down
map("v", "U", ":m '<-2<CR>gv=gv", opts)
map("v", "E", ":m '>+1<CR>gv=gv", opts)
map("n", "<leader>cd", ":cd %:p:h<CR>", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- quickfix list
map("n", "<leader>n", ":cnext<CR>", opts)
map("n", "<leader>p", ":cprev<CR>", opts)

-- Alternate file
map("n", "<BS>", "<C-^>", opts)

-- Navigate buffers
map("n", "<leader>bn", ":bnext<CR>", opts)
map("n", "<leader>bp", ":bprevious<CR>", opts)

-- locallist  list
map("n", "<leader>ln", ":lnext<CR>", opts)
map("n", "<leader>lp", ":lprev<CR>", opts)

-- Move text up and down
map("v", "U", ":m '<-2<CR>gv=gv", opts)
map("v", "E", ":m '>+1<CR>gv=gv", opts)

-- Git Signs
map("n", "<leader>sh", ":Gitsigns stage_hunk<CR>", opts)
map("v", "<leader>sh", ":Gitsigns stage_hunk<CR>", opts)
map("n", "<leader>rh", ":Gitsigns reset_hunk<CR>", opts)
map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
map("n", "<leader>sb", ":Gitsigns stage_buffer<CR>", opts)
map("n", "<leader>uh", ":Gitsigns undo_stage_hunk<CR>", opts)
map("n", "<leader>ub", ":Gitsigns reset_buffer<CR>", opts)
map("n", "<leader>ph", ":Gitsigns preview_hunk<CR>", opts)
map("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", opts)
map("n", "<leader>td", ":Gitsigns diffthis<CR>", opts)
