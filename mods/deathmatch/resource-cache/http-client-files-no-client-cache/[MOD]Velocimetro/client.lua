--[[
===========================================================
# Minha página: https://www.facebook.com/TioSteinScripter/#
#      ╔════╗╔══╗╔═══╗     ╔═══╗╔════╗╔═══╗╔══╗╔═╗─╔╗     #
#      ║╔╗╔╗║╚╣─╝║╔═╗║     ║╔═╗║║╔╗╔╗║║╔══╝╚╣─╝║║╚╗║║     #
#      ╚╝║║╚╝─║║─║║─║║     ║╚══╗╚╝║║╚╝║╚══╗─║║─║╔╗╚╝║     #
#      ──║║───║║─║║─║║     ╚══╗║──║║──║╔══╝─║║─║║╚╗║║     #
#      ──║║──╔╣─╗║╚═╝║     ║╚═╝║──║║──║╚══╗╔╣─╗║║─║║║     #
#      ──╚╝──╚══╝╚═══╝     ╚═══╝──╚╝──╚═══╝╚══╝╚╝─╚═╝     #
===========================================================
--]]

local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1920), (screenH/1080)

local voice = false
local velo = false
local hud = true
local fonts = {}
local anim = {}

fonts["font01"] = dxCreateFont("font/OpenSans-Bold.ttf", x*26)
fonts["font02"] = dxCreateFont("font/OpenSans-Bold.ttf", x*12)


