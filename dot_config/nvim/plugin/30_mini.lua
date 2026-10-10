-- [nfnl] plugin/30_mini.fnl
local now = _G.Config.now
local now_if_args = _G.Config.now_if_args
local later = _G.Config.later
for plugin, schedule in pairs({["mini.align"] = later, ["mini.bracketed"] = later, ["mini.bufremove"] = later, ["mini.cmdline"] = later, ["mini.comment"] = later, ["mini.cursorword"] = later, ["mini.diff"] = later, ["mini.git"] = later, ["mini.icons"] = later, ["mini.move"] = later, ["mini.pairs"] = later, ["mini.pick"] = later, ["mini.snippets"] = later, ["mini.starter"] = now, ["mini.statusline"] = later, ["mini.tabline"] = later}) do
  local function _1_()
    local module = require(plugin)
    return module.setup()
  end
  schedule(_1_)
end
local function _2_()
  local indentscope = require("mini.indentscope")
  return indentscope.setup({draw = {animation = indentscope.gen_animation.none(), delay = 20}})
end
later(_2_)
local function _3_()
  local map = require("mini.map")
  map.setup({integrations = {map.gen_integration.builtin_search(), map.gen_integration.diagnostic(), map.gen_integration.diff()}, symbols = {encode = map.gen_encode_symbols.dot("4x2")}, window = {focusable = true}})
  return map.toggle()
end
return later(_3_)
