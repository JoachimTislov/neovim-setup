--[[
  https://learnxinyminutes.com/docs/lua/
  :help lua-guide
  :help vim.o - Setting options (for options - :help option-list)
  :help gitsigns to understand what the configuration keys do
  normal autocommands events :help autocmd-events.
  :Telescope help_tags
  See `:help telescope` and `:help telescope.setup()`
]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.g.theme = 'silkcircuit'
-- vim.g.themeType = 'tokyonight-storm'

require 'config.options'
require 'config.keymaps'
require 'config.autocmds.yank-highlight'
require 'config.lazy'

vim.cmd.colorscheme(vim.g.themeType or vim.g.theme)
