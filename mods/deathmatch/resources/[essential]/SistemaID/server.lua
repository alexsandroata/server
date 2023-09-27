addEventHandler("onResourceStart", resourceRoot, 
    function (nameResource)
        if ( config["Connection"]["connectionType"] == "MySQL" ) then
            db = dbConnect("mysql", "dbname="..config["Connection"]["dbName"].."; host="..config["Connection"]["hostMySQL"], config["Connection"]["dbUser"], config["Connection"]["dbPassword"], "autoreconnect=1")
            if ( db ) then
                dbExec(db, "create table if not exists Data( Login TEXT, ID INTEGER, Serial TEXT )")
                outputDebugString("Database do ["..getResourceName(nameResource).."] conectada com sucesso ao servidor!", 4, 0, 255, 0)
            else
                outputDebugString("Database do ["..getResourceName(nameResource).."] falhou ao conectar com o servidor!", 4, 255, 0, 0)
            end
        elseif ( config["Connection"]["connectionType"] == "SQLite" ) then
            db = dbConnect("sqlite", config["Connection"]["directorySQLite"].."database.db")
            if ( db ) then
                dbExec(db, "create table if not exists Data( Login TEXT, ID INTEGER, Serial TEXT )")
                outputDebugString("Database do ["..getResourceName(nameResource).."] conectada com sucesso ao servidor!", 4, 0, 255, 0)
            else
                outputDebugString("Database do ["..getResourceName(nameResource).."] falhou ao conectar com o servidor!", 4, 255, 0, 0)
            end
        end
        for i, v in ipairs(getElementsByType("player")) do
            refreshId(v)
        end
    end
)

addCommandHandler(config["Definitions"]["changeID"], 
    function (player, _, playerID, id)
        if ( player and isElement(player) and getElementType(player) == "player" ) then
            if ( playerID and id ) then
                local id = tonumber(id)
                local playerID = tonumber(playerID)
                if ( playerID and id ) then
                    local idPlayer = getPlayerID(playerID)
                    if ( idPlayer ) then
                        local pesquisa = dbPoll(dbQuery(db, "select * from Data where Login = ?", getAccountName(getPlayerAccount(idPlayer))), -1)
                        if ( #pesquisa ~= 0 ) then
                            dbExec(db, "update Data set ID = ? where Login = ?", id, getAccountName(getPlayerAccount(idPlayer)))
                            removeElementData(idPlayer, config["Definitions"]["elementID"])
                            setElementData(idPlayer, config["Definitions"]["elementID"], id)
                            message(player, "ID alterado com sucesso!", "info")
                            message(idPlayer, "Seu ID foi alterado para "..id.."!", "info")
                        else
                            message(player, "Este player não existe!", "error")
                        end
                    else
                        message(player, "Este player está offline ou não existe!", "error")
                    end
                else
                    message(player, "Digite um ID válido!", "error")
                end
            else
                message(player, "Digite /"..config["Definitions"]["changeID"].." [ID do player] [novo ID]", "error")
            end
        end
    end
)

addEventHandler("onPlayerLogin", getRootElement(), 
    function ()
        refreshId(source)
    end
)

refreshId = function(player)
    if ( player and isElement(player) and getElementType(player) == "player" ) then
        local pesquisa = dbPoll(dbQuery(db, "select * from Data where Login = ?", getAccountName(getPlayerAccount(player))), -1)
        if ( #pesquisa == 0 ) then
            local id = getAccountID(getPlayerAccount(player)) + config["Definitions"]["startID"]
            dbExec(db, "insert into Data values (?, ?, ?)", getAccountName(getPlayerAccount(player)), id, getPlayerSerial(player))
            setElementData(player, config["Definitions"]["elementID"], id)
        else
            local id = pesquisa[1]["ID"]
            setElementData(player, config["Definitions"]["elementID"], id)
        end
    end
end