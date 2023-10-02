tableSave = {}
tableSaveRender = {}

addEventHandler("onResourceStart", resourceRoot,
function()
    db = dbConnect("sqlite", "dados.sqlite")
    dbExec(db, "CREATE TABLE IF NOT EXISTS SaveLag(account, dataAdicionais, predefenido, dataRenders)")
    if config["Mensagem Start"] then
        outputDebugString("["..getResourceName(getThisResource()).."] Startado com sucesso!")
    end
    for i, v in ipairs(getElementsByType("player")) do
        local result = dbPoll(dbQuery(db, "SELECT * FROM SaveLag WHERE account = ?", puxarConta(v)), -1)
        if #result <= 0 then
            tableSave[v] = {}
            tableSaveRender[v] = {}
            for k, b in ipairs(config["Adicionais"]) do
                table.insert(tableSave[v], {b[1], b[2], b[3], b[4], b[5], b[6]})
            end
            for k, b in pairs(config["Renderizações"]) do
                table.insert(tableSaveRender[v], {name = k, qnt = b})
            end
            dbExec(db, "INSERT INTO SaveLag(account, dataAdicionais, predefenido, dataRenders) VALUES(?,?,?,?)", puxarConta(v), toJSON(tableSave[v]), "", toJSON(tableSaveRender[v]))
        end
        if (getElementData(v, "Mira") or false) then
            triggerClientEvent(v, "JOAO.loadSetLag", v, (getElementData(v, "Mira") or false))
        end
    end
end)

addEvent("JOAO.sendDataSystemLag", true)
addEventHandler("JOAO.sendDataSystemLag", root,
function(player)
    local result = dbPoll(dbQuery(db, "SELECT * FROM SaveLag WHERE account = ?", puxarConta(player)), -1)
    triggerClientEvent(player, "JOAO.receiveDataSystemLag", player, result)
end)

addEventHandler("onPlayerLogin", root,
function(_, account)
    local result = dbPoll(dbQuery(db, "SELECT * FROM SaveLag WHERE account = ?", getAccountName(account)), -1)
    if #result > 0 then
        triggerClientEvent(source, "JOAO.setStatesLag", source, result)
    end
end)

addEvent("JOAO.attAntLag", true)
addEventHandler("JOAO.attAntLag", root,
function(player, tableAdicionais, tableRenders, predefenido)
    local result = dbPoll(dbQuery(db, "SELECT * FROM SaveLag WHERE account = ?", puxarConta(player)), -1)
    tableSave[player] = {}
    tableSaveRender[player] = {}
    if #result > 0 then
        for k, b in ipairs(tableAdicionais) do
            table.insert(tableSave[player], {b[1], b[2], b[3], b[4], b[5], b[6]})
        end
        for k, b in pairs(tableRenders) do
            table.insert(tableSaveRender[player], {name = k, qnt = b})
        end
        dbExec(db, "UPDATE SaveLag SET dataAdicionais = ?, dataRenders = ?, predefenido = ? WHERE account = ?", toJSON(tableSave[player]), toJSON(tableSaveRender[player]), predefenido, puxarConta(player))
    else
        for k, b in ipairs(tableAdicionais) do
            table.insert(tableSave[player], {b[1], b[2], b[3], b[4], b[5], b[6]})
        end
        for k, b in pairs(tableRenders) do
            table.insert(tableSaveRender[player], {name = k, qnt = b})
        end
        dbExec(db, "INSERT INTO SaveLag(account, dataAdicionais, predefenido, dataRenders) VALUES(?,?,?,?)", puxarConta(player), toJSON(tableSave[player]), predefenido, toJSON(tableSaveRender[player]))
    end
end)