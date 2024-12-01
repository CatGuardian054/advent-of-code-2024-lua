function parse_line(line)
    local leftNumber, rightNumber = line:match("(%d+)%s+(%d+)")
    return tonumber(leftNumber), tonumber(rightNumber)
end

-- MAIN
local file = io.open('1.txt')

local leftArray = {};
local rightArray = {};

for line in file:lines() do
    local leftNumber, rightNumber = parse_line(line)
    table.insert(leftArray, leftNumber)
    table.insert(rightArray, rightNumber)
end

table.sort(leftArray)
table.sort(rightArray)

local result = 0
for i = 1, #leftArray do
    result = result + math.abs(leftArray[i] - rightArray[i])
end

print(result)

file:close()
