return {
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'zbirenbaum/copilot-cmp',
    },
    config = function ()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function (args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = cmp.config.sources(
          {
            { name = 'copilot' },
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'path' },
            { name = 'emoji' },
          }
        ),
      })
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'cmdline' },
        },
      })
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    opts = {},
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = { 'Copilot' },
    opts = {
      suggestion = {
        enabled = false,
      },
      panel = {
        enabled = false,
      },
    },
  },
}
