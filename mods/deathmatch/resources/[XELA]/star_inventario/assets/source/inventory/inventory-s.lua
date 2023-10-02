outputDebugString(getResourceName(getThisResource())..': Inventory started.', 4, 0, 255, 50);

local db = dbConnect('sqlite', 'assets/source/database/inventory-db.db');
local query = {};

if db then
    dbExec(db, 'CREATE TABLE IF NOT EXISTS Inventory (Account TEXT, Items JSON, Weight INTEGER)');
    local poll = dbPoll(dbQuery(db, 'SELECT * FROM Inventory'), -1);
    query.global = poll;
end

function ShowInventory(player)
    if not getPlayerTable(player) then
        local Account, Items, Peso = getAccountName(getPlayerAccount(player)), toJSON({}), toJSON({current = config.Geral.WeightStandard, used = 0});
        dbExec(db, 'INSERT INTO Inventory VALUES (?, ?, ?)', Account, Items, Peso);
        table.insert(query.global, {Account = Account, Items = Items, Weight = Peso});
    end
    local v, i = getPlayerTable(player);
    triggerClientEvent(player, 'Inventory:Execute>Client', player, 'ShowInventory')
    triggerClientEvent(player, 'Inventory:Execute>Client', player, 'Load', 'Items', fromJSON(v.Items));
    triggerClientEvent(player, 'Inventory:Execute>Client', player, 'Load', 'Peso', fromJSON(v.Weight));
end

createEventHandler('Inventory:Execute>Server', getRootElement(), function(player, action, ...)
    local args = {...}
    if action == 'ChangeSlot' then
        local data_item, slot_move, data_itemMove, page = unpack(args);
        if data_item and slot_move then
            local values, index = getPlayerTable(player);
            local v, i = getPlayerItem(player, data_item.Item);
            local table_items = fromJSON(values.Items);
            if data_itemMove then
                local v1, i1 = getPlayerItem(player, data_itemMove.Item);
                table_items[i1].Slot = table_items[i].Slot;
            end
            table_items[i].Slot = slot_move;
            query.global[index].Items = toJSON(table_items);
            dbExec(db, 'UPDATE Inventory SET Items = ? WHERE Account = ?', toJSON(table_items), getAccountName(getPlayerAccount(player)));
            triggerClientEvent(player, 'Inventory:Execute>Client', player, 'Load', 'Items', table_items);
        end
    end
end)

function givePlayerItem(player, item, amount)
    if player and isElementPlayer(player) and getPlayerTable(player) then
        local itemcfg = config['Items'][tostring(item)];
        if item and itemcfg then
            if amount then
                local values, index = getPlayerTable(player);
                local table_items = fromJSON(values.Items);
                local _, hasItem = getPlayerItem(player, item);
                local Weight = fromJSON(values.Weight);
                local pesoAtual, pesoMax = Weight.used, Weight.current;
                local Calculator = WeightCalculator(item, amount);
                if pesoAtual + Calculator <= pesoMax then
                    if not hasItem then
                        table.insert(table_items, {Item = item, Amount = amount, Slot = getFreeSlot(player, itemcfg.type), Type = itemcfg.type});
                        query.global[index].Items = toJSON(table_items);
                        query.global[index].Weight = toJSON({used = math.round(pesoAtual + Calculator, 2, 'Ceil'), current = pesoMax});
                        dbExec(db, 'UPDATE Inventory SET Items = ? WHERE Account = ?', toJSON(table_items), getAccountName(getPlayerAccount(player)));
                        dbExec(db, 'UPDATE Inventory SET Weight = ? WHERE Account = ?', query.global[index].Weight, getAccountName(getPlayerAccount(player)));
                        triggerClientEvent(player, 'Inventory:Execute>Client', player, 'Load', 'Items', fromJSON(query.global[index].Items));
                        triggerClientEvent(player, 'Inventory:Execute>Client', player, 'Load', 'Peso', fromJSON(query.global[index].Weight));
                        return true;
                    else
                        for i, v in ipairs(table_items) do
                            if v.Item == item then
                                v.Amount = v.Amount + amount;
                            end
                        end
                        query.global[index].Items = toJSON(table_items);
                        query.global[index].Weight = toJSON({used = math.round(pesoAtual + Calculator, 2, 'Ceil'), current = pesoMax});
                        dbExec(db, 'UPDATE Inventory SET Items = ? WHERE Account = ?', toJSON(table_items), getAccountName(getPlayerAccount(player)));
                        dbExec(db, 'UPDATE Inventory SET Weight = ? WHERE Account = ?', query.global[index].Weight, getAccountName(getPlayerAccount(player)));
                        triggerClientEvent(player, 'Inventory:Execute>Client', player, 'Load', 'Items', fromJSON(query.global[index].Items));
                        triggerClientEvent(player, 'Inventory:Execute>Client', player, 'Load', 'Peso', fromJSON(query.global[index].Weight));
                        return true;
                    end
                else
                    return false, 'Peso insuficiente.';
                end
            else
                return false, 'Quantidade inválida.';
            end
        else
            return false, 'Item inválido.';
        end
    end
    return false;
