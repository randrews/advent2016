require 'lpeg'

left = { n='w', w='s', e='n', s='e' }
right = { n='e', e='s', s='w', w='n' }

spc = lpeg.S(" \t\n")^0
num = lpeg.C(lpeg.R('09')^1) / tonumber * spc

function step(turn, dist)
    return {turn=turn, dist=dist}
end

steps = ( (lpeg.S('LR') / string.lower * num) / step * lpeg.S(',')^0 * spc)^1

path = { steps:match(io.open('day1.txt'):read()) }

function walk(path)
    local dir = 'n'
    local x = 0
    local y = 0

    local visits = {}
    local first = nil

    local function visit(x, y)
        if first then return end
        if visits[x .. '-' .. y] then first = math.abs(x)+math.abs(y) end
        visits[x .. '-' .. y] = true
    end

    for _, step in ipairs(path) do
        if step.turn == 'l' then
            dir = left[dir]
        else
            dir = right[dir]
        end

        if dir == 'n' and not first then
            for n=y+1,y+step.dist do visit(x, n) end
        elseif dir == 's' and not first then
            for n=y-1,y-step.dist,-1 do visit(x, n) end
        elseif dir == 'e' and not first then
            for n=x+1,x+step.dist do visit(n, y) end
        elseif dir == 'w' and not first then
            for n=x-1,x-step.dist,-1 do visit(n, y) end
        end

        if dir == 'n' then y = y + step.dist
        elseif dir == 's' then y = y - step.dist
        elseif dir == 'e' then x = x + step.dist
        elseif dir == 'w' then x = x - step.dist
        end
    end

    return x, y, first
end

x, y, first = walk(path)
print('Part 1:', x+y)
print('part 2:', first)
