----------------------------------------------------------------------------------------------------------------------------------------
--local enter = createMarker(1298.529, -797.987, 84.141 + 0.75, "arrow", 1.25, 255, 255, 255, 100)
--local exit = createMarker(1298.929, -797.002, 1084.008 + 0.75, "arrow", 1.25, 255, 255, 255, 100)
--local obj = createObject(2533.502, -1666.769, 15.164, 0, 0, 270)
local marker = createMarker(-1457.419, -1464.771, 101.758 -1, "cylinder", 1.10, 102, 127, 201, 100)
local marker2 = createMarker(-1455.469, -1464.824, 101.758 -1, "cylinder", 1.10, 102, 127, 201, 100)
--local int = 0
--local dim = 0
local ACL = "Gang"
--setElementInterior(exit, int)
--setElementDimension(exit, dim)
--setElementInterior(obj, int)
--setElementDimension(obj, dim)
--setElementInterior(marker, int)
--setElementDimension(marker, dim)
----------------------------------------------------------------------------------------------------------------------------------------
--[[function Enter(playerSource)
	if getElementType(playerSource) == "player" then
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup(ACL)) then
			if getElementDimension(playerSource) == 0 and getElementInterior(playerSource) == 0 then
				if not isPedInVehicle(playerSource) then
					fadeCamera(playerSource, false, 0.5)
					setTimer(function() 
						setElementInterior(playerSource, int)
						setElementDimension(playerSource, dim)
						setElementPosition(playerSource, 1298.892, -795.718, 1084.008)
						setElementRotation(playerSource, 0, 0, 0)
						setCameraTarget(playerSource, playerSource)
						fadeCamera(playerSource, true, 0.5)
					end, 1000, 1)
				end
			end
		end
	end
end
addEventHandler("onMarkerHit", enter, Enter)
----------------------------------------------------------------------------------------------------------------------------------------
function Exit(playerSource)
	if getElementType(playerSource) == "player" then
		if getElementDimension(playerSource) == dim and getElementInterior(playerSource) == int then
			fadeCamera(playerSource, false, 0.5)
			setTimer(function() 
				setElementInterior(playerSource, 0)
				setElementDimension(playerSource, 0)
				setElementPosition(playerSource, 1298.485, -799.569, 84.141)
				setElementRotation(playerSource, 0, 0, 180)
				setCameraTarget(playerSource, playerSource)
				fadeCamera(playerSource, true, 0.5)
			end, 1000, 1)
		end
	end
end
addEventHandler("onMarkerHit", exit, Exit)
]]
----------------------------------------------------------------------------------------------------------------------------------------
function showPanel(playerSource)
	if getElementType(playerSource) == "player" then
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup(ACL)) then
			triggerClientEvent(playerSource, "Toggle", resourceRoot)
		end
	end
end
addEventHandler("onMarkerHit", marker, showPanel)
----------------------------------------------------------------------------------------------------------------------------------------
function start(playerSource, qntd)
	if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "budmaconha", 0, qntd, nil) then
		if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "plastico", 0, qntd, nil) then
			local x, y, z = getElementPosition(playerSource)
			local x2, y2, z2 = getElementPosition(marker)
			if getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) <= 2 then
				exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "budmaconha", qntd)
				exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "plastico", qntd)
				local time = qntd*2
				if time > 60000*5 then
					time = 60000*5
				elseif time < 60000 then
					time = 60000
				end
				setElementFrozen(playerSource, true)
				toggleAllControls(playerSource, false, true, false)
				setPedAnimation(playerSource, "CASINO", "dealone", -1, true, false, false, false, _, true)
				triggerClientEvent(playerSource, "progressBar", playerSource, time)
				--exports._infobox:addNotification(playerSource, "Embalando maconha...", "info")
				exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "info", "Embalando maconha...")
				setTimer(function()
					local percent = (qntd/30)*30
					setElementFrozen(playerSource, false)
					toggleAllControls(playerSource, true)
					setPedAnimation(playerSource, nil)
					exports["[GlobalDrops]InventarioCompleto"]:sendItem(playerSource, "maconha", 0, qntd, "none", false)
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "success", "Voce Embalou  "..qntd.."x 'de maconha'")
					triggerEvent("GiveExp", playerSource, playerSource, 3)
					--exports._infobox:addNotification(playerSource, "Voce Embalou  "..qntd.."x 'de maconha'", "money")
				end, time, 1)
			end
		else
			exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não possui "..qntd.."x 'Embalagem de Plástico' na sua mochila.")
		end
	else
		--exports._infobox:addNotification(playerSource, "Você não possui "..qntd.."x 'plastico' na sua mochila", "error")
		exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não possui "..qntd.."x 'Bud de Maconha' na sua mochila.")
	end
end
addEvent("Start", true)
addEventHandler("Start", resourceRoot, start)
----------------------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------------------------------
function showPanel(playerSource)
	if getElementType(playerSource) == "player" then
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup(ACL)) then
			triggerClientEvent(playerSource, "Toggle", resourceRoot)
		end
	end
end
addEventHandler("onMarkerHit", marker2, showPanel)
----------------------------------------------------------------------------------------------------------------------------------------
function start(playerSource, qntd)
	if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "budmaconha", 0, qntd, nil) then
		if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "plastico", 0, qntd, nil) then
			local x, y, z = getElementPosition(playerSource)
			local x2, y2, z2 = getElementPosition(marker2)
			if getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) <= 2 then
				exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "budmaconha", qntd)
				exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "plastico", qntd)
				local time = qntd*2
				if time > 60000*5 then
					time = 60000*5
				elseif time < 60000 then
					time = 60000
				end
				setElementFrozen(playerSource, true)
				toggleAllControls(playerSource, false, true, false)
				setPedAnimation(playerSource, "CASINO", "dealone", -1, true, false, false, false, _, true)
				triggerClientEvent(playerSource, "progressBar", playerSource, time)
				--exports._infobox:addNotification(playerSource, "Embalando maconha...", "info")
				exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "info", "Embalando maconha...")
				setTimer(function()
					local percent = (qntd/30)*30
					setElementFrozen(playerSource, false)
					toggleAllControls(playerSource, true)
					setPedAnimation(playerSource, nil)
					exports["[GlobalDrops]InventarioCompleto"]:sendItem(playerSource, "maconha", 0, qntd, "none", false)
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "success", "Voce Embalou  "..qntd.."x 'de maconha'")
					triggerEvent("GiveExp", playerSource, playerSource, 3)
					--exports._infobox:addNotification(playerSource, "Voce Embalou  "..qntd.."x 'de maconha'", "money")
				end, time, 1)
			end
		else
			exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não possui "..qntd.."x 'Embalagem de Plástico' na sua mochila.")
		end
	else
		--exports._infobox:addNotification(playerSource, "Você não possui "..qntd.."x 'plastico' na sua mochila", "error")
		exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não possui "..qntd.."x 'Bud de Maconha' na sua mochila.")
	end
end
addEvent("Start", true)
addEventHandler("Start", resourceRoot, start)
----------------------------------------------------------------------------------------------------------------------------------------