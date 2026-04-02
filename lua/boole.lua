local M = {}

local replace_map = {
    increment = {},
    decrement = {},
}

local default_opts = {
    mappings = {
        increment = nil,
        decrement = nil,
    },
    additions = nil,
    allow_caps_additions = nil,
    defaults = {
        booleans = true,
        canonical_hours = true,
        days_of_week = true,
        months_of_year = true,
        colors = false,
    },
}

M.generate = function(loop_list, allow_caps)
    for i = 1, #loop_list do
        local current = loop_list[i]
        local next = loop_list[i + 1] or loop_list[1]

        replace_map.increment[current] = next
        replace_map.decrement[next] = current

        if allow_caps then
            local capitalized_current = string.gsub(current, '^%l', string.upper)
            local capitalized_next = string.gsub(next, '^%l', string.upper)
            local all_caps_current = string.upper(current)
            local all_caps_next = string.upper(next)

            replace_map.increment[capitalized_current] = capitalized_next
            replace_map.decrement[capitalized_next] = capitalized_current
            replace_map.increment[all_caps_current] = all_caps_next
            replace_map.decrement[all_caps_next] = all_caps_current
        end
    end
end

local generate_defaults = function(defaults)
    if defaults == nil or defaults == false then
        return
    end

    if defaults.booleans then
        M.generate({ 'true', 'false' }, true)
        M.generate({ 'yes', 'no' }, true)
        M.generate({ 'on', 'off' }, true)
        M.generate({ 'enable', 'disable' }, true)
        M.generate({ 'enabled', 'disabled' }, true)
    end

    if defaults.canonical_hours then
        M.generate({
            'Matins',
            'Lauds',
            'Prime',
            'Terce',
            'Sext',
            'Nones',
            'Vespers',
            'Compline',
            'Vigil',
        })
    end

    if defaults.days_of_week then
        M.generate({
            'monday',
            'tuesday',
            'wednesday',
            'thursday',
            'friday',
            'saturday',
            'sunday',
        }, true)
        M.generate({
            'mon',
            'tue',
            'wed',
            'thu',
            'fri',
            'sat',
            'sun',
        }, true)
    end

    if defaults.months_of_year then
        M.generate({
            'january',
            'february',
            'march',
            'april',
            'may',
            'june',
            'july',
            'august',
            'september',
            'october',
            'november',
            'december',
        }, true)
    end

    if defaults.colors then
        -- Colors
        M.generate({
            'red',
            'orange',
            'yellow',
            'green',
            'blue',
            'indigo',
            'violet',
        })

        M.generate({
            'White',
            'Snow',
            'Ivory',
            'Linen',
            'AntiqueWhite',
            'Beige',
            'WhiteSmoke',
            'LavenderBlush',
            'OldLace',
            'AliceBlue',
            'SeaShell',
            'GhostWhite',
            'Honeydew',
            'FloralWhite',
            'Azure',
            'MintCream',
        })

        M.generate({
            'Black',
            'DarkSlateGray',
            'DimGray',
            'SlateGray',
            'Gray',
            'LightSlateGray',
            'Silver',
            'LightGray',
            'Gainsboro',
        })

        M.generate({
            'Pink',
            'LightPink',
            'HotPink',
            'PaleVioletRed',
            'DeepPink',
            'MediumVioletRed',
        })

        M.generate({
            'Indigo',
            'Purple',
            'DarkMagenta',
            'DarkViolet',
            'DarkSlateBlue',
            'BlueViolet',
            'DarkOrchid',
            'Fuchsia',
            'Magenta',
            'SlateBlue',
            'MediumSlateBlue',
            'MediumOrchid',
            'MediumPurple',
            'Orchid',
            'Violet',
            'Plum',
            'Thistle',
            'Lavender',
        })

        M.generate({
            'DarkRed',
            'Red',
            'Firebrick',
            'Crimson',
            'IndianRed',
            'LightCoral',
            'Salmon',
            'DarkSalmon',
            'LightSalmon',
        })

        M.generate({
            'OrangeRed',
            'Tomato',
            'DarkOrange',
            'Coral',
            'Orange',
        })

        M.generate({
            'DarkKhaki',
            'Gold',
            'Khaki',
            'PeachPuff',
            'Yellow',
            'PaleGoldenRod',
            'Moccasin',
            'PapayaWhip',
            'LightGoldenRodYellow',
            'LemonChiffon',
            'LightYellow',
        })

        M.generate({
            'MidnightBlue',
            'Navy',
            'DarkBlue',
            'MediumBlue',
            'Blue',
            'RoyalBlue',
            'SteelBlue',
            'DodgerBlue',
            'DeepSkyBlue',
            'CornflowerBlue',
            'SkyBlue',
            'LightSkyBlue',
            'LightSteelBlue',
            'LightBlue',
            'PowderBlue',
        })

        M.generate({
            'Maroon',
            'Brown',
            'SaddleBrown',
            'Sienna',
            'Chocolate',
            'DarkGoldenRod',
            'Peru',
            'RosyBrown',
            'GoldenRod',
            'SandyBrown',
            'Tan',
            'BurlyWood',
            'Wheat',
            'NavajoWhite',
            'Bisque',
            'BlanchedAlmond',
            'Cornsilk',
        })

        M.generate({
            'Teal',
            'DarkCyan',
            'LightSeaGreen',
            'CadetBlue',
            'DarkTurquoise',
            'MediumTurquoise',
            'Turquoise',
            'Aqua',
            'Cyan',
            'Aquamarine',
            'PaleTurquoise',
            'LightCyan',
        })

        M.generate({
            'DarkGreen',
            'Green',
            'DarkOliveGreen',
            'ForestGreen',
            'SeaGreen',
            'Olive',
            'OliveDrab',
            'MediumSeaGreen',
            'LimeGreen',
            'Lime',
            'SpringGreen',
            'MediumSpringGreen',
            'DarkSeaGreen',
            'MediumAquamarine',
            'YellowGreen',
            'LawnGreen',
            'Chartreuse',
            'LightGreen',
            'GreenYellow',
            'PaleGreen',
        })
    end
