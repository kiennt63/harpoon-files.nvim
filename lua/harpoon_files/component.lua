local M = {}
local harpoon = require 'harpoon'

local options = {}

M.setup = function(opts)
    options = opts
end

M.get_options = function()
    return options
end

M.harpoon_files = function()
    local current_file = vim.fn.expand '%:p'
    local opts = M.get_options()

    local result = {}
    for id, item in ipairs(harpoon:list().items) do
        local file_path = vim.fn.fnamemodify(item.value, ':p')
        local shortened =
            vim.fn.fnamemodify(file_path, ':t'):sub(1, opts.max_length) -- Shorten filename

        -- TODO: add highlight customization support
        -- if file_path == current_file then
        --     table.insert(
        --         result,
        --         string.format(
        --             '%%#lualine_c_diagnostics_hint_normal# [ %d - %s] %%*',
        --             id,
        --             shortened
        --         )
        --     )
        -- else
        --     table.insert(
        --         result,
        --         string.format(
        --             '%%#lualine_c_normal#  %d - %s %%*',
        --             id,
        --             shortened
        --         )
        --     )
        -- end
        local id_str = ''
        if opts.show_index then
            id_str = string.format('%d ', id)
        end

        if file_path == current_file then
            table.insert(
                result,
                string.format(
                    '%s[%s %s %s]%s',
                    opts.separator_left,
                    opts.icon,
                    id_str,
                    shortened,
                    opts.separator_right
                )
            )
        else
            table.insert(
                result,
                string.format(
                    '%s %s %s %s %s',
                    opts.separator_left,
                    opts.icon,
                    id_str,
                    shortened,
                    opts.separator_right
                )
            )
        end
    end

    local combined_string = table.concat(result, '')
    return combined_string
end

return M
