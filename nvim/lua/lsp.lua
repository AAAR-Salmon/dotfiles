require('mason').setup()
require('mason-lspconfig').setup({
  automatic_enable = true,
})

vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.lsp.enable('rust_analyzer')
vim.lsp.enable('pylsp')
vim.lsp.enable('denols')
vim.lsp.enable('ts_ls')

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
