return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', mode = 'n', desc = 'telescope live_grep' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>',   mode = 'n', desc = 'telescope buffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', mode = 'n', desc = 'telescope help_tags' },
    },
  },
  {
    'nvim-telescope/telescope-frecency.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      { '<leader>ff', '<cmd>Telescope frecency workspace=CWD<cr>', mode = 'n', desc = 'telescope find_files' },
    },
    config = function ()
      local telescope = require('telescope')
      telescope.load_extension('frecency')
    end,
  },
  {
    'smoka7/hop.nvim',
    dependencies = {
      'folke/which-key.nvim',
    },
    opts = {},
    keys = {
      { '<leader>h', '<cmd>HopChar1<cr>', mode = { 'n', 'v', 'o' }, desc = 'hop char1' },
    },
  },
  {
    'kazhala/close-buffers.nvim',
    dependencies = {
      'folke/which-key.nvim',
    },
    keys = {
      { '<leader>ba', '<cmd>BWipeout all<cr>',   mode = 'n', desc = 'close-buffers wipe all' },
      { '<leader>bo', '<cmd>BWipeout other<cr>', mode = 'n', desc = 'close-buffers wipe other' },
    },
  },
  {
    'FabijanZulj/blame.nvim',
    cmd = { 'BlameToggle' },
    opts = {
      date_format = '%Y%m%d',
    },
  },
  {
    'ervandew/supertab',
  },
  {
    'machakann/vim-sandwich',
  },
  {
    'folke/which-key.nvim',
  },
}
