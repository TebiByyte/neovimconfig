--Set options
vim.o.relativenumber = true
vim.o.number = true
vim.o.tabstop = 4
--Load plugins
require("plugin")
--Load binds
require("plugin.bindings").set_general_binds()
