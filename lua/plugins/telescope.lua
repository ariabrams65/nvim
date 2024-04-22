return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            local utils = require('telescope.utils')
            vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>sr', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>sg', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ff', builtin.current_buffer_fuzzy_find, {})
            vim.keymap.set('n', '<leader>sd', function()
                builtin.find_files({cwd = utils.buffer_dir()})
            end, {})
            vim.keymap.set('n', '<leader>sc', function()
                builtin.find_files({cwd="~/.config/nvim"})
            end, {})
            vim.keymap.set('n', '<leader>s~', function()
                builtin.find_files({cwd="~"})
            end, {})
        end
    }
}
