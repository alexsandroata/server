local db = dbConnect('sqlite', 'assets/source/database/inventory-db.db');
local chest = {};
local query = {};
local chest_clicked = {};

if db then
    dbExec(db, 'CREATE TABLE IF NOT EXISTS Chest (ID INTEGER, Informations JSON, Items JSON, Weight INTEGER)');
    local poll = dbPoll(dbQuery(db, 'SELECT * FROM Chest'), -1);
    query.chest = poll;
end

for i, v in ipairs(query.chest) do
    local data = fromJSON(v.Informations);
    local position = data.position;
    local rotation = data.rotation;
    local object = createObject(tonumber(config.Geral.ChestObject), position[1], position[2], position[3] - 1, Vector3(unpack(rotation)));
    setElementDimension(object, data.int);
    setElementInterior(object, data.dim);
    chest[object] = v.ID;
end

addCommandHandler(tostring(config.Commands.CreateChest.cmd), function(player, cmd, acl, weight)
    if player and isPlayerInACL(player, tostring(config.Commands.CreateChest.acl)) then
        if acl and type(acl) == 'string' and acl:len() ~= 0 then
            local weight = tonumber(weight);
            if weight and type(weight) == 'number' and tostring(weight):len() ~= 0 then
                local bool, msg = addChest(player, acl, weight);
                if bool then
                    return sendMessage(player, 'Bau ['..msg..'] ~ Criado com sucesso.', 'success');
                else
                    if msg then
                        return sendMessage(player, 'server', (msg and msg or 'N/A'), 'error');
                    end
                    sendMessage(player, 'server', 'Erro inesperado ao criar o BAU.', 'error')
                end
            else
                return sendMessage(player, 'server', 'Digite o Peso que o bau irá suportar.', 'info');
            end
        else
            return sendMessage(player, 'server', 'Digite a ACL que terá acesso ao BAU.', 'info');
        end
    end
end)

createEventHandler('Chest>Save', getRootElement(), function(player, object, data_item, amount)
    local hasChest = chest[object];
    if not hasChest then
        return false;
    end
    if chest_clicked[player] then
        return false; 
    end
    local data_chest, index = getChestFromID(hasChest);
    if not isPlayerInACL(player, fromJSON(data_chest.Informations).acl) then
        return sendMessage(player, 'server', 'Você não tem acesso a este bau.', 'error');
    end
    if not getElementDistance(player, object, 3) then
        return false;
    end
    if player and isElementPlayer(player) then
        local items = fromJSON(data_chest.Items);
        local valueItem, indexItem = getChestItem(items, data_item.Item);
        local itemcfg = config['Items'][data_item.Item];
        local Weight = fromJSON(data_chest.Weight);
        local pesoAtual, pesoMax = Weight.used, Weight.current;
        local Calculator = WeightCalculator(data_item.Item, amount);
        if pesoAtual + Calculator <= pesoMax then
            if valueItem then
                local bool, message = takePlayerItem(player, data_item.Item, amount);
                if bool then
                    items[indexItem].Amount = (items[indexItem].Amount + amount);
                    query.chest[index].Items = toJSON(items);
                    query.chest[index].Weight = toJSON({used = math.round(pesoAtual + Calculator, 2, 'Ceil'), current = pesoMax});
                    dbExec(db, 'UPDATE Chest SET Items = ? WHERE ID = ?', toJSON(items), hasChest);
                    dbExec(db, 'UPDATE Chest SET Weight = ? WHERE ID = ?', query.chest[index].Weight, hasChest);
                    triggerClientEvent(root, 'Chest>ExecuteClient', root, 'Load', 'Items', fromJSON(query.chest[index].Items));
                    triggerClientEvent(root, 'Chest>ExecuteClient', root, 'Load', 'Peso', fromJSON(query.chest[index].Weight));
                    sendMessage(player, 'server', 'Você colocou [ '..amount..'x '..itemcfg.name_item..' ] no baú.', 'info');
                    return true;
                end
            else
                local bool, message = takePlayerItem(player, data_item.Item, amount);
                if bool then
                    table.insert(items, {Item = data_item.Item, Amount = amount, Slot = getFreeChestSlot(hasChest, itemcfg.type), Type = itemcfg.type});
                    query.chest[index].Items = toJSON(items);
                    query.chest[index].Weight = toJSON({used = math.round(pesoAtual + Calculator, 2, 'Ceil'), current = pesoMax});
                    dbExec(db, 'UPDATE Chest SET Items = ? WHERE ID = ?', toJSON(items), hasChest);
                    dbExec(db, 'UPDATE Chest SET Weight = ? WHERE ID = ?', query.chest[index].Weight, hasChest);
                    triggerClientEvent(root, 'Chest>ExecuteClient', root, 'Load', 'Items', fromJSON(query.chest[index].Items));
                    triggerClientEvent(root, 'Chest>ExecuteClient', root, 'Load', 'Peso', fromJSON(query.chest[index].Weight));
                    sendMessage(player, 'server', 'Você colocou [ '..amount..'x '..itemcfg.name_item..' ] no baú.', 'info');
                    return true;
                end
            end
        else
            return sendMessage(player, 'server', 'O bau não tem espaço suficiente.', 'info');
        end
    end
end)

