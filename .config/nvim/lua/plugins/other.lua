require("other-nvim").setup({
  mappings = {
    -- custom mapping
    {
      pattern = "/components/(.*)%.js$",
      target = "/components/%1.hbs",
      context = "component",
    },
    {
      pattern = "/components/(.*)%.ts$",
      target = "/components/%1.hbs",
      context = "component",
    },
    {
      pattern = "/components/(.*)%.hbs$",
      target = {
        {
          target = "/components/%1\\(*.js\\|*.ts\\)",
          context = "component",

        },

      }
    },

    {
      pattern = "/controllers/(.*)%.js$",
      target = {
        {
          target = "/templates/%1.hbs",
          context = "template",
        },
        {
          target = "/routes/%1\\(*.js\\|*.ts\\)",
          context = "route",
        }
      },
    },
    {
      pattern = "/controllers/(.*)%.ts$",
      target = {
        {
          target = "/templates/%1.hbs",
          context = "template",
        },
        {
          target = "/routes/%1\\(*.js\\|*.ts\\)",
          context = "route",
        }
      },
    },
    {
      pattern = "/routes/(.*)%.js$",
      target = {
        {
          target = "/templates/%1.hbs",
          context = "template",
        },
        {
          target = "/controllers/%1\\(*.js\\|*.ts\\)",
          context = "controller",
        }
      },
    },
    {
      pattern = "/routes/(.*)%.ts$",
      target = {
        {
          target = "/templates/%1.hbs",
          context = "template",
        },
        {
          target = "/controllers/%1\\(*.js\\|*.ts\\)",
          context = "controller",
        }
      },
    },
    {
      pattern = "/templates/(.*)%.hbs$",
      target = {
        {
          target = "/routes/%1\\(*.js\\|*.ts\\)",
          context = "route",
        },
        {
          target = "/controllers/%1\\(*.js\\|*.ts\\)",
          context = "controller",
        }
      },
    },
  },
})

vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>:Other<CR>", { noremap = true, silent = true })

