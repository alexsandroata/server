local strf = string.format
local Global = {
    Foods = {},
    Object = {},
    Weapons = {}

}


function onPlayerUseItem (...)
    local RESPONSE = {...};
    local ITEM, QTD = RESPONSE[1], RESPONSE[2]
    if ITEM and QTD then
        if config['BlockItems'][ITEM] then
            if not config['BlockItems'][ITEM].use then
                triggerClientEvent(source, "addBox", source, 'Você não pode usar este item!', 'error')
                return false
            end
        end
        local settings = config['Items'][ITEM]
        local source = source
        if settings.type == 'Personal' then
            if settings.category == 'Munition' then
                if not getWeaponInSlotFromMunitionType (source, ITEM) then
                    triggerClientEvent(source, "addBox", source, 'Você não possui nenhum armamento equipado correspondende a este calibre de munição!', 'error')
                    return false
                end
                takePlayerItem (source, ITEM, QTD)
                giveWeapon (source, getWeaponInSlotFromMunitionType (source, ITEM)[1], QTD, false)
                triggerClientEvent(source, "addBox", source, 'Você equipou '..QTD..'x de '..settings.name_item..'.', 'success')
                return true
            end 
            if ITEM == 'bandagem' then
                if (getElementHealth (source) + 20) > 100 then
                    triggerClientEvent(source, "addBox", source, 'Você não precisa de curativos.', 'error')
                    return false
                end
                setElementHealth (source, (getElementHealth (source) + 20))
                takePlayerItem (source, ITEM, 1)
                triggerClientEvent(source, "addBox", source, 'Você utilizou 1x Bandagem.', 'success')
                return true
            end
            if ITEM == 'jbl' then
                exports.star_jbl:onCreateJBL(source) 
                triggerClientEvent(source, "addBox", source, 'Você utilizou a jbl.', 'success')
            end
            if ITEM == 'jblmaconha' then
                closeInv(source)
                executeCommandHandler('pasffsddsaioadiojsajisasijdsisaakpaoffkakaofkddsa', source, '1') 
            end
            if  ITEM == 'jblmilitar' then
                closeInv(source)
                executeCommandHandler('pasffsddsaioadiojsajisasijdsisaakpaoffkakaofkddsa', source, '2')
            end
             
              
            if ITEM == 'radinho' then -- RADINHO
                exports["[HS]Radio_Comunicador"]:open_radio( source )
            end




            if ITEM == 'akbotafogo' then -- AK-47 Bota Fogo
                exports["star_skins-armas"]:loadWeaponSkin(source, 30, '1')
            end
            if ITEM == 'akatleticopr' then -- AK-47 Athletico PR
                exports["star_skins-armas"]:loadWeaponSkin(source, 30, '2')
            end
            if ITEM == 'akgalo' then -- AK-47 Galo
                exports["star_skins-armas"]:loadWeaponSkin(source, 30, '3')
            end
            if ITEM == 'akbahia' then -- AK-47 Bahia
                exports["star_skins-armas"]:loadWeaponSkin(source, 30, '4')
            end
            if ITEM == 'akfortaleza' then -- AK-47 Fortaleza
                exports["star_skins-armas"]:loadWeaponSkin(source, 30, '5')
            end
            if ITEM == 'akinternacional' then -- AK-47 Internacional
                exports["star_skins-armas"]:loadWeaponSkin(source, 30, '6')
            end
            if ITEM == 'akpalmeiras' then -- AK-47 Palmeiras
                exports["star_skins-armas"]:loadWeaponSkin(source, 30, '7')
            end
            if ITEM == 'akblue' then -- AK-47 Blue
                exports["star_skins-armas"]:loadWeaponSkin(source, 30, '8')
            end
            if ITEM == 'akgold' then -- AK-47 Gold
                exports["star_skins-armas"]:loadWeaponSkin(source, 30, '9')
            end
            if ITEM == 'akhyper' then -- AK-47 Hyper
                exports["star_skins-armas"]:loadWeaponSkin(source, 30, '10')
            end
            if ITEM == 'akflamengo' then -- AK-47 Flamengo
                exports["star_skins-armas"]:loadWeaponSkin(source, 30, '11')
            end




            if ITEM == 'm4cartoon' then -- M4 Cartoon
                exports["star_skins-armas"]:loadWeaponSkin(source, 31, 'cartoon')
            end
            if ITEM == 'm4hyper' then -- M4 Hyper
                exports["star_skins-armas"]:loadWeaponSkin(source, 31, 'hyper')
            end
            if ITEM == 'm4red' then -- M4 Hyper
                exports["star_skins-armas"]:loadWeaponSkin(source, 31, 'red')
            end
            if ITEM == 'm4barbie' then -- M4 Hyper
                exports["star_skins-armas"]:loadWeaponSkin(source, 31, 'barbie')
            end
            if ITEM == 'm4blue' then -- M4 Hyper
                exports["star_skins-armas"]:loadWeaponSkin(source, 31, 'blue')
            end
            if ITEM == 'm4color' then -- M4 Hyper
                exports["star_skins-armas"]:loadWeaponSkin(source, 31, 'color')
            end
            if ITEM == 'm4gold' then -- M4 Hyper
                exports["star_skins-armas"]:loadWeaponSkin(source, 31, 'gold')
            end
            if ITEM == 'm4reddragon' then -- M4 Hyper
                exports["star_skins-armas"]:loadWeaponSkin(source, 31, 'reddragon')
            end

        elseif settings.type == 'Foods' then
            if not Global.Foods[source] then
                Global.Foods[source] = {}
            end
            local Fome, Sede = (getElementData (source, config.ElementData.Hunger) or 0), (getElementData (source, config.ElementData.Thirst) or 0)
            if settings.category == 'Bebidas' then
                if Global.Object[source] then
                    triggerClientEvent(source, "addBox", source, 'Aguarde um momento para executar esta ação.', 'info')
                    return false
                end
                if Global.Foods[source] and isTimer (Global.Foods[source]) then
                    triggerClientEvent(source, "addBox", source, 'Aguarde um momento para beber algo novamente.', 'info')
                    return false
                end
                if (Sede + settings.regenerate) > 100 then
                    triggerClientEvent(source, "addBox", source, 'Você não está com sede.', 'info')
                    return false
                end
                if not Global.Object[source] then
                    Global.Object[source] = {}
                end
                closeInv (source)
                takePlayerItem (source, ITEM, 1)
                Global.Object[source] = createObject (settings.object[1], Vector3 (getElementPosition (source)))
                setPedAnimation (source, 'VENDING', 'vend_drink2_p', -1, false, false, false, false)
                resource_attach:attachElementToBone (Global.Object[source], source, unpack (settings.object[2]))
                triggerClientEvent(source, "addBox", source, 'Você está bebendo 1x '..settings.name_item..'.', 'success')
                setElementData (source, config.ElementData.Thirst, (Sede + settings.regenerate))
                Global.Foods[source] = setTimer (function ()
                    if Global.Object[source] then
                        destroyElement (Global.Object[source])
                        Global.Object[source] = nil
                    end
                    setPedAnimation (source, nil, nil)
                end, 3000, 1)
            end
            if settings.category == 'Comida' then
                if Global.Object[source] then
                    triggerClientEvent(source, "addBox", source, 'Aguarde um momento para executar esta ação.', 'info')
                    return false
                end
                if Global.Foods[source] and isTimer (Global.Foods[source]) then
                    triggerClientEvent(source, "addBox", source, 'Aguarde um momento para comer algo novamente.', 'info')
                    return false
                end
                if (Fome + settings.regenerate) > 100 then
                    triggerClientEvent(source, "addBox", source, 'Você não está com fome.', 'info')
                    return false
                end
                if not Global.Object[source] then
                    Global.Object[source] = {}
                end
                closeInv (source)
                takePlayerItem (source, ITEM, 1)
                Global.Object[source] = createObject (settings.object[1], Vector3 (getElementPosition (source)))
                setPedAnimation (source, 'FOOD', 'EAT_Burger', -1, true, false, false)
                resource_attach:attachElementToBone (Global.Object[source], source, unpack (settings.object[2]))
                triggerClientEvent(source, "addBox", source, 'Você está comendo 1x '..settings.name_item..'.', 'success')
                setElementData (source, config.ElementData.Hunger, (Fome + settings.regenerate))
                Global.Foods[source] = setTimer (function ()
                    if Global.Object[source] then
                        destroyElement (Global.Object[source])
                        Global.Object[source] = nil
                    end
                    setPedAnimation (source, nil, nil)
                end, 3000, 1)
            end
        elseif settings.type == 'Utils' then
            if ITEM == 'kitreparo' then
                local vehicle = getPedOccupiedVehicle (source)
                if not vehicle then
                    triggerClientEvent(source, "addBox", source, 'Você precisa estar em um veiculo para utilizar o kit reparo.', 'error')
                    return false
                end
                if getElementHealth (vehicle) > 999 then
                    triggerClientEvent(source, "addBox", source, 'Seu veiculo não precisa de reparo.', 'info')
                    return false
                end
                fixVehicle (vehicle)
                takePlayerItem (source, ITEM, 1)
                triggerClientEvent(source, "addBox", source, 'Você utilizou 1x Kit Reparo.', 'success')
                return true
            end
            if ITEM == 'lockpick' then
                triggerClientEvent(source, 'JOAO.openLockPick', source)                
                takePlayerItem (source, ITEM, 1)
            end
            if ITEM == 'colete' then
                setPlayerArmor(source, 100)
                takePlayerItem (source, ITEM, 1)
            end
        elseif settings.type == 'Ilegais' then
            if settings.category == 'Weapon' then
                if not Global.Weapons[source] then
                    Global.Weapons[source] = {}
                end
                if Global.Weapons[source][ITEM] then
                    triggerClientEvent(source, "addBox", source, strf ('Você já possui a(a) %s equipado(a)!', settings.name_item), 'error')
                    return false
                end
                local POST = {
                    source,
                    config.Weapons[ITEM].category
                }
                if getWeaponFromCategory (POST) then
                    triggerClientEvent(source, "addBox", source, strf ('Você já possui um(a) %s equipado(a)!', POST[2]), 'error')
                    return false
                end
                Global.Weapons[source][ITEM] = {
                    id = config.Weapons[ITEM].weapon_id,
                    category = POST[2]
                }
                takePlayerItem (source, ITEM, 1)
                giveWeapon (source, config.Weapons[ITEM].weapon_id, 1, true)
                triggerClientEvent(source, "addBox", source, strf ('Você equipou a(o) %s!', settings.name_item), 'success')
                return true
            end
        end
    end
