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
  spec = {
    -- { 'NMAC427/guess-indent.nvim' },
    { 'nvim-java/nvim-java' },
    { 'sindrets/diffview.nvim' }, -- https://github.com/sindrets/diffview.nvim
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
