return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required for floating windows
    'saghen/blink.cmp', -- Autocompletion
    'telescope.nvim', -- For search capabilities
  },
  opts = {
    callbacks = {
      vim.keymap.set('n', '<leader>og', ':Obsidian search<cr>', { desc = '[O]bsidian [G]rep notes' }),
      vim.keymap.set('n', '<leader>os', ':Obsidian quick_switch<cr>', { desc = '[O]bsidian [S]witch notes' }),
      vim.keymap.set('n', '<leader>od', ':Obsidian dailies<cr>', { desc = '[O]bsidian [D]aily notes picker' }),
      vim.keymap.set('n', '<leader>on', ':Obsidian new<cr>', { desc = 'Create [O]bsidian [N]ew note' }),
      vim.keymap.set('n', '<leader>ot', ':Obsidian template<cr>', { desc = 'Open [O]bsidian [T]emplate' }),
    },
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = 'Notes',
        path = '~/Documents/Obsidian notes',
      },
    },
    -- File name is the same as note name
    note_id_func = function(title)
      if title ~= nil and title ~= '' then
        -- Clean the title into a valid filename
        local slug = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        return slug
      else
        -- Fallback if no title: use timestamp (or customize further)
        return tostring(os.time())
      end
    end,
    daily_notes = {
      folder = '00 - Daily Notes',
      date_format = '%Y%m%d', -- Compact format 20251215 - Year, Month, Day
    },
    -- Creating a new note inside the specified dir
    notes_subdir = '03 - Main Notes',
    new_notes_location = 'notes_subdir',
    templates = {
      folder = '99 - Templates',
      date_format = '%Y-%m-%d %H:%M',
      time_format = '%H:%M',
    },
    completion = {
      blink_cmp = true,
    },
    picker = {
      name = 'telescope.nvim',
    },
    ui = {
      enable = true, -- Fancy checkboxes, etc
    },
  },
}
