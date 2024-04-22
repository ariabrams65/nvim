return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
        config = function()
            vim.keymap.set('n', '<leader>md', ':MarkdownPreview<CR>', {})
        end
    },

    {'numToStr/Comment.nvim', opts = {}},
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        config = function()
            require('ibl').setup({
                scope = {enabled = false},
                exclude = {filetypes = {'text', 'markdown'}}
            })
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {theme = 'auto'}
            })
        end
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true
    },
}
