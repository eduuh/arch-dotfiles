local keymap = vim.api.nvim_set_keymap
local telescope = require('telescope')

local opts = { noremap = true, silent = true }
local term_opt = { silent = true }

telescope.setup{
pickers = {
   find_files = {
      hidden = true,
   }
},
defaults = {
     prompt_prefix = "> ",
  file_ignore_patterns = {"obj", "bin", "node_modules", "plugged", "autoload", "images"},
  mappings= {
     i = {
      ["<c-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
      ["<c-s"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
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

telescope.load_extension("fzf")
telescope.load_extension("git_worktree")
keymap("n","<leader>gw",":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",opts)
keymap("n","<leader>gm",":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",opts)

keymap("n","<leader>fb",":lua require('telescope.builtin').buffers()<CR>",opts)

keymap("n","<leader>ff",":lua require('telescope.builtin').git_files()<CR>",opts)

keymap("n","<leader>fg",":lua require('telescope.builtin').live_grep()<CR>",opts)

keymap("n","<C-p>",":lua require('telescope.builtin').find_files()<CR>",opts)


keymap("n","<leader>lr",":lua require('telescope.builtin').lsp_references()<CR>",opts)

keymap("n","<leader>ls",":lua require('telescope.builtin').lsp_document_symbols()<CR>",opts)

keymap("n","<leader>la",":lua require('telescope.builtin').lsp_code_actions()<CR>",opts)

keymap("n","<leader>la",":lua require('telescope.builtin').lsp_code_actions()<CR>",opts)

keymap("n","<leader>ld",":lua require('telescope.builtin').lsp_definitions()<CR>",opts)

keymap("n","<leader>lD",":lua require('telescope.builtin').lsp_type_definitions()<CR>",opts)

keymap("n","<leader>co",":Telescope find_files cwd=~/.config/nvim <CR>",opts)
keymap("n","<leader>lc",":Telescope find_files cwd=~/.local/bin <CR>",opts)


