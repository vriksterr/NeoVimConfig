return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          --for more configs watch this https://www.youtube.com/watch?v=GuIcGxYqaQQ
          --["<C-j>"] = cmp.mapping.select_next_item(),   --to scronn up or down in the suggested 
          --["<C-k>"] = cmp.mapping.select_prev_item(),   --to scronn up or down in the suggested 
          --["<C-n>"] = cmp.mapping.scroll_docs(-4),    --so suggestion can have a page so you can go up with this
          --["<C-m>"] = cmp.mapping.scroll_docs(4),     --and go down with this
          --["<C-Space>"] = cmp.mapping.complete(),     --thsis usefull if you dont know what you want to write toggeling this will let you know all the avalilable keywords and fuctions list that you can brows through

          ["<C-e>"] = cmp.mapping{
            i = cmp.mapping.abort(),    --this is used for closing suggestions insert mode
            c = cmp.mapping.close(),    --this is used for closing suggestions when in command mode
          },
          ["<CR>"] = cmp.mapping.confirm({ select = true }), --<CR> is basically Enter key used for selecting what we want from the given options
          
          --this is derived from the video it adds a lot of amazing features on how tab is being used
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {"i","s",}),
        
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
