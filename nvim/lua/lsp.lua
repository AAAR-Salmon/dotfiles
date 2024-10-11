require('mason').setup()
require('mason-lspconfig').setup()

require('mason-lspconfig').setup_handlers {
  function (server_name)
    require('lspconfig')[server_name].setup {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
  end,
}

require('lspconfig').rust_analyzer.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    ['rust-analyzer'] = {
      check = {
        command = 'clippy',
      },
      imports = {
        granularity = {
          group = 'module',
        },
        prefix = 'self',
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
})

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function (args)
    local buffer = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- a
    vim.o.updatetime = 500
    vim.api.nvim_create_autocmd('CursorHold', {
      buffer = bufnr,
      callback = function ()
        local opts = {
          focusable = false,
          close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
          border = 'rounded',
          source = 'always',
          prefix = ' ',
          scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
      end,
    })
  end,
})