end

function takePlayerItem(player, item, amount)
    if player and isElementPlayer(player) and getPlayerTable(player) then
        local itemcfg = config['Items'][tostring(item)];
        if item and itemcfg then
            if amount then
                local values, index = getPlayerTable(player);
                local table_items = fromJSON(values.Items);
                local AmountItem, hasItem = getPlayerItem(player, item);
                local Weight = fromJSON(values.Weight);
                local pesoAtual, pesoMax = Weight.used, Weight.current;
                local Calculator = WeightCalculator(item, amount);
                if hasItem then
                    if amount < AmountItem then
                        table_items[hasItem].Amount = (table_items[hasItem].Amount - amount);
                        query.global[index].Items = toJSON(table_items);
                        query.global[index].Weight = toJSON({used = (pesoAtual - Calculator), current = pesoMax});
                        dbExec(db, 'UPDATE Inventory SET Items = ? WHERE Account = ?', toJSON(table_items), getAccountName(getPlayerAccount(player)));
                        dbExec(db, 'UPDATE Inventory SET Weight = ? WHERE Account = ?', query.global[index].Weight, getAccountName(getPlayerAccount(player)));
                        triggerClientEvent(player, 'Inventory:Execute>Client', player, 'Load', 'Items', fromJSON(query.global[index].Items));
                        triggerClientEvent(player, 'Inventory:Execute>Client', player, 'Load', 'Peso', fromJSON(query.global[index].Weight));
                        return true;
                    else
                        if amount == AmountItem then
                            table.remove(table_items, hasItem)
                            query.global[index].Items = toJSON(table_items);
                            query.global[index].Weight = toJSON({used = (pesoAtual - Calculator > -1 and pesoAtual - Calculator or 0), current = pesoMax});
                            dbExec(db, 'UPDATE Inventory SET Items = ? WHERE Account = ?', toJSON(table_items), getAccountName(getPlayerAccount(player)));
                            dbExec(db, 'UPDATE Inventory SET Weight = ? WHERE Account = ?', query.global[index].Weight, getAccountName(getPlayerAccount(player)));
                            triggerClientEvent(player, 'Inventory:Execute>Client', player, 'Load', 'Items', fromJSON(query.global[index].Items));
                            triggerClientEvent(player, 'Inventory:Execute>Client', player, 'Load', 'Peso', fromJSON(query.global[index].Weight));
                            return true;
                        else
                            return false, 'Quantidade insuficiente.';
                        end
                    end
                else
                    return false, 'O jogador não possui este item.';
                end
            else
                return false, 'Quantidade inválida.';
            end
        else
            return false, 'Item inválido.';
        end
    end
    return false;
end

