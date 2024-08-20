return {
    {
        "hrsh7th/cmp-nvim-lsp",
        commit = "39e2eda"
    },
    {
        "L3MON4D3/LuaSnip",
        tag = "v2.3.0",
        dependencies = {
            "rafamadriz/friendly-snippets",
        }
    },
    {
        "rafamadriz/friendly-snippets",
        commit = "00ebcaa"
    },
    {
        "saadparwaiz1/cmp_luasnip",
        commit = "05a9ab2"
    },
    {
        "hrsh7th/nvim-cmp",
        commit = "ae644fe",
        config = function()
          local cmp = require'cmp'
          local luasnip = require("luasnip")
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets/" })

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
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
              ["<Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                      cmp.select_next_item()
                  elseif luasnip.locally_jumpable(1) then
                      luasnip.jump(1)
                  else
                      fallback()
                  end
            end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
            }, {
              { name = 'buffer' },
            })
          })
        end
    }
}
