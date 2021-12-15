local harpoon = require('harpoon')

harpoon.setup({
global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = true,
        excluded_filetypes = {"harpoon"}
    },
    projects = {
        ["/home/edd/repos/catalog.git/master"] = {
            term = {
                cmds = {
                    "dotnet build"
                }
            }
        },
        ["/home/edd/repos/Learning.git/master/datastructuresandAlgorithms/cplusplus/cprogramming"] = {
            term = {
                cmds = {
                    "g++ -g % -o program && ./program"
                }
            }
        }
      }
})

vim.cmd([[
nnoremap <leader>! :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>[ :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>] :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>" :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>tm :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>ht :lua require('harpoon.ui').toggle_quick_menu()<CR>
nnoremap <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>
]])
