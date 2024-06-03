vim.cmd.packadd 'vim-jetpack'
require('jetpack.packer').add {
  {'tani/vim-jetpack', opt = 1},
  {'vim-jp/vimdoc-ja'},
  {'neovim/nvim-lspconfig'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'lambdalisue/fern.vim'},
  {'lambdalisue/fern-hijack.vim'},
  {
    'yuki-yano/fern-preview.vim',
    config = function()
      vim.api.nvim_create_augroup('fern-conf', {})
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'fern',
        group = 'fern-conf',
        callback = function()
          local function nnoremap(lhs, rhs)
            vim.keymap.set('n', lhs, rhs, { noremap = true, silent = true, buffer = true })
          end
          nnoremap('p',     '<Plug>(fern-action-preview:toggle)')
          nnoremap('<C-p>', '<Plug>(fern-action-preview:auto:toggle)')
          nnoremap('<C-d>', '<Plug>(fern-action-preview:scroll:down:half)')
          nnoremap('<C-u>', '<Plug>(fern-action-preview:scroll:up:half)')
        end,
      })
    end,
  },
  {
    'itchyny/lightline.vim',
    config = function()
      vim.g.lightline = {
        colorscheme = 'jellybeans',
      }
    end,
  },
  {'ervandew/supertab'},
  {
    'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
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
  {'rhysd/conflict-marker.vim'},
  {'machakann/vim-sandwich'},
}
