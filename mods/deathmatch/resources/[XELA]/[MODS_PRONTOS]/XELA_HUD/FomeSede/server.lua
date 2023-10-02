connection = dbConnect('sqlite', 'dados.sqlite')
dbExec(connection, 'CREATE TABLE IF NOT EXISTS fs (conta, fome, sede)')

addEventHandler ( "onPlayerLogin", root,
  function ( _, acc )
	setTimer ( Carregar_FS, 50, 1, acc )
  end
)

function Carregar_FS(conta)
	if not isGuestAccount(conta) then
		if conta then
			local result = dbPoll(dbQuery(connection, 'SELECT * FROM fs WHERE conta = ?', getAccountName(conta)), - 1)
			local player = getAccountPlayer(conta)
			if #result ~= 0 then
				local fome = result[1]['fome']
				local sede = result[1]['sede']
				setElementData(player, "fome", tonumber(fome))
				setElementData(player, "sede", tonumber(sede))
			else
				setElementData(player, "fome", tonumber(100))
				setElementData(player, "sede", tonumber(100))
			end
		end
	end
end

function Iniciar_FS_Resource(res)
	if res == getThisResource() then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount(player)
			if not isGuestAccount(acc) then
				Carregar_FS(acc)
			end
		end
	end
end
addEventHandler("onResourceStart", getRootElement(), Iniciar_FS_Resource )

function Salvar_FS(conta)
	if conta then
		local fome = getElementData(source, "fome") or 100
		local sede = getElementData(source, "sede") or 100
		local result = dbPoll(dbQuery(connection, 'SELECT * FROM fs WHERE conta = ?', getAccountName(conta)), - 1)
		if #result ~= 0 then
			dbExec(connection, 'UPDATE fs SET fome=?, sede=? WHERE conta=?', fome, sede, getAccountName(conta))
		else
			dbExec(connection, 'INSERT INTO fs (conta, fome, sede) VALUES(?, ?, ?)', getAccountName(conta), fome, sede)
		end
	end
end

function checkFomeCount()
	for i, player in ipairs(getElementsByType("player")) do
		local acc = getPlayerAccount(player)
		if not isGuestAccount(acc) then
			local fome = getElementData(player,"fome") or 0
			setElementData(player, "fome", fome -1)
			if fome <= 10 then
				exports["XELA_Notify"]:addBox(player, "Você precisa se alimentar.", "info")
			end
			if fome <= 0 then
				setElementData(player,"fome",1)
				killPlayer(player)
			end
		end
	end
end
setTimer(checkFomeCount,100000,0)

function checkSedeCount()
	for i, player in ipairs(getElementsByType("player")) do
		local acc = getPlayerAccount(player)
		if not isGuestAccount(acc) then
			local sede = getElementData(player,"sede") or 0
			setElementData(player, "sede", sede -1)
			if sede <= 10 then
				exports["XELA_Notify"]:addBox(player, "Você precisa beber algo.", "info")
			end
			if sede <= 0 then
				setElementData(player,"sede", 1)
				killPlayer(player)
			end
		end
	end
end
setTimer(checkSedeCount,80000,0)

function Desligar_FS(res)
    if res == getThisResource() then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount (player)
			if not isGuestAccount(acc) then
				Salvar_FS(acc)
			end
		end
	end
end
addEventHandler("onResourceStop", getRootElement(), Desligar_FS)

function Sair_Servidor(quitType)
	local acc = getPlayerAccount(source)
	if not isGuestAccount(acc) then
		if acc then
			Salvar_FS(acc)
		end
	end
end
addEventHandler("onPlayerQuit", getRootElement(), Sair_Servidor)
