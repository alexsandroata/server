local drawFont = dxCreateFont("font/draw.ttf", 8)
local drawFontCity = dxCreateFont("font/draw.ttf", 25)

local scx, scy = guiGetScreenSize()

function updateGUIElements()
	drawAvatar()
end

-- ## New City Draw Region

local lastCity = ""
local cityDraw = false
local cityDrawTimer
local cityDrawAlpha = 0
local cityDrawAlphaBoolean = true
local cityDrawTime = 0
local cityDrawTimeI = getTickCount()

addEventHandler("onClientRender", root, function()
	checkNewCity()
end)

function checkNewCity()
	local city = getZoneName(getElementPosition(localPlayer))
	if city ~= lastCity then
		lastCity = city
		if cityDraw then
			killTimer(cityDrawTimer)
			cityDrawTimer = setTimer(function() removeEventHandler("onClientRender", root, drawCity) cityDraw = false cityDrawAlpha = 0 end, 5000, 1)
		else
			addEventHandler("onClientRender", root, drawCity)
			cityDrawTimer = setTimer(function() removeEventHandler("onClientRender", root, drawCity) cityDraw = false cityDrawAlpha = 0 end, 5000, 1)
			cityDraw = true
			cityDrawAlphaBoolean = true
		end
		cityDrawTimeI = getTickCount()
	end
end

function drawCity()
	if cityDrawAlpha < 255 and cityDrawAlphaBoolean then
		cityDrawAlpha = cityDrawAlpha +5
	else
		cityDrawAlphaBoolean = false
	end
	
	if cityDrawTimeI+3000 < getTickCount() then
		if cityDrawAlpha > 0 then
			cityDrawAlpha = cityDrawAlpha - 5
		end
	end
	dxDrawText(lastCity, scx-100+1, scy-165+1, scx-85+1, scy-90+1, tocolor(0, 0, 0, cityDrawAlpha), 1.1, drawFontCity, "right", "top", false, false, true)
	dxDrawText(lastCity, scx-100, scy-165, scx-85, scy-90, tocolor(255, 255, 255, cityDrawAlpha), 1.1, drawFontCity, "right", "top", false, false, true)
end

-- ## END

-- ## Car Region

local lastCar = ""
local carDraw = false
local carDrawTimer
local carDrawAlpha = 0
local carDrawAlphaBoolean = true
local carDrawTime = 0
local carDrawTimeI = getTickCount()

addEventHandler("onClientRender", root, function()
	checkNewCar()
end)

function checkNewCar()
	if not (isPedInVehicle(localPlayer)) then return end
	local car = getPedOccupiedVehicle(localPlayer)
	if not car then return end
	local carname = getVehicleName(car)
	if carname ~= lastCar then
		lastCar = carname
		if carDraw then
			killTimer(carDrawTimer)
			carDrawTimer = setTimer(function() removeEventHandler("onClientRender", root, drawCar) carDraw = false carDrawAlpha = 0 end, 5000, 1)
		else
			addEventHandler("onClientRender", root, drawCar)
			carDrawTimer = setTimer(function() removeEventHandler("onClientRender", root, drawCar) carDraw = false carDrawAlpha = 0 end, 5000, 1)
			carDraw = true
			carDrawAlphaBoolean = true
		end
		carDrawTimeI = getTickCount()
	end
end

function drawCar()
	if carDrawAlpha < 255 and carDrawAlphaBoolean then
		carDrawAlpha = carDrawAlpha +5
	else
		carDrawAlphaBoolean = false
	end
	
	if carDrawTimeI+3000 < getTickCount() then
		if carDrawAlpha > 0 then
			carDrawAlpha = carDrawAlpha - 5
		end
	end
	dxDrawText(lastCar, scx-100+1, scy-125+1, scx-85+1, scy-90+1, tocolor(0, 0, 0, carDrawAlpha), 1.1, drawFontCity, "right", "top", false, false, true)
	dxDrawText(lastCar, scx-100, scy-125, scx-85, scy-90, tocolor(0, 255, 255, carDrawAlpha), 1.1, drawFontCity, "right", "top", false, false, true)
end