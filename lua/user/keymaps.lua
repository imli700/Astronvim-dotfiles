-- lua/user/keymaps.lua

-- Remove the existing mappings for 'n' and 'N' in normal and visual
pcall(function()
  vim.keymap.del("n", "n")
  vim.keymap.del("n", "N")
  vim.keymap.del("x", "n")
  vim.keymap.del("x", "N")
end)

-- Restore default behaviour (these are the literal 'n' and 'N' motions)
-- Using vim.keymap.set keeps things modern and safe
vim.keymap.set("n", "n", "n", { noremap = true })
vim.keymap.set("n", "N", "N", { noremap = true })
vim.keymap.set("x", "n", "n", { noremap = true })
vim.keymap.set("x", "N", "N", { noremap = true })

-- Neorg <Plug> mapping: keep noremap = false to allow <Plug> expansion
vim.keymap.set("n", "<C-t>", "<Plug>(neorg.qol.todo-items.todo.task-cycle)", { noremap = false, silent = true })

-- Bugger navigation
vim.keymap.set("n", "H", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "L", "<cmd>bnext<CR>", { desc = "Next buffer" })
