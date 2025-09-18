-- ~/.config/nvim/lua/plugins/cmp.lua
return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" }, -- lazy-load on common events
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets", -- optional snippet collection
      -- Neorg provides its own cmp source; ensure neorg is installed too
      -- (neorg plugin spec should already be present in your plugins)
    },
    config = function()
      local ok, cmp = pcall(require, "cmp")
      if not ok then
        vim.notify("nvim-cmp not available", vim.log.levels.WARN)
        return
      end

      -- safe mapping builder: prefer cmp.mapping.preset.insert when present
      local mapping = nil
      if cmp.mapping and cmp.mapping.preset and cmp.mapping.preset.insert then
        mapping = cmp.mapping.preset.insert {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm { select = true },
          ["<C-e>"] = cmp.mapping.abort(),
        }
      else
        -- fallback mapping (simple)
        mapping = {
          ["<C-Space>"] = cmp.mapping(function() cmp.complete() end, { "i", "c" }),
          ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm { select = true }
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-e>"] = cmp.mapping(function() cmp.close() end, { "i", "c" }),
        }
      end

      -- setup cmp
      cmp.setup {
        snippet = {
          expand = function(args) require("luasnip").lsp_expand(args.body) end,
        },
        mapping = mapping,
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
        },
      }

      -- setup cmp specifically for norg filetype so neorg source is used
      -- (neorg registers a 'neorg' cmp source)
      cmp.setup.filetype("norg", {
        sources = cmp.config.sources {
          { name = "neorg" }, -- Neorg's source (required for neorg completion)
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
        },
      })
    end,
  },
}
