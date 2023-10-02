local screen = { guiGetScreenSize() }
local resW, resH = 1366, 768
local sx, sy = screen[1]/resW, screen[2]/resH

local isProgressBarRendered = false
local font = dxCreateFont("assets/fonts/font.ttf", 12)
local rotation = 0

local _dxDrawText = dxDrawText

function dxDrawText(text, x, y, w, h, ...)
    _dxDrawText(text, x, y, x + w, y + h, ...)
end


local SvgsRectangle = {}

function dxDrawBordRectangle(x, y, w, h, radius, color, post)
    if not SvgsRectangle[radius + w + h] then
        local Path = string.format([[
            <svg width="%s" height="%s" viewBox="0 0 %s %s" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect opacity="1" width="%s" height="%s" rx="%s" fill="#FFFFFF"/>
            </svg>
        ]], w, h, w, h, w, h, radius)
        SvgsRectangle[radius + w + h] = svgCreate(w, h, Path)
    end
    if SvgsRectangle[radius + w + h] then
        dxDrawImage(x, y, w, h, SvgsRectangle[radius + w + h], 0, 0, 0, color, post)
    end
end

function isCursorOnPosition(x, y, w, h)
    if cx and cy then
        if cx >= x and cx <= (x + w) and cy >= y and cy <=(y + h) then
            return true
        end
    end
    return false
end

function progress()
	local barra = interpolateBetween (0, 0, 0, 236, 0, 0, (getTickCount()-tick)/time, "Linear")
    dxDrawImage(527, 660, 312, 57, "assets/img/fundo.png",  0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(549, 680, 16, 16, "assets/gfx/loading.png", math.abs(getTickCount() / 900 * 255), 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawText("LOADING...", 670, 669, 55, 24, tocolor(255, 255, 255, 255), 1, font, "center", "center")
	dxDrawRectangle(582, 688, 236, 3, tocolor(128, 128, 128, 200), false)
	dxDrawRectangle(582, 688, barra, 3, tocolor(128, 0, 128, 255), false)
end

function toggleProgress(tempo)
	if not isProgressBarRendered then
		tick = getTickCount()
		time = tempo
		rotation = 0
		isProgressBarRendered = true
		addEventHandler("onClientRender", root, progress)
		Timer = setTimer(function()
			removeEventHandler("onClientRender", root, progress)
			isProgressBarRendered = false
		end, time, 1)
	else
		removeEventHandler("onClientRender", root, progress)
		killTimer(Timer)
		tick = getTickCount()
		time = tempo
		addEventHandler("onClientRender", root, progress)
		Timer = setTimer(function()
			removeEventHandler("onClientRender", root, progress)
			isProgressBarRendered = false
		end, time, 1)
	end
end
addEvent("progressBar", true)
addEventHandler("progressBar", root, toggleProgress)