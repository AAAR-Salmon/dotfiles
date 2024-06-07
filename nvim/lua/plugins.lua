-- https://github.com/tani/vim-jetpack/blob/main/README.adoc#modern-packernvim-paqnvim-style-1
vim.cmd.packadd 'vim-jetpack'
require('jetpack.packer').add {
  { 'tani/vim-jetpack',                 opt = 1 },
  { 'vim-jp/vimdoc-ja' },
  -- Language Server
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'nvimtools/none-ls.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
        },
      })
    end,
  },
  {'jay-babu/mason-null-ls.nvim'},
  -- Completion
  {
    'hrsh7th/nvim-cmp',
    config = require('plugins.cmp').config,
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/cmp-path' },
  -- Manupilation
  { 'ervandew/supertab' },
  { 'machakann/vim-sandwich' },
  -- Filer
  { 'lambdalisue/fern.vim' },
  { 'lambdalisue/fern-hijack.vim' },
  {
    'yuki-yano/fern-preview.vim',
    config = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'fern',
        group = vim.api.nvim_create_augroup('fern-conf', {}),
        callback = function()
          local function nnoremap(lhs, rhs)
            vim.keymap.set('n', lhs, rhs, { silent = true, buffer = true })
          end
          nnoremap('p', '<Plug>(fern-action-preview:toggle)')
          nnoremap('<C-p>', '<Plug>(fern-action-preview:auto:toggle)')
          nnoremap('<C-d>', '<Plug>(fern-action-preview:scroll:down:half)')
          nnoremap('<C-u>', '<Plug>(fern-action-preview:scroll:up:half)')
        end,
      })
    end,
  },
  -- Theme
  {
    'itchyny/lightline.vim',
    config = function()
      vim.g.lightline = {
        colorscheme = 'jellybeans',
      }
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
  -- Misc
  { 'vim-jp/autofmt' },
  {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
  { 'bronson/vim-trailing-whitespace' },
  {
    'nmac427/guess-indent.nvim',
    config = function()
      require('guess-indent').setup {}
    end,
  },
  { 'rhysd/conflict-marker.vim' },
  { 'anuvyklack/help-vsplit.nvim' },
}
