local add = vim.pack.add
local now_if_args, later = Config.now_if_args, Config.later

Config.now(function()
  add({ 'https://github.com/catppuccin/nvim' })

  require('catppuccin').setup({
    flavour = 'mocha',
    integrations = {
      mini = {
        enabled = true,
        indentscope_color = '',
      },
    },
    no_italic = true,
    term_colors = true,
  })

  vim.cmd.colorscheme('catppuccin')
end)

now_if_args(function()
  local ts_update = function() vim.cmd('TSUpdate') end
  Config.on_packchanged('nvim-treesitter', { 'update' }, ts_update, ':TSUpdate')
  add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  })

  local languages = {
    -- To see available languages:
    -- - Execute `:=require('nvim-treesitter').get_available()`
    -- - Visit 'SUPPORTED_LANGUAGES.md' file at
    --   https://github.com/nvim-treesitter/nvim-treesitter/blob/main
    'bash',
    'c',
    'cmake',
    'cpp',
    'css',
    'dockerfile',
    'fennel',
    'go',
    'gomod',
    'gosum',
    'gowork',
    'html',
    'javascript',
    'jinja',
    'json',
    'julia',
    'lua',
    'make',
    'markdown',
    'mermaid',
    'powershell',
    'python',
    'rust',
    'ssh_config',
    'terraform',
    'toml',
    'typescript',
    'typst',
    'vimdoc',
    'yaml',
  }
  local isnt_installed = function(lang)
    return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
  end
  local to_install = vim.tbl_filter(isnt_installed, languages)
  if #to_install > 0 then require('nvim-treesitter').install(to_install) end

  -- Enable tree-sitter after opening a file for a target language
  local filetypes = {}
  for _, lang in ipairs(languages) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end
  local ts_start = function(ev) vim.treesitter.start(ev.buf) end
  Config.new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
end)

now_if_args(function()
  add({
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason-lspconfig.nvim',
  })

  require('mason').setup()

  require('mason-lspconfig').setup({
    ensure_installed = {
      'bashls',
      'clangd',
      'cssls',
      'dockerls',
      'fennel_ls',
      'gh_actions_ls',
      'gitlab_ci_ls',
      'golangci_lint_ls',
      'gopls',
      'html',
      'jinja_lsp',
      'jsonls',
      'julials',
      'lua_ls',
      'markdown_oxide',
      'powershell_es',
      'ruff',
      'rumdl',
      'rust_analyzer',
      'terraformls',
      'tinymist',
      'ts_ls',
      'ty',
      'yamlls',
    },
    -- automatic_enable defaults to true: every server above gets vim.lsp.enable()'d
  })

  -- lua_ls: recognize `vim` as a global when editing this Neovim config
  vim.lsp.config('lua_ls', {
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false,
        },
      },
    },
  })

  -- gitlab_ci_ls only attaches to a special 'yaml.gitlab' filetype,
  -- since it's meant to sit alongside yamlls, not replace it
  Config.new_autocmd(
    { 'BufRead', 'BufNewFile' },
    '*.gitlab-ci*.{yml,yaml}',
    function() vim.bo.filetype = 'yaml.gitlab' end,
    'Detect GitLab CI YAML'
  )
end)

later(function()
  add({ 'https://github.com/stevearc/conform.nvim' })

  require('conform').setup({
    default_format_opts = {
      lsp_format = 'fallback',
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      rust = { 'rustfmt' },
      python = { 'ruff_format' },
      go = { 'goimports', 'gofmt' },
      json = { 'jq' },
      c = { 'clang_format' },
      cpp = { 'clang_format' },
      sh = { 'shfmt' },
      bash = { 'shfmt' },
      markdown = { 'rumdl' },
    },
  })
end)

later(function()
  -- github.com/carlos-algms/agentic.nvim
  add({ 'https://github.com/carlos-algms/agentic.nvim' })
  require('agentic').setup({
    provider = 'claude-agent-acp', -- built-in: claude-agent-acp | gemini-acp | codex-acp | opencode-acp | cursor-acp | ...
  })
end)

later(function()
  -- github.com/swaits/zellij-nav.nvim
  add({ 'https://github.com/swaits/zellij-nav.nvim' })
  require('zellij-nav').setup()
end)

later(function()
  -- github.com/obsidian-nvim/obsidian.nvim
  add({
    {
      src = 'https://github.com/obsidian-nvim/obsidian.nvim',
      version = vim.version.range('*'),
    },
  })
  require('obsidian').setup({
    legacy_commands = false,
    workspaces = {
      { name = 'personal', path = '~/vaults/personal' }, -- <- replace with your actual vault path(s)
    },
    picker = { name = 'mini.pick' }, -- integrates with the picker you already have
  })
  vim.opt.conceallevel = 2
end)

later(function()
  -- github.com/wurli/jet.nvim
  add({ 'https://github.com/wurli/jet.nvim' })
  require('jet').setup({})
end)
