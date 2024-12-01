utils = require "utils"

local file = io.open('input.txt')

local left_array, right_array = utils.read_arrays(file)

local result = 0
for _, left_value in pairs(left_array) do

    local appears_total = 0
    for _, right_value in pairs(right_array) do
        if left_value == right_value then
            appears_total = appears_total + 1
        end
    end

    result = result + left_value * appears_total
end

print(result)

file:close()