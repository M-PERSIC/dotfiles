-- [nfnl] plugin/20_keymaps.fnl
local vim = _G.vim
local function _1_()
  local mouse_pos = vim.fn.getmousepos()
  return nil
end
return vim.keymap.set("n", "<LeftMouse>", _1_)
