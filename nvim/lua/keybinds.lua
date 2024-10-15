vim.g.mapleader = ','

vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('i', 'Jk', '<esc>')
vim.keymap.set('v', 'q', '<esc>')
vim.keymap.set('n', 'g=', vim.lsp.buf.format, { desc = 'Format by Language Server' })
vim.keymap.set('n', 'G=', 'g=', { remap = true })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Jump to definition by Language Server' })
vim.keymap.set('n', 'gr', vim.lsp.buf.rename, { desc = 'Rename variable by Language Server' })
vim.keymap.set('n', 'gu', vim.lsp.buf.references, { desc = 'Jump to references by Language Server' })
vim.keymap.set('n', 'gq', vim.lsp.buf.code_action, { desc = 'Action (quickfix) by Language Server' })
