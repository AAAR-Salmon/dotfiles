return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = { 'Telescope' },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>fg', '<cmd>Telescope live_grep<cr>',  mode = 'n', desc = 'telescope live_grep' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>',    mode = 'n', desc = 'telescope buffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>',  mode = 'n', desc = 'telescope help_tags' },
      { '<leader>fs', '<cmd>Telescope git_status<cr>', mode = 'n', desc = 'telescope git_status' },
    },
    config = function ()
      local telescope = require('telescope')
      telescope.load_extension('frecency')
    end,
  },
  {
    'nvim-telescope/telescope-frecency.nvim',
    keys = {
      { '<leader>ff', '<cmd>Telescope frecency workspace=CWD<cr>', mode = 'n', desc = 'telescope find_files' },
    },
    opts = {
      -- See https://github.com/nvim-telescope/telescope-frecency.nvim/issues/270
      db_safe_mode = false,
    },
  },
  {
    'smoka7/hop.nvim',
    opts = {},
    keys = {
      { '<leader>h', '<cmd>HopChar1<cr>', mode = { 'n', 'v', 'o' }, desc = 'hop char1' },
    },
  },
  {
    'kazhala/close-buffers.nvim',
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
    'Wansmer/treesj',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    keys = {
      { '<leader>st', '<cmd>TSJToggle<cr>', mode = 'n', desc = 'Toggle join/split block' },
      { '<leader>sj', '<cmd>TSJJoin<cr>',   mode = 'n', desc = 'Join block' },
      { '<leader>ss', '<cmd>TSJSplit<cr>',  mode = 'n', desc = 'Split block' },
    },
    opts = {
      use_default_keymaps = false,
    },
  },
  {
    'machakann/vim-sandwich',
  },
  {
    'bassamsdata/namu.nvim',
    cmd = { 'Namu' },
    keys = {
      { '<leader>js', '<cmd>Namu symbols<cr>', mode = 'n', desc = 'Jump to LSP symbol' },
    },
    opts = {
      ui_select = {
        enable = true,
      },
    },
  },
  {
    'm4xshen/autoclose.nvim',
    event = { 'InsertEnter' },
    opts = {},
  },
  {
    'folke/which-key.nvim',
    event = { 'VeryLazy' },
  },
  {
    'tpope/vim-abolish',
    cmd = { 'S', 'Subvert' },
  },
}
