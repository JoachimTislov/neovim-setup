-- https://github.com/catppuccin/nvim
return {
  'catppuccin/nvim',
  lazy = false,
  priority = 1000,
  name = 'catppuccin',
  opts = {
    float = {
      transparent = true,
      solid = true,
    },
    flavour = 'auto',
    background = {
      light = 'latte',
      dark = 'mocha',
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      treesitter = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = '',
      },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  },
  config = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
}