end
createEventHandler ('Inventory:onPlayerUseItem', getRootElement (), onPlayerUseItem, true, 'normal')

createEventHandler ('Inventory:onPlayerDropItem', getRootElement (), function (...)
    local RESPONSE = {...};
    local ITEM, QTD = RESPONSE[1], RESPONSE[2]

    if config['BlockItems'][ITEM] then
        if not config['BlockItems'][ITEM].drop then
            triggerClientEvent(source, "addBox", source, 'Você não pode dropar este item!', 'error')
            return false
        end
    end

    local bool, message = takePlayerItem (source, ITEM, QTD)
    local settings = config['Items'][ITEM]

    if bool then
        triggerClientEvent(source, "addBox", source, 'você dropou x'..QTD..' '..settings.name_item..'.', 'success')
        return true
    else
        return triggerClientEvent(source, "addBox", source, message, 'error')
    end
end, true, 'high')

addEventHandler ('onPlayerWasted', getRootElement (), function ()
    for key, value in pairs (config.BlockItems) do
        if value.died then
            local amount = getPlayerItem(player, key)
            if amount and amount > 0 then
                takePlayerItem (source, key, amount)
            end
        end
    end
end)

--> Armas <--
function SaveWeapon (player)
    if not Global.Weapons[player] then
        sendMessage (player, 'server', 'Você não possui nenhum armamento equipado!', 'error')
        return false
    end
    for slot = 1, 12 do
        local currentWeapon = getPedWeapon (player, slot)
        if currentWeapon ~= 0 then
            for arma, data in pairs (Global.Weapons[player]) do
                if currentWeapon == data.id then
                    givePlayerItem (player, arma, 1)
                    if getAmmoTypeFromWeapon (data.id) then
                        local totalAmmo = (getPedTotalAmmo (player, slot) - 1 > 1 and getPedTotalAmmo (player, slot) - 1 or 0)
                        if totalAmmo > 0 then
                            givePlayerItem (player, getAmmoTypeFromWeapon (data.id), totalAmmo)
                        end
                    end
                    takeWeapon (player, data.id)
                end
            end
        end
    end
    Global.Weapons[player] = nil
    sendMessage (player, 'server', 'Você equipou todos os seus armamentos!', 'success')
    return true
