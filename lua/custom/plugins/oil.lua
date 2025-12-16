return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function()
    require('oil').setup {
      delete_to_trash = true,
      skip_confirm_for_simple_edits = false,
      vim.keymap.set('n', '<leader>e', require('oil').toggle_float, { desc = 'Open float Oil [E]xplorer' }),
    }
  end,
}
