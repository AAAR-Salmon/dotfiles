return {
  { 'lambdalisue/fern.vim' },
  { 'lambdalisue/fern-hijack.vim' },
  {
    'yuki-yano/fern-preview.vim',
    config = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'fern',
        group = vim.api.nvim_create_augroup('fern-conf', {}),
        callback = function()
          local function nnoremap(lhs, rhs)
            vim.keymap.set('n', lhs, rhs, { silent = true, buffer = true })
          end
          nnoremap('p', '<Plug>(fern-action-preview:toggle)')
          nnoremap('<C-p>', '<Plug>(fern-action-preview:auto:toggle)')
          nnoremap('<C-d>', '<Plug>(fern-action-preview:scroll:down:half)')
          nnoremap('<C-u>', '<Plug>(fern-action-preview:scroll:up:half)')
        end,
      })
    end,
  },
  {
    'lambdalisue/vim-fern-renderer-nerdfont',
    config = function()
      vim.g['fern#renderer'] = 'nerdfont'
    end,
    dependencies = {
      'lambdalisue/nerdfont.vim',
    },
  },
  { 'lambdalisue/vim-fern-git-status' },
}
