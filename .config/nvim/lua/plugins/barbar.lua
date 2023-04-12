require'bufferline'.setup({
  tabpages = true,
})

vim.keymap.set('n', '<C-h>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<C-l>', '<Cmd>BufferNext<CR>')
-- TODO ideally this would be <C-H> and <C-L> but need to make term support this
vim.keymap.set('n', '<A-,>', '<Cmd>BufferMovePrevious<CR>')
vim.keymap.set('n', '<A-.>', '<Cmd>BufferMoveNext<CR>')
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>')
vim.keymap.set('n', '<leader>q', '<Cmd>BufferClose<CR>')
