return {
  {
    'vim-jp/autofmt',
  },
  {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    setup = function ()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
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
