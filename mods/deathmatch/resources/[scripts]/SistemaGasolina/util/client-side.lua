for i, v in ipairs(peds) do
	local ped = createPed(v[1], v[2], v[3], v[4], v[5])
	setElementFrozen(ped, true)
	setElementData(ped, "MD:PedPosto", true)

	addEventHandler("onClientPedDamage", ped, function()
		cancelEvent()
	end)
	
end

local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1366), (screenH/768)
tick = getTickCount()

local LitroText = createElement('CS:LitrosEditBox')

function draw_Abastecer()
	local color1 = tocolor(0, 0, 0, 150)
	local color2 = tocolor(0, 0, 0, 150)

	local veh = getPedOccupiedVehicle(localPlayer)
	if (veh) then	
		gasolina = tonumber(getElementData(veh, "MD:Gasolina")) or 0
	end

	if isCursorOnElement(x*634, y*480, x*130, y*30) then color1 = tocolor(255, 0, 0, 255) end
	if isCursorOnElement(x*634, y*440, x*130, y*30) then color2 = tocolor(255, 0, 0, 255) end

    dxDrawRectangle(x*514, y*270, x*365, y*260, tocolor(0, 0, 0, 150), false)
    dxDrawLine(x*877, y*270, x*877, y*530, tocolor(255, 0, 0, 255), x*6, false)
    dxDrawText("Pressione backspace para fechar", x*588, y*573, x*834, y*583, tocolor(255, 255, 255, 255), x*1.00, "clear", "left", "top", false, false, false, false, false)
    dxDrawRectangle(x*515, y*271, x*358, y*31, tocolor(0, 0, 0, 150), false)
    dxDrawText("Posto de Gasolina", x*640, y*276, x*746, y*288, tocolor(255, 0, 0, 255), x*1.20, "default-bold", "left", "top", false, false, false, true, false)
    dxDrawRectangle(x*514, y*536, x*366, y*27, tocolor(0, 0, 0, 150), false)
    dxDrawRectangle(x*514, y*536, x*gasolina*3.660, y*27, tocolor(69, 69, 69, 255), false)
    dxDrawText("Sua Gasolina: "..math.floor(gasolina).."%", x*650, y*543, x*804, y*553, tocolor(0, 255, 0, 255), x*1.10, "default-bold", "left", "top", false, false, false, false, false)
	dxDrawRectangle(x*634, y*480, x*130, y*30, color1, false)

	dxDrawRectangle(x*634, y*440, x*130, y*30, color2, false)
   	dxDrawText("Abastecer", x*663, y*486, x*735, y*488, tocolor(255, 255, 255, 255), x*1.20, "arial", "left", "top", false, false, false, false, false)
	dxDrawImage(x*660, y*340, x*80, y*80, "util/gfx/bomba.png", 0, 0, 0, tocolor(255, 0, 0, 255), false)
	dxDrawEditBox("Litros", x*634, y*440, x*130, y*30, false, 3, LitroText)
end

bindKey("backspace", "down", function()
	if isEventHandlerAdded("onClientRender", root, draw_Abastecer) then
		removeEventHandler("onClientRender", root, draw_Abastecer)
		triggerServerEvent("MD:RemoveDataPed", localPlayer)
		playSoundFrontEnd(17)
	end
end)

addEventHandler("onClientClick", root,
	function(_, state)
		if isEventHandlerAdded("onClientRender", root, draw_Abastecer) then
			if (state == "down") then
				if isCursorOnElement(x*634, y*480, x*130, y*30) then
					local litros = getElementData(LitroText, 'text')
					if not string.find(litros, '+') and not string.find(litros, '-') then
						triggerServerEvent("MD:OnClickAbastecer", localPlayer, litros)
					else
						triggerEvent("N3xT.dxNotification", localPlayer, "Digite um número sem símbolos.", "error")
					end
				end
			end
		end
	end
)