--[[
         ><><><><><><><><><><><><><><><><><><><><
         ><          Painel Inicial            ><
         ><><><><><><><><><><><><><><><><><><><><
--]]
tick = getTickCount()
function dxHud ()
	if velo == false then 
		local veh = getPedOccupiedVehicle(localPlayer) 
		if veh then 
			checkVeh(localPlayer)
		end
		if hud == false then
			anim["Anim01"] = interpolateBetween ( 1430, 0, 0, 1667, 0, 0, ((getTickCount()-tick)/500), "Linear")
			anim["Anim02"] = interpolateBetween ( 1471, 0, 0, 1708, 0, 0, ((getTickCount()-tick)/500), "Linear")
			anim["Anim03"] = interpolateBetween ( 1614, 0, 0, 1920, 0, 0, ((getTickCount()-tick)/800), "Linear")
			anim["Anim04"] = interpolateBetween ( 1591, 0, 0, 1920, 0, 0, ((getTickCount()-tick)/700), "Linear")
			anim["Anim05"] = interpolateBetween ( 1813, 0, 0, 2000, 0, 0, ((getTickCount()-tick)/1000), "Linear")
			anim["Anim06"] = interpolateBetween ( 1817, 0, 0, 2000, 0, 0, ((getTickCount()-tick)/1000), "Linear")
			anim["Anim07"] = interpolateBetween ( 1662, 0, 0, 1920, 0, 0, ((getTickCount()-tick)/1000), "Linear")
			anim["Anim08"] = interpolateBetween ( 1702, 0, 0, 1920, 0, 0, ((getTickCount()-tick)/1000), "Linear")
			anim["Anim09"] = interpolateBetween ( 1618, 0, 0, 4000, 0, 0, ((getTickCount()-tick)/800), "Linear")
			anim["Anim10"] = interpolateBetween ( 1668, 0, 0, 4000, 0, 0, ((getTickCount()-tick)/800), "Linear")
		else
			anim["Anim01"] = 1667
			anim["Anim02"] = 1708
			anim["Anim03"] = 1920
			anim["Anim04"] = 1920
			anim["Anim05"] = 2000
			anim["Anim06"] = 2000
			anim["Anim07"] = 1920
			anim["Anim08"] = 1920
			anim["Anim09"] = 4000
			anim["Anim10"] = 4000
		end
		local Vida = (getElementHealth(localPlayer))
		local Colete = (getPedArmor(localPlayer))
		if voice == false then
			dxDrawImage(x*anim["Anim01"], y*915, x*181, y*120, "vida-colete.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		else
			dxDrawImage(x*anim["Anim01"], y*915, x*181, y*120, "vida-colete2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		end
		dxDrawImage(x*anim["Anim02"], y*964, x*109, y*15, "vida.png", 0, 0, 0, tocolor(0, 0, 0, 100), false)
		dxDrawImage(x*anim["Anim02"], y*964, x*109*Vida/100, y*15, "vida.png", 0, 0, 0, tocolor(220, 0, 83, 255), false)
		dxDrawImage(x*anim["Anim02"], y*993, x*109, y*15, "vida.png", 0, 0, 0, tocolor(0, 0, 0, 100), false)
		dxDrawImage(x*anim["Anim02"], y*993, x*109*Colete/100, y*15, "vida.png", 0, 0, 0, tocolor(98, 98, 98, 255), false)
		dxDrawImage(x*anim["Anim03"], y*915, x*248, y*151, "velocimetro.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawText(0, x*anim["Anim09"], y*947, x*1760, y*1000, tocolor(255, 255, 255, 255), 1.00, fonts["font01"], "center", "center", false, false, false, false, false)
		dxDrawText(0, x*anim["Anim10"], y*990, x*1712, y*1040, tocolor(255, 255, 255, 255), 1.00, fonts["font02"], "center", "center", false, false, false, false, false)
		dxDrawImage(x*anim["Anim05"], y*952, x*18, y*19, "cinto.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawImage(x*anim["Anim05"], y*976, x*24, y*24, "farol.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawImage(x*anim["Anim06"], y*1005, x*20, y*21, "gas.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawImage(x*anim["Anim07"], y*932, x*14, y*10, "seta.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawImage(x*anim["Anim08"], y*932, x*14, y*10, "seta.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
	end
end
addEventHandler ( "onClientRender", root, dxHud )

function dxVelo()
	if velo == true then
		local veh = getPedOccupiedVehicle(localPlayer) 
		anim["Anim01"] = interpolateBetween ( 1667, 0, 0, 1430, 0, 0, ((getTickCount()-tick)/500), "Linear")
		anim["Anim02"] = interpolateBetween ( 1708, 0, 0, 1471, 0, 0, ((getTickCount()-tick)/500), "Linear")
		anim["Anim03"] = interpolateBetween ( 1920, 0, 0, 1614, 0, 0, ((getTickCount()-tick)/800), "Linear")
		anim["Anim04"] = interpolateBetween ( 1920, 0, 0, 1591, 0, 0, ((getTickCount()-tick)/700), "Linear")
		anim["Anim05"] = interpolateBetween ( 2000, 0, 0, 1813, 0, 0, ((getTickCount()-tick)/1000), "Linear")
		anim["Anim06"] = interpolateBetween ( 2000, 0, 0, 1817, 0, 0, ((getTickCount()-tick)/1000), "Linear")
		anim["Anim07"] = interpolateBetween ( 1920, 0, 0, 1662, 0, 0, ((getTickCount()-tick)/1000), "Linear")
		anim["Anim08"] = interpolateBetween ( 1920, 0, 0, 1702, 0, 0, ((getTickCount()-tick)/1000), "Linear")
		anim["Anim09"] = interpolateBetween ( 2000, 0, 0, 1618, 0, 0, ((getTickCount()-tick)/800), "Linear")
		anim["Anim10"] = interpolateBetween ( 2000, 0, 0, 1668, 0, 0, ((getTickCount()-tick)/800), "Linear")
		local Vida = (getElementHealth(localPlayer))
		local Colete = (getPedArmor(localPlayer))
		if voice == false then
			dxDrawImage(x*anim["Anim01"], y*915, x*181, y*120, "vida-colete.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		else
			dxDrawImage(x*anim["Anim01"], y*915, x*181, y*120, "vida-colete2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		end
		dxDrawImage(x*anim["Anim02"], y*964, x*109, y*15, "vida.png", 0, 0, 0, tocolor(0, 0, 0, 100), false)
		dxDrawImage(x*anim["Anim02"], y*964, x*109*Vida/100, y*15, "vida.png", 0, 0, 0, tocolor(220, 0, 83, 255), false)
		dxDrawImage(x*anim["Anim02"], y*993, x*109, y*15, "vida.png", 0, 0, 0, tocolor(0, 0, 0, 100), false)
		dxDrawImage(x*anim["Anim02"], y*993, x*109*Colete/100, y*15, "vida.png", 0, 0, 0, tocolor(98, 98, 98, 255), false)
		if veh then
			local speedx, speedy, speedz = getElementVelocity ( veh )
			local vehicleRPM = math.floor(((getElementSpeed(veh, "km/h") / getVehicleCurrentGear(veh)) * 160) + 0.5) or 0
			dxDrawImage(x*anim["Anim03"], y*915, x*248, y*151, "velocimetro.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawText(getElementSpeed(veh), x*anim["Anim09"], y*947, x*1760, y*1000, tocolor(255, 255, 255, 255), 1.00, fonts["font01"], "center", "center", false, false, false, false, false)
			if getVehicleCurrentGear(veh) >= 1 then
				dxDrawText(tostring(getVehicleCurrentGear(veh)), x*anim["Anim10"], y*990, x*1712, y*1040, tocolor(255, 255, 255, 255), 1.00, fonts["font02"], "center", "center", false, false, false, false, false)
			else
				dxDrawText("R", x*anim["Anim10"], y*990, x*1712, y*1040, tocolor(255, 255, 255, 255), 1.00, fonts["font02"], "center", "center", false, false, false, false, false)
			end
			if getElementData(localPlayer,"Cinto") == "Cinto>Colocado" then
				dxDrawImage(x*anim["Anim05"], y*952, x*18, y*19, "cinto.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			else
				dxDrawImage(x*anim["Anim05"], y*952, x*18, y*19, "cinto.png", 0, 0, 0, tocolor(255, 0, 0, 255), false)
			end
			if getVehicleOverrideLights(veh) == 2 then
				dxDrawImage(x*anim["Anim05"], y*976, x*24, y*24, "farol.png", 0, 0, 0, tocolor(0, 0, 255, 255), false)
			else
				dxDrawImage(x*anim["Anim05"], y*976, x*24, y*24, "farol.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			end
			if tonumber(getElementData(veh, "fuel") or 0) <= 20 then
				dxDrawImage(x*anim["Anim06"], y*1005, x*20, y*21, "gas.png", 0, 0, 0, tocolor(248, 255, 71, 255), false)
			else
				dxDrawImage(x*anim["Anim06"], y*1005, x*20, y*21, "gas.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			end
			dxDrawImage(x*anim["Anim07"], y*932, x*14, y*10, "seta.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawImage(x*anim["Anim08"], y*932, x*14, y*10, "seta.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
		end
	end
end

--[[
         ><><><><><><><><><><><><><><><><><><><><
         ><      Configurações N Altere        ><
         ><><><><><><><><><><><><><><><><><><><><
--]]

function checkVeh()
	tick = getTickCount()
	if getPedOccupiedVehicle(localPlayer) then
		velo = true
		removeEventHandler ( "onClientRender", root, dxHud )
		removeEventHandler ( "onClientRender", root, dxVelo )
		addEventHandler ( "onClientRender", root, dxVelo )
		hud = false
	else
		velo = false
		removeEventHandler ( "onClientRender", root, dxVelo )
		removeEventHandler ( "onClientRender", root, dxHud )
		addEventHandler ( "onClientRender", root, dxHud )
		hud = false
	end
end
addEvent("TS:Velo", true)
addEventHandler("TS:Velo", root, checkVeh)

function getElementSpeed(element)
	r = 0
	if isElement(element) then
		local speedx, speedy, speedz = getElementVelocity ( element )
		r = math.floor((speedx^2 + speedy^2 + speedz^2)^(0.5)*180)
	end
	return r
end

function voiceOn (button, press)
	if button == "z" then
		if (press) then
			voice = true
		else
			voice = false
		end
	end
end
addEventHandler ( "onClientKey", root, voiceOn)


function isCursorOnElement ( x, y, w, h )
	local mx, my = getCursorPosition ()
	local fullx, fully = guiGetScreenSize ()
	cursorx, cursory = mx*fullx, my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
	return false
	end
end

function drawBorde(x, y, w, h, borderColor, bgColor, postGUI)
  if (x and y and w and h) then
      if (not borderColor) then
          borderColor = tocolor(0, 0, 0, 200)
      end
      
      if (not bgColor) then
          bgColor = borderColor
      end        
      postGUI = false

      dxDrawRectangle(x, y, w, h, bgColor, postGUI)

      dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI) -- top
      dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI) -- bottom
      dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI) -- left
      dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI) -- right
  end
end
