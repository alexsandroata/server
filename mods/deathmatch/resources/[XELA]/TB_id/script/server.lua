addEventHandler("onResourceStart", resourceRoot, function(res)
    if res == getThisResource() then
        db = dbConnect( "sqlite", "passaporte.sqlite" )
        dbExec(db, "CREATE TABLE IF NOT EXISTS passaportes (passaporte, conta, serial)")
        if db then
            outputDebugString("dbConnect[passaporte]: Sucesso!")
        else
            outputDebugString("dbConnect[passaporte]: Fail!")
        end
    end
end)

local getPlayerID = function(id)
	v = false
	for i, player in ipairs (getElementsByType("player")) do
		if getElementData(player, "ID") == id then
			v = player
			break
		end
	end
	return v
end

addEventHandler("onPlayerLogin", root, function(_, acc)
    local data = dbPoll(dbQuery(db, "SELECT * FROM passaportes WHERE conta = ?", getAccountName(acc)), -1)
    if #data >= 1 then 
        for i, data in ipairs (data) do
            local IDJogador = data["passaporte"]
            setElementData(source, "ID", tonumber(IDJogador))
            dbExec(db, "UPDATE passaportes SET serial = ? WHERE conta = ?", getPlayerSerial(source), getAccountName(getPlayerAccount(source)))
        end
    else
        local IDNovo = getAccountID(acc)
        dbExec(db, "INSERT INTO passaportes VALUES( ?, ?, ? )", tonumber(IDNovo), getAccountName(acc), getPlayerSerial(source))
        setElementData(source, "ID", tonumber(IDNovo))
    end
end)

addEventHandler("onResourceStart", resourceRoot, function()
    for _, player in ipairs(getElementsByType("player")) do 
        local acc = getPlayerAccount(player)
        if getAccountName(getPlayerAccount(player)) ~= "guest" then 
            local data = dbPoll(dbQuery(db, "SELECT * FROM passaportes WHERE conta = ?", getAccountName(getPlayerAccount(player))), -1)
            if #data >= 1 then
                for i, data in ipairs (data) do
                    local IDJogador = data["passaporte"]
                    setElementData(player, "ID", tonumber(IDJogador))
                    dbExec(db, "UPDATE passaportes SET serial = ? WHERE conta = ?", getPlayerSerial(player), getAccountName(getPlayerAccount(player)))
                end
            else
                local IDNovo = getAccountID(acc)
                dbExec(db, "INSERT INTO passaportes VALUES( ?, ?, ?)", tonumber(IDNovo), getAccountName(acc), getPlayerSerial(player))
                setElementData(player, "ID", tonumber(IDNovo))
            end
        end
    end
end)

function getSerialByID(rg)
    local result = dbPoll(dbQuery(db, 'select * from passaportes where passaporte = ?', rg), - 1)
    if #result ~= 0 then
        return result[1]['serial'], result[1]['conta']
    end
end

function getIdByConta(conta)
    local result = dbPoll(dbQuery(db, 'select * from passaportes where conta = ?', conta), - 1)
    if #result ~= 0 then
        return result[1]['passaporte'], result[1]['serial']
    end
end

local getNameFromID = function(player, command, id, ...)
    if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("STAFF")) then
        if(id) then
            local playerID = tonumber(id)
            if(playerID) then
                local Player2 = getPlayerID(playerID)
                if(Player2) then	
                    outputChatBox ("#00ff00✘ #ffffffINFO #00ff00✘➺ #ffffff Nome do Jogador #00ff00" .. getPlayerName(Player2) .."", player, 255, 255, 255, true)
                else
                    outputChatBox ("#00ff00✘ #ffffffERRO #00ff00✘➺ #ffffff O Jogador(a) de ID: #00ff00(" .. id .. ") #ffffffNão Foi Encontrado!", player, 255, 255, 255, true)
                end 
            else
                outputChatBox ("#00ff00✘ #ffffffERRO #00ff00✘➺ #ffffff ID: #00ff00(" .. id .. ") #ffffffInválido!", player, 255, 255, 255, true)
            end
        else
            outputChatBox ("#00ff00✘ #ffffffERRO #00ff00✘➺ #ffffffUse /id #00ff00[#ffffffID#00ff00]", player, 255, 255, 255, true)
        end
    else
        exports.XELA_Notify:addBox(player, "Você não tem permissão!", "error")
    end
end
addCommandHandler("id", getNameFromID)

local setID = function(thePlayer, cmd, oldid, newid)
    if tonumber(oldid) and tonumber(newid) and isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( thePlayer ) ), aclGetGroup ( "Console" ) ) then
        local player = getPlayerID(tonumber(oldid))
        local player_2 = getPlayerID(tonumber(newid))
        if isElement(player_2) then
            setElementData(player_2, "ID", tonumber(oldid))
        end
        if isElement(player) then
            setElementData(player, "ID", tonumber(newid))
        end
        local data = dbPoll(dbQuery(db, "SELECT * FROM passaportes WHERE passaporte = ?", tonumber(oldid)), -1)
        if #data >= 1 then
            local account_old = data[1]["conta"]
            dbExec(db, "UPDATE passaportes SET passaporte = ? WHERE passaporte = ?", tonumber(oldid), tonumber(newid))
            dbExec(db, "UPDATE passaportes SET passaporte = ? WHERE conta = ?", tonumber(newid), account_old)
        end
        exports.XELA_Notify:addBox(player, "O staff "..removeHex(getPlayerName(thePlayer)).." trocou seu id para "..tonumber(newid).."!", "info")
        exports.XELA_Notify:addBox(thePlayer, "Você alterou o ID "..tonumber(oldid).." para o ID "..tonumber(newid).."!", "info")
    end
end
addCommandHandler("setid", setID)

function removeHex (s)
    return s:gsub ("#%x%x%x%x%x%x", "") or false
end

bags = {}

function takeItemInv(player)
	bags[player] = createObject(2960, 0, 0, 0)
	setObjectScale(bags[player], 0.3)
    setPedAnimation(player, "CARRY", "crry_prtial", 4.1, true, true, true)
	exports.bone_attach:attachElementToBone(bags[player], player, 4, 0.4, 0.1, -0.3, -40, -65, 0)
	toggleControl(player, "fire", false)
end
addCommandHandler("schootzgay", takeItemInv)