function distPed()
	local ped_v = getElementData(localPlayer, "Ped_v")

	if (ped_v) and isElement(ped_v) then
		if (getElementType(ped_v) == "ped") then
			local dist_ped = Vector3(getElementPosition(ped_v))
			local dist_player = Vector3(getElementPosition(localPlayer))
			local dist = getDistanceBetweenPoints3D(dist_player, dist_ped)
		
			if (dist >= 5) then
				triggerServerEvent("MD:RemoveDataPed", localPlayer)
				removeEventHandler("onClientRender", root, draw_Abastecer)
				--playSoundFrontEnd(17)
			end
		end
	end

	if isEventHandlerAdded("onClientRender", root, draw_Abastecer) then
		if not isPedInVehicle(localPlayer) then
			removeEventHandler("onClientRender", root, draw_Abastecer)
			triggerServerEvent("MD:RemoveDataPed", localPlayer)
		end
	end
end
addEventHandler("onClientRender", root, distPed)

addEventHandler("onClientVehicleEnter", root,
	function()
		local veh = getPedOccupiedVehicle(localPlayer)
    	if (veh) then
    		for i, v in ipairs(veiculos) do
				if (getElementModel(veh) == v) then
					if not getElementData(veh, "MD:Gasolina") then
						setElementData(veh, "MD:Gasolina", 100.9)
					end
				end
			end
		end		
	end
)

function setCombustivel()
	local veh = getPedOccupiedVehicle(localPlayer)

	if (veh) then
		for i, v in ipairs(veiculos) do
			if (getElementModel(veh) == v) then
				local gasolina = tonumber(getElementData(veh, "MD:Gasolina")) or 0
				if (gasolina > 0) then
					VelocidadeX, VelocidadeY, VelocidadeZ = getElementVelocity(veh)
					VelocidadeAtual = (VelocidadeX ^ 2 + VelocidadeY ^ 2 + VelocidadeZ ^ 2) ^ (0.5)
					KMH = math.floor(VelocidadeAtual * 250)

					if (KMH > 0) then
						setElementData(veh, "MD:Gasolina", gasolina - 0.1)
					end
				else
					setVehicleEngineState(veh, false)
				end
			end
		end
	end
end
setTimer(setCombustivel, 3000, 0)

addEventHandler("onClientClick", root,
	function(_, state, _, _, _, _, _, click)
		if (click) then
			if (getElementType(click) == "ped") and (state == "down") then
				if getElementData(click, "MD:PedPosto", true) then
					for k, m in ipairs(getElementsByType("marker")) do
						if getElementData(m, "Abastecer", true) then
							if isElementWithinMarker(localPlayer, m) then
								local veh = getPedOccupiedVehicle(localPlayer)
								if (veh) then
									for i, v in ipairs(veiculos) do
										if (getElementModel(veh) == v) then
											if (getPedOccupiedVehicleSeat(localPlayer) == 0) then
												if not isEventHandlerAdded('onClientRender', root, draw_Abastecer) then
													addEventHandler("onClientRender", root, draw_Abastecer)
													setElementData(localPlayer, "Ped_v", click)
													playSoundFrontEnd(7)
													valorgasolina = 1
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
)

function wolrdTexts()
	for i, p in ipairs(getElementsByType("ped")) do
		if getElementData(p, "MD:PedPosto", true) then
			dxDrawTextOnElement(p, "#ffffffFrentista", 1, 100, 255, 255, 255, 255, 1, "default-bold-small")
		end
	end
end
addEventHandler("onClientRender", getRootElement(), wolrdTexts)

function dxDrawTextOnElement(TheElement,text,height,distance,R,G,B,alpha,size,font, ...)
    local x, y, z = getElementPosition(TheElement)
    local x2, y2, z2 = getCameraMatrix()
    local distance = distance or 100
    local height = height or 1
    local value1 = 2
    local value2 = 2
    local sx, sy = getScreenFromWorldPosition(x, y, z+height)

    if(sx) and (sy) then
        local distanceBetweenPoints = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
        if(distanceBetweenPoints < distance) then
            dxDrawText(text, sx+value1, sy+value2-30, sx, sy, tocolor(R or 255, G or 255, B or 255, alpha or 255), (size or 1)-(distanceBetweenPoints / distance), font or "arial", "center", "center", false, false, false, true, false)
        end
    end
