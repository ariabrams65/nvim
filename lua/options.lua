vim.g.have_nerd_font = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.showmode = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.clipboard = 'unnamedplus'

vim.opt.cursorline = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.hlsearch = true

vim.opt.undofile = true

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Not exactly sure what this does since we alreay have substition preview
-- vim.opt.inccommand = 'split'


-- Not sure what these are doing   
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