createEventHandler('Chest>Give', getRootElement(), function(player, data_item, amount)
    if not chest_clicked[player] then
        return false;
    end
    local hasChest = chest_clicked[player][1];
    local data_chest, index = getChestFromID(hasChest);
    if not isPlayerInACL(player, fromJSON(data_chest.Informations).acl) then
        return sendMessage(player, 'server', 'Você não tem acesso a este bau.', 'error');
    end
    if player and isElementPlayer(player) then
        local items = fromJSON(data_chest.Items);
        local valueItem, indexItem = getChestItem(items, data_item.Item);
        local itemcfg = config['Items'][data_item.Item];
        local Weight = fromJSON(data_chest.Weight);
        local pesoAtual, pesoMax = Weight.used, Weight.current;
        local Calculator = WeightCalculator(data_item.Item, amount);
        if pesoAtual -  Calculator <= pesoMax then
            if amount < data_item.Amount then
                local bool, message = givePlayerItem(player, data_item.Item, amount);
                if bool then
                    items[indexItem].Amount = (items[indexItem].Amount - amount);
                    query.chest[index].Items = toJSON(items);
                    query.chest[index].Weight = toJSON({used = math.round(pesoAtual - Calculator, 2, 'Ceil'), current = pesoMax});
                    dbExec(db, 'UPDATE Chest SET Items = ? WHERE ID = ?', toJSON(items), hasChest);
                    dbExec(db, 'UPDATE Chest SET Weight = ? WHERE ID = ?', query.chest[index].Weight, hasChest);
                    triggerClientEvent(root, 'Chest>ExecuteClient', root, 'Load', 'Items', fromJSON(query.chest[index].Items));
                    triggerClientEvent(root, 'Chest>ExecuteClient', root, 'Load', 'Peso', fromJSON(query.chest[index].Weight));
                    sendMessage(player, 'server', 'Você retirou [ '..amount..'x '..itemcfg.name_item..' ] do baú.', 'info');
                    return true;
                end
            elseif amount == data_item.Amount then
                local bool, message = givePlayerItem(player, data_item.Item, amount);
                if bool then
                    local items = fromJSON(query.chest[index].Items);
                    table.remove(items, indexItem);
                    query.chest[index].Items = toJSON(items);
                    query.chest[index].Weight = toJSON({used = math.round(pesoAtual - Calculator, 2, 'Ceil'), current = pesoMax});
                    dbExec(db, 'UPDATE Chest SET Items = ? WHERE ID = ?', toJSON(items), hasChest);
                    dbExec(db, 'UPDATE Chest SET Weight = ? WHERE ID = ?', query.chest[index].Weight, hasChest);
                    triggerClientEvent(root, 'Chest>ExecuteClient', root, 'Load', 'Items', fromJSON(query.chest[index].Items));
                    triggerClientEvent(root, 'Chest>ExecuteClient', root, 'Load', 'Peso', fromJSON(query.chest[index].Weight));
                    sendMessage(player, 'server', 'Você retirou [ '..amount..'x '..itemcfg.name_item..' ] do baú.', 'info');
                    return true;
                end
            end
        else
            return sendMessage(player, 'server', 'O bau não tem espaço suficiente.', 'info');
        end
    end
end)

addEventHandler('onElementClicked', getRootElement(), function(button, state, player)
    if button == 'left' and state == 'down' and player and isElementPlayer(player) and not isGuestAccount(getPlayerAccount(player)) then
        local hasChest = chest[source];
        if hasChest and not chest_clicked[player] then
            if getElementDistance(player, source, 3) then
                local data_chest, index = getChestFromID(hasChest);
                if not isPlayerInACL(player, fromJSON(data_chest.Informations).acl) then
                    return sendMessage(player, 'server', 'Você não tem acesso a este bau.', 'error');
                end
                if not chest_clicked[player] then
                    chest_clicked[player] = {hasChest, source};
                end
                triggerClientEvent(player, 'Chest>ExecuteClient', player, 'ShowChest');
                triggerClientEvent(root, 'Chest>ExecuteClient', root, 'Load', 'Items', fromJSON(query.chest[index].Items));
                triggerClientEvent(root, 'Chest>ExecuteClient', root, 'Load', 'Peso', fromJSON(query.chest[index].Weight));
            end
        end
    end
end)

