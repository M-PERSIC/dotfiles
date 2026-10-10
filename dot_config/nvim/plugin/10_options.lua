-- [nfnl] plugin/10_options.fnl
local vim = _G.vim
local Config = _G.Config
for option, value in pairs({mapleader = " "}) do
  vim.g[option] = value
end
for option, value in pairs({mouse = "a", mousescroll = "ver:25,hor:6", switchbuf = "usetab", undofile = true, shada = "'100,<50,s10,:1000,/100,@100,h", breakindent = true, breakindentopt = "list:-1", colorcolumn = "+1", cursorline = true, linebreak = true, list = true, number = true, pumborder = "single", pumheight = 10, pummaxwidth = 100, shortmess = "CFOSWaco", signcolumn = "yes", splitbelow = true, splitkeep = "screen", splitright = true, winborder = "single", cursorlineopt = "screenline,number", fillchars = "eob: ,fold:\226\149\140", listchars = "extends:\226\128\166,nbsp:\226\144\163,precedes:\226\128\166,tab:> ", foldlevel = 10, foldmethod = "indent", foldnestmax = 10, foldtext = "", autoindent = true, expandtab = true, formatoptions = "rqnl1j", ignorecase = true, incsearch = true, infercase = true, shiftwidth = 2, smartcase = true, smartindent = true, spelloptions = "camel", tabstop = 2, virtualedit = "block", iskeyword = "@,48-57,_,192-255,-", formatlistpat = "^\\s*[0-9\\-\\+\\*]\\+[\\.\\)]*\\s\\+", complete = ".,w,b,kspell", completeopt = "menuone,noselect,fuzzy,nosort", completetimeout = 100, laststatus = 3, ruler = false, showmode = false, wrap = false}) do
  vim.o[option] = value
end
local f
local function _1_()
  return vim.cmd("setlocal formatoptions-=c formatoptions-=o")
end
f = _1_
Config.new_autocmd("FileType", nil, f, "Proper 'formatoptions'")
local diagnostic_opts = {signs = {priority = 9999, severity = {min = "WARN", max = "ERROR"}}, underline = {severity = {min = "HINT", max = "ERROR"}}, virtual_lines = true, virtual_text = {severity = {min = "ERROR", max = "ERROR"}, current_line = false}, update_in_insert = false}
vim.lsp.inlay_hint.enable(true)
local function _2_()
  return vim.diagnostic.config(diagnostic_opts)
end
return Config.later(_2_)
