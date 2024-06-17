local map = vim.keymap.set
map('i', 'jk', '<ESC>')
-- Disable this since `jjj...jk` is common in visual line mode
-- map('v', 'jk', '<ESC>')
map('v', 'q', '<ESC>')
map('n', 'g=', function() vim.lsp.buf.format() end)
map('n', 'G=', 'g=', { remap = true })
map('n', 'gd', function() vim.lsp.buf.definition() end)
map('n', 'gr', function() vim.lsp.buf.rename() end)
