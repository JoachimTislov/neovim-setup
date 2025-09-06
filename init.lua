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
vim.g.copilot_no_tab_map = true

-- Poor attempt at resolving avante issues at determining project root
-- Best to open nvim from the project root
-- vim.g.root_spec = { { '.git' }, 'lsp', 'cwd' }

-- Theme is specified by two variables to also enable the actual theme on start up
vim.g.theme = 'rose-pine'
vim.g.themeType = 'rose-pine-moon'

require 'config.options'
require 'config.keymaps'
require 'config.autocmds.yank-highlight'
require 'config.autocmds.copilotBufEnter'
require 'config.lazy'

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'copilot-chat',
--   callback = function()
--     vim.bo.filetype = 'markdown'
--   end,
-- })
--
vim.api.nvim_set_hl(0, 'CopilotChatHeader', { fg = '#7C3AED', bold = true })
vim.api.nvim_set_hl(0, 'CopilotChatSeparator', { fg = '#848884' })
vim.cmd.colorscheme(vim.g.themeType or vim.g.theme)
