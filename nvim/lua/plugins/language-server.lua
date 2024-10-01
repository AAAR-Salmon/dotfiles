return {
  {
    'neovim/nvim-lspconfig'
  },
  {
    'williamboman/mason.nvim'
  },
  {
    'williamboman/mason-lspconfig.nvim'
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'gbprod/none-ls-shellcheck.nvim',
    },
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          require("none-ls-shellcheck.diagnostics"),
          require("none-ls-shellcheck.code_actions"),
        },
      })
    end,
  },
  {
    'jay-babu/mason-null-ls.nvim'
  },
}
