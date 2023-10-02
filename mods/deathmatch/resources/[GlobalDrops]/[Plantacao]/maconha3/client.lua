----------------------------------------------------------------------------------------------------------------------------------------
local screenW, screenH = guiGetScreenSize()
local isPanelVisible = false
local labelQuantidade = guiCreateEdit(0.40, 0.5675, 0.12, 0.04, "Quantidade", true)
guiSetAlpha(labelQuantidade, 0)
guiSetVisible(labelQuantidade, false)
function onStart()
    font1 = dxCreateFont("Roboto.ttf", 10)
    font2 = dxCreateFont("RobotoBold.ttf", 10)
end
addEventHandler("onClientResourceStart", resourceRoot, onStart)
----------------------------------------------------------------------------------------------------------------------------------------
function render()
	editQuantidade = guiGetText(labelQuantidade)
	dxDrawRectangle(screenW * 0.3946, screenH * 0.3164, screenW * 0.2116, screenH * 0.3672, tocolor(25, 25, 25, 254), false)--background
	dxDrawRectangle(screenW * 0.5717, screenH * 0.3164, screenW * 0.0344, screenH * 0.0456, tocolor(190, 0, 0, 255), false)--close
	dxDrawRectangle(screenW * 0.4510, screenH * 0.3737, screenW * 0.0988, screenH * 0.1497, tocolor(45, 45, 45, 255), false)--slotitemselected
	dxDrawRectangle(screenW * 0.4019, screenH * 0.5677, screenW * 0.1171, screenH * 0.0391, tocolor(45, 45, 45, 255), false)--background qntd
	dxDrawLine(screenW * 0.4019, screenH * 0.6055, screenW * 0.5185, screenH * 0.6055, tocolor(68, 68, 68, 255), 2, false)--line qntd
	dxDrawRectangle(screenW * 0.4019, screenH * 0.6237, screenW * 0.1969, screenH * 0.0469, tocolor(45, 45, 45, 255), false)--buy
	dxDrawText("X", screenW * 0.5717, screenH * 0.3164, screenW * 0.6061, screenH * 0.3620, tocolor(255, 255, 255, 255), 1.00, font2, "center", "center", false, false, false, false, false)
	dxDrawText("Embalar", screenW * 0.4019, screenH * 0.6237, screenW * 0.5988, screenH * 0.6706, tocolor(255, 255, 255, 255), 1.00, font2, "center", "center", false, false, false, false, false)
	dxDrawText("  "..editQuantidade, screenW * 0.4026, screenH * 0.5677, screenW * 0.5183, screenH * 0.6068, tocolor(110, 110, 110, 255), 1.00, font1, "left", "center", false, false, false, false, false)
	dxDrawText("    Embalar Maconha", screenW * 0.3946, screenH * 0.3164, screenW * 0.5717, screenH * 0.3620, tocolor(255, 255, 255, 255), 1.00, font2, "left", "center", false, false, false, false, false)
	dxDrawImage(screenW * 0.4729, screenH * 0.3919, screenW * 0.0549, screenH * 0.0977, "plastico.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	if tonumber(editQuantidade) then
		local percent = (editQuantidade/100)*100
		dxDrawText("Quantidade: "..percent, screenW * 0.5256, screenH * 0.5677, screenW * 0.5981, screenH * 0.6068, tocolor(255, 255, 255, 255), 1.00, font1, "right", "center", false, false, false, false, false)
	else
		dxDrawText("quantidade: 0", screenW * 0.5256, screenH * 0.5677, screenW * 0.5981, screenH * 0.6068, tocolor(255, 255, 255, 255), 1.00, font1, "right", "center", false, false, false, false, false)
	end
end
----------------------------------------------------------------------------------------------------------------------------------------
function toggle()
	if not (isPanelVisible) then
		isPanelVisible = true
		showCursor(true)
		addEventHandler("onClientRender", root, render)
		guiSetVisible(labelQuantidade, true)
		guiSetText(labelQuantidade, "Quantidade")
	end
end
addEvent("Toggle", true)
addEventHandler("Toggle", resourceRoot, toggle)
-------------------------------------------------------------------------------------------------------------------------------------------------
function onClick(button, state)
	if (button == "left" and state == "down") then
    	if (isPanelVisible) then
    		if isCursorOnElement(screenW * 0.5717, screenH * 0.3164, screenW * 0.0344, screenH * 0.0456) then
				isPanelVisible = false
				showCursor(false)
				removeEventHandler("onClientRender", root, render)
				guiSetVisible(labelQuantidade, false)
			elseif isCursorOnElement(screenW * 0.4019, screenH * 0.5677, screenW * 0.1171, screenH * 0.0391) then
				if not tonumber(editQuantidade) then
					guiSetText(labelQuantidade, "")
				end
			elseif isCursorOnElement(screenW * 0.4019, screenH * 0.6237, screenW * 0.1969, screenH * 0.0469) then
				if tonumber(editQuantidade) and tonumber(editQuantidade) > 0 then
					triggerServerEvent("Start", resourceRoot, localPlayer, tonumber(editQuantidade))
					isPanelVisible = false
					showCursor(false)
					removeEventHandler("onClientRender", root, render)
					guiSetVisible(labelQuantidade, false)
				else
					exports._infobox:addNotification("Digite um número válido no campo 'Quantidade'", "error")
				end
			end
		end
    end
end
addEventHandler("onClientClick", root, onClick)
-------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------
function isCursorOnElement(x, y, w, h)
	if isCursorShowing() then
		local mx, my = getCursorPosition()
		local fullx, fully = guiGetScreenSize()
		local cursorx, cursory = mx*fullx, my*fully
		if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
			return true
		else
			return false
		end
	else
		return false
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------