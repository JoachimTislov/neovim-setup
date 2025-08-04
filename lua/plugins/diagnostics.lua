-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'if_many',
  },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}

-- [lsp(name)]: --> [scope/type/kind]: symbol
local lsp_symbols = {
  ['lua_ls'] = {
    ['global'] = {
      'require',
      'vim',
      'error',
      'string',
    },
    ['field'] = {
      'fs_stat',
    },
  },
}

-- Override the handler to filter out unwanted diagnostics
vim.lsp.handlers['textDocument/publishDiagnostics'] = function(err, result, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if not result or not client or not lsp_symbols[client.name] then
    return
  end

  result.diagnostics = vim.tbl_filter(function(diagnostic)
    for kind, symbols in pairs(lsp_symbols[client.name]) do
      for _, name in ipairs(symbols) do
        if diagnostic.message:match(string.format('Undefined %s `%s`', kind, name)) then
          return false
        end
      end
    end
    return true
  end, result.diagnostics)

  -- Use default handler
  vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
end
