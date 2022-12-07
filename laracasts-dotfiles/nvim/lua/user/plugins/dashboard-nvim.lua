local dashboard = require('dashboard')

dashboard.custom_header = {
  '',
  '',
  '  ⢸⣦⡈⠻⣿⣿⣿⣶⣄',
  '    ⢸⣿⣿⣦⡈⠻⣿⣿⣿⣷⣄',
  '⣀⣀⣀⣀⣀⣀⣼⣿⣿⣿⣿ ⠈⠻⣿⣿⣿⣷⣄',
  '  ⠈⠻⣿⣿⣿⣿⣿⡿⠿⠛⠁   ⠈⠻⢿⣿⣿⣷⣄',
  '',
}

dashboard.custom_center = {
  { icon = '  ', desc = 'New file                       ', action = 'enew' },
  { icon = '  ', shortcut = 'SPC km', desc = 'Keymaps                ', action = 'Telescope keymaps' },
  { icon = '  ', shortcut = 'CTRL+p', desc = 'Find file                 ', action = 'Telescope find_files' },
  { icon = '  ', shortcut = 'CTRL+e', desc = 'Recent files              ', action = 'Telescope oldfiles' },
  { icon = '  ', shortcut = 'CTRL+g', desc = 'Find Word                 ', action = 'Telescope live_grep' },
  { icon = '  ', shortcut = 'SPC gs', desc = 'Git Status                ', action = 'Telescope git_status' },
}

dashboard.custom_footer = { 'SQB SMART' }


vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#6272a4' })
vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = '#f8f8f2' })
vim.api.nvim_set_hl(0, 'DashboardShortcut', { fg = '#bd93f9' })
vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#6272a4' })
