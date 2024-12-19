--Set options
vim.o.relativenumber = true
vim.o.number = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
--vim.bo.softtabstop = 2

--Load plugins
require("plugin")
--Load binds
local binds = require("plugin.bindings")
binds.set_general_binds()
binds.set_telescope_binds()

