local opt = vim.opt

opt.syntax = 'on'

opt.number = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.autoindent = true
opt.smartindent = true

opt.list = true
opt.listchars = {
  tab = '▸ ',
  space = '·',
}

opt.ruler = true
opt.textwidth = 79
opt.colorcolumn = '+1'

opt.clipboard = 'unnamedplus'


opt.helplang = 'ja', 'en'

vim.cmd('set formatexpr=autofmt#japanese#formatexpr()')
