local api = vim.api
local telescope = require('telescope')

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
api.nvim_set_keymap("n","<leader>gw",":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",{ noremap = true, silent = true })
api.nvim_set_keymap("n","<leader>gm",":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",{ noremap = true, silent = true })

api.nvim_set_keymap("n","<leader>fb",":lua require('telescope.builtin').buffers()<CR>",{ noremap = true, silent = true })

api.nvim_set_keymap("n","<leader>ff",":lua require('telescope.builtin').git_files()<CR>",{ noremap = true, silent = true })

api.nvim_set_keymap("n","<leader>fg",":lua require('telescope.builtin').live_grep()<CR>",{ noremap = true, silent = true })

api.nvim_set_keymap("n","<C-p>",":lua require('telescope.builtin').find_files()<CR>",{ noremap = true, silent = true })


api.nvim_set_keymap("n","<leader>lr",":lua require('telescope.builtin').lsp_references()<CR>",{ noremap = true, silent = true })

api.nvim_set_keymap("n","<leader>ls",":lua require('telescope.builtin').lsp_document_symbols()<CR>",{ noremap = true, silent = true })

api.nvim_set_keymap("n","<leader>la",":lua require('telescope.builtin').lsp_code_actions()<CR>",{ noremap = true, silent = true })

api.nvim_set_keymap("n","<leader>la",":lua require('telescope.builtin').lsp_code_actions()<CR>",{ noremap = true, silent = true })

api.nvim_set_keymap("n","<leader>ld",":lua require('telescope.builtin').lsp_definitions()<CR>",{ noremap = true, silent = true })

api.nvim_set_keymap("n","<leader>lD",":lua require('telescope.builtin').lsp_type_definitions()<CR>",{ noremap = true, silent = true })
