local wk = require('which-key')

vim.g.mapleader = ','
wk.add({
  { 'jk', '<esc>', mode = 'i' },
  { 'q',  '<esc>', mode = 'v' },
  {
    'g=',
    function()
      vim.lsp.buf.format()
    end,
    mode = 'n',
    desc = 'Format by Language Server',
  },
  { 'G=', 'g=', mode = 'n', remap = true },
  {
    'gd',
    function()
      vim.lsp.buf.definition()
    end,
    mode = 'n',
    desc = 'Jump to definition by Language Server',
  },
  {
    'gr',
    function()
      vim.lsp.buf.rename()
    end,
    mode = 'n',
    desc = 'Rename variable by Language Server',
  },
  {
    'gu',
    function()
      vim.lsp.buf.references()
    end,
    mode = 'n',
    desc = 'Jump to references by Language Server',
  },
})