-- util's
createEventHandler('Chest>ResetID', getRootElement(), function(player)
    if chest_clicked[player] then
        chest_clicked[player] = nil;
    end
end)

function addChest(element, acl, weight)
    if element and isElementPlayer(element) then
        if acl and weight then
            if not getChestNearest(element) then
                local newID = getNewChestID();
                local position, rotation = {getElementPosition(element)}, {getElementRotation(element)};
                local object = createObject(tonumber(config.Geral.ChestObject), position[1], position[2], position[3] - 1, Vector3(unpack(rotation)));
                local informations = {position = position, rotation = rotation, dim = getElementDimension(element), int = getElementInterior(element), acl = acl};
                chest[object] = newID;
                dbExec(db, 'INSERT INTO Chest VALUES(?, ?, ?, ?)', newID, toJSON(informations), toJSON({}), toJSON({current = weight, used = 0}));
                table.insert(query.chest, {ID = newID, Informations = toJSON(informations), Items = toJSON({}), Weight = toJSON({current = weight, used = 0})});
                setElementDimension(object, getElementDimension(element));
                setElementInterior(object, getElementInterior(element));
                return true, newID;
            else
                return false, 'Tem um baú muito proximo.';
            end
        end
    end
    return false;
end

function addChestHouse(acl, pos, rot, int, dim, weight)
    if acl and weight then
        local newID = getNewChestID();
        local position, rotation = pos, rot
        local object = createObject(tonumber(config.Geral.ChestObject), position[1], position[2], position[3] - 1, Vector3(unpack(rotation)));
        local informations = {position = position, rotation = rotation, dim = dim, int = int, acl = acl};
        chest[object] = newID;
        dbExec(db, 'INSERT INTO Chest VALUES(?, ?, ?, ?)', newID, toJSON(informations), toJSON({}), toJSON({current = weight, used = 0}));
        table.insert(query.chest, {ID = newID, Informations = toJSON(informations), Items = toJSON({}), Weight = toJSON({current = weight, used = 0})});
        setElementDimension(object, dim);
        setElementInterior(object, int);
        return true, newID;
    end
    return false;
end
createEventHandler('Schootz.bauCasa', getRootElement(), addChestHouse)

createEventHandler('Chest:ChangeSlot', getRootElement(), function(player, ...)
    local args = {...}
    local data_item, slot_move, data_itemMove, page = unpack(args);
    if data_item and slot_move then
        local chest_id = chest_clicked[player][1];
        if not chest_id then
            return false, sendMessage(player, 'server', 'Erro inesperado.', 'error');
        end
        local values, index = getChestFromID(chest_id);
        local table_items = fromJSON(values.Items);
        local v, i = getChestItem(table_items, data_item.Item);
        if data_itemMove then
            local v1, i1 = getChestItem(table_items, data_itemMove.Item);
            table_items[i1].Slot = table_items[i].Slot;
        end
        table_items[i].Slot = slot_move;
        query.chest[index].Items = toJSON(table_items);
        dbExec(db, 'UPDATE Chest SET Items = ? WHERE ID = ?', toJSON(table_items), chest_id);
        triggerClientEvent(root, 'Chest>ExecuteClient', root, 'Load', 'Items', fromJSON(query.chest[index].Items));
    end
end)

function getChestItem(tbl, item)
    if tbl and type(tbl) == 'table' and #tbl ~= 0 then
        for i, v in ipairs(tbl) do
            if v.Item == item then
                return v, i;
            end
        end
    end
    return false;
end

function getNewChestID()
    local newID = (#query.chest + 1);
    if query.chest[#query.chest] and #query.chest > 0 then
        newID = query.chest[#query.chest].ID + 1;
    end
    return newID;
end

function getChestNearest(element)
    local player = element;
    if player and isElementPlayer(player) then
        for i, v in pairs(chest) do
            if getElementDistance(player, i, 10) then
                return i;
            end
        end
    end
    return false;
end

function getChestFromID(id)
    if id and type(id) == 'number' and tostring(id):len() ~= 0 then
        for i, v in ipairs(query.chest) do
            if v.ID == id then
                return v, i;
            end
        end
    end
    return false;
end

function getFreeChestSlot(id, page)
    local v = getChestFromID(id)
    local data = fromJSON(v.Items)
    local dados = {};
    for i, v in ipairs(data) do
        if v.Type == page then
            table.insert(dados, v)
        end
    end
    if #dados ~= 0 then
        Index = 0
        while true do
            Index = Index + 1
            Liberado = true
            for i,v in ipairs(dados) do
                if v.Slot == Index then
                    Liberado = false
                end
            end
            if Liberado then
                return Index
            end
        end
    else
        return 1
    end
end