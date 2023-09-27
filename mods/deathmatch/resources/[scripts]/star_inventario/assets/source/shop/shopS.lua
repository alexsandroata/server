local Shop = {
    Functions = {},
    Data = {}
}

Shop.Functions.CreateMarker = function ()
    for key, value in ipairs (config.Shops) do
        local marker = createMarker (Vector3 (unpack (value.position)), 'cylinder', 1.3, unpack (value.color))
        Shop.Data[marker] = value.items
    end
end
addEventHandler ('onResourceStart', resourceRoot, Shop.Functions.CreateMarker, true, 'low-5')

Shop.Functions.onMarkerHit = function (player, dimension)
    if not Shop.Data[source] then
        return false
    end
    if player and isElement (player) and getElementType (player) == 'player' and not getPedOccupiedVehicle (player) and not isGuestAccount (getPlayerAccount (player)) and dimension then
        triggerClientEvent (player, 'toggle', player, Shop.Data[source])
        return true
    end
end
addEventHandler ('onMarkerHit', resourceRoot, Shop.Functions.onMarkerHit, true, 'low-5')

Shop.Functions.Buy = function (response)
    if not response then
        return
    end
    if getPlayerMoney (source) < response.price then
        sendMessage (source, 'server', 'Você não tem dinheiro suficiente.', 'info')
        return
    end
    local gived, message = givePlayerItem (source, response.item, 1)
    if not gived then
        sendMessage (source, 'server', tostring (message), 'error')
        return
    end
    sendMessage (source, 'server', 'Você comprou 1x '..response.name_item..'.', 'success')
    takePlayerMoney (source, response.price)
    return
end
createEventHandler ('buy', getRootElement (), Shop.Functions.Buy, true, 'low-5')