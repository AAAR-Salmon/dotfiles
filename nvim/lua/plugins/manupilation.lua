return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'folke/which-key.nvim',
    },
    config = function ()
      local wk = require('which-key')
      local builtin = require('telescope.builtin')
      wk.add({
        { '<leader>fg', builtin.live_grep, mode = 'n', desc = 'telescope live_grep' },
        { '<leader>fb', builtin.buffers,   mode = 'n', desc = 'telescope buffers' },
        { '<leader>fh', builtin.help_tags, mode = 'n', desc = 'telescope help_tags' },
      })
    end,
  },
  {
    'nvim-telescope/telescope-frecency.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'folke/which-key.nvim',
    },
    config = function ()
      local wk = require('which-key')
      local telescope = require('telescope')
      telescope.load_extension('frecency')
      wk.add({
        {
          '<leader>ff',
          function ()
            telescope.extensions.frecency.frecency({
              workspace = 'CWD',
            })
          end,
          mode = 'n',
          desc = 'telescope find_files',
        },
      })
    end,
  },
  {
    'smoka7/hop.nvim',
    dependencies = {
      'folke/which-key.nvim',
    },
    config = function ()
      local wk = require('which-key')
      local hop = require('hop')
      hop.setup({})
      wk.add({
        {
          '<leader>h',
          function ()
            hop.hint_char1({})
          end,
          mode = { 'n', 'v', 'o' },
          desc = 'hop char1',
        },
      })
    end,
  },
  {
    'kazhala/close-buffers.nvim',
    dependencies = {
      'folke/which-key.nvim',
    },
    config = function ()
      local close_buffers = require('close_buffers')
      local wk = require('which-key')
      wk.add({
        {
          '<leader>ba',
          function ()
            close_buffers.wipe({ type = 'all' })
          end,
          mode = 'n',
          desc = 'close-buffers wipe all',
        },
        {
          '<leader>bo',
          function ()
            close_buffers.wipe({ type = 'other' })
          end,
          mode = 'n',
          desc = 'close-buffers wipe other',
        },
      })
    end,
  },
  {
    'FabijanZulj/blame.nvim',
    cmd = { 'BlameToggle' },
    opts = {
      date_format = "%Y%m%d",
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
