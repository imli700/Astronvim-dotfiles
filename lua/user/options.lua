-- lua/user/options.lua
local opt = vim.opt

opt.linebreak = true
opt.breakindent = true
opt.title = true

-- let tree_sitter handle folds
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Enable terminal transparency
vim.cmd [[
  highlight Normal ctermbg=none guibg=none
  highlight NonText ctermbg=none guibg=none
]]

vim.o.termguicolors = true
