local M = {}

local function set_map(mode, lhs, rhs, arg3, arg4)
    local options = { noremap = true, silent = true }

    -- Merge strings as desc and tables as options
    for _, arg in ipairs({ arg3, arg4 }) do
        if type(arg) == 'string' then
            options.desc = arg
        elseif type(arg) == 'table' then
            options = vim.tbl_extend('force', options, arg)
        end
    end

    vim.keymap.set(mode, lhs, rhs, options)
end

M.map = setmetatable({}, {
    __index = function(_, mode)
        return function(lhs, rhs, arg3, arg4)
            local modes = {}
            for char in mode:gmatch('.') do
                table.insert(modes, char)
            end
            set_map(modes, lhs, rhs, arg3, arg4)
        end
    end
})

return M
