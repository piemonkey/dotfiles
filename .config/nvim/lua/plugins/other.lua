require("other-nvim").setup({
  mappings = {
    -- Ember components
    {
      pattern = "/components/(.*)%.[tj]s$",
      target = "/components/%1.hbs",
      context = "component",
    },
    {
      pattern = "/components/(.*)%.hbs$",
      target = {
        {
          target = "/components/%1.*",
          context = "component",
        },

      }
    },
    -- Ember routes/controllers/templates
    {
      pattern = "/controllers/(.*)%.[tj]s$",
      target = {
        {
          target = "/templates/%1.hbs",
          context = "template",
        },
        {
          target = "/routes/%1.*",
          context = "route",
        }
      },
    },
    {
      pattern = "/routes/(.*)%.[tj]s$",
      target = {
        {
          target = "/templates/%1.hbs",
          context = "template",
        },
        {
          target = "/controllers/%1.*",
          context = "controller",
        }
      },
    },
    {
      pattern = "/templates/(.*)%.hbs$",
      target = {
        {
          -- target = "/routes/%1.?s",
          target = "/routes/%1.*",
          context = "route",
        },
        {
          -- target = "/controllers/%1.?s",
          target = "/controllers/%1.*",
          context = "controller",
        }
      },
    },
  },
})

vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>:Other<CR>", { noremap = true, silent = true })