end

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

local x,y = guiGetScreenSize()
function isCursorOnElement(x, y, w, h)
	if (not isCursorShowing()) then
		return false
	end
	local mx, my = getCursorPosition()
	local fullx, fully = guiGetScreenSize()
	cursorx, cursory = mx*fullx, my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end

function dxDrawEditBox(text, x, y, w, h, password, maxCharacter, element)
	local getText = getElementData(element, 'text') or setElementData(element, 'text', '')
	local state = getElementData(element, 'state') or setElementData(element, 'state', false)
	local character = getElementData(element, 'maximum') or setElementData(element, 'maximum', maxCharacter)

	if (#getElementData(element, 'text') == 0) then
		dxDrawText(text, x + 5, y, x + w - 10, y + h, tocolor(255, 255, 255, 255), 1.2, 'arial', 'center', 'center', true, false, false)
	end
	
	if (dxGetTextWidth(password and string.gsub(getElementData(element, 'text'), '.', '•') or getElementData(element, 'text'), 1.2, 'arial') <= w - 10) then
		dxDrawText(password and string.gsub(getElementData(element, 'text'), '.', '•') or getElementData(element, 'text'), x + 5, y, x + w - 10, y + h, tocolor(255, 255, 255, 255), 1.2, 'arial', 'left', 'center', true, false, false)
	else
		dxDrawText(password and string.gsub(getElementData(element, 'text'), '.', '•') or getElementData(element, 'text'), x + 5, y, x + w - 10, y + h, tocolor(255, 255, 255, 255), 1.2, 'arial', 'right', 'center', true, false, false)
	end
	
	if (getElementData(element, 'state') == true) then
		if (dxGetTextWidth(password and string.gsub(getElementData(element, 'text'), '.', '•') or getElementData(element, 'text'), 1.2, 'arial') <= w - 10) then
			dxDrawLine(x + 5 + dxGetTextWidth(password and string.gsub(getElementData(element, 'text'), '.', '•') or getElementData(element, 'text'), 1.2, 'arial'), y + 5, x + 5 + dxGetTextWidth(password and string.gsub(getElementData(element, 'text'), '.', '•') or getElementData(element, 'text'), 1.2, 'arial'), y + h - 5, tocolor(255, 255, 255, math.abs(math.sin(getTickCount() / 255) * 255)), 1, false)
		else
			dxDrawLine(x + w - 10, y + 5, x + w - 10, y + h - 5, tocolor(255, 255, 0, math.abs(math.sin(getTickCount() / 255) * 255)), 1, false)
		end
	end
	
	if (cursorPosition(x, y, w, h)) then
		setElementData(element, 'mouseState', 'hovered')
	else
		setElementData(element, 'mouseState', 'normal')
	end
end

function dxClickElement(button, state, cx, cy)
	if (button == 'left') and (state == 'down') then
		local buttonId = false
		for id, element in ipairs(getElementsByType('dxButton')) do
			if (getElementData(element, 'mouseState') == 'hovered') then
				buttonId = id
			end
		end
		if (buttonId) then
			if (isElement(getElementsByType('dxButton')[buttonId])) then
				setElementData(getElementsByType('dxButton')[buttonId], 'mouseState', 'clicked')
				triggerEvent('onClickButton', getElementsByType('dxButton')[buttonId])
			end
		end
	end
	if (button == 'left') and (state == 'down') then
		local editBoxId = false
		for id, element in ipairs(getElementsByType('CS:LitrosEditBox')) do
			if (getElementData(element, 'mouseState') == 'hovered') then
				editBoxId = id
			elseif (getElementData(element, 'mouseState') == 'normal') then
				if (getElementData(element, 'state') == true) then
					guiSetInputMode('allow_binds')
					setElementData(element, 'state', false)
				end
			end
		end
		if (editBoxId) then
			if (isElement(getElementsByType('CS:LitrosEditBox')[editBoxId])) then
				if (getElementData(getElementsByType('CS:LitrosEditBox')[editBoxId], 'state') == false) then
					guiSetInputMode('no_binds')
					setElementData(getElementsByType('CS:LitrosEditBox')[editBoxId], 'state', true)
				end
			end
		end
	end
	if (button == 'left') and (state == 'down') then
		local checkBoxId = false
		for id, element in ipairs(getElementsByType('dxCheckBox')) do
			if (getElementData(element, 'mouseState') == 'hovered') then
				checkBoxId = id
			end
		end
		if (checkBoxId) then
			if (isElement(getElementsByType('dxCheckBox')[checkBoxId])) then
				if (getElementData(getElementsByType('dxCheckBox')[checkBoxId], 'state') == true) then
					setElementData(getElementsByType('dxCheckBox')[checkBoxId], 'state', false)
				else
					setElementData(getElementsByType('dxCheckBox')[checkBoxId], 'state', true)
				end
			end
		end
	end
	if (button == 'left') then
		for _, element in ipairs(getElementsByType('dxGridList')) do
			if (getElementData(element, 'mouseState') == 'hovered') then
				local barCount = getElementData(element, 'barCount')
				local barList = getElementData(element, 'barList')
				if (#barList > barCount) then
					local x = getElementData(element, 'x')
					local y = getElementData(element, 'y')
					local w = getElementData(element, 'w')
					local h = getElementData(element, 'h')
					local scrollOffset = getElementData(element, 'scrollOffset')
					local scrollY = getElementData(element, 'scrollY')
					local scrollSpace = #barList > barCount and 11 or 0
					local size = barCount / #barList
					local scrollList = scrollOffset / #barList
					if (state == 'down') then
						if (cx >= x + w - scrollSpace) and (cx <= x + w - scrollSpace + 3) and (cy >= y + scrollList * h) and (cy <= y + scrollList * h + size * h) then
							setElementData(element, 'scrollAlpha', 255)
							setElementData(element, 'scrollAttached', true)
							local mouseOffset = y + scrollY * (1 - size) * h
							setElementData(element, 'scrollAttachedOffset', cy - mouseOffset)
						end
					end
				end
				if (state == 'up') and not (getElementData(element, 'scrollAttached')) then
					setElementData(element, 'selected', {getElementData(element, 'barAttached')[1], getElementData(element, 'barAttached')[2] or ''})
					triggerEvent('loginClick', element)
				end
			end
			if (state == 'up') then
				setElementData(element, 'scrollAttached', false)
				setElementData(element, 'scrollAlpha', 150)
			end
		end
	end
end
addEventHandler('onClientClick', getRootElement(), dxClickElement)

function dxCharacterElement(button)
	if (isChatBoxInputActive()) or (isConsoleActive()) or (isMainMenuActive()) then
		return
	end
	for _, element in ipairs(getElementsByType('CS:LitrosEditBox')) do
		if (getElementData(element, 'state') == true) then
			if (#getElementData(element, 'text') < getElementData(element, 'maximum')) then
				setElementData(element, 'text', getElementData(element, 'text')..button)
			end
		end
	end
end
addEventHandler('onClientCharacter', getRootElement(), dxCharacterElement)

function dxKeyElement(button, press)
	if (isChatBoxInputActive()) or (isConsoleActive()) or (isMainMenuActive()) then
		return
	end
	if (press) and (button == 'backspace') then
		for _, element in ipairs(getElementsByType('CS:LitrosEditBox')) do
			if (getElementData(element, 'state') == true) then
				if (#getElementData(element, 'text') > 0) then
					setElementData(element, 'text', string.sub(getElementData(element, 'text'), 1, #getElementData(element, 'text') - 1))
				end
			end
		end
	end
end
addEventHandler('onClientKey', getRootElement(), dxKeyElement)

function cursorPosition(x, y, width, height)
    if(not isCursorShowing()) then
        return false
    end
    local sx, sy = guiGetScreenSize()
    local cx, cy = getCursorPosition()
    local cx, cy =(cx*sx),(cy*sy)
    if(cx >= x and cx <= x + width) and(cy >= y and cy <= y + height) then
        return true
    else
        return false
    end
end