local screen = {guiGetScreenSize()} local x, y = (screen[1]/1366), (screen[2]/768) 
local tick = {} local edits = {}
local select = false local sound = {}

function dxDraw()
    local alpha = interpolateBetween(0, 0, 0, 255, 0, 0, ((getTickCount() - tick[1]) / 1000), 'Linear')
    dxDrawImage(x * 499, y * 270, x * 368, y * 226, 'Files/Base.png', 0, 0, 0, tocolor(255, 255, 255, alpha))
    dxDrawText(select == 1 and guiGetText(edits[1])..'|' or guiGetText(edits[1]), x * 508, y * 331, x * 852,  y * 357, tocolor(255, 255, 255, alpha), 1.00, "clear", "center", "center", false, false, false, true, false)
end

bindKey('backspace', 'down', 
    function()
        if isEventHandlerAdded('onClientRender', root, dxDraw) then  
            triggerEvent('Pedro.printJBLC', localPlayer)
        end
    end
)

addEventHandler('onClientClick', root, 
    function(b, s, _, _, _, _, _, element)
        if (b == 'left') and (s == 'down') then 
            if isEventHandlerAdded('onClientRender', root, dxDraw) then 
                select = 0
                if isMouseInPosition(x * 507, y * 332, x * 346, y * 24) then
                    if guiEditSetCaretIndex(edits[1], string.len(guiGetText(edits[1]))) then
                        guiBringToFront(edits[1])
                        guiSetInputMode('no_binds_when_editing') 
                        select = 1
                        if (guiGetText(edits[1]) == 'Musica') then 
                            guiSetText(edits[1], '')
                        end
                    end
                elseif isMouseInPosition(x * 636, y * 397, x * 94, y * 28) then 
                        triggerServerEvent('Pedro.addMusicIndex', localPlayer, localPlayer, guiGetText(edits[1]))
                        guiSetText(edits[1], 'Musica')
                elseif isMouseInPosition(x * 636, y * 447, x * 94, y * 28) then 
                    triggerServerEvent('Pedro.optionsMusicIndex', localPlayer, localPlayer, 'pause')
                elseif isMouseInPosition(x * 519, y * 397, x * 94, y * 28) then 
                    triggerServerEvent('Pedro.optionsMusicIndex', localPlayer, localPlayer, '+')
                elseif isMouseInPosition(x * 753, y * 395, x * 94, y * 28) then 
                    triggerServerEvent('Pedro.optionsMusicIndex', localPlayer, localPlayer, '-')
                end
            end
        end
    end
)

addEvent('Pedro.printJBLC', true)
addEventHandler('Pedro.printJBLC', root, 
    function()
        if not isEventHandlerAdded('onClientRender', root, dxDraw) then
            tick[1] = getTickCount()
            addEventHandler('onClientRender', root, dxDraw)
            showCursor(true)
            EditBox('add')
        else 
            EditBox('remove')
            showCursor(false)
            removeEventHandler('onClientRender', root, dxDraw)
        end
    end
)

addEvent('Pedro.optionsMusic', true)
addEventHandler('Pedro.optionsMusic', root,
    function(type, index)
        if isElement(sound[index]) then 
            if type == '+' then 
                if getSoundVolume(sound[index]) < 6 then 
                    setSoundVolume(sound[index], getSoundVolume(sound[index]) + 0.5)
                end
            elseif type == '-' then 
                if getSoundVolume(sound[index]) > 0.5 then 
                    setSoundVolume(sound[index], getSoundVolume(sound[index]) - 0.5)
                end
            elseif type == 'pause' then 
                if isSoundPaused(sound[index]) then 
                    setSoundPaused(sound[index], false)
                else
                    setSoundPaused(sound[index], true)
                end
            end
        end
    end
)

addEvent('Schootz.stopSound', true)
addEventHandler('Schootz.stopSound', root, 
    function(index)
        if isElement(sound[index]) then 
            stopSound(sound[index])
        end
    end
)

addEvent('Pedro.addMusic', true)
addEventHandler('Pedro.addMusic', root, 
    function(index, x, y, z, int, dim, link)
        if isElement(sound[index]) then 
            stopSound(sound[index])
        end
        sound[index] = playSound3D(tostring(link), x, y, z, true)
        attachElements(sound[index], index)
        setElementInterior(sound[index], int)
        setElementDimension(sound[index], dim)

        setSoundVolume(sound[index], 2)
        setSoundMaxDistance(sound[index], 45)
    end
)

------------------------------------------------
function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
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

function EditBox(tipo)
    if tipo == 'destroy' then
        for i = 1, 1 do    
            if isElement(edits[i]) then 
                destroyElement(edits[i])
            end
        end
    elseif tipo == 'add' then
        edits[1] = guiCreateEdit(-1000, -1000, 0, 0, 'Musica', false)
	end
end
------------------------------------------------        

addEventHandler('onClientResourceStart',resourceRoot,function () 
    txd = engineLoadTXD( 'files/soundbox.txd' ) 
    engineImportTXD( txd, 2226 ) 
    dff = engineLoadDFF('files/soundbox.dff', 2226) 
    engineReplaceModel( dff, 2226 )
    end)
    
    
         