local M = {}

-- Load the custom component
local component = require 'harpoon_files.component'
M.lualine_component = component.harpoon_files

M.defaults = {
    max_length = 15,
    icon = '',
    show_index = true,
    separator_left = ' ',
    separator_right = ' ',
}

M.options = {}

function M.setup(opts)
    M.options = vim.tbl_deep_extend('force', M.defaults, opts or {})
    component.setup(M.options)
end

return M
