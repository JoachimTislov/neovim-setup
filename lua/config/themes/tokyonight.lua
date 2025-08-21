return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  name = 'tokyonight',
  opts = {
    styles = {
      comments = { italic = false },
    },
  },
  config = function()
    -- 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'tokyonight-moon'
  end,
}
