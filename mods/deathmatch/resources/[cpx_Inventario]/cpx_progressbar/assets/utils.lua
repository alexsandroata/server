local screen = { guiGetScreenSize() }
local resW, resH = 1366, 768
local sx, sy = screen[1]/resW, screen[2]/resH

--/ Eventos \--

local _Events = {}
_addEventHandler = addEventHandler
_removeEventHandler = removeEventHandler

function addEventHandler(eventName, attachedTo, theFunction, propagate, priority)
    local stt = _addEventHandler(eventName, attachedTo, theFunction, propagate, priority)
    if stt then
        table.insert(_Events, {eventName = eventName, attachedTo = attachedTo, theFunction = theFunction})
        return true
    else
        error('HOUVE UM IMPREVISTO AO EXECUTAR A FUNÇÃO, CHEQUE A LINHA ACIMA', 2)
    end
    return false
end

function removeEventHandler(eventName, attachedTo, theFunction)
    local stt = _removeEventHandler(eventName, attachedTo, theFunction)
    if (stt) then
        for i, evento in ipairs(_Events) do
            if (evento.eventName == eventName and evento.attachedTo == attachedTo and evento.theFunction == theFunction) then
                table.remove(_Events, i)
                return true
            end
        end
    else
        error('HOUVE UM IMPREVISTO AO EXECUTAR A FUNÇÃO, CHEQUE A LINHA ACIMA', 2)
    end
    return false
end

function isEventHandlerAdded(eventName, attachedTo, theFunction)
    for i, evento in ipairs(_Events) do
        if (evento.eventName == eventName and evento.attachedTo == attachedTo and evento.theFunction == theFunction) then
            return true
        end
    end
    return false
end

function aToR(X, Y, sX, sY)
    local xd = X/resW or X
    local yd = Y/resH or Y
    local xsd = sX/resW or sX
    local ysd = sY/resH or sY
    return xd * screen[1], yd * screen[2], xsd * screen[1], ysd * screen[2]
end

--/ Dx functions \--

_dxDrawRectangle = dxDrawRectangle
function dxDrawRectangle(x, y, w, h, ...)
    local x, y, w, h = aToR(x, y, w, h)
    return _dxDrawRectangle(x, y, w, h, ...)
end

_dxDrawText = dxDrawText
function dxDrawText(text, x, y, w, h, ...)
    local x, y, w, h = aToR(x, y, w, h)
    return _dxDrawText(text, x, y, w + x, h + y, ...)
end

_dxDrawImage = dxDrawImage
function dxDrawImage(x, y, w, h, ...)
    local x, y, w, h = aToR(x, y, w, h)
    return _dxDrawImage(x, y, w, h, ...)
end

_dxDrawImageSection = dxDrawImageSection
function dxDrawImageSection(x, y, w, h, ...)
    local x, y, w, h = aToR(x, y, w, h)
    return _dxDrawImageSection(x, y, w, h, ...)
end

_dxDrawLine = dxDrawLine
function dxDrawLine(x, y, w, h, ...)
    local x, y, w, h = aToR(x, y, w, h)
    return _dxDrawLine(x, y, w, h, ...)
end 

function isCursorOnElement (x, y, w, h)
    local x, y, w, h = aToR(x, y, w, h)
    if isCursorShowing() then
        local mx, my = getCursorPosition()
        local resx, resy = guiGetScreenSize()
        mousex, mousey = mx * resx, my * resy
        if mousex > x and mousex < x + w and mousey > y and mousey < y + h then
            return true
        else
            return false
        end
    end
end

function roundedRectangle(x, y, w, h, borderColor, bgColor, postGUI)
	if (x and y and w and h) then
		if (not borderColor) then
			borderColor = tocolor(0, 255, 0, 200);
		end
		
		if (not bgColor) then
			bgColor = borderColor;
		end
		
		--> Background
		dxDrawRectangle(x, y, w, h, bgColor, postGUI);
		
		--> Border
		dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI); -- top
		dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI); -- bottom
		dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI); -- left
		dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI); -- right
	end
end