function WeightCalculator (item, amount)
    if item and config.Items[tostring(item)] then
        if amount and type(amount) == 'number' and tostring(amount):len() ~= 0 then
            return (config.Items[tostring(item)].weight * amount);
        end
    end
    return false;
end

local Trade = {functions = {}, data = {}}
local strf = string.format

function Trade.functions.sendItem (theReceiver, itemData, tradeAmount)
    local theReceiverTable = getPlayerTable (theReceiver)
    if not theReceiverTable then
        return
    end
    local hasGived, errGived = givePlayerItem (theReceiver, itemData.Item, tradeAmount)
    if not hasGived then
        sendMessage (source, 'server', errGived, 'error')
        return false
    end
    takePlayerItem (source, itemData.Item, tradeAmount)
    sendMessage (source, 'server', strf ('Você enviou %sx %s para %s [%s].', tradeAmount, config['Items'][itemData.Item].name_item, getPlayerName (theReceiver), (getElementData (theReceiver, 'ID') or 0)), 'success')
    sendMessage (theReceiver, 'server', strf ('Você recebeu %sx %s de %s [%s].', tradeAmount, config['Items'][itemData.Item].name_item, getPlayerName (source), (getElementData (source, 'ID') or 0)), 'success')
    closeInv(source)
    return true
end
createEventHandler ('Trade>SendItem', getRootElement (), Trade.functions.sendItem)

-- Commands [GIVE - TAKE];
addCommandHandler(tostring(config.Commands.GiveItem.cmd), function(player, cmd, id, amount, ...)
    local id, amount = tonumber(id), tonumber(amount);
    local item = table.concat({...}, ' ');
    if player and isPlayerInACL(player, tostring(config.Commands.GiveItem.acl)) then
        if id and type(id) == 'number' and tostring(id):len() ~= 0 then
            local receiver = getPlayerID(id);
            if receiver and isElement(receiver) then
                if amount and type(amount) == 'number' and tostring(amount):len() ~= 0 then
                    if item and type(item) == 'string' and item:len() ~= 0 then
                        local item_config = config['Items'][item];
                        if item_config then
                            local bool, message = givePlayerItem(receiver, item, amount);
                            if bool then
                                sendMessage(player, 'server', 'Você enviou '..amount..'x '..item_config.name_item..' para o jogador: '..getPlayerName(receiver)..' ('..id..').', 'info');
                                sendMessage(receiver, 'server', 'Você recebeu '..amount..'x '..item_config.name_item..' do STAFF: '..getPlayerName(player)..' ('..(getElementData(player, 'ID') or 0)..').', 'staff');
                                return
                            else
                                if message then
                                    return sendMessage(player, 'server', (message and message or 'undefined'), 'error');
                                end
                            end
                        else
                            return sendMessage(player, 'server', 'O Item não foi encontrado.', 'info');
                        end
                    else
                        return sendMessage(player, 'server', 'Digite o Nome do item que deseja givar ao jogador.', 'info');
                    end
                else
                    return sendMessage(player, 'server', 'Digite a Quantidade do item que deseja givar ao jogador.', 'info');
                end
            else
                return sendMessage(player, 'server', 'O jogador não foi encontrado.', 'error')
            end
        else
            return sendMessage(player, 'server', 'Digite o ID do jogador que deseja givar o item.', 'info')
        end
    end
end)

