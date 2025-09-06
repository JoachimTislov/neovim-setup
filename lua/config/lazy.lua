-- :h lazy.nvim.txt
-- https://github.com/folke/lazy.nvim
-- https://lazy.folke.io/
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  -- Spec is a list of plugins with default options
  spec = {
    -- { 'NMAC427/guess-indent.nvim' },
    { 'folke/snacks.nvim', priority = 1000, lazy = false, opts = {} },
    -- { 'zbirenbaum/copilot.lua', cmd = 'Copilot', event = 'InsertEnter', opts = {} },
    -- { 'zbirenbaum/copilot-cmp', opts = {} },
    { 'github/copilot.vim' },
    { 'meznaric/key-analyzer.nvim', opts = {} },
    { 'nvim-java/nvim-java' },
    { 'sindrets/diffview.nvim' }, -- Duplicate of diffview in neogit dependencies
    { 'stevearc/overseer.nvim', opts = {} },
    { import = 'plugins' },
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  defaults = {
    autocmds = false,
    keymaps = false,
  },
  rocks = {
    enabled = true,
    hererocks = false,
  },
}
