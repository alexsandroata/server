blacklistVehicles = {[581]=true, [509]=true, [481]=true, [462]=true, [521]=true,[463]=true, [510]=true,[522]=true,[461]=true,[448]=true,[468]=true,[586]=true}


addEventHandler("onVehicleDamage", root, function(loss)
    player = getVehicleOccupant(source)
    if not getElementData(player, "xela:cinto") then 
        lifePlayer = getElementHealth(player)
        total = lifePlayer - loss
       setElementHealth(player, total)
    end
end)



function security(player) 
    if getElementData(player, "xela:cinto") then 
        triggerClientEvent(player, "xela:cinto:sound", player, 2)
        setElementData(player, "xela:cinto", false, true)
        exports["FR_DxMessages"]:addBox(player, "Você retirou o cinto.", "info")
    else
        triggerClientEvent(player, "xela:cinto:sound", player, 1)
        setElementData(player, "xela:cinto", true, true)
        exports["FR_DxMessages"]:addBox(player, "Você colocou o cinto.", "success")
    end
    
end

function enterVehicle(player, seat, jacked)
    if not blacklistVehicles[getElementModel(source)] then     
        triggerClientEvent(player, "xela:cinto:sound", player, 4)   
        bindKey (player, "x", "down", security, player)
        exports["FR_DxMessages"]:addBox(player, "entrou no veiculo.", "info")
    else 
        exports["FR_DxMessages"]:addBox(player, "saiu do veiculo.", "info")
    end
end

addEventHandler("onVehicleEnter", getRootElement(), enterVehicle)


addEventHandler("onVehicleStartExit", getRootElement(), function(player, seat, jacked)
    if getElementData(player, "xela:cinto") then 
        cancelEvent()
    elseif not getElementData(player, "xela:cinto") and not blacklistVehicles[getElementModel(source)] then     
        triggerClientEvent(player, "xela:cinto:sound", player, 3)
    end
end)

addEventHandler("onVehicleExit", getRootElement(), function(ped, seat, jacker, forcedByScript)
    unbindKey(ped, "x", "down", security)
end)