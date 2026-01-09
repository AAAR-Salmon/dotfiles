return {
  {
    'itchyny/lightline.vim',
    config = function ()
      vim.g.lightline = {
        colorscheme = 'jellybeans',
      }
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
  {
    'romgrk/barbar.nvim',
    event = { 'BufReadPre', 'BufWrite', 'BufFilePre' },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'lewis6991/gitsigns.nvim',
    },
    keys = {
      { '<leader>th', '<cmd>BufferPrevious<cr>',     mode = 'n', desc = 'navigate to left tab' },
      { '<leader>tl', '<cmd>BufferNext<cr>',         mode = 'n', desc = 'navigate to right tab' },
      { '<leader>t<', '<cmd>BufferMovePrevious<cr>', mode = 'n', desc = 'move tab to left' },
      { '<leader>t>', '<cmd>BufferMoveNext<cr>',     mode = 'n', desc = 'move tab to right' },
      { '<leader>tx', '<cmd>BufferWipeout<cr>',      mode = 'n', desc = 'close current tab' },
    },
  },
  {
    'folke/trouble.nvim',
    opts = {},
    keys = {
      { '<leader>tb', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', mode = 'n', desc = 'Trouble Buffer Diagnostics' },
    },
  },
  {
    'folke/todo-comments.nvim',
    cmds = { 'TodoTelescope' },
    keys = {
      { '<leader>ft', '<cmd>TodoTelescope<cr>', mode = 'n', desc = 'TodoTelescope' },
    },
    opts = {},
  },
  {
    'folke/noice.nvim',
    event = { 'VeryLazy' },
    dependencies = {
      'MunifTanjim/nui.nvim',
      -- https://github.com/folke/noice.nvim/issues/938
      'stevearc/dressing.nvim',
    },
    opts = {},
  },
  {
    'shellRaining/hlchunk.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      chunk = {
        enable = true,
        delay = 0,
      },
    },
  },
  {
    'bronson/vim-trailing-whitespace',
  },
  {
    'rhysd/conflict-marker.vim',
  },
}
