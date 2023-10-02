local animTimer = {}
local phone = {}
local TimerCall = {}

function registerEvent (event, ...)
	addEvent(event, true)
	addEventHandler(event, ...)
end

function getPlayerFromCall(id) 
	if tonumber(id) then 
		for i, player in ipairs(getElementsByType('player')) do 
			if player ~= source then 
				if (getElementData(player, 'Call') or false) ~= false then 
					if getElementData(player, 'Call') == tonumber(id) then 
						return player
					end
				end
			end
		end
	end
	return false
end

function getPlayerReceiver(receiver) 
	for i, player in ipairs(getElementsByType('player')) do 
		if player ~= receiver then 
			if (getElementData(player, 'Recebendo') or false) ~= false then 
				if getElementData(player, 'Recebendo') == receiver then 
					return player
				end
			end
		end
	end
	return false
end

addEventHandler('onResourceStart', getResourceRootElement(getThisResource()),
	function ()
		connection = dbConnect('sqlite', 'celular.sqlite')
		dbExec(connection, 'create table if not exists celular (conta, wallpaper, settings)')	
		dbExec(connection, 'create table if not exists contatos (conta, id, nome)')
		dbExec(connection, "create table if not exists datas(login, credits)")	
		dbExec(connection, 'create table if not exists appstore(login, app)')	

		for _, player in ipairs(getElementsByType('player')) do
			if not isGuestAccount(getPlayerAccount(player)) then
				bindKey(player, config.tecla[1], config.tecla[2], openCelular)
			end
		end

		for _, player in ipairs(getElementsByType('player')) do 
			removeElementData(player, 'Call') 
			removeElementData(player, 'Recebendo')
		end
	end
)

