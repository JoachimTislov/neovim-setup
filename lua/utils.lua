local M = {}

function M.safe_require(path)
  local ok, m = pcall(require, path)
  if not ok then
    return {}
  else
    return m
  end
end

function M.setup_ls(name, config)
  config.capabilities = vim.tbl_deep_extend('force', {}, require('blink.cmp').get_lsp_capabilities(), config.capabilities or {})
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

return M
