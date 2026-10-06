-- [nfnl] plugin/40_plugins.fnl
local vim = _G.vim
local Config = _G.Config
local add = vim.pack.add
local now = Config.now
local now_if_args = Config.now_if_args
local later = Config.later
local function _1_()
  add({{src = "https://github.com/catppuccin/nvim", name = "catppuccin"}})
  do
    local catppuccin = require("catppuccin")
    catppuccin.setup({flavour = "mocha", integrations = {mini = {enabled = true, indentscope_color = ""}}, no_italic = true, term_colors = true})
  end
  return vim.cmd.colorscheme("catppuccin")
end
now(_1_)
local function _2_()
  do
    local ts_update
    local function _3_()
      return vim.cmd("TSUpdate")
    end
    ts_update = _3_
    Config.on_packchanged("nvim-treesitter", {"update"}, ts_update, ":TSUpdate")
  end
  add({"https://github.com/nvim-treesitter/nvim-treesitter", "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"})
  local languages = {"bash", "c", "cmake", "cpp", "css", "dockerfile", "fennel", "go", "gomod", "gosum", "gowork", "html", "javascript", "jinja", "json", "julia", "lua", "make", "markdown", "mermaid", "powershell", "python", "rust", "ssh_config", "terraform", "toml", "typescript", "typst", "vimdoc", "yaml"}
  local isnt_installed
  local function _4_(lang)
    return (#vim.api.nvim_get_runtime_file(("parser/" .. lang .. ".*"), false) == 0)
  end
  isnt_installed = _4_
  local to_install = vim.tbl_filter(isnt_installed, languages)
  if (#to_install > 0) then
    local treesitter = require("nvim-treesitter")
    treesitter.install(to_install)
  else
  end
  local filetypes = {}
  local ts_start
  local function _6_(ev)
    return vim.treesitter.start(ev.buf)
  end
  ts_start = _6_
  for _, lang in ipairs(languages) do
    for _0, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end
  return Config.new_autocmd("FileType", filetypes, ts_start, "Start tree-sitter")
end
now_if_args(_2_)
local function _7_()
  add({"https://github.com/mason-org/mason.nvim", "https://github.com/neovim/nvim-lspconfig", "https://github.com/mason-org/mason-lspconfig.nvim"})
  do
    local mason = require("mason")
    mason.setup()
  end
  do
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({ensure_installed = {"bashls", "clangd", "cssls", "dockerls", "fennel_ls", "gh_actions_ls", "gitlab_ci_ls", "golangci_lint_ls", "gopls", "html", "jinja_lsp", "jsonls", "julials", "lua_ls", "markdown_oxide", "powershell_es", "ruff", "rumdl", "rust_analyzer", "terraformls", "tinymist", "ts_ls", "ty", "yamlls"}})
  end
  vim.lsp.config("lua_ls", {settings = {Lua = {diagnostics = {globals = {"vim"}}, workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false}}}})
  local function _8_()
    vim.bo.filetype = "yaml.gitlab"
    return nil
  end
  return Config.new_autocmd({"BufRead", "BufNewFile"}, "*.gitlab-ci*.{yml,yaml}", _8_, "Detect GitLab CI YAML")
end
now_if_args(_7_)
local function _9_()
  add({"https://github.com/stevearc/conform.nvim"})
  local conform = require("conform")
  return conform.setup({default_format_opts = {lsp_format = "fallback"}, format_on_save = {timeout_ms = 500, lsp_fallback = true}, formatters_by_ft = {bash = {"shfmt"}, c = {"clang_format"}, cpp = {"clang_format"}, fennel = {"fnlfmt"}, go = {"goimports", "gofmt"}, json = {"jq"}, lua = {"stylua"}, markdown = {"rumdl"}, python = {"ruff_format"}, rust = {"rustfmt"}, sh = {"shfmt"}, toml = {"tombi"}}})
end
later(_9_)
local function _10_()
  add({"https://github.com/carlos-algms/agentic.nvim"})
  local agentic = require("agentic")
  return agentic.setup({provider = "cursor-acp"})
end
later(_10_)
local function _11_()
  add({"https://github.com/swaits/zellij-nav.nvim"})
  local zellij_nav = require("zellij-nav")
  return zellij_nav.setup()
end
later(_11_)
local function _12_()
  add({{src = "https://github.com/obsidian-nvim/obsidian.nvim", version = vim.version.range("*")}})
  do
    local obsidian = require("obsidian")
    obsidian.setup({workspaces = {{name = "personal", path = "~/vaults/personal"}}, picker = {name = "mini.pick"}, legacy_commands = false})
  end
  vim.opt.conceallevel = 2
  return nil
end
later(_12_)
local function _13_()
  add({"https://github.com/wurli/jet.nvim"})
  local jet = require("jet")
  return jet.setup()
end
later(_13_)
local function _14_()
  add({"https://github.com/sphamba/smear-cursor.nvim"})
  local smear_cursor = require("smear_cursor")
  return smear_cursor.setup()
end
return later(_14_)
