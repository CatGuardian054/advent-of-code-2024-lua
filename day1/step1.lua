local inspect = require('inspect')

local function parse_line(line)
    local left_number, right_number = line:match("(%d+)%s+(%d+)")
    return tonumber(left_number), tonumber(right_number)
end

-- local file = io.open('example.txt')
local file = io.open('input.txt')

local left_array = {}
local right_array = {}

for line in file:lines() do
    local left_number, right_number = parse_line(line)
    table.insert(left_array, left_number)
    table.insert(right_array, right_number)
end

table.sort(left_array)
table.sort(right_array)

-- print(inspect(left_array))

local result = 0

for i = 1, #left_array do
    result = result + math.abs(left_array[i] - right_array[i])
end

print(result)

file:close()

-- local left_array, right_array = utils.read_arrays(file)

-- table.sort(left_array)
-- table.sort(right_array)

-- local result = 0
-- for i = 1, #left_array do
--     result = result + math.abs(left_array[i] - right_array[i])
-- end