end

-- Fallback to next <C-a> and <C-x> functions.  Depending on configuration,
-- this could be other plugins or the built-in functions for numbers.
local call_vim_fallback_functions = function(direction, v_count)
    if v_count ~= nil and v_count > 0 then
        if direction == 'increment' then
            return vim.cmd('normal!' .. v_count .. '')
        end
        if direction == 'decrement' then
            return vim.cmd('normal!' .. v_count .. '')
        end
    else
        if direction == 'increment' then
            return vim.cmd('normal!' .. '')
        end
        if direction == 'decrement' then
            return vim.cmd('normal!' .. '')
        end
    end
end

M.run = function(direction)
    -- The current word under the cursor is all we are interested in
    local word = vim.fn.expand('<cword>')
    local v_count = vim.v.count

    -- If we have the cursor in an empty location there is nothing to do.
    if word == '' then
        return false
    end
    -- If the word is purely numeric then leave to the builtin functions.
    if tonumber(word) ~= nil then
        return call_vim_fallback_functions(direction, v_count)
    end
end

M.setup = function(options)
    options = vim.tbl_deep_extend('force', default_opts, options)

    vim.api.nvim_create_user_command('Boole', function(args)
        M.run(args.args)
    end, {
        nargs = 1,
        complete = function()
            return { 'increment', 'decrement' }
        end,
    })

    if options == nil then
        return false
    end

    if options.allow_caps_additions ~= nil then
        for _, val in pairs(options.allow_caps_additions) do
            M.generate(val, true)
        end
    end

    if options.additions ~= nil then
        for _, val in pairs(options.additions) do
            M.generate(val)
        end
    end

    if options.mappings.increment ~= nil then
        vim.keymap.set({ 'n', 'v' }, options.mappings.increment, '<Cmd>Boole increment<CR>')
    end

    if options.mappings.decrement ~= nil then
        vim.keymap.set({ 'n', 'v' }, options.mappings.decrement, '<Cmd>Boole decrement<CR>')
    end

    generate_defaults(options.defaults)

    return true
end

return M
