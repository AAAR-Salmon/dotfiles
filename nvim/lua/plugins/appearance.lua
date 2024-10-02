return {
  {
    'itchyny/lightline.vim',
    config = function()
      vim.g.lightline = {
        colorscheme = 'jellybeans',
      }
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      {
        'lewis6991/gitsigns.nvim',
        config = function()
          require('gitsigns').setup()
        end,
      },
    },
  },
  {
    'folke/trouble.nvim',
    config = function()
      local wk = require('which-key')
      require('trouble').setup({
        wk.add({
          { '<leader>tb', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', mode = 'n', desc = 'Trouble Buffer Diagnostics' },
        })
      })
    end
  },
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function ()
      require('noice').setup()
    end
  },
  {
    'shellRaining/hlchunk.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    -- event = { 'BufReadPre', 'BufNewFile' },
    config = function ()
      require('hlchunk').setup({
        chunk = {
          enable = true,
          delay = 0,
        },
      })
    end,
  },
  {
    'bronson/vim-trailing-whitespace',
  },
  {
    'rhysd/conflict-marker.vim',
  },
}
