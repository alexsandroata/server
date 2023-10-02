--== Script feito por:
--== ● Caio ●
--== Discord: Caio#8888
--===================================================
--== Qualquer problema procure pelo meu discord.
--===================================================

size = {}
function sizeFormat(size)
	local size = tostring(size)
	if size:len() >= 4 then		
		if size:len() >= 7 then
			if size:len() >= 9 then
				local returning = size:sub(1, size:len()-9)
				if returning:len() <= 1 then
					returning = returning.."."..size:sub(2, size:len()-7)
				end
				return returning.." GB";
			else				
				local returning = size:sub(1, size:len()-6)
				if returning:len() <= 1 then
					returning = returning.."."..size:sub(2, size:len()-4)
				end
				return returning.." MB";
			end
		else		
			local returning = size:sub(1, size:len()-3)
			if returning:len() <= 1 then
				returning = returning.."."..size:sub(2, size:len()-1)
			end
			return returning.." KB";
		end
	else
		return size.." B";
	end
end

function getSizingFiles ()
    for page, _ in pairs(config.abas) do
        if config.abas[page] and config.abas[page].mods and type(config.abas[page].mods) == 'table' then
            for i, v in ipairs(config.abas[page].mods) do
				if fileExists('assets/mods/'..v.modelo..'.txd') and fileExists('assets/mods/'..v.modelo..'.dff') then
					local file_txd, file_dff = fileOpen('assets/mods/'..v.modelo..'.txd'), fileOpen('assets/mods/'..v.modelo..'.dff')
					local size_txd, size_dff = fileGetSize(file_txd), fileGetSize(file_dff)
					size[v.modelo] = sizeFormat(size_txd + size_dff)
					fileClose(file_txd)
					fileClose(file_dff)
				else
					print('Está faltando arquivos: assets/mods/'..v.modelo..'')
				end
            end
        end
    end
end
getSizingFiles()

addEvent('getSizeFiles', true)
addEventHandler('getSizeFiles', root, function ()
    triggerClientEvent(source, 'setSizeFiles', source, size)
end)

registred = {}
addEvent('saveAtivos', true)
addEventHandler('saveAtivos', root, function (tab)
	registred[source] = tab
end)

connection = dbConnect('sqlite', 'assets/registred.sqlite')
dbExec(connection, 'CREATE TABLE IF NOT EXISTS Ativados (account, modelos)')

setTimer(function()
	for i, v in ipairs(getElementsByType('player')) do
		local account = getPlayerAccount(v)
		if not isGuestAccount(account) then
			local query = dbPoll(dbQuery(connection, 'SELECT * FROM Ativados WHERE account = ?', getAccountName(account)), - 1)
			if (#query > 0) then
				local json = fromJSON(query[1]['modelos'])
				registred[v] = json
				triggerClientEvent(v, 'ativeMods', v, json)
				dbExec(connection, 'DELETE FROM Ativados WHERE account = ?', getAccountName(account))
			end
		end
	end
end, 300, 1)

addEventHandler('onPlayerLogin', root, function (_, account)
	local query = dbPoll(dbQuery(connection, 'SELECT * FROM Ativados WHERE account = ?', getAccountName(account)), - 1)
	if (#query > 0) then
		local json = fromJSON(query[1]['modelos'])
		registred[source] = json
		triggerClientEvent(source, 'ativeMods', source, json)
		dbExec(connection, 'DELETE FROM Ativados WHERE account = ?', getAccountName(account))
	end
end)

addEventHandler('onResourceStop', resourceRoot, function ()
	for i, v in ipairs(getElementsByType('player')) do
		local account = getPlayerAccount(v)
		if not isGuestAccount(account) then
			if (registred[v] and #registred[v] > 0) then
				dbExec(connection, 'INSERT INTO Ativados (account, modelos) VALUES(?, ?)', getAccountName(account), toJSON(registred[v]))
			end
		end
	end
end)

addEventHandler('onPlayerQuit', root, function ()
	local account = getPlayerAccount(source)
	if not isGuestAccount(account) then
		if (registred[source] and #registred[source] > 0) then
			dbExec(connection, 'INSERT INTO Ativados (account, modelos) VALUES(?, ?)', getAccountName(account), toJSON(registred[source]))
		end
	end
end)