--[[
    author: szymcio
	github.com/szymixooo
]]

local f0 = dxCreateFont('f.ttf', 10)
local f1 = dxCreateFont('f.ttf', 12)

local sw,sh = guiGetScreenSize()
local baseX = 1920
local scale = 1
local minScale = 2
if sw < baseX then
    scale = math.min(minScale, baseX/sw)
end

function isMouseIn ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
    local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
        return true
    else
        return false
    end
end

local on = dxCreateTexture("button_on.png","argb",false,"clamp")
local off = dxCreateTexture("button_off.png","argb",false,"clamp")

function customButton(text, x, y, w, h)
    if isMouseIn(x, y, w, h) then
        dxDrawImage(x,y,w,h,on)
    else
        dxDrawImage(x,y,w,h,off)
    end
    dxDrawText(text, x, y, w+x, h+y, tocolor(255,255,255), 1/scale, f1, 'center', 'center')
end  

function shadowText(text, x, y, w, h, s, color)
	local f = f1
	if s == 0 then
		f = f0
	end
    local xd = false
    color = color or ''
    local text2 = text
    if color == 'hex' then
       text2 = string.gsub(text2, "#%x%x%x%x%x%x", "")
       xd = true
    end
	dxDrawText(text2, x+1, y+1, w+1, h+1, tocolor(0, 0, 0, 255), 1/scale, f, 'center', 'center', false, true, false, xd)
	dxDrawText(text, x, y, w, h, tocolor(255, 255, 255, 255), 1/scale, f, 'center', 'center', false, true, false, xd)
end