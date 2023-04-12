require('nvim-tree').setup({
  -- close nvim-tree on opening a file
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },

  update_focused_file = {
    enable = true,
  },
  git = {
    ignore = false,
  },
  view = {
    width = 35,
  },
  renderer = {
    indent_width = 1,
    indent_markers = {
      enable = true,
    },
    highlight_opened_files = 'all',
  },
  trash = {
    cmd = "rm",
    require_confirm = true,
  },
})

vim.api.nvim_set_keymap( "n", "<leader>fl", ":NvimTreeToggle<CR>", { noremap = true } )

-- 'niaive' auto close (close nvim-tree when vim should close) taken from github
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
