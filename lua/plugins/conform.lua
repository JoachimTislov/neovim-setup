return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    notify_on_error = false,
    formatters_by_ft = {
      lua = { 'stylua' },
      jsonc = { 'jq' },
      json = { 'jq' },
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      vue = { 'prettierd' },
      bash = { 'shfmt' },
      java = { 'google-java-format' },
      python = { 'black' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
    },
  },
}
