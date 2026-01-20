return {
  'enochchau/nvim-pretty-ts-errors',
  build = 'npm install',
  config = function()
    vim.keymap.set('n', '<leader>d', require('nvim-pretty-ts-errors').show_line_diagnostics, { desc = 'TS diagnostics' })
  end,
}
