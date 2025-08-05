return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'saghen/blink.cmp',
  },
  config = function()
    require 'config.autocmds.lsp-attach'
    require 'config.diagnostics'

    local vue_plugin = {
      name = '@vue/typescript-plugin',
      location = vim.fn.expand '$MASON/packages/vue-language-server/node_modules/@vue/language-server',
      languages = { 'vue' },
      confignamespace = 'typescript',
    }
    local filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
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
      -- Not sure why but i experienced alot of issues with the vtsls solution for vue projects
      -- textDocument/highlight error -32603, Typescript versions issues ...
      -- vtsls = {
      --   settings = {
      --     vtsls = {
      --       tsserver = {
      --         globalplugins = {
      --           vue_plugin,
      --         },
      --       },
      --     },
      --     typescript = {
      --       preferences = {
      --         -- https://github.com/lazyvim/lazyvim/discussions/1124
      --         includecompletionsformoduleexports = true,
      --         includecompletionsforimportstatements = true,
      --         importmodulespecifier = 'non-relative',
      --       },
      --     },
      --   },
      --   filetypes = filetypes,
      -- },
      -- -- setup vue: https://github.com/vuejs/language-tools/wiki/neovim
      vue_ls = {
        on_init = function(client)
          client.handlers['tsserver/request'] = function(_, result, context)
            local clients = vim.lsp.get_clients { bufnr = context.bufnr, name = 'ts_ls' }
            if #clients == 0 then
              vim.notify('Could not find `vtsls` lsp client, `vue_ls` would not work without it.', vim.log.levels.ERROR)
              return
            end
            local ts_client = clients[1]

            local param = unpack(result)
            local id, command, payload = unpack(param)
            ts_client:exec_cmd({
              title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
              command = 'typescript.tsserverRequest',
              arguments = {
                command,
                payload,
              },
            }, { bufnr = context.bufnr }, function(_, r)
              local response = r and r.body
              -- TODO: handle error or response nil here, e.g. logging
              -- NOTE: Do NOT return if there's an error or no response, just return nil back to the vue_ls to prevent memory leak
              local response_data = { { id, response } }

              ---@diagnostic disable-next-line: param-type-mismatch
              client:notify('tsserver/response', response_data)
            end)
          end
        end,
      },
      -- some languages (like typescript) have entire language plugins that can be useful:
      --    https://github.com/pmizio/typescript-tools.nvim
      ts_ls = {
        init_options = {
          plugins = {
            vue_plugin,
          },
        },
        filetypes = filetypes,
      },
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
    require('mason-tool-installer').setup {
      ensure_installed = vim.list_extend(vim.tbl_keys(servers), {
        'stylua',
        'prettierd',
        'shfmt',
        'rustywind',
        'clang-format',
        'jq',
      }),
    }
    for name, config in pairs(servers) do
      config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, config.capabilities or {})
      vim.lsp.config(name, config)
      vim.lsp.enable(name)
    end
  end,
}
