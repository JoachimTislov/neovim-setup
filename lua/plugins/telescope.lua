-- https://github.com/nvim-telescope/telescope.nvim
return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      -- pickers = {}
      -- extensions = {
      --   ['ui-select'] = {
      --     require('telescope.themes').get_dropdown(),
      --   },
      -- },
    }
    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    local function live_grep(dir, desc, open_files)
      if dir == '' then
        dir = vim.fn.getcwd()
      end
      builtin.live_grep {
        cwd = dir,
        grep_open_files = open_files,
        prompt_title = 'Live grep in ' .. desc,
        additional_args = function()
          return { '--hidden' }
        end,
      }
    end
    local function keymap_grep(dir, key, desc, open_files)
      vim.keymap.set('n', '<leader>sg' .. key, function()
        live_grep(dir, desc, open_files)
      end, { desc = desc })
    end
    keymap_grep('', 'w', '[W]orking directory')
    keymap_grep('~/dotfiles', 'd', '[D]otfiles')
    keymap_grep('~/.config', 'c', '[C]onfig')
    keymap_grep('~/.config/nvim', 'n', '[N]eovim')
    keymap_grep('', 'o', '[O]pen files', true)

    vim.keymap.set('n', '<leader>st', function()
      builtin.colorscheme { enable_preview = true }
    end, { desc = '[S]elect [T]heme' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch in current [B]uffers' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

    local function find_files(key, dir, desc, hidden)
      vim.keymap.set('n', key, function()
        builtin.find_files { cwd = dir, hidden = hidden }
      end, { desc = desc })
    end
    find_files('<leader>sc', '~/dotfiles', '[S]earch in dotfiles')
    find_files('<leader>sn', vim.fn.stdpath 'config', '[S]earch [N]eovim files')
    find_files('<leader>su', '~', '[S]earch in [U]ser home', true)
    find_files('<leader>sf', vim.fn.getcwd(), '[S]earch [F]iles', true)

    -- vim.keymap.set('n', '<leader>n', '<cmd>Telescope notify<CR>', { desc = 'View past notifications' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
  end,
}
