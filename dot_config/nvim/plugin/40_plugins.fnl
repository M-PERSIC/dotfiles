(local vim _G.vim)
(local Config _G.Config)
(local {: add} vim.pack)
(local {: now : now_if_args : later} Config)

;; Soothing pastel theme
(now (fn []
       (add [{:src "https://github.com/catppuccin/nvim" :name "catppuccin"}])
       (let [catppuccin (require :catppuccin)]
         (catppuccin.setup {:flavour "mocha"
                            :integrations {:mini {:enabled true
                                                  :indentscope_color ""}}
                            :no_italic true
                            :term_colors true}))
       (vim.cmd.colorscheme "catppuccin")))

;; Tree-sitter
(now_if_args (fn []
               (let [ts-update (fn [] (vim.cmd "TSUpdate"))]
                 (Config.on_packchanged "nvim-treesitter" ["update"] ts-update
                                        ":TSUpdate"))
               (add ["https://github.com/nvim-treesitter/nvim-treesitter"
                     "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"])
               (let [languages [;; To see available languages:
                                ;; - Execute `:=require('nvim-treesitter').get_available()`
                                ;; - Visit 'SUPPORTED_LANGUAGES.md' file at
                                ;;   https://github.com/nvim-treesitter/nvim-treesitter/blob/main
                                "bash"
                                "c"
                                "cmake"
                                "cpp"
                                "css"
                                "dockerfile"
                                "fennel"
                                "go"
                                "gomod"
                                "gosum"
                                "gowork"
                                "html"
                                "javascript"
                                "jinja"
                                "json"
                                "julia"
                                "lua"
                                "make"
                                "markdown"
                                "mermaid"
                                "powershell"
                                "python"
                                "rust"
                                "ssh_config"
                                "terraform"
                                "toml"
                                "typescript"
                                "typst"
                                "vimdoc"
                                "yaml"]
                     isnt-installed (fn [lang]
                                      (= (length (vim.api.nvim_get_runtime_file (.. "parser/"
                                                                                    lang
                                                                                    ".*")
                                                                                false))
                                         0))
                     to-install (vim.tbl_filter isnt-installed languages)]
                 (when (> (length to-install) 0)
                   (let [treesitter (require :nvim-treesitter)]
                     (treesitter.install to-install)))
                 ;; Enable tree-sitter after opening a file for a target language
                 (let [filetypes []
                       ts-start (fn [ev] (vim.treesitter.start ev.buf))]
                   (each [_ lang (ipairs languages)]
                     (each [_ ft (ipairs (vim.treesitter.language.get_filetypes lang))]
                       (table.insert filetypes ft)))
                   (Config.new_autocmd "FileType" filetypes ts-start
                                       "Start tree-sitter")))))

;; LSP
(now_if_args (fn []
               (add ["https://github.com/mason-org/mason.nvim"
                     "https://github.com/neovim/nvim-lspconfig"
                     "https://github.com/mason-org/mason-lspconfig.nvim"])
               (let [mason (require :mason)]
                 (mason.setup))
               (let [mason-lspconfig (require :mason-lspconfig)]
                 (mason-lspconfig.setup {:ensure_installed ["bashls"
                                                            "clangd"
                                                            "cssls"
                                                            "dockerls"
                                                            "fennel_ls"
                                                            "gh_actions_ls"
                                                            "gitlab_ci_ls"
                                                            "golangci_lint_ls"
                                                            "gopls"
                                                            "html"
                                                            "jinja_lsp"
                                                            "jsonls"
                                                            "julials"
                                                            "lua_ls"
                                                            "markdown_oxide"
                                                            "powershell_es"
                                                            "ruff"
                                                            "rumdl"
                                                            "rust_analyzer"
                                                            "terraformls"
                                                            "tinymist"
                                                            "ts_ls"
                                                            "ty"
                                                            "yamlls"]
                                         ;; automatic_enable defaults to true: every server above gets vim.lsp.enable()'d
                                         }))
               ;; lua_ls: recognize `vim` as a global when editing this Neovim config
               (vim.lsp.config "lua_ls"
                               {:settings {:Lua {:diagnostics {:globals ["vim"]}
                                                 :workspace {:library (vim.api.nvim_get_runtime_file ""
                                                                                                     true)
                                                             :checkThirdParty false}}}})
               ;; gitlab_ci_ls only attaches to a special 'yaml.gitlab' filetype,
               ;; since it's meant to sit alongside yamlls, not replace it
               (Config.new_autocmd ["BufRead" "BufNewFile"]
                                   "*.gitlab-ci*.{yml,yaml}"
                                   (fn [] (set vim.bo.filetype "yaml.gitlab"))
                                   "Detect GitLab CI YAML")))

;; Formatting
(later (fn []
         (add ["https://github.com/stevearc/conform.nvim"])
         (let [conform (require :conform)]
           (conform.setup {:default_format_opts {:lsp_format "fallback"}
                           :format_on_save {:timeout_ms 500 :lsp_fallback true}
                           :formatters_by_ft {:bash ["shfmt"]
                                              :c ["clang_format"]
                                              :cpp ["clang_format"]
                                              :fennel ["fnlfmt"]
                                              :go ["goimports" "gofmt"]
                                              :json ["jq"]
                                              :lua ["stylua"]
                                              :markdown ["rumdl"]
                                              :python ["ruff_format"]
                                              :rust ["rustfmt"]
                                              :sh ["shfmt"]
                                              :toml ["tombi"]}}))))

;; github.com/carlos-algms/agentic.nvim
(later (fn []
         (add ["https://github.com/carlos-algms/agentic.nvim"])
         (let [agentic (require :agentic)]
           (agentic.setup {;; built-in: claude-agent-acp | gemini-acp | codex-acp | opencode-acp | cursor-acp | ...
                           :provider "cursor-acp"}))))

;; github.com/swaits/zellij-nav.nvim
(later (fn []
         (add ["https://github.com/swaits/zellij-nav.nvim"])
         (let [zellij-nav (require :zellij-nav)]
           (zellij-nav.setup))))

;; github.com/obsidian-nvim/obsidian.nvim
(later (fn []
         (add [{:src "https://github.com/obsidian-nvim/obsidian.nvim"
                :version (vim.version.range "*")}])
         (let [obsidian (require :obsidian)]
           (obsidian.setup {:legacy_commands false
                            :workspaces [{:name "personal"
                                          ;; <- replace with your actual vault path(s)
                                          :path "~/vaults/personal"}]
                            ;; integrates with the picker you already have
                            :picker {:name "mini.pick"}}))
         (set vim.opt.conceallevel 2)))

;; github.com/wurli/jet.nvim
(later (fn []
         (add ["https://github.com/wurli/jet.nvim"])
         (let [jet (require :jet)]
           (jet.setup))))

;; github.com/sphamba/smear-cursor.nvim
(later (fn []
         (add ["https://github.com/sphamba/smear-cursor.nvim"])
         (let [smear-cursor (require :smear_cursor)]
           (smear-cursor.setup))))