addEventHandler('onPlayerLogin', root,
	function (_, account)
		bindKey(source, config.tecla[1], config.tecla[2], openCelular)
		local data = dbPoll(dbQuery(connection, 'select * from celular where conta = ?', getAccountName(account)), - 1)
		if (#data ~= 0) then
			local settings = fromJSON(data[1]['settings'])
			if settings then
				setElementData(source, 'Ligação', settings[1])
				setElementData(source, 'Ligação de estranhos', settings[2])
				setElementData(source, 'Mensagens', settings[3])
				setElementData(source, 'Mensagens de estranhos', settings[4])
			end
		end

		local result = dbPoll(dbQuery(connection,"SELECT * FROM datas WHERE login=?", getAccountName(getPlayerAccount(source))), -1) 
        if #result > 0 then 
            for i, dado in ipairs(result) do 
                setElementData(source, "Mbs", dado["credits"])
            end
        end
	end
) 

addEventHandler('onPlayerQuit', root,
	function ()
		if not isGuestAccount(getPlayerAccount(source)) then
			local result = dbPoll(dbQuery(connection, 'select * from celular where conta = ?', getAccountName(getPlayerAccount(source))), - 1)
			if (#result ~= 0) then
				dbExec(connection, 'update celular set settings = ? where conta = ?', toJSON({(getElementData(source, 'Ligação') or 'sim'), (getElementData(source, 'Ligação de estranhos') or 'sim'), (getElementData(source, 'Mensagens') or 'sim'), (getElementData(source, 'Mensagens de estranhos') or 'sim')}), getAccountName(getPlayerAccount(source)))
			else
				dbExec(connection, 'insert into celular (conta, wallpaper, settings) values(?, ?, ?)', getAccountName(getPlayerAccount(source)), 2, toJSON({(getElementData(source, 'Ligação') or 'sim'), (getElementData(source, 'Ligação de estranhos') or 'sim'), (getElementData(source, 'Mensagens') or 'sim'), (getElementData(source, 'Mensagens de estranhos') or 'sim')}))
			end

			local result = dbPoll(dbQuery(connection,"SELECT * FROM datas WHERE login=?", getAccountName(getPlayerAccount(source))), -1)  
        	if #result > 0 then 
        	    dbExec(connection,"UPDATE datas SET credits=? WHERE login=?", (getElementData(source, "Mbs") or 0), getAccountName(getPlayerAccount(source)))
        	else 
        	    dbExec(connection,"INSERT INTO datas (login , credits) VALUES(?, ?)", getAccountName(getPlayerAccount(source)), (getElementData(source, "Mbs") or 0))
        	end
		end

		removePhone(source)
		if isTimer(TimerCall[source]) then killTimer(TimerCall[source]) end 
		if (getElementData(source, 'Call') or false) ~= false then 
			local receiver = getPlayerFromCall(getElementData(source, 'Call'))
			if isElement(receiver) then 
				setElementData(receiver, 'Recebendo', false)
				triggerClientEvent(receiver, 'Pedro.changeWindowCell', receiver, 'inicio')
				setElementData(receiver, 'Call', false)
			end
		end
	end
)

addEventHandler('onPlayerWasted', root, function()
	triggerClientEvent(source, 'Pedro.destroySound', source)
	if (getElementData(source, 'Call') or false) ~= false then 
		local receiver = getPlayerFromCall(getElementData(source, 'Call'))
		if isElement(receiver) then 
			setElementData(receiver, 'Recebendo', false)
			triggerClientEvent(receiver, 'Pedro.changeWindowCell', receiver, 'inicio')
			setElementData(receiver, 'Call', false)
		end
	end
	
	removePhone(source)
	if isTimer(TimerCall[source]) then killTimer(TimerCall[source]) end 
	setElementData(source, 'Call', false)
	setElementData(source, 'Recebendo', false)
	triggerClientEvent(source, 'Pedro.changeWindowCell', source, 'inicio')
end)

function openCelular (player)
	if not isElement(phone[player]) then
		local result = dbPoll(dbQuery(connection, 'select * from celular where conta = ?', getAccountName(getPlayerAccount(player))), - 1)
		if (#result ~= 0) then
			triggerClientEvent(player, 'Caio.onOpenCelular', player, result[1]['wallpaper'], 'add')
		else
			triggerClientEvent(player, 'Caio.onOpenCelular', player, 1, 'add')
		end
		local data = dbPoll(dbQuery(connection, 'select * from contatos where conta = ?', getAccountName(getPlayerAccount(player))), - 1)
		if (#data ~= 0) then
			for i, v in ipairs(data) do
				triggerClientEvent(player, 'Caio.onInsertTable', player, v['nome'], v['id'])
			end
		end
	else
		triggerClientEvent(player, 'Caio.onOpenCelular', player, 1, 'remove')
	end
end

function isContatoExists (player, id)
	local data = dbPoll(dbQuery(connection, 'select * from contatos where conta = ?', getAccountName(getPlayerAccount(player))), - 1)
	if (#data ~= 0) and (type(data) == 'table') then
		for i, v in ipairs(data) do
			if (tonumber(v['id']) == id) then
				return true
			end
		end
	end
	return false
end

function isContatoExistsName (player, name)
	local data = dbPoll(dbQuery(connection, 'select * from contatos where conta = ?', getAccountName(getPlayerAccount(player))), - 1)
	if (#data ~= 0) and (type(data) == 'table') then
		for i, v in ipairs(data) do
			if (v['nome'] == name) then
				return true
			end
		end
	end
	return false
end

function isMaxContatos (player)
	local data = dbPoll(dbQuery(connection, 'select * from contatos where conta = ?', getAccountName(getPlayerAccount(player))), - 1)
	if (#data >= tonumber(config.maxContatos)) then
		return true
	end
	return false
end

function removePhone(player)
	if isElement(phone[player]) then
		destroyElement(phone[player])
	end
	if (animTimer[player]) then
		killTimer(animTimer[player])
		animTimer[player] = nil
	end
	setPedAnimation(player)
end

registerEvent('Caio.onAdicionarContato', root,
	
	function (player, id, contato)

		if id and contato then

			if isContatoExists(player, id) then
				return config.notify_server(player, 'Você já possui este contato adicionado.', 'error')
			end

			if isContatoExistsName(player, contato) then
				return config.notify_server(player, 'Você já possui um contato com este nome.', 'error')
			end

			if isMaxContatos(player) then
				return config.notify_server(player, 'Você já possui o número máximo de contatos.', 'error')
			end

			if id == getElementData(player, 'ID') then
				return config.notify_server(player, 'Você não pode adicionar seu próprio número.', 'error')
			end
			
			dbExec(connection, 'insert into contatos (conta, id, nome) values(?, ?, ?)', getAccountName(getPlayerAccount(player)), id, contato)
			config.notify_server(player, 'Você adicionou o contato '..contato..'.', 'success')
			triggerClientEvent(player, 'Caio.onInsertTable', player, contato, id)

		end

	end

)

registerEvent('Caio.onDeleteContato', root,
	function (player, id)
		if (id) then
			local data = dbPoll(dbQuery(connection, 'select * from contatos where conta = ? and id = ?', getAccountName(getPlayerAccount(player)), id), - 1)
			if (#data ~= 0) then
				dbExec(connection, 'delete from contatos where conta = ? and id = ?', getAccountName(getPlayerAccount(player)), id)
			end
		end
	end
)

registerEvent('Caio.onSetNewWallpaper', root,
	function (player, wallpaper)
		local result = dbPoll(dbQuery(connection, 'select * from celular where conta = ?', getAccountName(getPlayerAccount(player))), - 1)
		if (#result ~= 0) then
			dbExec(connection, 'update celular set wallpaper = ? where conta = ?', tonumber(wallpaper), getAccountName(getPlayerAccount(player)))
		else
			dbExec(connection, 'insert into celular (conta, wallpaper, settings) values(?, ?, ?)', getAccountName(getPlayerAccount(player)), tonumber(wallpaper), toJSON({(getElementData(player, 'Ligação') or 'sim'), (getElementData(player, 'Ligação de estranhos') or 'sim'), (getElementData(player, 'Mensagens') or 'sim'), (getElementData(player, 'Mensagens de estranhos') or 'sim')}))
		end
		config.notify_server(player, 'Você alterou seu wallpaper com sucesso.', 'success')
	end
)

registerEvent('Goiaba.setAnimationPhone', root, 
	function(value)
		if (value == 1) then
			setPedWeaponSlot(client, 0)
			if isElement(phone[client]) then
				destroyElement(phone[client])
			end
			phone[client] = createObject(330, 0, 0, 0, 0, 0, 0)
			setObjectScale(phone[client], 1.5)
			exports.bone_attach:attachElementToBone(phone[client], client, 12, 0, 0.01, 0.03, -15, 270, -15)
			setPedAnimation(client, 'ped','phone_in', 1000, false, false, false, true)
			animTimer[client] = setTimer(function(player)
				if isElement(player) then
					setPedAnimationProgress(player, 'phone_in', 0.8)
				end
			end, 500, 0, client)
			
		elseif (value == 2) then
			removePhone(client)
			setPedAnimation(client, 'ped', 'phone_out', 50, false, false, false, false)
		end
	end
)

local BlipLoc = {} local TimerLoc = {} local delayLoc = {}
registerEvent('Pedro.enviarLocalização', root, 
	function(player, id)
		if tonumber(id) then 
			local receiver = getPlayerFromID(tonumber(id))
			if isElement(receiver) then 
				if isTimer(delayLoc[player]) then
					config.notify_server(player, 'Você já enviou a localização recentemente.', 'info')
					return
				end
				if isTimer(TimerLoc[player]) then killTimer(TimerLoc[player]) end 
				if isElement(BlipLoc[player]) then destroyElement(BlipLoc[player]) end
				
				BlipLoc[player] = createBlipAttachedTo(player, config.blipLocID)
				setElementVisibleTo(BlipLoc[player], root, false)	
				setElementVisibleTo(BlipLoc[player], receiver, true)

				TimerLoc[player] = setTimer(function(player)
					if isElement(BlipLoc[player]) then destroyElement(BlipLoc[player]) end
				end, config.tempoLoc, 1, player)
				config.notify_server(player, 'Localização enviada com sucesso.', 'success')
				config.notify_server(receiver, 'Você recebeu a localização do jogador.', 'success')
				delayLoc[player] = setTimer(function () end, 60000, 1)
			else 
				config.notify_server(player, 'Indivíduo não está na cidade.', 'info')
			end
		else 
			config.notify_server(player, 'Digite um id para prosseguir.', 'info')
		end 
	end
)

registerEvent('Caio.onEnviar', root,
    function (player, id, amount)
        local receiver = getPlayerFromID(tonumber(id))
        if tonumber(amount) then
            if isElement(receiver) then
                if (getPlayerMoney(player) >= tonumber(amount)) then
                    takePlayerMoney(player, tonumber(amount))
                    givePlayerMoney(receiver, tonumber(amount))
                    config.notify_server(player, 'Você enviou R$ '..config.convertNumber(amount)..' para '..getPlayerName(receiver)..'.', 'info')
                    config.notify_server(receiver, 'Você recebeu R$ '..config.convertNumber(amount)..' de '..getPlayerName(player)..'.', 'info')
                else
                    config.notify_server(player, 'Você não possui dinheiro suficiente.', 'info')
                end
            else
                config.notify_server(player, 'Este ID não está online.', 'info')
            end
        else
            config.notify_server(player, 'Você precisa digitar um número.', 'info')
        end
    end
)

registerEvent('Pedro.ligar', root, 
	function(player, id)
		if tonumber(id) then 
			local receiver = getPlayerFromID(tonumber(id)) 
			if isElement(receiver) then
				--if (exports['vanish_inventario']:getItem(player, 'Chip') or 0) >= 1 then 
					if receiver == player then return config.notify_server(player, 'Você não pode ligar para você mesmo.', 'info') end
					if (getElementData(player, 'Mbs') or 0) >= 5 then 
						if (getElementData(receiver, 'Recebendo') or false) == false then 
							if (getElementData(receiver, 'Call') or false) == false then 
								if (getElementData(receiver, 'Ligação') or 'sim') == 'sim' then

									if (getElementData(receiver, 'Ligação de estranhos') or 'sim') == 'não' then
										if not isContatoExists(receiver, getElementData(player, 'ID')) then
											return config.notify_server(player, 'Este jogador está com a ligação de estranhos desativado.', 'info')
										end
									end

									if not isElement(phone[receiver]) then
										openCelular(receiver)
									end
									triggerClientEvent(player, 'Pedro.changeWindowCell', player, 'Chamando', (getElementData(receiver, 'Avatar') or 0))
									triggerClientEvent(player, 'Pedro.tocarSom', player, 'Files/Sons/chamando.mp3')

									triggerClientEvent(receiver, 'Pedro.changeWindowCell', receiver, 'Recebendo', (getElementData(player, 'Avatar') or 0))
									triggerClientEvent(receiver, 'Pedro.tocarSom', receiver, 'Files/Sons/recebendo_ligacao.mp3')

									setElementData(receiver, 'Recebendo', player)
									setElementData(player, 'Call', id)

									if isTimer(TimerCall[player]) then killTimer(TimerCall[player]) end 
									TimerCall[player] = setTimer(function(player, receiver)
										if isElement(player) then 
											removeElementData(player, 'Call')
											triggerClientEvent(player, 'Pedro.changeWindowCell', player, 'inicio')
											triggerClientEvent(player, 'Pedro.destroySound', player)
										end

										if isElement(receiver) then 
											removeElementData(receiver, 'Recebendo')
											removeElementData(receiver, 'Call')
											triggerClientEvent(receiver, 'Pedro.destroySound', receiver)
										end
									end, 30000, 1, player, receiver)
								else
									config.notify_server(player, 'Este jogador está com a ligação desativada', 'info')
								end
							else 
								config.notify_server(player, 'Indivíduo está em uma chamada.', 'info')
							end
						else 
							config.notify_server(player, 'Indivíduo está Recebendo uma chamada.', 'info')
						end
					else
						config.notify_server(player, 'Você não tem crédito para realizar essa ligação, recarregue eles dentro do celular.', 'info')
					end
				--else
					--config.notify_server(player, 'Você não tem um chip', 'info')
				--end
			else 
				config.notify_server(player, 'Indivíduo não está na cidade.', 'info')
			end
		else 
			config.notify_server(player, 'Digite um número válido.', 'info')
		end
	end
)

registerEvent('Pedro.atender', root, 
    function(player)
        if (getElementData(player, 'Recebendo') or false) ~= false then 
			local receiver = getElementData(player, 'Recebendo')
			if isElement(receiver) then 
				if (getElementData(player, 'Mbs') or 0) >= 5 then
           			if isTimer(TimerCall[receiver]) then killTimer(TimerCall[receiver]) end
           			setElementData(player, 'Call', (getElementData(player, 'ID') or 'N/A'))
					triggerClientEvent(player, 'Pedro.changeWindowCell', player, 'Ligação', (getElementData(receiver, 'Avatar') or 0))
					triggerClientEvent(receiver, 'Pedro.changeWindowCell', receiver, 'Ligação', (getElementData(player, 'Avatar') or 0))
					triggerClientEvent(receiver, 'Pedro.destroySound', receiver)
           			setElementData(player, 'Recebendo', false)
					triggerClientEvent(player, 'Pedro.destroySound', player)

					setElementData(receiver, 'Mbs', (getElementData(receiver, 'Mbs') or 0) - 5)
					setElementData(player, 'Mbs', (getElementData(player, 'Mbs') or 0) - 5)
					return 
				else
					config.notify_server(player, 'Você não tem crédito para atender essa ligação, recarregue eles dentro do celular.', 'info')
				end
			end
			removeElementData(player, 'Call')
			removeElementData(player, 'Recebendo')
			triggerClientEvent(player, 'Pedro.changeWindowCell', player, 'inicio')
			triggerClientEvent(player, 'Pedro.destroySound', player)
        end
    end
)

registerEvent('Pedro.recusar', root, 
    function(player)
        if (getElementData(player, 'Recebendo') or false) ~= false then 
            if isTimer(TimerCall[player]) then killTimer(TimerCall[player]) end
            setElementData(player, 'Call', false)
            local receiver = (getElementData(player, 'Recebendo'))
            if isElement(receiver) then 
                setElementData(receiver, 'Call', false)
                triggerClientEvent(receiver, 'Pedro.changeWindowCell', receiver, 'inicio')
				triggerClientEvent(receiver, 'Pedro.destroySound', receiver)
				config.notify_server(receiver, 'Chamada encerrada', 'info')
            end

			config.notify_server(player, 'Chamada encerrada', 'info')
            setElementData(player, 'Recebendo', false)
            triggerClientEvent(player, 'Pedro.changeWindowCell', player, 'inicio')
			triggerClientEvent(player, 'Pedro.destroySound', player)
        end
    end
)

registerEvent('Pedro.encerrar', root, 
    function(player)
        if (getElementData(player, 'Call') or false) ~= false then 
			local receiver = getPlayerFromCall(getElementData(source, 'Call'))
			if isElement(receiver) then
				setElementData(receiver, 'Recebendo', false)
				triggerClientEvent(receiver, 'Pedro.changeWindowCell', receiver, 'inicio')
				setElementData(receiver, 'Call', false)
				triggerClientEvent(receiver, 'Pedro.destroySound', receiver)
			else 
				local receiver = getPlayerReceiver(player)
				if isElement(receiver) then 
					setElementData(receiver, 'Recebendo', false)
					triggerClientEvent(receiver, 'Pedro.changeWindowCell', receiver, 'inicio')
					setElementData(receiver, 'Call', false)
					triggerClientEvent(receiver, 'Pedro.destroySound', receiver)
				end
			end

			if isTimer(TimerCall[player]) then killTimer(TimerCall[player]) end
            setElementData(player, 'Call', false)
            setElementData(player, 'Recebendo', false)
            triggerClientEvent(player, 'Pedro.changeWindowCell', player, 'inicio')
			triggerClientEvent(player, 'Pedro.destroySound', player)
			config.notify_server(player, 'Chamada encerrada', 'info')
        end
    end
)

registerEvent('Pedro.compraPlano', root, 
	function(player, amount, preco)
		if getPlayerMoney(player) >= tonumber(preco) then 
			takePlayerMoney(player, preco)
			setElementData(player, 'Mbs', (getElementData(player, 'Mbs') or 0) + amount)
			config.notify_server(player, 'Crédito recarregado.', 'info')
		else
			config.notify_server(player, 'Você não tem dinheiro suficente para recarregar', 'info')
		end		
	end
)

registerEvent('Goiaba.onSendMessage', root, 
	function(player, id, message)
		if tonumber(id) then 
			if message then 
				local receiver = getPlayerFromID(tonumber(id))
				if isElement(receiver) then 
					if (getElementData(receiver, 'Mensagens') or 'sim') == 'não' then 
						return config.notify_server(player, 'Individuo não esta aceitando mensagens.', 'info')
					end

					if (getElementData(receiver, 'Mensagens de estranhos') or 'sim') == 'não' then 
						if (isContatoExists(receiver, getElementData(player, 'ID')) == false) then
							return config.notify_server(player, 'Individuo não esta aceitando mensagens de estranhos.', 'info')
						end
					end

					triggerClientEvent(player, 'Pedro.insertMessage', player, getPlayerName(receiver) ..getPlayerName(player), message, 'enviado', (getElementData(receiver, 'Avatar') or 0), getPlayerName(receiver), id)
					triggerClientEvent(receiver, 'Pedro.insertMessage', receiver,  getPlayerName(player) ..getPlayerName(receiver), message, 'recebido', (getElementData(player, 'Avatar') or 0), getPlayerName(player), (getElementData(player, 'ID') or false))
					config.notify_server(player, 'Mensagem enviada.', 'info')
					config.notify_server(receiver, 'Mensagem recebida do individuo '..getPlayerName(player)..'.', 'info')
				else 
					config.notify_server(player, 'Individuo não esta presente', 'info')
				end
			end
		end
	end
)

registerEvent('Pedro.addApp', root, 
	function(player, app)
		dbExec(connection, 'Insert into appstore(login, app) Values(?, ?)', getAccountName(getPlayerAccount(player)), app)
	end
)

registerEvent('Pedro.makeAppsS', root,
	function()
		local result = dbPoll(dbQuery(connection, 'Select * from appstore Where login = ?', getAccountName(getPlayerAccount(source))), - 1)
		for i, v in ipairs(result) do 
			triggerClientEvent(source, 'Pedro.makeAppsC', source, v['app'])
		end
	end
)

local matchs = {} local likes = {} 

registerEvent('Pedro.likeTinder', root, 
	function(player, id)
		local receiver = getPlayerFromID(tonumber(id)) 
		if isElement(receiver) then 
			if not likes[player] then 
				likes[player] = {}
			end

			table.insert(likes[player], getPlayerName(receiver)) 

			if likes[receiver] then 
				for _, name in ipairs(likes[receiver]) do 
					if name == getPlayerName(player) then
						if not matchs[receiver] then   	 
							matchs[receiver] = {} 	 	
						end 	
						if not matchs[player] then
							matchs[player] = {}
						end	
						
						table.insert(matchs[player], getPlayerName(receiver))
						table.insert(matchs[receiver], getPlayerName(player))

						config.notify_server(receiver, 'Você deu match com '..getPlayerName(player), 'info')
						config.notify_server(player, 'Você deu match com '..getPlayerName(receiver), 'info')

						triggerClientEvent(player, 'Pedro.addConversaOnMatch', player, (getElementData(receiver, 'Avatar') or 0), getPlayerName(receiver), (getElementData(receiver, 'ID') or -1))
						triggerClientEvent(receiver, 'Pedro.addConversaOnMatch', receiver, (getElementData(player, 'Avatar') or 0), getPlayerName(player), (getElementData(player, 'ID') or -1))
						break 
					end
				end
			end
		else
			print(21313)
		end
	end
)

registerEvent('Goiaba.onSendMessageTinder', root, 
	function(player, id, message)
		if tonumber(id) then 
			if message then 
				local receiver = getPlayerFromID(tonumber(id))
				if isElement(receiver) then 

					triggerClientEvent(player, 'Pedro.insertMessageTinder', player, getPlayerName(receiver) ..getPlayerName(player), message, 'enviado', (getElementData(receiver, 'Avatar') or 0), getPlayerName(receiver), id)
					triggerClientEvent(receiver, 'Pedro.insertMessageTinder', receiver,  getPlayerName(player) ..getPlayerName(receiver), message, 'recebido', (getElementData(player, 'Avatar') or 0), getPlayerName(player), (getElementData(player, 'ID') or false))
					config.notify_server(player, 'Mensagem enviada.', 'info')
					config.notify_server(receiver, 'Mensagem recebida do individuo '..getPlayerName(player)..'.', 'info')
				else 
					config.notify_server(player, 'Individuo não esta presente', 'info')
				end
			end
		end
	end
)

registerEvent('Pedro.makeTinder', root, 
	function()
		for i, v in ipairs(getElementsByType('player')) do 
			if v ~= source then 
				if not matchs[source] then 
					matchs[source] = {}
				end
				verif = true 
				for _, match in ipairs(matchs[source]) do 
					if not getPlayerName(v) == match then 
						verif = false 
					end
				end

				if verif == true then 
					triggerClientEvent(source, 'Pedro.insertTinder', source, (getElementData(v, 'Avatar') or 1), getPlayerName(v), (getElementData(v, 'Biografia') or 'Não há biografia'), (getElementData(v, 'ID') or -1)) 
				end
				verif = true 
			end
		end
	end 
)
-----=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-----

chamado = {}
typeChamado = {}

registerEvent('Caio.onChamarOcorrencia', root,
    function(player, tipo)
        if not chamado[player] or (chamado[player] == false) then
			exports["infobox"]:addBox(player, "success", 'Você chamou um '..tipo..'.')                                    
            messageToPlayers('#FFFFFFO jogador '..getPlayerName(player)..' #FFFFFFchamou '..tipo..'.\n#FFFFFFUtilize /aceitar '..(getElementData(player, 'ID') or 'N/A'), tipo)
            chamado[player] = true
			typeChamado[player] = tipo
            setTimer(function(player)
                if isElement(player) then
                    if chamado[player] then
                        chamado[player] = false
						exports["infobox"]:addBox(player, "info", "Você já pode chamar outro staff.")                                    
                    end
                end
            end, 4 * 60000, 1, player)
        end
    end
)

blipsS = {}

addCommandHandler('aceitar',
    function(player, _, id)
        if (id) then
            local receiver = getPlayerFromID(tonumber(id))
            if (receiver) then
				if typeChamado[receiver] and isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(player)), aclGetGroup(typeChamado[receiver])) then
                    if chamado[receiver] or (chamado[receiver] == true) then
                        chamado[receiver] = false
						if (typeChamado[receiver] == 'Staff') then
                        	local pos = {getElementPosition(receiver)}
                        	setElementPosition(player, pos[1] + 1, pos[2], pos[3])
                        else
							blipsS[receiver] = createBlipAttachedTo(receiver, 41)
							setElementVisibleTo(blipsS[receiver], root, false)
							setElementVisibleTo(blipsS[receiver], player, true)
							setTimer(function(blip)
								if isElement(blip) then
									destroyElement(blip)
								end
							end, 3*60000, 1, blipsS[receiver])
						end
						exports["infobox"]:addBox(receiver, "info", 'O '..typeChamado[receiver]..' '..getPlayerName(player)..' aceitou seu chamado.')   
						exports["infobox"]:addBox(player, "info", 'Você aceitou o chamado do jogador '..getPlayerName(receiver)..'.')   
                    else
						exports["infobox"]:addBox(player, "info", 'O jogador '..getPlayerName(receiver)..' não chamou '..typeChamado[receiver]..'.')   
                    end
                else
					exports["infobox"]:addBox(player, "error", "Este jogador não existe.")   
                end
            else
				exports["infobox"]:addBox(player, "info", "Digite o ID do jogador.")   
            end
        end
    end     
)

function messageToPlayers (message, acl)
    if (message) then
        for i, v in ipairs(getElementsByType('player')) do
            if not isGuestAccount(getPlayerAccount(v)) then
                if isObjectInACLGroup('user.'.. getAccountName(getPlayerAccount(v)), aclGetGroup(acl)) then
                    outputChatBox(message, v, 255, 255, 255, true)
                end
            end
        end
    end
end

function getPlayerFromID (id)
    if (id) then
        for i, v in ipairs(getElementsByType('player')) do
            if not isGuestAccount(getPlayerAccount(v)) then
                if (getElementData(v, 'ID') or 'N/A') == tonumber(id) then
                    return v
                end
            end
        end
    end
    return false
end

local tableAccents = {["à"] = "a",["á"] = "a",["â"] = "a",["ã"] = "a",["ä"] = "a",["ç"] = "c",["è"] = "e",["é"] = "e",["ê"] = "e",["ë"] = "e",["ì"] = "i",["í"] = "i",["î"] = "i",["ï"] = "i",["ñ"] = "n",["ò"] = "o",["ó"] = "o", ["ô"] = "o",["õ"] = "o",["ö"] = "o",["ù"] = "u",["ú"] = "u",["û"] = "u",["ü"] = "u",["ý"] = "y",["ÿ"] = "y",["À"] = "A",["Á"] = "A",["Â"] = "A",["Ã"] = "A",["Ä"] = "A",["Ç"] = "C",["È"] = "E",["É"] = "E",["Ê"] = "E",["Ë"] = "E",["Ì"] = "I",["Í"] = "I",["Î"] = "I",["Ï"] = "I",["Ñ"] = "N",["Ò"] = "O",["Ó"] = "O",["Ô"] = "O",["Õ"] = "O",["Ö"] = "O",["Ù"] = "U",["Ú"] = "U",["Û"] = "U",["Ü"] = "U",["Ý"] = "Y"}
function removeAccents(str)
	local noAccentsStr = ""
	for strChar in string.gfind(str, "([%z\1-\127\194-\244][\128-\191]*)") do
		if (tableAccents[strChar] ~= nil) then
			noAccentsStr = noAccentsStr..tableAccents[strChar]
		else
			noAccentsStr = noAccentsStr..strChar
		end
	end
	return noAccentsStr
end

addEvent("Caio.searchMusics", true)
addEventHandler("Caio.searchMusics", root,
    function(str)
        str = removeAccents(str):gsub("%s", "%%20")
		fetchRemote("http://api.soundcloud.com/tracks.json?client_id=N2eHz8D7GtXSl6fTtcGHdSJiS74xqOUI&q="..str.."&limit=10",
			function(resposta, erro, player)
				if (resposta ~= "ERROR") and (erro == 0) then
					data = {fromJSON (resposta)}
					triggerClientEvent(player, "Caio.getMusics", resourceRoot, data)
				end
			end
		, "", false, client)
    end
)

function messageDiscord(message, link)
	sendOptions = {
	    queueName = "dcq",
	    connectionAttempts = 3,
	    connectTimeout = 5000,
	    formFields = {
	        content="```\n"..message.."```"
	    },
	}
	fetchRemote(link, sendOptions, function () return end)
end

function getPlayerID(id)
	v = false
	for i, player in ipairs (getElementsByType("player")) do
		if getElementData(player, "ID") == id then
			v = player
			break
		end
	end
	return v
end