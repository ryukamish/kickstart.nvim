return {
  -- 'vague-theme/vague.nvim',
  'EdenEast/nightfox.nvim',
  -- 'rose-pine/neovim',
  -- 'folke/tokyonight.nvim',
  name = 'nightfox',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('nightfox').setup {
      italic = false, -- For vague theme
      styles = {
        italic = false, -- For rose pine theme
        comments = { italic = false }, -- Disable italics in comments
      },
    }
    vim.cmd.colorscheme 'nightfox'
    -- vim.cmd.colorscheme 'tokyonight'
    -- vim.cmd.colorscheme 'rose-pine'
    -- vim.cmd.colorscheme 'rose-pine-moon'
    -- vim.cmd.colorscheme 'rose-pine-dawn'
  end,
}
