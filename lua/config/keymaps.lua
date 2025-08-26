--  See `<cmd>help vim.keymap.set()`

-- vim.keymap.set('n', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'x', '"_x', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'c', '"_c', { noremap = true, silent = true })

vim.keymap.set('n', 'i', function()
  return string.match(vim.api.nvim_get_current_line(), '%g') == nil and 'cc' or 'i'
end, { expr = true, noremap = true })

vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = '[Q]uit' })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = '[W]rite to file' })
vim.keymap.set('n', '<leader>r', '<cmd>source<cr>', { desc = '[S]ource file' })
vim.keymap.set('n', '<leader>m', '<cmd>messages<cr>', { desc = 'View [M]essages' })

vim.keymap.set('n', 'gd', vim.diagnostic.setloclist, { desc = '[D]iagnostic quickfix list' })

vim.keymap.set('n', '<leader>o', '', { desc = '[O]pen' })
-- vim.keymap.set('n', '<leader>od', '<cmd>Dashboard<cr>', { desc = '[D]ashboard' })
vim.keymap.set('n', '<leader>on', '<cmd>Neogit<cr>', { desc = '[N]eogit' })
-- vim.keymap.set('n', '<leader>ot', '<cmd>terminal<cr>', { desc = '[T]erminal' })
vim.keymap.set('n', '<leader>ot', '<cmd>tabnew<cr>', { desc = '[T]ab' })
vim.keymap.set('n', '<leader>ol', '<cmd>Lazy<cr>', { desc = '[L]azy' })
vim.keymap.set('n', '<leader>om', '<cmd>Mason<cr>', { desc = '[M]ason' })
vim.keymap.set('n', '<leader>ov', '<cmd>vsplit<cr>', { desc = '[V]ertical split' })
vim.keymap.set('n', '<leader>os', '<cmd>split<cr>', { desc = '[S]plit (horisontal)' })
vim.keymap.set('n', '<leader>of', '<cmd>enew<cr>', { desc = '[F]ile' })

vim.keymap.set('n', '<S-h>', '<cmd>Oil<cr>', { desc = 'Open parent directory' })
--  See `<cmd>help hlsearch`
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- vim.keymap.set('n', '<Enter>', ':') conflicts with jumping to sections in README.md file
vim.keymap.set('n', '<BS>', '/')

-- Exit terminal mode in the builtin terminal with a shortcut
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')

-- TIP<cmd> Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<cr>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<cr>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<cr>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<cr>')

--  Use CTRL+<hjkl> to switch between windows
--  See `<cmd>help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
