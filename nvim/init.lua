require 'plugins'
require 'options'

vim.cmd.colorscheme 'kanagawa'

vim.api.nvim_create_augroup('fern-conf', {})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'fern',
  group = 'fern-conf',
  callback = function()
    vim.keymap.set('n', 'p',     '<Plug>(fern-action-preview:toggle)',           { noremap = true, silent = true, buffer = true })
    vim.keymap.set('n', '<C-p>', '<Plug>(fern-action-preview:auto:toggle)',      { noremap = true, silent = true, buffer = true })
    vim.keymap.set('n', '<C-d>', '<Plug>(fern-action-preview:scroll:down:half)', { noremap = true, silent = true, buffer = true })
    vim.keymap.set('n', '<C-u>', '<Plug>(fern-action-preview:scroll:up:half)',   { noremap = true, silent = true, buffer = true })
  end,
})
