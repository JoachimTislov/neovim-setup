return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    -- ~/local/share/nvim/lazy/nvim-treesitter/
    -- folder: /usr/share/nvim/runtime/parser/*name of parser*
    ensure_installed = {
      'go',
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
      disable = { 'markdown' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  -- Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  -- Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  -- Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  config = function(_, opts)
    vim.filetype.add {
      extension = {
        rasi = 'rasi',
        lua = 'lua',
      },
      pattern = {
        ['.*/waybar/config'] = 'jsonc',
        ['.*/mako/config'] = 'dosini',
        ['.*/kitty/*.conf'] = 'bash',
        ['.*/hypr/.*%.conf'] = 'hyprlang',
        ['.*/zshrc/.*'] = 'bash',
      },
      filename = {
        ['.zshrc'] = 'bash',
        ['.zshenv'] = 'bash',
      },
    }
    require('nvim-treesitter.configs').setup(opts)
  end,
}
