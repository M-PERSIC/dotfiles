(local vim _G.vim)

(vim.keymap.set :n "<LeftMouse>"
                (fn []
                  (local mouse_pos (vim.fn.getmousepos))))
