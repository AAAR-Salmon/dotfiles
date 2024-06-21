local opt = vim.opt

opt.syntax = 'on'

opt.number = true

opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.autoindent = true
opt.smartindent = true

opt.ruler = true
opt.textwidth = 79
opt.colorcolumn = '+1'

opt.clipboard = 'unnamedplus'

opt.filetype = 'on', 'indent', 'plugin'

opt.helplang = 'ja', 'en'

vim.cmd('set formatexpr=autofmt#japanese#formatexpr()')
