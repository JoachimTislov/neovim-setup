return {
  'catppuccin/nvim',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      float = {
        transparent = true,
        solid = true,
      },
      flavour = 'auto',
      background = {
        light = 'latte',
        dark = 'mocha',
      },
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
