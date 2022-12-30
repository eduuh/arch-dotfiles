local telescope = require('telescope')

telescope.setup {
    pickers = {
        find_files = {
            hidden = false,
        }
    },
    defaults = {
        prompt_prefix = ">> ",
        file_ignore_patterns = { "obj", "bin", "node_modules", "plugged", "autoload", "images" },
        mappings = {
            i = {
                ["<c-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
                ["<c-s"] = require("telescope.actions").send_selected_to_qflist +
                    require("telescope.actions").open_qflist,
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
