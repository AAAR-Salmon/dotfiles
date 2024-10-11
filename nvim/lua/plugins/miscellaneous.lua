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
    config = function ()
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      require('guess-indent').setup()
    end,
  },
  {
    'anuvyklack/help-vsplit.nvim',
    config = function ()
      require('help-vsplit').setup({
        always = true,
        side = 'right',
      })
    end,
  },
}
