for i, v in ipairs(markers) do
	abastecer = createMarker(v[1], v[2], v[3] -2.1, "cylinder", 1.9, 255, 0, 0, 50 )
	setElementData(abastecer, "Abastecer", true)
	addEventHandler("onMarkerHit", abastecer, function(source)
		if (getElementType(source) == "vehicle") then
			local driver = getVehicleOccupant(source)
			if (driver) then
				for i, v in ipairs(veiculos) do
					if (getElementModel(source) == v) then
						if (getPedOccupiedVehicleSeat(driver) == 0) then
							triggerClientEvent(driver, "N3xT.dxNotification", root, "Clique no #0000ffFrentista #ffffffpara colocar #00ff00Gasolina#ffffff.", "info")
							outputChatBox("#00ff7fINFO #ffffff- Valor litro da #a9a9a9Gasolina #ffffff- #00FF00R$10#ffffff.", driver, 255,255,255, true)
						end
					end
				end
			end
		end
	end)
end

addEvent("MD:RemoveDataPed", true)
addEventHandler("MD:RemoveDataPed", root,
	function()
		removeElementData(source, "Ped_v")
	end
)

addEvent("MD:OnClickAbastecer", true)
addEventHandler("MD:OnClickAbastecer", root,
	function(valorgasolina)
		local veh = getPedOccupiedVehicle(source)
		if tonumber(valorgasolina) then
			if (veh) then
				local gasolina = math.floor(tonumber(getElementData(veh, "MD:Gasolina")))
				local soma     = (valorgasolina + gasolina)
				if (soma <= 100) then
					local money = getPlayerMoney(source)
					local soma2 = (valorgasolina * 10)
					if (money >= soma2) then
						takePlayerMoney(source, soma2)
						setElementData(veh, "MD:Gasolina", gasolina + valorgasolina)
						triggerClientEvent(source, "N3xT.dxNotification", root, "Você abasteceu seu veículo! #ff0000"..valorgasolina.." Litro's. #00FF00R$"..soma2.."#ffffff.", "success")
					else
						triggerClientEvent(source, "N3xT.dxNotification", root, "Você não tem dinheiro suficiente!", "error")
					end
				else
					triggerClientEvent(source, "N3xT.dxNotification", root, "Seu tanque não cabe essa quantidade de litros!", "error")
				end
			end
		else
			triggerClientEvent(source, "N3xT.dxNotification", root, "Digite um número no litro.", "error")
		end
	end
)

addEventHandler("onResourceStart", resourceRoot,
	function()
		for _, vehicle in ipairs(getElementsByType("vehicle")) do
			for i, v in ipairs(veiculos) do
				if (getElementModel(vehicle) == v) then
					if not getElementData(vehicle, "MD:Gasolina") then
						setElementData(vehicle, "MD:Gasolina", 100.9)
					end
				end
			end
		end
	end
)