end
addCommandHandler ('garmas', SaveWeapon)

function getAmmoTypeFromWeapon (weaponId)
    for key, value in pairs (config.Munitions) do
        for _, id in pairs (value) do
            if id == weaponId then
                return key
            end
        end
    end
    return false
end

function getWeaponFromCategory (RESPONSE)
    if not Global.Weapons[RESPONSE[1]] then
        return false
    end
    for u, k in pairs (Global.Weapons[RESPONSE[1]]) do
        if k.category == RESPONSE[2] then
            return true
        end
    end
    return false
end

function getWeaponInSlotFromMunitionType (player, munition)
    if not Global.Weapons[player] then
        return false
    end
    for _, weapons in ipairs (config.Munitions[munition]) do
        for name, content in pairs (Global.Weapons[player]) do
            if weapons == content.id then
                return {content.id, name}
            end
        end
    end
    return false
end

--> Useful <--
function closeInv (element)
    return triggerClientEvent (element, 'Inventory:Close', element)
end

onPlayerEvents = function (...)
    if Global.Object[source] and isElement (Global.Object[source]) then
        destroyElement (Global.Object[source])
        Global.Object[source] = nil
    end
    if Global.Foods[source] and isTimer (Global.Foods[source]) then
        killTimer (Global.Foods[source])
        Global.Foods[source] = nil
    end
    if eventName == 'onPlayerWasted' then
        Global.Weapons[source] = nil
    end
    if Global.Weapons[source] then
        for slot = 1, 12 do
            local currentWeapon = getPedWeapon (source, slot)
            if currentWeapon ~= 0 then
                for arma, data in pairs (Global.Weapons[source]) do
                    if currentWeapon == data.id then
                        givePlayerItem (source, arma, 1)
                        if getAmmoTypeFromWeapon (data.id) then
                            local totalAmmo = (getPedTotalAmmo (source, slot) - 1 > 1 and getPedTotalAmmo (source, slot) - 1 or 0)
                            if totalAmmo > 0 then
                                givePlayerItem (source, getAmmoTypeFromWeapon (data.id), totalAmmo)
                            end
                        end
                        takeWeapon (source, data.id)
                    end
                end
            end
        end
    end
end
addEventHandler ('onPlayerQuit', getRootElement (), onPlayerEvents, true, 'normal')
addEventHandler ('onPlayerLogout', getRootElement (), onPlayerEvents, true, 'normal')
addEventHandler ('onPlayerWasted', getRootElement (), onPlayerEvents, true, 'normal')