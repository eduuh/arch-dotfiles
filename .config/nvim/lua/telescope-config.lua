local api = vim.api
local telescope = require('telescope')

telescope.setup{
defaults = {
     prompt_prefix = "> ",
  file_ignore_patterns = {"obj", "bin", "node_modules", "plugged"},
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

telescope.load_extension("git_worktree")
api.nvim_set_keymap("n","<leader>gw",":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",{ noremap = true, silent = true })
api.nvim_set_keymap("n","<leader>gm",":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",{ noremap = true, silent = true })

api.nvim_set_keymap("n","<leader>tb",":lua require('telescope.builtin').buffers()<CR>",{ noremap = true, silent = true })

api.nvim_set_keymap("n","<C-p>",":lua require('telescope.builtin').git_files()<CR>",{ noremap = true, silent = true })

api.nvim_set_keymap("n","<leader>f",":lua require('telescope.builtin').find_files()<CR>",{ noremap = true, silent = true })
