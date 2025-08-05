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
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
