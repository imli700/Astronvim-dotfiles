-- add to lua/user/plugins.lua (inside the returned table)
return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  opts = {
    -- plugin options passed to require("gruvbox").setup()
    transparent_mode = true, -- enables built-in transparency
    contrast = "soft", -- "soft" | "medium" | "hard" (optional)
    italic = { comments = true }, -- example tweak
  },
  config = function(_, opts)
    -- apply plugin opts then set the scheme (Astro/Lazy pattern)
    require("gruvbox").setup(opts)
    vim.cmd.colorscheme "gruvbox"
  end,
}
