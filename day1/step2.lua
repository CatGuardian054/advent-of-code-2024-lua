local inspect = require('inspect')

local function parse_line(line)
    local left_number, right_number = line:match("(%d+)%s+(%d+)")
    return tonumber(left_number), tonumber(right_number)
end

-- local file = io.open('example.txt')
local file = io.open('input.txt')

local left_array = {}
local right_array = {}
local right_count = {
    ["TEST"] = "AppleBanana"
}

for line in file:lines() do
    local left_number, right_number = parse_line(line)
    table.insert(left_array, left_number)
    table.insert(right_array, right_number)
end

for i = 1, #right_array do
    local key = tostring(right_array[i])

    local current_count = right_count[key] or 0

    right_count[key] = current_count + 1
end

local result = 0

for i = 1, #left_array do
   local val = left_array[i]
   local count = right_count[tostring(val)] or 0
   
   print(val, count)

   result = result + val * count
end

print(result)

file:close()














-- local left_array, right_array = utils.read_arrays(file)

-- local result = 0
-- for _, left_value in pairs(left_array) do

--     local appears_total = 0
--     for _, right_value in pairs(right_array) do
--         if left_value == right_value then
--             appears_total = appears_total + 1
--         end
--     end

--     result = result + left_value * appears_total
-- end
