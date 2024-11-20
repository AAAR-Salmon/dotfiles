return {
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      renderer = {
        full_name = true,
      },
    },
    keys = {
      { '<leader>ee', '<cmd>NvimTreeToggle<cr>',   mode = 'n', desc = 'NvimTreeToggle' },
      { '<leader>ef', '<cmd>NvimTreeFindFile<cr>', mode = 'n', desc = 'NvimTreeFindFile' },
    },
  },
}
