local xoffset = (240 - 11 * 10) / 2
local yoffset = (136 - 9) / 2
local _chars = " ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
local chars = {}
for i = 1, _chars:len() do
    table.insert(chars, _chars:sub(i, i))
end
local NAME = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' }
local selected = 1
local function toindex(x)
    for i = 1, #chars do
        if chars[i] == x then return i end
    end
end
local function stringify(x)
    n = ""
    for i = 1, #x do
        n = n .. tostring(x[i])
    end
    return n
end
function NAME:loop(onEnterName)
    local _w = print("Enter Your Name:", -80000, -80000)
    print("Enter Your Name:", (240-_w)/2, 20, 6)
    local vid = toindex(self[selected])
    -- button handling
    if btnp(0, 120, 6) then
        vid = vid - 1
        if vid <= 0 then vid = #chars + vid end
        self[selected] = chars[vid]
    elseif btnp(1, 120, 6) then
        vid = vid + 1
        if vid > #chars then vid = vid % #chars end
        NAME[selected] = chars[vid]
    elseif btnp(2) then
        selected = selected - 1
        if selected <= 0 then selected = #self + selected end
    elseif btnp(3) then
        selected = selected + 1
        if selected > #self then selected = selected - #self end
    end
    -- drawing
    for i = 1, #self do
        if selected == i then
            rectb(xoffset + (i - 1) * 11, yoffset, 10, 9, 5)
            tri(xoffset+(i-1)*11, yoffset-2, xoffset+(i-1)*11+9, yoffset-2, xoffset + (i-1)*11+4.5, yoffset-8, 12)
            tri(xoffset+(i-1)*11, yoffset+2+8, xoffset+(i-1)*11+9, yoffset+8+2, xoffset + (i-1)*11+4.5, yoffset+8+8, 12)
        else
            rectb(xoffset + (i - 1) * 11, yoffset, 10, 9, 8)
        end
        print(self[i], xoffset + (i - 1) * 11 + 3, yoffset + 2, 12)
    end
    if selected == #self then
        print("SUBMIT: Z", xoffset + 11*#self + 5, yoffset+2, 2)
    end
    if btnp(4) then onEnterName(stringify(self)) end
end
local v, h = 1, 1
