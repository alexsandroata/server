local screen = {guiGetScreenSize()}

local isProgressBarRendered = false
local font = dxCreateFont("assets/fonts/font.ttf", 20)
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
	local barra = interpolateBetween (0, 0, 0, 138, 0, 0, (getTickCount()-tick)/time, "Linear")
	dxDrawBordRectangle(1125, 600, 200, 70, 7, tocolor(18, 18, 18, 200), false)
    dxDrawImage(1205, 610, 35, 35, "assets/img/loading.png", math.abs(getTickCount() / 500 * 100), 0, 0, tocolor(255, 255, 255, 255), false)
	--dxDrawText("LOADING...", 1170, 630, 30, 30, tocolor(255, 255, 255, 255), 1, font, "left", "top")
	dxDrawRectangle(1155, 655, 138, 4, tocolor(18, 18, 18, 200), false)
	dxDrawRectangle(1155, 655, barra, 4, tocolor(41, 122, 255, 255), false)
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
