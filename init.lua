vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

vim.keymap.set('i', 'kj', '<Esc>')

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<A-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<A-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<A-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<A-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {'numToStr/Comment.nvim', opts = {}},
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        config = function()
            require('ibl').setup({
                scope = {enabled = false}
            })
        end
    },
    {
        'neanias/everforest-nvim',
        version = false, 
        lazy = false, 
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'everforest'
        end
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>sg', builtin.git_files, {})
        end
    },
    {
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate",
        config = function() 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {'lua', 'python', 'vimdoc'},
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {theme = 'everforest'}
            })
        end
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true
    }
}, {})
