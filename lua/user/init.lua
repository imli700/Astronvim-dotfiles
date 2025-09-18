-- lua/user/init.lua
-- Entry file for user customizations. AstroNvim will load this file when
-- it sets up the user namespace. Keep it small — require other files here.

-- load options first (so other modules can rely on them)
pcall(require, "user.options")

-- load keymaps (after options)
pcall(require, "user.keymaps")

-- load autocmds (after keymaps/options)
pcall(require, "user.autocmds")

-- load additional plugin specs / imports
pcall(require, "user.plugins")
