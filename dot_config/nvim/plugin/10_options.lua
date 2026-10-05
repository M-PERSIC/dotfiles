-- [nfnl] plugin/10_options.fnl
local vim = _G.vim
local Config = _G.Config
for option, value in pairs({mapleader = " "}) do
  vim.g[option] = value
end
for option, value in pairs({mouse = "a"}) do
  vim.o[option] = value
end
vim.o.mousescroll = "ver:25,hor:6"
vim.o.switchbuf = "usetab"
vim.o.undofile = true
vim.o.shada = "'100,<50,s10,:1000,/100,@100,h"
vim.o.breakindent = true
vim.o.breakindentopt = "list:-1"
vim.o.colorcolumn = "+1"
vim.o.cursorline = true
vim.o.linebreak = true
vim.o.list = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.pumborder = "single"
vim.o.pumheight = 10
vim.o.pummaxwidth = 100
vim.o.ruler = false
vim.o.shortmess = "CFOSWaco"
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.splitbelow = true
vim.o.splitkeep = "screen"
vim.o.splitright = true
vim.o.winborder = "single"
vim.o.wrap = false
vim.o.cursorlineopt = "screenline,number"
vim.o.fillchars = "eob: ,fold:\226\149\140"
vim.o.listchars = "extends:\226\128\166,nbsp:\226\144\163,precedes:\226\128\166,tab:> "
vim.o.foldlevel = 10
vim.o.foldmethod = "indent"
vim.o.foldnestmax = 10
vim.o.foldtext = ""
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.formatoptions = "rqnl1j"
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.infercase = true
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.spelloptions = "camel"
vim.o.tabstop = 2
vim.o.virtualedit = "block"
vim.o.iskeyword = "@,48-57,_,192-255,-"
vim.o.formatlistpat = "^\\s*[0-9\\-\\+\\*]\\+[\\.\\)]*\\s\\+"
vim.o.complete = ".,w,b,kspell"
vim.o.completeopt = "menuone,noselect,fuzzy,nosort"
vim.o.completetimeout = 100
local f
local function _1_()
  return vim.cmd("setlocal formatoptions-=c formatoptions-=o")
end
f = _1_
Config.new_autocmd("FileType", nil, f, "Proper formatoptions")
local diagnostic_opts = {signs = {priority = 9999, severity = {min = "WARN", max = "ERROR"}}, underline = {severity = {min = "HINT", max = "ERROR"}}, virtual_lines = true, update_in_insert = false, virtual_text = false}
local function _2_()
  return vim.diagnostic.config(diagnostic_opts)
end
Config.later(_2_)
vim.o.mousescroll = "ver:25,hor:6"
vim.o.switchbuf = "usetab"
vim.o.undofile = true
vim.o.shada = "'100,<50,s10,:1000,/100,@100,h"
vim.o.breakindent = true
vim.o.breakindentopt = "list:-1"
vim.o.colorcolumn = "+1"
vim.o.cursorline = true
vim.o.linebreak = true
vim.o.list = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.pumborder = "single"
vim.o.pumheight = 10
vim.o.pummaxwidth = 100
vim.o.ruler = false
vim.o.shortmess = "CFOSWaco"
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.splitbelow = true
vim.o.splitkeep = "screen"
vim.o.splitright = true
vim.o.winborder = "single"
vim.o.wrap = false
vim.o.cursorlineopt = "screenline,number"
vim.o.fillchars = "eob: ,fold:\226\149\140"
vim.o.listchars = "extends:\226\128\166,nbsp:\226\144\163,precedes:\226\128\166,tab:> "
vim.o.foldlevel = 10
vim.o.foldmethod = "indent"
vim.o.foldnestmax = 10
vim.o.foldtext = ""
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.formatoptions = "rqnl1j"
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.infercase = true
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.spelloptions = "camel"
vim.o.tabstop = 2
vim.o.virtualedit = "block"
vim.o.iskeyword = "@,48-57,_,192-255,-"
vim.o.formatlistpat = "^\\s*[0-9\\-\\+\\*]\\+[\\.\\)]*\\s\\+"
vim.o.complete = ".,w,b,kspell"
vim.o.completeopt = "menuone,noselect,fuzzy,nosort"
vim.o.completetimeout = 100
local f0
local function _3_()
  return vim.cmd("setlocal formatoptions-=c formatoptions-=o")
end
f0 = _3_
Config.new_autocmd("FileType", nil, f0, "Proper formatoptions")
local diagnostic_opts0 = {signs = {priority = 9999, severity = {min = "WARN", max = "ERROR"}}, underline = {severity = {min = "HINT", max = "ERROR"}}, virtual_lines = true, update_in_insert = false, virtual_text = false}
local function _4_()
  return vim.diagnostic.config(diagnostic_opts0)
end
return Config.later(_4_)
