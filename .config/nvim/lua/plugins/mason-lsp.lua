-- Set up mason first
require("mason").setup()

-- Set up cmp lsp plugin
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local default_config = { capabilities = capabilities }

-- Then mason-lspconfig
local servers = {
  -- "cssls",
  -- "dockerls",
  -- "sqlls",
  -- "sqls",
  eslint = {
    filetypes = {
      "javascript",
      "typescript",
      "javascript.glimmer",
      "typescript.glimmer",
      "javascriptreact",
      "typescriptreact",
      "json",
    },
    capabilities = capabilities,
  },
  bashls = default_config,
  marksman = default_config,
  pylsp = default_config,
  lua_ls = default_config,
  ts_ls = default_config,
  ember = default_config,
  glint = default_config,
  elixirls = default_config,
  yamlls = default_config,
}

local lspconfig = require('mason-lspconfig')
lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

lspconfig.setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup(servers[server_name] or default_config)
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- ["rust_analyzer"] = function ()
  --     require("rust-tools").setup {}
  -- end
}

vim.keymap.set('n', '<space>e', function() vim.diagnostic.open_float({ source="if-many" }) end)
-- I don't know if hover is useful, but let's see
vim.keymap.set('n', '<space>i', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>d', vim.lsp.buf.type_definition)
-- I feel like these will be hard to remember between each other but let's find out
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', 'ge', vim.diagnostic.goto_next)
vim.keymap.set('n', 'gE', vim.diagnostic.goto_prev)

