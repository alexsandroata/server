addEvent('Caio.lavarDinheiro', true)
addEventHandler('Caio.lavarDinheiro', root, 
    function(player)
        local quantidade = exports["font_inventory"]:GiveAndTakeAndGetItem("get", player , "dinheirosujo", "all")
        if quantidade then  
            print(quantidade)
            givePlayerMoney(player, math.floor(tonumber((quantidade / 100) * config.Percentual)))
            exports["font_inventory"]:GiveAndTakeAndGetItem("take", player , "dinheirosujo", quantidade)
            triggerClientEvent( source, 'Notify', source, "importante", "Você limpou todo seu dinheiro sujo e recebeu "..config.Percentual.."%")
        else 
            triggerClientEvent( source, 'Notify', source, "importante", "Você não tem dinheiro sujo.")
        end
    end
)

marker = {}
for i, v in ipairs(config.Marker) do 
    
    marker[i] = createMarker(v[1], v[2], v[3], 'cylinder', 1.5, 177, 16, 16, 90)

    addEventHandler('onMarkerHit', marker[i], function(player)
        if player and not isPedInVehicle(player) and not isGuestAccount(getPlayerAccount(player)) then              
            triggerClientEvent(player, 'Caio.onOpenPanelDS', player, exports["font_inventory"]:GiveAndTakeAndGetItem("get", player , "dinheirosujo", "all"))
        end
    end)

end     