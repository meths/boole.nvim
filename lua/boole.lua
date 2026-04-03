local M = {}

local unpack = unpack or table.unpack

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
    local fallback_key
    if v_count ~= nil and v_count > 0 then
        if direction == 'increment' then
            fallback_key = vim.api.nvim_replace_termcodes(v_count .. '<C-a>', true, false, true)
        elseif direction == 'decrement' then
            fallback_key = vim.api.nvim_replace_termcodes(v_count .. '<C-x>', true, false, true)
        end
    else
        if direction == 'increment' then
            fallback_key = vim.api.nvim_replace_termcodes('<C-a>', true, false, true)
        elseif direction == 'decrement' then
            fallback_key = vim.api.nvim_replace_termcodes('<C-x>', true, false, true)
        end
    end
    return vim.api.nvim_feedkeys(fallback_key, 'n', false)
end

local process_word = function(word, match)
    -- nvim_buf_set_text({buffer}, {start_row}, {start_col}, {end_row}, {end_col}, {replacement})
    --   0-based indexing.
    --   end_col needs to be calculated taking the larger of the two words
    --   being swapped (word or match).
    --   The buffer parameter is 0 for the current buffer.
    -- [row, column] = vim.api.nvim_win_get_cursor({window})
    --   Gets the (1,0)-indexed cursor position (row, column)
    --   The window parameter is 0 for the current buffer.
    -- start, end = string.find(string, pattern, index)
    --   start, end and index are 1-based.
    --
    -- The vim cword grabbing is from the space before the word up until the
    -- word end.  This means the interaction of the various index bases and
    -- the cword can leave us off by two positions between the cursor and the
    -- word start found by string.find().  Hence the '+ 2' below.

    local row, cursor_column = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()

    -- There may be multiple occurrences of the word in the line so make sure
    -- we find the occurrence where the cursor is.
    local position = 1
    local word_start, word_end
    repeat
        word_start, word_end = string.find(line, word, position)
        if word_start == nil or word_end == nil then
            return false
        end
        position = word_end
    until word_start <= cursor_column + 2 and word_end > cursor_column

    local change_row = row - 1
    local change_start = word_start - 1
    local change_length = string.len(word)

    vim.api.nvim_buf_set_text(0, change_row, change_start, change_row, change_start + change_length, { match })
end

M.run = function(direction)
    -- The current word under the cursor is all we are interested in
    local word = vim.fn.expand('<cword>')
    local v_count = vim.v.count

    -- If we have the cursor in an empty location there is nothing to do.
    if word == '' then
        return false
    end
    -- If the word is purely numeric then leave to the built-in functions.
    if tonumber(word) ~= nil then
        return call_vim_fallback_functions(direction, v_count)
    end

    local match = word
    for _ = v_count, 1, -1 do
        match = direction == 'decrement' and replace_map.decrement[match] or replace_map.increment[match]
    end

    if not match then
        -- We have no match for this word.  If the word ends with digits give
        -- the built-in functions a chance.
        if string.match(word, '[%a%d]*%d+') == word then
            return call_vim_fallback_functions(direction, v_count)
        else
            return false
        end
    end

    process_word(word, match)
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
