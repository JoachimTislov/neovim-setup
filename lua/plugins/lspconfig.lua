return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    {
      'j-hui/fidget.nvim',
      opts = {
        notification = {
          window = {
            winblend = 0,
          },
        },
      },
    },
    'saghen/blink.cmp',
  },
  config = function()
    require 'config.autocmds.lsp-attach'
    require 'config.diagnostics'

    local servers = {
      'gopls',
      'lua_ls',
      'jdtls',
      -- 'harper_ls', -- annoying
      -- 'codebook', -- annoying
      -- 'vtsls',
      'ts_ls',
      'bashls',
      -- 'jsonls',
      'cssls',
      'pyright',
      'clangd',
      'rust_analyzer',
    }

    require('mason-tool-installer').setup {
      ensure_installed = vim.list_extend(servers, {
        'stylua',
        'prettierd',
        'shfmt',
        'rustywind',
        'clang-format',
        'jq',
        'google-java-format',
        'black',
      }),
    }

    local utils = require 'utils'
    for _, name in ipairs(servers) do
      local lsp = utils.safe_require('config.lsp.' .. name)
      if lsp.child then
        local child_lsp = utils.safe_require('config.lsp.' .. lsp.child)
        utils.setup_ls(lsp.child, child_lsp[name] or {})
      end
      utils.setup_ls(name, lsp)
    end
  end,
}
