local keymap = vim.keymap

keymap.set('i', 'jj', '<Esc>')
keymap.set('', 'l', 'h')
keymap.set('', ';', 'l')
keymap.set('', 'h', ';')

keymap.set('n', '<C-W>l', '<C-W><C-H>')
keymap.set('n', '<C-W>;', '<C-W><C-L>')

keymap.set('n', '<Leader>b', ':ls<CR>:b<Space>')
keymap.set('n', '<Leader><Tab>', ':bn<CR>')
keymap.set('n', '<Leader><S-Tab>', ':bp<CR>')
keymap.set('n', '<Leader>q', ':bp<CR>:bd #<CR>')
keymap.set('n', '<Leader>w', ':w<CR>')

keymap.set('', '<F10>', ':terminal<CR>')

keymap.set('n', '<Leader>h', ':nohl<CR>')

keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
