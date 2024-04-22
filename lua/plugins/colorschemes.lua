return {
    {
        'neanias/everforest-nvim',
        version = false,
        lazy = false,
        --priority = 1000,
        config = function()
            -- vim.cmd.colorscheme 'everforest'
        end
    },
    {
        "oxfist/night-owl.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("night-owl")
        end
    },
}
