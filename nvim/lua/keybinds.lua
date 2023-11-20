local map = vim.api.nvim_set_keymap
map('i', 'jk', '<ESC>', {noremap = true})
-- Disable this since `jjj...jk` is common in visual line mode
-- map('v', 'jk', '<ESC>', {noremap = true})
map('v', 'q', '<ESC>', {noremap = true})
