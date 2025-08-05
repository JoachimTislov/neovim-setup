return {
  'rcarriga/nvim-notify',
  config = function()
    ---@diagnostic disable-next-line:duplicate-set-field
    vim.notify = function(msg, ...)
      vim.api.nvim_set_hl(0, 'NotifyBackground', { bg = '#1e1e2e' })
      -- block certain notifications ...
      -- vtsls: -32603: Request textDocument/documentHighlight failed with message: Cannot find provider for documentHighlight, the feature is possibly not supported by the current TypeScrip t version or disabled by settings.
      -- if string.match(msg, '(vtsls: %-32603)') then
      --   return
      -- end
      require 'notify'(msg, ...)
    end
  end,
}
