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
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown' },
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && COREPACK_ENABLE_AUTO_PIN=0 yarn install',
    init = function ()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
  },
  {
    'rest-nvim/rest.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    ft = { 'http' },
    cmd = { 'Rest' },
    keys = {
      { '<leader>rr', '<cmd>Rest run<cr>', mode = 'n', desc = 'HTTP request under cursor' },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    cmd = { 'TSInstall', 'TSUpdate' },
    config = function ()
      require('nvim-treesitter.configs').setup({
        highlight = {
          enable = true,
        },
        ensure_installed = {
          'http',
        },
      })
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
