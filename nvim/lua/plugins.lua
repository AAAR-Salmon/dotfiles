vim.cmd.packadd 'vim-jetpack'
require('jetpack.packer').add {
  {'tani/vim-jetpack', opt = 1},
  {'vim-jp/vimdoc-ja'},
  {'lambdalisue/fern.vim'},
  {'lambdalisue/fern-hijack.vim'},
  {'yuki-yano/fern-preview.vim'},
  {'vim-airline/vim-airline'},
  {'ervandew/supertab'},
  {'rebelot/kanagawa.nvim'},
  {'vim-jp/autofmt'},
  {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    setup = function()
      vim.g.mkdp_filetypes = {'markdown'}
    end,
    ft = {'markdown'},
  },
  {'bronson/vim-trailing-whitespace'},
  {
    'nmac427/guess-indent.nvim',
    config = function()
      require('guess-indent').setup {}
    end,
  },
}
