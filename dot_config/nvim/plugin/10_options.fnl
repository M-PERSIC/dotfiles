(local vim _G.vim)
(local Config _G.Config)

;; Global variables
(each [option value (pairs {:mapleader " "
                            ;; Use <Space> as <Leader> key
                            })]
  (set (. vim.g option) value))

;; Options
(each [option value (pairs {:mouse "a"
                            ;; Enable mouse
                            })]
  (set (. vim.o option) value))

;; General
(set vim.o.mousescroll "ver:25,hor:6")

;; Customize mouse scroll
(set vim.o.switchbuf "usetab")

;; Use already opened buffers when switching
(set vim.o.undofile true)

;; Enable persistent undo
(set vim.o.shada "'100,<50,s10,:1000,/100,@100,h")

;; Limit ShaDa file (for startup)

;; UI
(set vim.o.breakindent true)

;; Indent wrapped lines to match line start
(set vim.o.breakindentopt "list:-1")

;; Add padding for lists (if 'wrap' is set)
(set vim.o.colorcolumn "+1")

;; Draw column on the right of maximum width
(set vim.o.cursorline true)

;; Enable current line highlighting
(set vim.o.linebreak true)

;; Wrap lines at 'breakat' (if 'wrap' is set)
(set vim.o.list true)

;; Show helpful text indicators
(set vim.o.number true)

;; Show line numbers
(set vim.o.relativenumber true)

;; Show relative line numbers
(set vim.o.pumborder "single")

;; Use border in popup menu
(set vim.o.pumheight 10)

;; Make popup menu smaller
(set vim.o.pummaxwidth 100)

;; Make popup menu not too wide
(set vim.o.ruler false)

;; Don't show cursor coordinates
(set vim.o.shortmess "CFOSWaco")

;; Disable some built-in completion messages
(set vim.o.showmode false)

;; Don't show mode in command line
(set vim.o.signcolumn "yes")

;; Always show signcolumn (less flicker)
(set vim.o.splitbelow true)

;; Horizontal splits will be below
(set vim.o.splitkeep "screen")

;; Reduce scroll during window split
(set vim.o.splitright true)

;; Vertical splits will be to the right
(set vim.o.winborder "single")

;; Use border in floating windows
(set vim.o.wrap false)

;; Don't visually wrap lines (toggle with \w)

(set vim.o.cursorlineopt "screenline,number")

;; Show cursor line per screen line

;; Special UI symbols. More is set via 'mini.basics' later.
(set vim.o.fillchars "eob: ,fold:╌")
(set vim.o.listchars "extends:…,nbsp:␣,precedes:…,tab:> ")

;; Folds (see `:h fold-commands`, `:h zM`, `:h zR`, `:h zA`, `:h zj`)
(set vim.o.foldlevel 10)

;; Fold nothing by default; set to 0 or 1 to fold
(set vim.o.foldmethod "indent")

;; Fold based on indent level
(set vim.o.foldnestmax 10)

;; Limit number of fold levels
(set vim.o.foldtext "")

;; Show text under fold with its highlighting

;; Editing
(set vim.o.autoindent true)

;; Use auto indent
(set vim.o.expandtab true)

;; Convert tabs to spaces
(set vim.o.formatoptions "rqnl1j")

;; Improve comment editing
(set vim.o.ignorecase true)

;; Ignore case during search
(set vim.o.incsearch true)

;; Show search matches while typing
(set vim.o.infercase true)

;; Infer case in built-in completion
(set vim.o.shiftwidth 2)

;; Use this number of spaces for indentation
(set vim.o.smartcase true)

;; Respect case if search pattern has upper case
(set vim.o.smartindent true)

;; Make indenting smart
(set vim.o.spelloptions "camel")

;; Treat camelCase word parts as separate words
(set vim.o.tabstop 2)

;; Show tab as this number of spaces
(set vim.o.virtualedit "block")

;; Allow going past end of line in blockwise mode

(set vim.o.iskeyword "@,48-57,_,192-255,-")

;; Treat dash as `word` textobject part

;; Pattern for a start of numbered list (used in `gw`). This reads as
;; "Start of list item is: at least one special character (digit, -, +, *)
;; possibly followed by punctuation (. or `)`) followed by at least one space".
(set vim.o.formatlistpat "^\\s*[0-9\\-\\+\\*]\\+[\\.\\)]*\\s\\+")

;; Built-in completion
(set vim.o.complete ".,w,b,kspell")

;; Use less sources
(set vim.o.completeopt "menuone,noselect,fuzzy,nosort")

;; Use custom behavior
(set vim.o.completetimeout 100)

;; Limit sources delay

;; Autocommands
;; Don't auto-wrap comments and don't insert comment leader after hitting 'o'.
;; Do on FileType to always override these changes from filetype plugins.
(local f (fn [] (vim.cmd "setlocal formatoptions-=c formatoptions-=o")))
(Config.new_autocmd "FileType" nil f "Proper formatoptions")

;; Diagnostics
;; See `:h vim.diagnostic` and `:h vim.diagnostic.config()`.
(local diagnostic_opts {:signs {:priority 9999
                                :severity {:min "WARN" :max "ERROR"}}
                        :underline {:severity {:min "HINT" :max "ERROR"}}
                        :virtual_lines true
                        :virtual_text false
                        :update_in_insert false})

