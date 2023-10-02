db = dbConnect("sqlite", "db/dados.db")
dbExec(db, "CREATE TABLE IF NOT EXISTS Itens (ID, Item, Quantidade)")

Query = dbQuery(db, "SELECT * FROM Itens")
Result = dbPoll(Query, -1)
TableItens = Result

PM = {}



--[[addEventHandler("onElementClicked",root,function(b,s,player)
    if b == "left" and s == "down" and getElementType(source) == "object" then
        local Tabela = getElementData(source, "Kings.IDPM")
        if Tabela then
            local ID, Acls,Peso = Tabela[1], fromJSON(Tabela[2]), Tabela[3]
            local PermAcl, PermMover = isObjectInTableACLGroups(player, Acls)
            if PermAcl then
                local x,y,z = getElementPosition(source)
                local x2,y2,z2 = getElementPosition(player)
                if getDistanceBetweenPoints3D(x,y,z,x2,y2,z2) <= 3 then
                    local Itens = exports["MODInventario"]:formatItens(getItensPM(ID), "PM")
                    local ItensInv = exports["MODInventario"]:getItensPlayer(player)
                    triggerClientEvent(player, "MST.OpenChest",player, ID, ItensInv, Itens,Peso, PermMover)
                end 
            end
        end
    end
end)]]--

function getVehicleProximo (player)
    local target = nil
    for _,v in ipairs(getElementsByType('vehicle')) do 
        local posp = {getElementPosition(player)}
        local posv = {getElementPosition(v)}
        if getDistanceBetweenPoints3D(posp[1], posp[2], posp[3], posv[1], posv[2], posv[3]) <= 3 then 
            target = v
        end
    end
    if target ~= nil then 
        return target
    else
        return false
    end
end

addEvent('OpenPortaMalas', true)
addEventHandler('OpenPortaMalas', root, function(player)
    local veiculo = getVehicleProximo(player)
    if veiculo ~= false then 
        if getElementData(veiculo, 'TS:Trancado') == true then return end
        if isPedInVehicle(player) then return end
        local model = getElementModel(veiculo)
        if Config.Veiculos[model] then
            if not getElementData(getVehicleProximo(player), 'Porta-Malas') then
                local Itens = exports["MODInventario"]:formatItens(getItensPM(getVehiclePlateText(getVehicleProximo(player))), "bau")
                local ItensInv = exports["MODInventario"]:getItensPlayer(player)
                triggerClientEvent(player, "MST.OpenPM",player, getVehiclePlateText(getVehicleProximo(player)), ItensInv, Itens, Config.Veiculos[model], getVehicleProximo(player))
                setElementData(getVehicleProximo(player), 'Porta-Malas', true)
                setVehicleDoorOpenRatio(getVehicleProximo(player), 1, 1, 1500)
            end
        end
    end
end)

addEvent('ClosePortaMalas', true)
addEventHandler('ClosePortaMalas', root, function(player, vehicle)
    if vehicle then 
        setElementData(vehicle, 'Porta-Malas', nil)
        setVehicleDoorOpenRatio(vehicle, 1, 0, 1500)
    end
end)

function clearID(id)
    for i,v in ipairs(TableItens) do
        if v.ID == id then
            table.remove(TableItens, i)
        end
    end
    dbExec(db, "DELETE FROM Itens WHERE ID = ?", id)
end
addEvent("MST.ClearID2",true)
addEventHandler("MST.ClearID2",root,clearID)


function isObjectInTableACLGroups(player,acls)
    for i,v in ipairs(acls) do
        if aclGetGroup(v[1]) then
            if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup(v[1])) then
                return true,v[2]
            end
        end
    end
    return false
end

function searchResult(id, item)
    for i,v in ipairs(TableItens) do
        if v.ID == id and v.Item == item then
            return i
        end
    end
    return false
end

function getItensPM(id)
    Table = {}
    for i,v in ipairs(TableItens) do
        if v.ID == id then
            table.insert(Table, v)
        end
    end
    return Table
end

function InsertResult(id,item,quantidade)
    dbExec(db, "INSERT INTO Itens (ID, Item, Quantidade) VALUES (?,?,?)", id, item, quantidade)
    table.insert(TableItens, {ID = id, Item = item, Quantidade = quantidade})
end

function UpdateResult(id,item,quantidade, type)
    local Index = searchResult(id, item)
    if Index then
        local Quantidade = TableItens[Index].Quantidade
        if type == "add" then
            dbExec(db, "UPDATE Itens SET Quantidade = ? WHERE ID = ? AND Item = ?", Quantidade + quantidade, id, item)
            TableItens[Index].Quantidade = TableItens[Index].Quantidade + quantidade
        elseif type == "remove" then
            dbExec(db, "UPDATE Itens SET Quantidade = ? WHERE ID = ? AND Item = ?", Quantidade - quantidade, id, item)
            TableItens[Index].Quantidade = TableItens[Index].Quantidade - quantidade
        end
    end
end

function DeleteReuslt(id, item)
    dbExec(db, "DELETE FROM Itens WHERE ID = ? AND Item = ?", id,item)
    local Index = searchResult(id, item)
    if Index then
        table.remove(TableItens, Index)
    end
end

function GiveItem(id,item,quantidade)
    local Index = searchResult(id, item)
    if Index then
        UpdateResult(id, item, quantidade, "add")
        exports["MODInventario"]:GiveAndTakeAndGetItem("take",source,item, quantidade)
        UpdateID(source,id)
    else
        InsertResult(id, item, quantidade)
        exports["MODInventario"]:GiveAndTakeAndGetItem("take",source,item, quantidade)
        UpdateID(source,id)
    end
end
addEvent("Kings.AddPM",true)
addEventHandler("Kings.AddPM",root,GiveItem)

function TakeItem(id,item,quantidade)
    local Index = searchResult(id, item)
    if Index then
        local Quantidade = TableItens[Index].Quantidade
        if Quantidade == quantidade then
            local result = exports["MODInventario"]:GiveAndTakeAndGetItem("give",source,item, quantidade)
            if result then
                DeleteReuslt(id, item)
                UpdateID(source,id)
            end
        elseif Quantidade > quantidade then
            local result = exports["MODInventario"]:GiveAndTakeAndGetItem("give",source,item, quantidade)
            if result then
                UpdateResult(id, item, quantidade, "remove")
                UpdateID(source,id)
            end
        end
    end
end
addEvent("Kings.RemovePM",true)
addEventHandler("Kings.RemovePM",root,TakeItem)

function UpdateID(player, id)
    local Itens = exports["MODInventario"]:formatItens(getItensPM(id), "bau")
    local ItensInv = exports["MODInventario"]:getItensPlayer(player)
    triggerClientEvent(player, "MST.AttPM",player,ItensInv,Itens)
end
addEvent("Kings.UpdateID2",true)
addEventHandler("Kings.UpdateID2",root,UpdateID)


