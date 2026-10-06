(local vim _G.vim)
(local Config _G.Config)

;; Global variables
(each [option value (pairs {;; Use `<Space>` as <Leader> key
                            :mapleader " "})]
  (set (. vim.g option) value))

;; Options
(each [option value (pairs {;; Enable mouse
                            :mouse "a"
                            ;; Customize mouse scroll
                            :mousescroll "ver:25,hor:6"
                            ;; Use already opened buffers when switching
                            :switchbuf "usetab"
                            ;; Enable persistent undo
                            :undofile true
                            ;; Limit ShaDa file (for startup)
                            :shada "'100,<50,s10,:1000,/100,@100,h"
                            ;; Indent wrapped lines to match line start
                            :breakindent true
                            ;; Add padding for lists (if 'wrap' is set)
                            :breakindentopt "list:-1"
                            ;; Draw column on the right of maximum width
                            :colorcolumn "+1"
                            ;; Enable current line highlighting
                            :cursorline true
                            ;; Wrap lines at 'breakat' (if 'wrap' is set)
                            :linebreak true
                            ;; Show helpful text indicators
                            :list true
                            ;; Show line numbers
                            :number true
                            ;; Use border in popup menu
                            :pumborder "single"
                            ;; Make popup menu smaller
                            :pumheight 10
                            ;; Make popup menu not too wide
                            :pummaxwidth 100
                            ;; Don't show cursor coordinates
                            :ruler false
                            ;; Disable some built-in completion messages
                            :shortmess "CFOSWaco"
                            ;; Don't show mode in command line
                            :showmode false
                            ;; Always show signcolumn (less flicker)
                            :signcolumn "yes"
                            ;; Horizontal splits will be below
                            :splitbelow true
                            ;; Reduce scroll during window split
                            :splitkeep "screen"
                            ;; Vertical splits will be to the right
                            :splitright true
                            ;; Use border in floating windows
                            :winborder "single"
                            ;; Don't visually wrap lines (toggle with \w)
                            :wrap false
                            ;; Show cursor line per screen line
                            :cursorlineopt "screenline,number"
                            ;; Special UI symbols. More is set via 'mini.basics' later.
                            :fillchars "eob: ,fold:╌"
                            :listchars "extends:…,nbsp:␣,precedes:…,tab:> "
                            ;; Folds (see `:h fold-commands`, `:h zM`, `:h zR`, `:h zA`, `:h zj`)
                            ;; Fold nothing by default; set to 0 or 1 to fold
                            :foldlevel 10
                            ;; Fold based on indent level
                            :foldmethod "indent"
                            ;; Limit number of fold levels
                            :foldnestmax 10
                            ;; Show text under fold with its highlighting
                            :foldtext ""
                            ;; Use auto indent
                            :autoindent true
                            ;; Convert tabs to spaces
                            :expandtab true
                            ;; Improve comment editing
                            :formatoptions "rqnl1j"
                            ;; Ignore case during search
                            :ignorecase true
                            ;; Show search matches while typing
                            :incsearch true
                            ;; Infer case in built-in completion
                            :infercase true
                            ;; Use this number of spaces for indentation
                            :shiftwidth 2
                            ;; Respect case if search pattern has upper case
                            :smartcase true
                            ;; Make indenting smart
                            :smartindent true
                            ;; Treat camelCase word parts as separate words
                            :spelloptions "camel"
                            ;; Show tab as this number of spaces
                            :tabstop 2
                            ;; Allow going past end of line in blockwise mode
                            :virtualedit "block"
                            ;; Treat dash as `word` textobject part
                            :iskeyword "@,48-57,_,192-255,-"
                            ;; Pattern for a start of numbered list (used in `gw`). This reads as
                            ;; "Start of list item is: at least one special character (digit, -, +, *)
                            ;; possibly followed by punctuation (. or `)`) followed by at least one space".
                            :formatlistpat "^\\s*[0-9\\-\\+\\*]\\+[\\.\\)]*\\s\\+"
                            ;; Built-in completion
                            ;; Use less sources
                            :complete ".,w,b,kspell"
                            ;; Use custom behavior
                            :completeopt "menuone,noselect,fuzzy,nosort"
                            ;; Limit sources delay
                            :completetimeout 100})]
  (set (. vim.o option) value))

;; Autocommands
;; Don't auto-wrap comments and don't insert comment leader after hitting 'o'.
;; Do on `FileType` to always override these changes from filetype plugins.
(local f (fn [] (vim.cmd "setlocal formatoptions-=c formatoptions-=o")))
(Config.new_autocmd "FileType" nil f "Proper 'formatoptions'")

;; There are other autocommands created by 'mini.basics'. See 'plugin/30_mini.lua'.

;; Diagnostics
;; Neovim has built-in support for showing diagnostic messages. This configures
;; a more conservative display while still being useful.
;; See `:h vim.diagnostic` and `:h vim.diagnostic.config()`.
(local diagnostic_opts {;; Show signs on top of any other sign, but only for warnings and errors
                        :signs {:priority 9999
                                :severity {:min "WARN" :max "ERROR"}}
                        ;; Show all diagnostics as underline (for their messages type `<Leader>ld`)
                        :underline {:severity {:min "HINT" :max "ERROR"}}
                        ;; Show more details immediately for errors on the current line
                        :virtual_lines true
                        :virtual_text {:current_line false
                                       :severity {:min "ERROR" :max "ERROR"}}
                        ;; Don't update diagnostics when typing
                        :update_in_insert false})

;; Use `later()` to avoid sourcing `vim.diagnostic` on startup
(Config.later (fn [] (vim.diagnostic.config diagnostic_opts)))
