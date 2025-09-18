-- lua/user/autocmds.lua
-- Autocmds for norg files and generic helpers

-- norg local options
vim.api.nvim_create_autocmd("FileType", {
  pattern = "norg",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end,
})

-- Remove 'c','r','o' from formatoptions for norg files
vim.api.nvim_create_augroup("UserNorgFormatOptions", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "UserNorgFormatOptions",
  pattern = "norg",
  callback = function()
    -- Use vim.bo to modify buffer-local options
    vim.bo.formatoptions = vim.bo.formatoptions:gsub("[cro]", "")
  end,
})

-- Remember folds
vim.api.nvim_create_augroup("UserRememberFolds", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
  group = "UserRememberFolds",
  pattern = "?*",
  callback = function() pcall(vim.cmd, "mkview") end,
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  group = "UserRememberFolds",
  pattern = "?*",
  callback = function() pcall(vim.cmd, "silent! loadview") end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "FileType" }, {
  pattern = { "*.norg" },
  callback = function()
    -- make conceal hide markup (2 hides completely; 1 shows one char replacement)
    vim.opt_local.conceallevel = 2
    -- keep concealing even for the cursor line in normal/visual modes,
    -- but allow the text to be visible when you enter insert/select to edit (common choice)
    -- "nc" means concealing applies in normal+visual; adjust if you prefer different behavior.
    vim.opt_local.concealcursor = ""
  end,
})
