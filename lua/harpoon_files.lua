local M = {}

-- Load the custom component
local component = require 'harpoon_files.component'
M.lualine_component = component.harpoon_files

function M.setup(opts)
    component.setup(opts)
end

return M
