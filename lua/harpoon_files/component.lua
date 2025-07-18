local M = {}
local harpoon = require 'harpoon'

M.options = {
    max_length = 15,
    icon = '',
    show_icon = true,
    show_index = true,
    show_filename = true,
    separator_left = ' ',
    separator_right = ' ',
    reverse_order = false,
}

M.setup = function(opts)
    M.options = vim.tbl_deep_extend('force', M.options, opts or {})
end

M.harpoon_files = function()
    local current_file = vim.fn.expand '%:p'

    local result = {}
    for id, item in ipairs(harpoon:list().items) do
        local file_path = vim.fn.fnamemodify(item.value, ':p')
        local shortened =
            vim.fn.fnamemodify(file_path, ':t'):sub(1, M.options.max_length) -- Shorten filename

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
        if M.options.show_index then
            id_str = string.format('%d', id)
        end

        local fname = ''
        if M.options.show_filename then
            if M.options.show_icon or M.options.show_index then
                fname = string.format(' %s', shortened)
            else
                fname = string.format('%s', shortened)
            end
        end

        local icon_str = ''
        if M.options.show_icon then
            icon_str = string.format('%s ', M.options.icon)
        end

        local insert_pos = #result + 1
        if M.options.reverse_order then
            insert_pos = 1
        end

        if file_path == current_file then
            table.insert(
                result,
                insert_pos,
                string.format(
                    '%s[%s%s%s]%s',
                    M.options.separator_left,
                    icon_str,
                    id_str,
                    fname,
                    M.options.separator_right
                )
            )
        else
            table.insert(
                result,
                insert_pos,
                string.format(
                    '%s %s%s%s %s',
                    M.options.separator_left,
                    icon_str,
                    id_str,
                    fname,
                    M.options.separator_right
                )
            )
        end
    end

    local combined_string = table.concat(result, '')
    return combined_string
end

return M
