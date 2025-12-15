-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "vim",
      "norg",
      "norg_meta",
      "latex",
      "scss",
      "svelte",
      "tsx",
      "typst",
      "vue",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
