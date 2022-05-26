local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then return end

-- TODO: add spelling support: https://github.com/nvim-lualine/lualine.nvim/issues/487
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {'filetype'},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- Also setting up tabline
require('tabline').setup{
    no_name = '[No Name]',    -- Name for buffers with no name
    modified_icon = '',      -- Icon for showing modified buffer
    close_icon = '',          -- Icon for closing tab with mouse
    separator = "",          -- Separator icon on the left side 
    padding = 2,              -- Prefix and suffix space
    color_all_icons = true,   -- Color devicons in active and inactive tabs
    right_separator = false,  -- Show right separator on the last tab
    show_index = true,       -- Shows the index of tab before filename
    show_icon = true,        -- Shows the devicon
    theme = 'dracula',
}
