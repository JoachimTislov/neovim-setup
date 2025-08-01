return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- file icons
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      columns = {
        'icon',
        'permissions',
        'size',
        'mtime',
      },
      buf_options = {
        buflisted = true,
        -- bufhidden = "hide",
      },
      win_options = {
        wrap = true,
        signcolumn = 'no',
        cursorcolumn = false,
        foldcolumn = '0',
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = 'nvic',
      },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      -- -- Oil will automatically delete hidden buffers after this delay
      -- -- You can set the delay to false to disable cleanup entirely
      -- -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
      -- cleanup_delay_ms = 2000,
      -- lsp_file_methods = {
      --   -- Enable or disable LSP file operations
      --   enabled = true,
      --   -- Time to wait for LSP file operations to complete before skipping
      --   timeout_ms = 1000,
      --   -- Set to true to autosave buffers that are updated with LSP willRenameFiles
      --   -- Set to "unmodified" to only save unmodified buffers
      --   autosave_changes = false,
      -- },
      -- -- Constrain the cursor to the editable parts of the oil buffer
      -- -- Set to `false` to disable, or "name" to keep it on the file names
      -- constrain_cursor = "editable",
      -- -- Set to true to watch the filesystem for changes and reload oil
      -- watch_for_changes = false,
      -- -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
      -- -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
      -- -- See :help oil-actions for a list of all available actions
      keymaps = {
        ['<C-h>'] = false,
        ['<C-l>'] = { 'actions.select', mode = 'n' },
      },
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name)
          local m = name:match '^%.'
          return m ~= nil
        end,
        is_always_hidden = function(name)
          return name == '.git'
        end,
        -- Sort file names with numbers in a more intuitive order for humans.
        -- Can be "fast", true, or false. "fast" will turn it off for large directories.
        natural_order = 'fast',
        -- Sort file and directory names case insensitive
        case_insensitive = false,
        sort = {
          -- sort order can be "asc" or "desc"
          -- see :help oil-columns to see which columns are sortable
          { 'type', 'asc' },
          { 'name', 'asc' },
        },
        -- Customize the highlight group for the file name
        highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
          return nil
        end,
      },
      -- -- Extra arguments to pass to SCP when moving/copying files over SSH
      -- extra_scp_args = {},
      -- -- EXPERIMENTAL support for performing file operations with git
      -- git = {
      --   -- Return true to automatically git add/mv/rm files
      --   add = function(path)
      --     return false
      --   end,
      --   mv = function(src_path, dest_path)
      --     return false
      --   end,
      --   rm = function(path)
      --     return false
      --   end,
      -- },
      -- -- Configuration for the floating window in oil.open_float
      -- float = {
      --   -- Padding around the floating window
      --   padding = 2,
      --   -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      --   max_width = 0,
      --   max_height = 0,
      --   border = "rounded",
      --   win_options = {
      --     winblend = 0,
      --   },
      --   -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
      --   get_win_title = nil,
      --   -- preview_split: Split direction: "auto", "left", "right", "above", "below".
      --   preview_split = "auto",
      --   -- This is the config that will be passed to nvim_open_win.
      --   -- Change values here to customize the layout
      --   override = function(conf)
      --     return conf
      --   end,
      -- },
      -- -- Configuration for the file preview window
      preview_win = {
        -- Whether the preview window is automatically updated when the cursor is moved
        update_on_cursor_moved = true,
        -- How to open the preview window "load"|"scratch"|"fast_scratch"
        preview_method = 'fast_scratch',
        -- A function that returns true to disable preview on a file e.g. to avoid lag
        disable_preview = function(filename)
          return false
        end,
        -- Window-local options to use for preview window buffers
        win_options = {},
      },
      -- -- Configuration for the floating action confirmation window
      -- confirmation = {
      --   -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      --   -- min_width and max_width can be a single value or a list of mixed integer/float types.
      --   -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
      --   max_width = 0.9,
      --   -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
      --   min_width = { 40, 0.4 },
      --   -- optionally define an integer/float for the exact width of the preview window
      --   width = nil,
      --   -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      --   -- min_height and max_height can be a single value or a list of mixed integer/float types.
      --   -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
      --   max_height = 0.9,
      --   -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
      --   min_height = { 5, 0.1 },
      --   -- optionally define an integer/float for the exact height of the preview window
      --   height = nil,
      --   border = "rounded",
      --   win_options = {
      --     winblend = 0,
      --   },
      -- },
      -- -- Configuration for the floating progress window
      -- progress = {
      --   max_width = 0.9,
      --   min_width = { 40, 0.4 },
      --   width = nil,
      --   max_height = { 10, 0.9 },
      --   min_height = { 5, 0.1 },
      --   height = nil,
      --   border = "rounded",
      --   minimized_border = "none",
      --   win_options = {
      --     winblend = 0,
      --   },
      -- },
      -- -- Configuration for the floating SSH window
      -- ssh = {
      --   border = "rounded",
      -- },
      -- -- Configuration for the floating keymaps help window
      -- keymaps_help = {
      --   border = "rounded",
      -- },
    }
  end,
}
