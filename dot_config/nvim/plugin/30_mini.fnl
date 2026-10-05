;; github.com/nvim-mini/mini.nvim
(local {: now : now_if_args : later} _G.Config)

;; Default plugins
(each [plugin schedule (pairs {;; Align text interactively
                               :mini.align later
                               ;; Go forward/backward with square brackets
                               :mini.bracketed later
                               ;; Command line tweaks
                               :mini.cmdline later
                               ;; Comment lines
                               :mini.comment later
                               ;; Completion and signature help
                               :mini.completion now_if_args
                               ;; Autohighlight word under cursor
                               :mini.cursorword later
                               ;; Work with diff hunks
                               :mini.diff later
                               ;; Git integration
                               :mini.git later
                               ;; Icon provider
                               :mini.icons later
                               ;; Move any selection in any direction
                               :mini.move later
                               ;; Autopairs
                               :mini.pairs later
                               ;; Pick anything
                               :mini.pick later
                               ;; Start screen
                               :mini.starter now
                               ;; Statusline
                               :mini.statusline later})]
  (schedule (fn []
              (let [module (require plugin)]
                (module.setup)))))

;; Visualize and work with indent scope
(later (fn []
         (let [indentscope (require :mini.indentscope)]
           (indentscope.setup {:draw {:animation (indentscope.gen_animation.none)
                                      :delay 20}}))))

;; Window with buffer text overview
(later (fn []
         (let [map (require :mini.map)]
           (map.setup {:integrations [(map.gen_integration.builtin_search)
                                      (map.gen_integration.diagnostic)
                                      (map.gen_integration.diff)]
                       :symbols {:encode (map.gen_encode_symbols.dot "4x2")}
                       :window {:focusable true}})
           (map.toggle))))
