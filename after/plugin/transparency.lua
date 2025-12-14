vim.opt.termguicolors = true

local groups = {
  'Normal',
  'NormalNC',
  'NormalFloat',
  'EndOfBuffer',
  'LineNr',
  'CursorLine',
  'CursorLineNr',
  'SignColumn',
  'Pmenu',
  'PmenuSel',
  'PmenuThumb',
  'FloatBorder',
  'NeoTreeNormal',
  'NeoTreeNormalNC',
  'Winbar',
  -- "StatusLine", "StatusLineNC",
  -- "WinSeparator",
  -- "TabLine", "TabLineFill", "TabLineSel"
}

local function make_transparent()
  for _, g in ipairs(groups) do
    -- set bg = none; keep fg untouched
    pcall(vim.api.nvim_set_hl, 0, g, { bg = 'none' })
  end

  -- also remove any EndOfBuffer tildes color
  pcall(vim.api.nvim_set_hl, 0, 'EndOfBuffer', { fg = nil, bg = 'none' })

  -- optional: set winblend for popup menus and floating windows
  vim.o.pumblend = 0
  vim.o.winblend = 0
end

-- run once now (VimEnter may already have passed if loaded late)
make_transparent()

-- re-apply whenever colorscheme changes
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    make_transparent()
  end,
})

-- optional safety: re-apply on VimEnter (for odd ordering)
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.schedule(make_transparent)
  end,
})
