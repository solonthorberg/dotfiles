-- Keybinds
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap

keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste without losing register' })

keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines without moving cursor' })

keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

keymap.set('n', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
keymap.set('v', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })

keymap.set('n', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
keymap.set('v', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })

keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = '[B]uffer [D]elete' })
