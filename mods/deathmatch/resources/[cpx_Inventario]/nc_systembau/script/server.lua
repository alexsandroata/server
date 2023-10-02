db = dbConnect("sqlite", "db/dados.db")
dbExec(db, "CREATE TABLE IF NOT EXISTS Itens (ID, Item, Quantidade)")

Query = dbQuery(db, "SELECT * FROM Itens")
Result = dbPoll(Query, -1)
TableItens = Result

Bau = {}

function CriarBaus()
    for i = 1,#Config.Baus do
        local Acls = toJSON(Config.Baus[i].Acls)
        local Peso = Config.Baus[i].Peso
        local x,y,z = Config.Baus[i].Posicao[1],Config.Baus[i].Posicao[2],Config.Baus[i].Posicao[3]
        local rx,ry,rz = Config.Baus[i].Rotacao[1],Config.Baus[i].Rotacao[2],Config.Baus[i].Rotacao[3]
        local interior = Config.Baus[i].Interior
        local dimensao = Config.Baus[i].Dimensao
        Bau[i] = createObject(2332, x,y,z -0.5,rx,ry,rz)
        setElementData(Bau[i], "Kings.IDBau",{i, Acls, Peso})
        setElementInterior(Bau[i], interior)
        setElementDimension(Bau[i], dimensao)
    end
end
addEventHandler("onResourceStart",resourceRoot,CriarBaus)

addEventHandler("onElementClicked",root,function(b,s,player)
    if b == "left" and s == "down" and getElementType(source) == "object" then
        local Tabela = getElementData(source, "Kings.IDBau")
        if Tabela then
            local ID, Acls,Peso = Tabela[1], fromJSON(Tabela[2]), Tabela[3]
            local PermAcl, PermMover = isObjectInTableACLGroups(player, Acls)
            if PermAcl then
                local x,y,z = getElementPosition(source)
                local x2,y2,z2 = getElementPosition(player)
                if getDistanceBetweenPoints3D(x,y,z,x2,y2,z2) <= 3 then
                    local Itens = exports["MODInventario"]:formatItens(getItensBau(ID), "bau")
                    local ItensInv = exports["MODInventario"]:getItensPlayer(player)
                    triggerClientEvent(player, "MST.OpenChest",player, ID, ItensInv, Itens,Peso, PermMover)
                end 
            end
        end
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
addEvent("MST.ClearID",true)
addEventHandler("MST.ClearID",root,clearID)


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

function getItensBau(id)
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
addEvent("Kings.AddBau",true)
addEventHandler("Kings.AddBau",root,GiveItem)

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
addEvent("Kings.RemoveBau",true)
addEventHandler("Kings.RemoveBau",root,TakeItem)

function UpdateID(player, id)
    local Itens = exports["MODInventario"]:formatItens(getItensBau(id), "bau")
    local ItensInv = exports["MODInventario"]:getItensPlayer(player)
    triggerClientEvent(player, "MST.AttChest",player,ItensInv,Itens)
end
addEvent("Kings.UpdateID",true)
addEventHandler("Kings.UpdateID",root,UpdateID)


