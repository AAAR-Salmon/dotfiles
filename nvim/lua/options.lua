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

opt.scrolloff = 99

opt.clipboard = 'unnamedplus'

opt.encoding = 'utf-8'
opt.fileencodings = { 'utf-8', 'sjis' }

opt.helplang = { 'ja', 'en' }

vim.cmd('set formatexpr=autofmt#japanese#formatexpr()')

vim.filetype.add({
  filename = {
    ['compose.yaml'] = 'yaml.docker-compose',
    ['compose.yml'] = 'yaml.docker-compose',
    ['docker-compose.yaml'] = 'yaml.docker-compose',
    ['docker-compose.yml'] = 'yaml.docker-compose',
  },
})
