--  See `<cmd>help vim.keymap.set()`

-- vim.keymap.set('n', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'x', '"_x', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'c', '"_c', { noremap = true, silent = true })

-- Map a key to enter command mode
-- Doesn't work
-- vim.keymap.set('n', '\\', ':', { noremap = true, silent = true })

-- Add k or j to reset cursor back to initial position
vim.keymap.set('n', 'oo', 'o<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', 'OO', 'O<Esc>', { noremap = true, silent = true })

vim.keymap.set('n', 'i', function()
  return string.match(vim.api.nvim_get_current_line(), '%g') == nil and 'cc' or 'i'
end, { expr = true, noremap = true })

vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = '[Q]uit' })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = '[W]rite to file' })
vim.keymap.set('n', '<leader>r', '<cmd>source<cr>', { desc = '[R]un - Source file' })
vim.keymap.set('n', '<leader>m', '<cmd>messages<cr>', { desc = 'View [M]essages' })

vim.keymap.set('n', 'gd', vim.diagnostic.setloclist, { desc = '[D]iagnostic quickfix list' })

vim.keymap.set('n', '<leader>o', '', { desc = '[O]pen' })
vim.keymap.set('n', '<leader>on', '<cmd>Neogit<cr>', { desc = '[O]pen [N]eogit' })
vim.keymap.set('n', '<leader>ot', '<cmd>tabnew<cr>', { desc = '[O]pen  [T]ab' })
vim.keymap.set('n', '<leader>ol', '<cmd>Lazy<cr>', { desc = '[O]pen  [L]azy' })
vim.keymap.set('n', '<leader>om', '<cmd>Mason<cr>', { desc = '[O]pen  [M]ason' })
vim.keymap.set('n', '<leader>ov', '<cmd>vsplit<cr>', { desc = '[O]pen  [V]ertical split' })
vim.keymap.set('n', '<leader>os', '<cmd>split<cr>', { desc = '[O]pen  [S]plit (horisontal)' })
vim.keymap.set('n', '<leader>of', '<cmd>enew<cr>', { desc = '[O]pen  [F]ile' })
vim.keymap.set('n', '<leader>oc', '<cmd>CopilotChatOpen<cr>', { desc = '[O]pen  [C]opilot' })
-- vim.keymap.set('n', '<leader>od', '<cmd>Dashboard<cr>', { desc = '[D]ashboard' })
-- vim.keymap.set('n', '<leader>ot', '<cmd>terminal<cr>', { desc = '[T]erminal' })

-- Disabled copilot panel as it is not useful and bugs out the folke loader UI
-- vim.keymap.set('n', '<leader>cP', '<cmd>Copilot panel<cr>', { desc = 'Panel' })
-- Copilot
vim.keymap.set('n', '<leader>ce', '<cmd>Copilot enable<cr>', { desc = 'Enable' })
vim.keymap.set('n', '<leader>cd', '<cmd>Copilot disable<cr>', { desc = 'Disable' })
vim.keymap.set('n', '<leader>cp', '<cmd>CopilotChatPrompts<cr>', { desc = 'View/select prompt templates' })
vim.keymap.set('n', '<leader>ct', '<cmd>CopilotChatToggle<cr>', { desc = 'Toggle chat window' })
vim.keymap.set('n', '<leader>cs', '<cmd>CopilotChatStop<cr>', { desc = 'Stop current output' })
vim.keymap.set('n', '<leader>cr', '<cmd>CopilotChatReset<cr>', { desc = 'Reset Chat' })
vim.keymap.set('n', '<leader>cm', '<cmd>CopilotChatModels<cr>', { desc = 'View/select available models' })
vim.keymap.set('n', '<leader>cw', ':CopilotChatSave ', { desc = 'Save chat' })
vim.keymap.set('n', '<leader>cl', ':CopilotChatLoad ', { desc = 'Load chat' })
vim.keymap.set('n', '<leader>cc', ':CopilotChat ', { desc = 'Chat (Add custom prompt)' })
-- TODO: List all prompts in telescope instead of opening a chat

-- Remap <Tab> to <S-Tab> for copilot accept to avoid conflict with other plugins
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
vim.keymap.set('i', '<C-A-j>', 'copilot#Next()', { expr = true, silent = true, script = true })

-- https://github.com/meznaric/key-analyzer.nvim?tab=readme-ov-file
vim.keymap.set('n', '<leader>k', ':KeyAnalyzer ', { desc = 'Open KeyAnalyzer' })
-- https://github.com/stevearc/oil.nvim
vim.keymap.set('n', '<S-h>', '<cmd>Oil<cr>', { desc = 'Open parent directory' })
--  See `<cmd>help hlsearch`
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- vim.keymap.set('n', '<Enter>', ':') conflicts with jumping to sections in README.md file
vim.keymap.set('n', '<BS>', '/') -- Start searching with backspace key

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
vim.keymap.set({ 'n', 'x' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 'x' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n', 'x' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n', 'x' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
