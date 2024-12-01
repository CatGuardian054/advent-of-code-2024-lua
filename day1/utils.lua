local utils = {}

local function split_whitespace(line)
    return string.gmatch(line, "([^%s]+)")
end


local function parse_line(line)
    local left_number, right_number = line:match("(%d+)%s+(%d+)")
    return tonumber(left_number), tonumber(right_number)
end

function utils.read_arrays(file)
    local left_array = {}
    local right_array = {}

    for line in file:lines() do
        local left_number, right_number = parse_line(line)
        table.insert(left_array, left_number)
        table.insert(right_array, right_number)
    end

    return left_array, right_array
end

return utils