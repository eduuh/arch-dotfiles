local harpoon = require('harpoon')

harpoon.setup({
global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = true,
    },
    projects = {
        ["/home/edd/repos/catalog.git/master"] = {
            term = {
                cmds = {
                    "dotnet build && dotnet watch run"
                }
            }
        }
      }
})

vim.cmd([[
 nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-t> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-n> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-s> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <C-h> :lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>
nnoremap <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>
]])
