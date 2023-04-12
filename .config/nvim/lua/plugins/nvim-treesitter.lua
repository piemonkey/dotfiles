require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "glimmer",
    "graphql",
    "html",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "kotlin",
    "lua",
    "markdown",
    "python",
    "regex",
    "toml",
    "tsx",
    "typescript",
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