;; Use later() to avoid sourcing vim.diagnostic on startup
(Config.later (fn [] (vim.diagnostic.config diagnostic_opts)))

;; General
(set vim.o.mousescroll "ver:25,hor:6")

;; Customize mouse scroll
(set vim.o.switchbuf "usetab")

;; Use already opened buffers when switching
(set vim.o.undofile true)

;; Enable persistent undo
(set vim.o.shada "'100,<50,s10,:1000,/100,@100,h")

;; Limit ShaDa file (for startup)

;; UI
(set vim.o.breakindent true)

;; Indent wrapped lines to match line start
(set vim.o.breakindentopt "list:-1")

;; Add padding for lists (if 'wrap' is set)
(set vim.o.colorcolumn "+1")

;; Draw column on the right of maximum width
(set vim.o.cursorline true)

;; Enable current line highlighting
(set vim.o.linebreak true)

;; Wrap lines at 'breakat' (if 'wrap' is set)
(set vim.o.list true)

;; Show helpful text indicators
(set vim.o.number true)

;; Show line numbers
(set vim.o.relativenumber true)

;; Show relative line numbers
(set vim.o.pumborder "single")

;; Use border in popup menu
(set vim.o.pumheight 10)

;; Make popup menu smaller
(set vim.o.pummaxwidth 100)

;; Make popup menu not too wide
(set vim.o.ruler false)

;; Don't show cursor coordinates
(set vim.o.shortmess "CFOSWaco")

;; Disable some built-in completion messages
(set vim.o.showmode false)

;; Don't show mode in command line
(set vim.o.signcolumn "yes")

;; Always show signcolumn (less flicker)
(set vim.o.splitbelow true)

;; Horizontal splits will be below
(set vim.o.splitkeep "screen")

;; Reduce scroll during window split
(set vim.o.splitright true)

;; Vertical splits will be to the right
(set vim.o.winborder "single")

;; Use border in floating windows
(set vim.o.wrap false)

;; Don't visually wrap lines (toggle with \w)

(set vim.o.cursorlineopt "screenline,number")

;; Show cursor line per screen line

;; Special UI symbols. More is set via 'mini.basics' later.
(set vim.o.fillchars "eob: ,fold:╌")
(set vim.o.listchars "extends:…,nbsp:␣,precedes:…,tab:> ")

;; Folds (see `:h fold-commands`, `:h zM`, `:h zR`, `:h zA`, `:h zj`)
(set vim.o.foldlevel 10)

;; Fold nothing by default; set to 0 or 1 to fold
(set vim.o.foldmethod "indent")

;; Fold based on indent level
(set vim.o.foldnestmax 10)

;; Limit number of fold levels
(set vim.o.foldtext "")

;; Show text under fold with its highlighting

;; Editing
(set vim.o.autoindent true)

;; Use auto indent
(set vim.o.expandtab true)

;; Convert tabs to spaces
(set vim.o.formatoptions "rqnl1j")

;; Improve comment editing
(set vim.o.ignorecase true)

;; Ignore case during search
(set vim.o.incsearch true)

;; Show search matches while typing
(set vim.o.infercase true)

;; Infer case in built-in completion
(set vim.o.shiftwidth 2)

;; Use this number of spaces for indentation
(set vim.o.smartcase true)

;; Respect case if search pattern has upper case
(set vim.o.smartindent true)

;; Make indenting smart
(set vim.o.spelloptions "camel")

;; Treat camelCase word parts as separate words
(set vim.o.tabstop 2)

;; Show tab as this number of spaces
(set vim.o.virtualedit "block")

;; Allow going past end of line in blockwise mode

(set vim.o.iskeyword "@,48-57,_,192-255,-")

;; Treat dash as `word` textobject part

;; Pattern for a start of numbered list (used in `gw`). This reads as
;; "Start of list item is: at least one special character (digit, -, +, *)
;; possibly followed by punctuation (. or `)`) followed by at least one space".
(set vim.o.formatlistpat "^\\s*[0-9\\-\\+\\*]\\+[\\.\\)]*\\s\\+")

;; Built-in completion
(set vim.o.complete ".,w,b,kspell")

;; Use less sources
(set vim.o.completeopt "menuone,noselect,fuzzy,nosort")

;; Use custom behavior
(set vim.o.completetimeout 100)

;; Limit sources delay

;; Autocommands
;; Don't auto-wrap comments and don't insert comment leader after hitting 'o'.
;; Do on FileType to always override these changes from filetype plugins.
(local f (fn [] (vim.cmd "setlocal formatoptions-=c formatoptions-=o")))
(Config.new_autocmd "FileType" nil f "Proper formatoptions")

;; Diagnostics
;; See `:h vim.diagnostic` and `:h vim.diagnostic.config()`.
(local diagnostic_opts {:signs {:priority 9999
                                :severity {:min "WARN" :max "ERROR"}}
                        :underline {:severity {:min "HINT" :max "ERROR"}}
                        :virtual_lines true
                        :virtual_text false
                        :update_in_insert false})

;; Use later() to avoid sourcing vim.diagnostic on startup
(Config.later (fn [] (vim.diagnostic.config diagnostic_opts)))
