local now, now_if_args, later = Config.now, Config.now_if_args, Config.later

later(function()
  -- github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-bracketed.md
  require('mini.bracketed').setup()
end)

later(function()
  -- github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-cmdline.md
  require('mini.cmdline').setup()
end)

later(function()
  -- github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-diff.md
  require('mini.diff').setup()
end)

later(function()
  -- github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-git.md
  require('mini.git').setup()
end)

later(function()
  -- github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-indentscope.md
  require('mini.indentscope').setup({
    draw = {
      animation = require('mini.indentscope').gen_animation.none(),
    },
  })
end)

later(function()
  -- github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-move.md
  require('mini.move').setup()
end)

later(function()
  -- github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-align.md
  require('mini.align').setup()
end)

later(function()
  -- github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-comment.md
  require('mini.comment').setup()
end)

later(function()
  -- github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-cursorword.md
  require('mini.cursorword').setup()
end)

later(function()
  -- github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-map.md
  require('mini.map').setup()
end)

later(function()
  -- github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-pairs.md 
  require('mini.completion').setup()
end)

later(function()
  -- github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-completion.md
  require('mini.pairs').setup()
end)

later(function()
  -- github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-pick.md 
  require('mini.pick').setup()
end)
