return {
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'L3MON4d3/LuaSnip',
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets'
        }
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<A-n>'] = cmp.mapping.select_next_item(),
                    ['<A-p>'] = cmp.mapping.select_prev_item(),
                    ['<A-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<A-f>'] = cmp.mapping.scroll_docs(4),
                    ['<A-Space>'] = cmp.mapping.complete(),
                    ['<A-e>'] = cmp.mapping.abort(),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
                    {
                        { name = 'buffer' },
                    })
            })
        end
    }
}
