return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'saghen/blink.cmp',
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          -- Load luvit types when the `vim.uv` word is found
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
  },
  config = function()
    require 'plugins.autocmds.lsp-attach'
    require 'plugins.diagnostics'

    vim.lsp.set_log_level 'DEBUG'

    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local servers = {
      -- clangd = {},
      -- rust_analyzer = {},
      gopls = {
        cmd = { 'gopls' },
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
          },
        },
      },
      pyright = {},
      vtsls = {
        settings = {
          vtsls = {
            tsserver = {
              globalplugins = {
                {
                  name = '@vue/typescript-plugin',
                  location = vim.fn.expand '$mason/packages/vue-language-server/node_modules/@vue/language-server',
                  languages = { 'vue' },
                  confignamespace = 'typescript',
                },
              },
            },
          },
          typescript = {
            preferences = {
              -- https://github.com/lazyvim/lazyvim/discussions/1124
              includecompletionsformoduleexports = true,
              includecompletionsforimportstatements = true,
              importmodulespecifier = 'non-relative',
            },
          },
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      },
      -- setup vue: https://github.com/vuejs/language-tools/wiki/neovim
      vue_ls = {},
      -- some languages (like typescript) have entire language plugins that can be useful:
      --    https://github.com/pmizio/typescript-tools.nvim
      ts_ls = {},
      bashls = {},
      jsonls = {},
      cssls = {},
      lua_ls = {
        settings = {
          lua = {
            completion = {
              callsnippet = 'replace',
            },
            runtime = {
              version = 'LuaJIT',
            },
            -- https://reddit.com/r/neovim/comments/1avouc4/lua_why_warning_message_undefined_global_keywords
            -- https://github.com/pynappo/dotfiles/blob/2aa3ff1383fa1f85a0ceff0db1e25cc58f0f91a1/.config/nvim/lua/pynappo/lsp/configs.lua#L14-L45
            -- https://github.com/neovim/neovim/issues/21686
            workspace = {
              checkthirdparty = false,
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
            diagnostics = {
              globals = { 'vim', 'require', 'error', 'string' },
              disable = { 'missing-fields' },
            },
          },
        },
      },
    }
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
      'prettierd',
      'shfmt',
      'rustywind',
      'clang-format',
      'jq',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    for name, config in pairs(servers) do
      config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, config.capabilities or {})
      vim.lsp.config(name, config)
      vim.lsp.enable(name)
    end
  end,
}
