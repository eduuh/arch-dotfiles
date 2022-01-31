local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--Modes
-- normal_mode = "n"
-- Insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x"
-- term_mode = "t"
-- command_mode = "c"

-- Up down left right
keymap("n","k","h",opts)
keymap("x","k","h",opts)
keymap("o","k","h",opts)

keymap("n","n","j",opts)
keymap("o","n","j",opts)
keymap("x","n","j",opts)

keymap("n","e","k",opts)
keymap("x","e","k",opts)
keymap("o","e","k",opts)

keymap("n","i","l",opts)
keymap("x","i","l",opts)

-- inSert/Replace/append ()
  
keymap("n","l","i",opts)
keymap("n","L","I",opts)

-- Folds 

keymap("n","j","z",opts)
keymap("n","jn","zj",opts)
keymap("n","je","zk",opts)


-- Window handling

keymap("n","<c-w>k","<c-w>h",opts)
keymap("x","<c-w>k","<c-w>h",opts)

keymap("n","<c-w>n","<c-w>j",opts)
keymap("x","<c-w>n","<c-w>j",opts)

keymap("n","<c-w>e","<c-w>k",opts)
keymap("x","<c-w>e","<c-w>k",opts)

keymap("n","<c-w>i","<c-w>l",opts)

keymap("x","<c-w>i","<c-w>l",opts)
