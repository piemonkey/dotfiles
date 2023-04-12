local lsp_installer_servers = require('nvim-lsp-installer.servers')
-- local coq = require('coq')

vim.keymap.set('n', '<space>e', function() vim.diagnostic.open_float({ source="if-many" }) end)
-- I don't know if hover is useful, but let's see
vim.keymap.set('n', '<space>i', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>d', vim.lsp.buf.type_definition)
-- I feel like these will be hard to remember between each other but let's find out
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
-- Again, don't know what this one is used for and probably needs more customisation
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', 'ge', vim.diagnostic.goto_next)
vim.keymap.set('n', 'gE', vim.diagnostic.goto_prev)

local servers = {
    -- "cssls",
    -- "dockerls",
    -- "sqlls",
    -- "sqls",
    "eslint",
    "bashls",
    "marksman",
    "pylsp",
    "lua_ls",
    "tsserver",
    "ember",
}

-- Loop through the servers listed above.
for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        server:on_ready(function ()
            -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
            -- this function will be invoked. Make sure not to use the "catch-all" lsp_installer.on_server_ready()
            -- function to set up servers, to avoid doing setting up a server twice.
            local opts = {}
            server:setup(opts)
            -- Actually, do I want snippets? server:setup(coq.lsp_ensure_capabilities(opts))
        end)
        if not server:is_installed() then
            -- Queue the server to be installed.
            server:install()
        end
    end
end
