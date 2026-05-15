return {
  {
    'vim-jp/autofmt',
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    cmd = { 'ToggleTerm' },
    keys = {
      { '<leader>!', '<cmd>ToggleTerm<cr>', mode = 'n', desc = 'open floating terminal' },
    },
    opts = {
      direction = 'float',
    },
  },
  {
    'stevearc/overseer.nvim',
    opts = {},
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup({
        auto_load = false,
        theme = 'light',
        app = 'browser',
      })
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    'mechatroner/rainbow_csv',
    ft = { 'csv' },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install { 'http' }
    end,
  },
  {
    'nmac427/guess-indent.nvim',
    init = function ()
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
    end,
    opts = {},
  },
  {
    'anuvyklack/help-vsplit.nvim',
    opts = {
      always = true,
      side = 'right',
    },
  },
}
