--  See `<cmd>help vim.keymap.set()`
local utils = require 'utils'
local nmap = utils.nmap
local nvmap = utils.nvmap
local imap = utils.imap

-- nmap('<Space>', '<Nop>', { noremap = true, silent = true })
nvmap('x', '"_x', { noremap = true, silent = true })
nvmap('c', '"_c', { noremap = true, silent = true })

-- Map a key to enter command mode
-- Doesn't work
-- nmap('\\', ':', { noremap = true, silent = true })

-- Add k or j to reset cursor back to initial position
nmap('oo', 'o<Esc>', { noremap = true, silent = true })
nmap('OO', 'O<Esc>', { noremap = true, silent = true })

-- Remap insert to be flexible for tab indents
nmap('i', function()
  return string.match(vim.api.nvim_get_current_line(), '%g') == nil and 'cc' or 'i'
end, { expr = true, noremap = true })

nmap('<leader>e', '<cmd>q<cr>', { desc = '[E]xit' })
nmap('<leader>qa', '<cmd>qa<cr>', { desc = '[Q]uit [A]ll' })
nmap('<leader>qt', '<cmd>tabc<cr>', { desc = '[Q]uit [T]ab' })
nmap('<leader>qb', '<cmd>bd<cr>', { desc = '[Q]uit [B]uffer' })
nmap('<leader>qf', '<cmd>q!<cr>', { desc = '[Q]uit [F]orce' })

nmap('<leader>w', '<cmd>w<cr>', { desc = '[W]rite to file' })
nmap('<leader>r', '<cmd>source<cr>', { desc = '[R]un - Source file' })
nmap('<leader>m', '<cmd>messages<cr>', { desc = 'View [M]essages' })

nmap('gd', vim.diagnostic.setloclist, { desc = '[D]iagnostic quickfix list' })

nmap('<leader>o', '', { desc = '[O]pen' })
nmap('<leader>on', '<cmd>Neogit<cr>', { desc = '[O]pen [N]eogit' })
nmap('<leader>ot', '<cmd>tabnew<cr>', { desc = '[O]pen [T]ab' })
nmap('<leader>ol', '<cmd>Lazy<cr>', { desc = '[O]pen [L]azy' })
nmap('<leader>om', '<cmd>Mason<cr>', { desc = '[O]pen [M]ason' })
nmap('<leader>ov', '<cmd>vsplit<cr>', { desc = '[O]pen [V]ertical split' })
nmap('<leader>os', '<cmd>split<cr>', { desc = '[O]pen [S]plit (horisontal)' })
nmap('<leader>of', '<cmd>enew<cr>', { desc = '[O]pen [F]ile' })
nmap('<leader>oc', '<cmd>CopilotChatOpen<cr>', { desc = '[O]pen [C]opilot' })
-- nmap('<leader>od', '<cmd>Dashboard<cr>', { desc = '[D]ashboard' })
-- nmap('<leader>ot', '<cmd>terminal<cr>', { desc = '[T]erminal' })

-- Disabled copilot panel as it is not useful and bugs out the folke loader UI
-- nmap('<leader>cP', '<cmd>Copilot panel<cr>', { desc = 'Panel' })
nmap('<leader>ce', '<cmd>Copilot enable<cr>', { desc = 'Enable' })
nmap('<leader>cd', '<cmd>Copilot disable<cr>', { desc = 'Disable' })
nmap('<leader>cp', '<cmd>CopilotChatPrompts<cr>', { desc = 'View/select prompt templates' })
nvmap('<leader>ct', '<cmd>CopilotChatToggle<cr>', { desc = 'Toggle chat window' })
nmap('<leader>cs', '<cmd>CopilotChatStop<cr>', { desc = 'Stop current output' })
nmap('<leader>cr', '<cmd>CopilotChatReset<cr>', { desc = 'Reset Chat' })
nmap('<leader>cm', '<cmd>CopilotChatModels<cr>', { desc = 'View/select available models' })
nmap('<leader>cw', ':CopilotChatSave ', { desc = 'Save chat' })
nmap('<leader>cl', ':CopilotChatLoad ', { desc = 'Load chat' })
nmap('<leader>cc', ':CopilotChat ', { desc = 'Chat (Add custom prompt)' })

-- Remap <Tab> to <S-Tab> for copilot accept to avoid conflict with other plugins
imap('<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
imap('<C-A-j>', 'copilot#Next()', { expr = true, silent = true, script = true })

-- https://github.com/meznaric/key-analyzer.nvim?tab=readme-ov-file
nmap('<leader>k', ':KeyAnalyzer ', { desc = 'Open KeyAnalyzer' })
-- https://github.com/stevearc/oil.nvim
nmap('<S-h>', '<cmd>Oil<cr>', { desc = 'Open parent directory' })
--  See `<cmd>help hlsearch`
-- Clear highlights on search when pressing <Esc> in normal mode
nmap('<Esc>', '<cmd>nohlsearch<cr>')

-- nmap('<Enter>', ':') conflicts with jumping to sections in README.md file
nmap('<BS>', '/') -- Start searching with backspace key

-- Exit terminal mode in the builtin terminal with a shortcut
utils.tmap('<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

nmap('<C-d>', '<C-d>zz')
nmap('<C-u>', '<C-u>zz')
nmap('<C-f>', '<C-f>zz')
nmap('<C-b>', '<C-b>zz')

-- TIP<cmd> Disable arrow keys in normal mode
nmap('<left>', '<cmd>echo "Use h to move!!"<cr>')
nmap('<right>', '<cmd>echo "Use l to move!!"<cr>')
nmap('<up>', '<cmd>echo "Use k to move!!"<cr>')
nmap('<down>', '<cmd>echo "Use j to move!!"<cr>')

--  Use CTRL+<hjkl> to switch between windows
--  See `<cmd>help wincmd` for a list of all window commands
nvmap('<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
nvmap('<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
nvmap('<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
nvmap('<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
