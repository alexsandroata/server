local marker = createMarker(0, "cylinder", 2, 255, 255, 255, 50)
local ACL = "Mafia"
local rotation = -0, 0, 342.406
local r, g, b = 5, 5, 5
local id = 458
veh = {}

function spawnVTR(playerSource)
	if isElement(playerSource) then
		if getElementType(playerSource) == "player" then
			if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup(ACL)) then
				if not isPedInVehicle(playerSource) then
					if not isElement(veh[playerSource]) then
						local x, y, z = getElementPosition(marker)
						veh[playerSource] = createVehicle(id, x, y, z + 1, 0, 0, rotation)
						setElementData(veh[playerSource], "Key", playerSource)
						setVehicleColor(veh[playerSource], r, g, b)
						warpPedIntoVehicle(playerSource, veh[playerSource])
					else
						destroyElement(veh[playerSource])
						veh[playerSource] = nil
					end
				else
					if isElement(veh[playerSource]) then
						if getPedOccupiedVehicle(playerSource) == veh[playerSource] then
							destroyElement(veh[playerSource])
							veh[playerSource] = nil
						end
					end
				end
			end
		end
	end
end
addEventHandler("onMarkerHit", marker, spawnVTR)

function onQuit()
	if isElement(veh[source]) then 
		destroyElement(veh[source])
		veh[source] = nil
	end
end
addEventHandler("onPlayerQuit", root, onQuit)