local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local themes = require('telescope.themes')

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fw', builtin.grep_string)
vim.keymap.set('n', '<leader>fg', function() builtin.live_grep({ disable_coordinates = true }) end)
vim.keymap.set('n', '<leader>fq', builtin.quickfix)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fr', builtin.resume)
-- Stolen from Cid
vim.keymap.set('n', '<leader>fn',
    function() 
        require("telescope.builtin").find_files({
            prompt_title = "< nvim config >",
            cwd = "$HOME/.config/nvim",
       })
    end
)
-- Stolen from Cid
-- function() 
--     require("telescope.builtin").git_branches({
--         attach_mappings = function(prompt_bufnr, map) 
--             map('i', '<c-d>', actions.git_delete_branch)
--             map('n', '<c-d>', actions.git_delete_branch)
--             return true
--         end
--     })
-- end

require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },

        layout_config = {
            height = 0.95,
            width = 0.95,
            preview_width = 0.60,
        },
        wrap_results = true,
        path_display = 'smart', --{
            -- "truncate",
            -- shorten = { len = 3, exclude = {-2, -1} },
        -- },
        preview = {
            -- Seems to time out on some big volunteers-nowhere files
            -- timeout = 400
        }
    },
    extensions = {
        fzy_native = {
            -- TODO figure this mess out
            override_generic_sorter = true,
            override_file_sorter = false,
            -- override_generic_sorter = false,
            -- override_file_sorter = true,
        },
    },
}

require('telescope').load_extension('fzy_native')
