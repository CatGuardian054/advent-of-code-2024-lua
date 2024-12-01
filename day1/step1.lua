utils = require "utils"

local file = io.open('input.txt')

local left_array, right_array = utils.read_arrays(file)

table.sort(left_array)
table.sort(right_array)

local result = 0
for i = 1, #left_array do
    result = result + math.abs(left_array[i] - right_array[i])
end

print(result)

file:close()
