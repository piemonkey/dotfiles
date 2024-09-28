require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "elixir",
    "glimmer",
    "graphql",
    "html",
    "java",
    "javascript",
    -- "javascript.glimmer",
    -- "javascriptreact",
    "jsdoc",
    "json",
    "json5",
    "jsonc",
    "kotlin",
    "lua",
    "markdown",
    "python",
    "regex",
    "toml",
    "tsx",
    "typescript",
    -- "typescript.glimmer",
    -- "typescriptreact",
    "vim",
    "yaml",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  }
}
