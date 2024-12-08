local inspect = require('inspect')
local counter = 0

--local file = io.open('input.txt')
local file = io.open('example.txt')

local saveNum = {}

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
        else
            --idk what to put here 
        end
    end
end

for line in file:lines() do
    local report = parse_line(line)
    local isSafe = is_safe(report)

    for i = 1, #report do
        if isSafe == false then
            table.insert(saveNum, report[i])
            table.remove(report, report[i])

            if isSafe == false then
                table.insert(report, saveNum[1])
                table.remove(saveNum, saveNum[1])
                else
                return true
            end

            if i == #report then
                return false
            end
        end
        
    end

    -- while isSafe == false do
    --     num = num + 1

    --     table.remove(report, report[num])

    --     if num ~= 1 then
    --         table.insert(report, report[num-1])
    --     end
    -- end
    print(inspect(report), isSafe)
end
    



print("  ")
print(counter, "Safe Responses")

-- for i, v in pairs do
--     print(MatchGroup[i])
-- end