addCommandHandler(tostring(config.Commands.TakeItem.cmd), function(player, cmd, id, amount, ...)
    local id, amount = tonumber(id), tonumber(amount);
    local item = table.concat({...}, ' ');
    if player and isPlayerInACL(player, tostring(config.Commands.TakeItem.acl)) then
        if id and type(id) == 'number' and tostring(id):len() ~= 0 then
            local receiver = getPlayerID(id);
            if receiver and isElement(receiver) then
                if amount and type(amount) == 'number' and tostring(amount):len() ~= 0 then
                    if item and type(item) == 'string' and item:len() ~= 0 then
                        local item_config = config['Items'][item];
                        if item_config then
                            local bool, message = takePlayerItem(player, item, amount);
                            if bool then
                                sendMessage(player, 'server', 'Você retirou '..amount..'x '..item_config.name_item..' do jogador: '..getPlayerName(receiver)..' ('..id..').', 'info');
                                sendMessage(receiver, 'server', 'o STAFF: '..getPlayerName(player)..' ('..(getElementData(player, 'ID') or 0)..'), retirou '..amount..'x '..item_config.name_item..'. Do seu inventário.', 'staff');
                                return
                            else
                                if message then
                                    return sendMessage(player, 'server', (message and message or 'undefined'), 'error');
                                end
                            end
                        else
                            return sendMessage(player, 'server', 'O Item não foi encontrado.', 'info');
                        end
                    else
                        return sendMessage(player, 'server', 'Digite o Nome do item que deseja retirar ao jogador.', 'info');
                    end
                else
                    return sendMessage(player, 'server', 'Digite a Quantidade do item que deseja retirar do jogador.', 'info');
                end
            else
                return sendMessage(player, 'server', 'O jogador não foi encontrado.', 'error')
            end
        else
            return sendMessage(player, 'server', 'Digite o ID do jogador que deseja retirar o item.', 'info')
        end
    end
end)

-- Function's Util's
function getPlayerTable (element)
    if element and isElementPlayer(element) and not isGuestAccount(getPlayerAccount(element)) then
        for i, v in ipairs(query.global) do
            if v.Account == getAccountName(getPlayerAccount(element)) then
                return v, i;
            end
        end
    end
    return false;
end

function getPlayerItem(player, item)
    if player and isElementPlayer(player) and not isGuestAccount(getPlayerAccount(player)) then
        local Item = config['Items'][item];
        local values, index = getPlayerTable(player);
        local table_items = fromJSON(values.Items);
        for i, v in ipairs(table_items) do
            if v.Item == item then
                return v.Amount, i;
            end
        end
    end
    return false;
end

function getItemFromSlot(player, slot, page)
    local values = getPlayerTable(player)
    local items = fromJSON(values.Items)
    for i, v in ipairs(items) do
        if v.Slot == slot and v.Type == page then
            return i;
        end
    end
    return false;
end

function getFreeSlot(element, page)
    local v = getPlayerTable(element)
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

function onPlayerExecuteEvent(...)
    local args = {...}
    if eventName == 'onResourceStart' and args[1] == getThisResource() then
        for i, v in ipairs(getElementsByType('player')) do
            if v and not isGuestAccount(getPlayerAccount(v)) then
                bindKey(v, config.Geral.Tecla, 'down', ShowInventory)
            end
        end
    elseif eventName == 'onPlayerLogin' then
        bindKey(source, config.Geral.Tecla, 'down', ShowInventory)
    elseif eventName == 'onPlayerWasted' then
        local player_table = getPlayerTable(source);

        if (not player_table) then
            return false
        end

        local items = fromJSON(player_table.Items);
        closeInv(source)
        for k = 1, #items do
            local hasItemTakeOnDied = config['BlockItems'][items[k].Item];
            if hasItemTakeOnDied and hasItemTakeOnDied.died then
                takePlayerItem(source, items[k].Item, items[k].Amount);
            end
        end
    elseif eventName == 'onPlayerQuit' or eventName == 'onPlayerLogout' then
        closeInv(source)
        unbindKey(source, config.Geral.Tecla, 'down', ShowInventory)
        return
    end
end
addEventHandler('onResourceStart', getRootElement(), onPlayerExecuteEvent);
addEventHandler('onPlayerLogin', getRootElement(), onPlayerExecuteEvent);
addEventHandler('onPlayerQuit', getRootElement(), onPlayerExecuteEvent);
addEventHandler('onPlayerLogout', getRootElement(), onPlayerExecuteEvent);
addEventHandler('onPlayerWasted', getRootElement(), onPlayerExecuteEvent);