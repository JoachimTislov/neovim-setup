-- https://github.com/NeogitOrg/neogit
return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    kind = 'floating',
  },
  config = function(_, opts)
    require('neogit').setup(opts)
  end,
}
