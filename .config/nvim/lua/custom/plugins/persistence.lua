return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = {},
  config = function()
    require('persistence').setup()

    -- Load the session for the current directory
    vim.keymap.set('n', '<leader>qs', function()
      require('persistence').load()
    end, { desc = 'Restore Session' })

    -- Select a session to load
    vim.keymap.set('n', '<leader>qS', function()
      require('persistence').select()
    end, { desc = 'Select Session' })

    -- Load the last session
    vim.keymap.set('n', '<leader>ql', function()
      require('persistence').load { last = true }
    end, { desc = 'Restore Last Session' })

    -- Stop Persistence => session won't be saved on exit
    vim.keymap.set('n', '<leader>qd', function()
      require('persistence').stop()
    end, { desc = "Don't Save Session" })
  end,
}
