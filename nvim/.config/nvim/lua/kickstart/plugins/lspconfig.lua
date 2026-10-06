-- LSP Plugins
---@module 'lazy'
---@type LazySpec

-- 1. Helper for resolving paths safely
local function expand_path(path)
  return vim.fn.expand(path)
end

-- 2. Define active LSP Servers and their custom configs
local servers = {
  -- clangd = {},
  gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- ts_ls = {},

  arduino_language_server = {
    cmd = {
      'arduino-language-server',
      '-cli-config',
      expand_path '~/Library/Arduino15/arduino-cli.yaml',
    },
  },

  -- Lua Language Server configuration
  lua_ls = {
    on_init = function(client)
      client.server_capabilities.documentFormattingProvider = false -- Formatting handled by stylua

      -- Don't configure workspace libraries if local configuration is present
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT',
          path = { 'lua/?.lua', 'lua/?/init.lua' },
        },
        workspace = {
          checkThirdParty = false,
          library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true), {
            '${3rd}/luv/library',
            '${3rd}/busted/library',
          }),
        },
      })
    end,
    ---@type lspconfig.settings.lua_ls
    settings = {
      Lua = {
        format = { enable = false }, -- Formatting handled by stylua
      },
    },
  },

  taplo = {},
  -- tsc = {},
  vtsls = {
    settings = {
      vtsls = {
        tsserver = {
          globalPlugins = {
            {
              name = '@vue/typescript-plugin',
              location = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
              languages = { 'vue' },
              configNamespace = 'typescript',
            },
          },
        },
      },
    },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
  },
  vue_ls = {},
}

-- 3. Standalone formatters/linters to be installed via Mason (not LSPs)
local formatters_and_linters = {
  'stylua',
  'markdownlint',
}

-- 4. Setup keymaps on LSP attach
local function setup_keymaps(event, client)
  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
  end

  -- Rename variable under cursor
  map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

  -- Execute code action
  map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

  -- Goto Declaration
  map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  -- Toggle inlay hints if supported
  if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
    map('<leader>th', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
    end, '[T]oggle Inlay [H]ints')
  end
end

-- 5. Setup document word highlight on hover
local function setup_document_highlight(event, client)
  if not (client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)) then
    return
  end

  local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })

  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    buffer = event.buf,
    group = highlight_augroup,
    callback = vim.lsp.buf.document_highlight,
  })

  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    buffer = event.buf,
    group = highlight_augroup,
    callback = vim.lsp.buf.clear_references,
  })

  vim.api.nvim_create_autocmd('LspDetach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
    callback = function(event2)
      vim.lsp.buf.clear_references()
      vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
    end,
  })
end

-- 6. Main Lazy.nvim Spec
return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'mason-org/mason.nvim',
        ---@module 'mason.settings'
        ---@type MasonSettings
        ---@diagnostic disable-next-line: missing-fields
        opts = {},
      },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      -- LSP-specific attach hooks
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          setup_keymaps(event, client)
          setup_document_highlight(event, client)
        end,
      })

      -- Aggregate Mason tool list (LSPs + extra tools)
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, formatters_and_linters)

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      -- Register and enable servers via Neovim built-in LSP API
      for name, server in pairs(servers) do
        vim.lsp.config(name, server)
        vim.lsp.enable(name)
      end

      -- Register compatibility user commands for Neovim 0.11+
      vim.api.nvim_create_user_command('LspInfo', 'checkhealth vim.lsp', { desc = 'Alias to checkhealth vim.lsp' })
      vim.api.nvim_create_user_command('LspLog', function()
        vim.cmd(string.format('tabnew %s', vim.lsp.log.get_filename()))
      end, { desc = 'Opens the Nvim LSP client log' })
    end,
  },
}
