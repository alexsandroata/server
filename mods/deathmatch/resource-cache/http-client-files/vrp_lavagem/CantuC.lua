--- ░█████╗░░█████╗░███╗░░██╗████████╗██╗░░░██╗ ░░██╗░░░░██╗██╗░░
--- ██╔══██╗██╔══██╗████╗░██║╚══██╔══╝██║░░░██║  ░██╔╝░░░██╔╝╚██╗░
--- ██║░░╚═╝███████║██╔██╗██║░░░██║░░░██║░░░██║  ██╔╝░░░██╔╝░░╚██╗
--- ██║░░██╗██╔══██║██║╚████║░░░██║░░░██║░░░██║  ╚██╗░░██╔╝░░░██╔╝
--- ╚█████╔╝██║░░██║██║░╚███║░░░██║░░░╚██████╔╝  ░╚██╗██╔╝░░░██╔╝░
--- ░╚════╝░╚═╝░░╚═╝╚═╝░░╚══╝░░░╚═╝░░░░╚═════╝░  ░░╚═╝╚═╝░░░░╚═╝░░

--- Qualquer duvida: Cantu#5945
--- Qualquer duvida: Cantu#0764
--- Qualquer duvida: Cantu#0007
--- Qualquer duvida: @cantuzinho

local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1980), (screenH/1080)

function dxDraw()
    dxDrawImage(x*14, y*262, x*416, y*302, "Files/base.png", 0, 0, 0, tocolor(255, 255, 255, Alpha), false)
end



function onClientClick(b, s)
    if (b == 'left') and (s == 'down') then 
        if isEventHandlerAdded('onClientRender', root, dxDraw) then 
            if isMouseInPosition(x * 151, y * 507, x * 143, y * 44) then 
               -- if (tonumber(sujo) >= config.minimo) then 
                    if desmanchando ~= true then
                        removeEventHandler('onClientRender', root, dxDraw)
                        setPedAnimation(localPlayer, 'BAR', 'barcustom_get', - 1)
                        showCursor(false)
                        toggleAllControls(false)
                        desmanchando = true
                        setTimer(function()
                            triggerServerEvent('Caio.lavarDinheiro', localPlayer, localPlayer, sujo)
                            setPedAnimation(localPlayer, nil)
                            toggleAllControls(true)
                            desmanchando = false
                        end, config.Tempo * 1000, 1)
                    else
                        print('Você já está lavando!')
                    end
                -- else 
                --     message('O minimo de dinheiro para ser lavado é R$ '..config.minimo)
                -- end
            end
        end
    end
end

addEvent('Caio.onOpenPanelDS', true) addEventHandler('Caio.onOpenPanelDS', root, function (dinheiro)
    if isEventHandlerAdded('onClientRender', root, dxDrawBarra) then return end
    if not isEventHandlerAdded('onClientRender', root, dxDraw) then 
        sujo = dinheiro
        addEventHandler('onClientRender', root, dxDraw)
        addEventHandler('onClientClick', root, onClientClick)
        showCursor(true)
    end
end)

bindKey('backspace', 'down', function()
    if isEventHandlerAdded('onClientRender', root, dxDraw) then 
        removeEventHandler('onClientRender', root, dxDraw)
        removeEventHandler('onClientClick', root, onClientClick)
        showCursor(false)
    end
end)

addEventHandler('onClientKey', root, function(key)
    if desmanchando == true then
        if (key == 'control' or key == 'space' or key == 'alt' or key == 0 or key == 'F1' or key == 'F2' or key == 'F3' or key == 'F4' or key == 'F5' or key == 'F9' or key == 'shift') then 
            cancelEvent()
        end
    end
end)

function isEventHandlerAdded(sEventName, pElementAttachedTo, func)
    if type(sEventName) == 'string' and isElement(pElementAttachedTo) and type(func) == 'function' then
        local aAttachedFunctions = getEventHandlers(sEventName, pElementAttachedTo)
        if type(aAttachedFunctions) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs(aAttachedFunctions) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end

function isMouseInPosition(x,y,w,h)
	if isCursorShowing() then
		local sx,sy = guiGetScreenSize()
		local cx,cy = getCursorPosition()
		local cx,cy = (cx*sx),(cy*sy)
		if (cx >= x and cx <= x+w) and (cy >= y and cy <= y+h) then
			return true
		end
	end
end

function message(text, type)
    exports.a_infobox:addBox(text, type)
end   