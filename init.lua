vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
vim.o.wrap = true
vim.o.winborder = 'rounded'
vim.swapfile = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.confirm = true
vim.o.splitbelow = true
vim.o.scrolloff = 15
vim.o.list = true
vim.opt.listchars = { trail = '·' }

local github = 'https://github.com/'
vim.pack.add({
  { src = github .. 'stevearc/oil.nvim' },
  { src = github .. 'echasnovski/mini.pick' },
  { src = github .. 'neovim/nvim-lspconfig' },
  { src = github .. 'williamboman/mason.nvim' },
  { src = github .. 'WhoIsSethDaniel/mason-tool-installer.nvim' },
  { src = github .. 'folke/which-key.nvim' },

  -- Themes
  { src = github .. 'rose-pine/neovim' },
  { src = github .. 'vague2k/vague.nvim' },
})
vim.cmd.colorscheme('rose-pine')
vim.cmd(':hi statusline guibg=NONE')

require('mason').setup()
require('mason-tool-installer').setup {
  ensure_installed = {
    'lua-language-server',    -- lua_ls
    'svelte-language-server', -- svelte
    'stylua',
    'prettierd',
    'prettier',
    'google-java-format',
  }
}
vim.lsp.enable({ 'lua_ls', 'svelte' })

-- Keymaps --

local function k(mode, key, func, opts)
  vim.keymap.set(mode, key, func, opts or {})
end

local function nmap(...)
  k('n', ...)
end

local function nvmap(...)
  k({ 'n', 'v', 'x' }, ...)
end

-- Sync with system clipboard
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

require 'mini.pick'.setup()
require 'oil'.setup()
require('which-key').setup {
  delay = 500,
  win = {
    no_overlap = false,
  },
}

nmap('<leader>f', '<cmd>Pick files<cr>', { desc = 'Pick files' })
nmap('<leader>h', '<cmd>Pick help<cr>', { desc = 'Pick help' })
nmap('<s-h>', '<cmd>Oil<cr>', { desc = 'Oil' })
nmap('<leader>lf', vim.lsp.buf.format, { desc = 'Format file' })
nmap('<leader>w', '<cmd>w<cr>', { desc = 'Write to file' })
nmap('<leader>e', '<cmd>q<cr>', { desc = 'Quit file' })
nmap('<leader>s', ':source<cr>')
nmap('<leader>os', '<cmd>split<cr>')
nmap('<leader>ov', '<cmd>vsplit<cr>')

-- Search with backspace
nvmap('<BS>', '/')

-- Clear highlights on search when pressing <Esc> in normal mode
nmap('<Esc>', '<cmd>nohlsearch<cr>')

-- Navigate between windows
nvmap('<C-j>', '<C-W>j')
nvmap('<C-k>', '<C-W>k')
nvmap('<C-l>', '<C-W>l')
nvmap('<C-h>', '<C-W>h')

-- Center editor view with zz
nvmap('<C-d>', '<C-d>zz')
nvmap('<C-u>', '<C-u>zz')
nvmap('<C-f>', '<C-f>zz')
nvmap('<C-b>', '<C-b>zz')

-- Quickfix list navigation
nvmap('<M-j>', '<cmd>cnext<cr>')
nvmap('<M-k>', '<cmd>cprev<cr>')
nvmap('<M-h>', '<cmd>cfirst<cr>')
nvmap('<M-l>', '<cmd>clast<cr>')

-- Quality of life configurations
local snoremap = { noremap = true, silent = true }

-- Disable space
nvmap('<Space>', '<Nop>', snoremap)

-- Omit chars consumed by the x and c operator
nvmap('x', '"_x', snoremap)
nvmap('c', '"_c', snoremap)

-- ignore empty line when deleting or yanking a line
-- Source: https://www.reddit.com/r/neovim/comments/1ftpdt9/comment/lpvh3s8/
local function handle_yank_delete(key)
  local line = vim.fn.getline '.'
  if key == 'yy' and line ~= '' then
    vim.cmd 'normal! yy'
  elseif key == 'dd' then
    if line:match '^%s*$' then
      vim.api.nvim_feedkeys('"_dd', 'n', false)
    else
      vim.cmd 'normal! dd'
    end
  end
end

nmap('yy', function()
  handle_yank_delete 'yy'
end, snoremap)
nmap('dd', function()
  handle_yank_delete 'dd'
end, snoremap)

-- Override the handler to filter out unwanted diagnostics
local lsp_symbols_filters = {
  ['lua_ls'] = {
    ['global'] = {
      'vim',
      'error',
      'string',
      'tostring',
      'pcall',
      'os_uname',
      'os',
    },
    ['field'] = {
      'fs_stat',
    },
  },
}

vim.lsp.handlers['textDocument/publishDiagnostics'] = function(err, result, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if not result or not client then
    return
  end

  -- Apply filters for certain lsps (mainly for lua_ls)
  if lsp_symbols_filters[client.name] then
    result.diagnostics = vim.tbl_filter(function(diagnostic)
      for kind, symbols in pairs(lsp_symbols_filters[client.name]) do
        for _, name in ipairs(symbols) do
          if diagnostic.message:match(string.format('Undefined %s `%s`', kind, name)) then
            return false
          end
        end
      end
      return true
    end, result.diagnostics)
  end

  -- Use default handler
  vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
end
