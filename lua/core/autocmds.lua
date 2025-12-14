-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Single mini statusline for multiple splits in a single buffer
vim.api.nvim_create_autocmd('WinEnter', {
  callback = function()
    vim.opt_local.statusline = '%!v:lua.MiniStatusline.active()'
  end,
})

vim.api.nvim_create_autocmd('WinLeave', {
  callback = function()
    vim.opt_local.statusline = ' '
  end,
})
