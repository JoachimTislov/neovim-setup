--[[
  https://learnxinyminutes.com/docs/lua/
  :help lua-guide
  <space>sh
  :help vim.o - Setting options (for options - :help option-list)
  :help gitsigns to understand what the configuration keys do
  normal autocommands events :help autocmd-events.
  :Telescope help_tags
  See `:help telescope` and `:help telescope.setup()`
]]

-- Set <space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

require 'config.options'
require 'config.keymaps'
require 'config.autocmds.yank-highlight'
require 'config.lazy'
