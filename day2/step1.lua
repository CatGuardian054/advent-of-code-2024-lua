local inspect = require('inspect')

local counter = 0

local file = io.open('input.txt')
-- local file = io.open('example.txt')

local function parse_line(line)
    local MatchGroup = {}
    local matches = line:gmatch("%d+")
    for match in matches do
        table.insert(MatchGroup, tonumber(match))
    end
    return MatchGroup
end

local function is_safe(report)
    local startAscending = (report[2] - report[1]) > 0

    local cycles = #report - 1

    for i in pairs(report) do
        if report[i+1] == nil then
            counter = counter + 1
            -- end of list, safe
            return true
        end

        local stillAscending = (report[i+1] - report[i]) > 0
        if startAscending == true and stillAscending == true then
            -- okay
        elseif startAscending == true and stillAscending == false then
            return false
        elseif startAscending == false and stillAscending == false then
            -- okay
        elseif startAscending == false and stillAscending == true then
            return false
        end
        if i <= cycles then
            local ascending = (report[i+1] - report[i]) > 0

            if startAscending == true and report[i+1] - report[i] > 3 then
                return false
            elseif startAscending == false and report[i+1] - report[i] < -3 then
                return false
            elseif report[i+1] - report[i] == 0 then
                return false
            end

            -- local ascendingGroup = {}
            -- print(inspect(report), ascending, i)

            -- table.insert(ascendingGroup, ascending)

            -- print(inspect(ascendingGroup))
        else

        end
    end
end

for line in file:lines() do
    local report = parse_line(line)
    
    local isSafe = is_safe(report)
    print(inspect(report), isSafe)
end

print("  ")
print(counter)

-- for i, v in pairs do
--     print(MatchGroup[i])
-- end
