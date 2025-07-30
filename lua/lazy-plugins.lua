require('lazy').setup {
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.blink-cmp',
  require 'kickstart.plugins.conform',
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.gitsigns',
  require 'kickstart.plugins.indent-line',
  require 'kickstart.plugins.lazy-dev',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.lspconfig',
  require 'kickstart.plugins.mini',
  require 'kickstart.plugins.oil',
  require 'kickstart.plugins.telescope',
  require 'kickstart.plugins.todo-comments',
  require 'kickstart.plugins.treesitter',
  require 'kickstart.plugins.which-key',
  require 'kickstart.plugins.markdown-preview',
  -- themes
  -- require 'kickstart.plugins.themes.tokyonight',
  require 'kickstart.plugins.themes.catppuccin',
}
