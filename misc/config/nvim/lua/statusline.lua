local function paste_indicator()
  return vim.o.paste and 'PASTE' or ''
end

local function tabs_indicator()
  return not vim.o.expandtab and 'TABS' or ''
end

require('lualine').setup {
  options = {
    theme = 'solarized_light',
    section_separators = { left = '\u{E0B0}', right = '\u{E0B2}' },
    component_separators = { left = '\u{E0B1}', right = '\u{E0B3}' },
  },
  sections = {
    lualine_a = { 'mode', paste_indicator, tabs_indicator },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'filetype' },
    lualine_y = { 'encoding', 'fileformat' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = { { 'buffers', show_filename_only = true } },
    lualine_z = { 'tabs' },
  },
}
