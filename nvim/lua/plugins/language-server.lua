return {
  {
    'neovim/nvim-lspconfig',
    event = { 'VeryLazy' },
  },
  {
    'williamboman/mason.nvim',
    event = { 'VeryLazy' },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    event = { 'VeryLazy' },
  },
  {
    'nvimtools/none-ls.nvim',
    event = { 'VeryLazy' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'gbprod/none-ls-shellcheck.nvim',
    },
    config = function ()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          require('none-ls-shellcheck.diagnostics'),
          require('none-ls-shellcheck.code_actions'),
        },
      })
    end,
  },
  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'VeryLazy' },
  },
}
