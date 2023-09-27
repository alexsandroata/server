-- https://globaldrops.blogspot.com
-- https://discord.gg/EjXJUdspWb

--[[

#Mandar uma notificação
sendNotification(player, "tipo", "mensagem")
tipo = {
    info
    success
    error
    warn
    chernaruz
}

#Apenas quem está no /invadmin vai ver essa mensagem
sendNotificationAdmin(mensagem)

--

sendProgressbar(player, tempo em segundos, mensagem)
playSound(player, "sound.mp3")
playSound3D(alvo, "sound.mp3", distância)

--

#Obter informação do item na mão
getItemHand(player)
EX: local slot, item, durability, amount, serial, temporary = getItemHand(player)

--

#Obter informações do item
getItem(player, slot, item, result)
Result = {
    1 = slot
    2 = item
    3 = durabilidade
    4 = quantidade
    5 = serial
    6 = se o item é temporario
}
EX: local result = getItem(player, 1, "pizza", 4)

--

#Obter total quantidade itens
getAmountItems(player, item)
Ex: local result = getAmountItems(player, "pizza")
--

#Outras funções
closeInventory(player) ----------Fechar o inventário
clearAllItemsTemporary(player) --Remover todos os itens temporarios do inventário
clearInventory(player) ----------Remova todos os itens removíveis do inventario
    
--
  
#Verificar se o player tem o item no inventário  
hasItemInventory(player, item, durability, amount, serial) --------Verificar se o player tem o item no inventário
EX: 1. local hasItem = hasItemInventory(player, "box", 0, 1, "123") --Verificar se o player possui o item com durabilidade mínima de 0, valor mínimo de 1 e com o serial 123
    2. local hasItem = hasItemInventory(player, "box", 0, 1, nil) ----Verificar se o player possui o item com durabilidade mínima de 0, valor mínimo de 1 e sem verificar o serial
    
--
    
takeItem(player, slot, item, quantidade) - Remover item do player
EX: 1. local result = takeItem(player, 1, item, 1)
    2. local result = takeItem(player, nil, item, 1)

--

takeAllItem(player, item, quantidade)
EX: local result = takeAllItem(player, "pizza")

--

sendItem(player, item, durabilidade, quantidade, serial, temporario) - Enviar item para o player
EX: local result = sendItem(player, "pizza", 0, 10, "none", false)

--

setAmount(player, quantidade, slot) - Definir quantidade

--

setDurability(player, durabilidade, slot) - Definir durabilidade

--

alertPolice(alvo (player, ped, vehicle, object), mensagem que aparecerá para a polícia, id do blip, segundos para destruir o blip)
EX: alertPolice(target, "Algo não está certo.", 1, 60)
blip = {
    https://wiki.multitheftauto.com/wiki/Radar_Blips
}

--
]]

cooldown = { }
maleta = { }
capacete = { }
cavalo = { }
mochila= { }
cigarro = {}
acao = {}
mascara = {}


addEvent("Chernaruz.UseItem", true)
addEventHandler("Chernaruz.UseItem", root, function(player, item, durability, amount, slot, tab)
    if player and isElement(player) then
        if cooldown[player] then
            return
        end

        if weapons[item] then
            weapon(player, slot, item, amount)
        elseif item == "bandage" then
            local health = getElementHealth(player)
            if health >= 100 then
                sendNotification(player, "error", "Você não precisa de curativo.")
                return
            end
            local result = takeItem(player, slot, item, 1)
            if result then
                setElementData(player, "Chernaruz.InProgress", true)
                sendNotification(player, "info", "Você está usando uma bandagem.")
                setPedAnimation(player, "CASINO", "dealone", true, true, false)
                cooldown[player] = setTimer(function()
                    setElementData(player, "Chernaruz.InProgress", false)
                    setPedAnimation(player, nil)
                    local healthCont = health + 25
                    if healthCont > 100 then
                        setElementHealth(player, 100)
                    else
                        setElementHealth(player, healthCont)
                    end
                    cooldown[player] = nil
                end, 1000*3, 1)
            end
        elseif item == "medkit" then
            local health = getElementHealth(player)
            if health >= 100 then
                sendNotification(player, "error", "Você não precisa de curativo.")
                return
            end
            local result = takeItem(player, slot, item, 1)
            if result then
                setElementData(player, "Chernaruz.InProgress", true)
                sendNotification(player, "info", "Você está usando uma bandagem.")
                setPedAnimation(player, "tec", "tec_reload", true, true, false)
                cooldown[player] = setTimer(function()
                    setElementData(player, "Chernaruz.InProgress", false)
                    setPedAnimation(player, nil)
                    setElementHealth(player, 100)
                    cooldown[player] = nil
                end, 1000*3, 1)
            end
        elseif item == "box" then
            putBox(player, slot)
        elseif item == "bottle.vodka" then
            local result = takeItem(player, slot, item, 1)
            if result then
                setElementData(player, "Chernaruz.InProgress", true)
                playSound(player, "drink.mp3")
                setPedAnimation(player, "vending", "vend_drink2_p", 0, true, true, false)
                toggleControl(player, "fire", false)
                toggleControl(player, "jump", false)
                sendProgressbar(player, 6, "Bebendo uma garrafa de vodka...")
                cooldown[player] = setTimer(function()
                    setElementData(player, "Chernaruz.InProgress", false)
                    setPedAnimation( player, "ped", "facanger", 0, false, false, false)
                    toggleControl(player, "fire", true)
                    toggleControl(player, "jump", true)
                    cooldown[player] = nil
					local sede = getElementData(player, "hunger") or 0
					setElementData(player, "hunger", sede + 15)
					if getElementData(player, "hunger") > 100 then
						setElementData(player, "hunger", 100)
					end
                end, 1000*6, 1)
            end
		elseif item == "agua" then
            local result = takeItem(player, slot, item, 1)
            if result then
                setElementData(player, "Chernaruz.InProgress", true)
                playSound(player, "drink.mp3")
                setPedAnimation(player, "vending", "vend_drink2_p", 0, true, true, false)
                toggleControl(player, "fire", false)
                toggleControl(player, "jump", false)
                sendProgressbar(player, 6, "Bebendo uma garrafa de vodka...")
                cooldown[player] = setTimer(function()
                    setElementData(player, "Chernaruz.InProgress", false)
                    setPedAnimation( player, "ped", "facanger", 0, false, false, false)
                    toggleControl(player, "fire", true)
                    toggleControl(player, "jump", true)
                    cooldown[player] = nil
					local sede = getElementData(player, "hunger") or 0
					setElementData(player, "hunger", sede + 25)
					if getElementData(player, "hunger") > 100 then
						setElementData(player, "hunger", 100)
					end
                end, 1000*6, 1)
            end
		elseif item == "leite2" then
            local result = takeItem(player, slot, item, 1)
            if result then
                setElementData(player, "Chernaruz.InProgress", true)
                playSound(player, "drink.mp3")
                setPedAnimation(player, "vending", "vend_drink2_p", 0, true, true, false)
                toggleControl(player, "fire", false)
                toggleControl(player, "jump", false)
                sendProgressbar(player, 6, "Bebendo uma garrafa de vodka...")
                cooldown[player] = setTimer(function()
                    setElementData(player, "Chernaruz.InProgress", false)
                    setPedAnimation( player, "ped", "facanger", 0, false, false, false)
                    toggleControl(player, "fire", true)
                    toggleControl(player, "jump", true)
                    cooldown[player] = nil
					local sede = getElementData(player, "hunger") or 0
					setElementData(player, "hunger", sede + 35)
					if getElementData(player, "hunger") > 100 then
						setElementData(player, "hunger", 100)
					end
                end, 1000*6, 1)
            end
        elseif item == "pizza" then
            local result = takeItem(player, slot, item, amount)
            if result then
                setElementData(player, "Chernaruz.InProgress", true)
                playSound(player, "eat.mp3")
                setPedAnimation(player, "food", "eat_pizza", 0, true, true, false)
                toggleControl(player, "fire", false)
                toggleControl(player, "jump", false)
                sendProgressbar(player, 6, "Comendo pizza...")
                cooldown[player] = setTimer(function()
                    setElementData(player, "Chernaruz.InProgress", false)
                    setPedAnimation(player, "ped", "facanger", 0, false, false, false)
                    toggleControl(player, "fire", true)
                    toggleControl(player, "jump", true)
                    cooldown[player] = nil
					local sede = getElementData(player, "hunger") or 0
					setElementData(player, "hunger", sede + 25)
					if getElementData(player, "hunger") > 100 then
						setElementData(player, "hunger", 100)
					end
                end, 1000*6, 1)
            end
		elseif item == "jbl" then
            local result = takeItem(player, slot, item, amount)
            if result then
				triggerEvent('Schootz.JBL', player, player)
            end
		elseif item == "radio" then
            if (getElementData(player, 'tr4jado.radinho') == true) then
				setElementData(player, 'tr4jado.frequencia', 0)
				triggerClientEvent(player, 'S:Radio', player, 'false')
				setElementData(player, 'tr4jado.radinho', false)
				exports['FR_DxMessages']:addBox(player, 'Radio comunicador desequipado.', 'success')
			else
				setElementData(player, 'tr4jado.radinho', true)
				triggerClientEvent(player, 'S:Radio', player, 'true')
				exports['FR_DxMessages']:addBox(player, "Radio equipado com sucesso!", "success")
			end
		elseif item == "spraitinta" then
            local result = takeItem(player, slot, item, amount)
            if result then
                giveWeapon(player, 41, 9999, true )
            end
		elseif item == "maconha" then
			if exports["CzInventory"]:hasItemInventory(player, "seda", 0, 1, nil) then
				local result = takeItem(player, slot, item, amount)
				if result then
					local random = math.random(1, 10)
					if random == 1 then
						exports["CzInventory"]:takeItem(player, nil, "seda", 1)
					end
					exports["CzInventory"]:sendItem(player, "baseado", 0, 1, "none", false)
				end
			else
				exports["CzInventory"]:sendNotification(player, "error", "Você não tem seda.")
			end
		elseif item == "baseado" then
            local result = takeItem(player, slot, item, amount)
			if exports["CzInventory"]:hasItemInventory(player, "isqueiro", 0, 1, nil) then
				if result then
					if not isTimer(acao[player]) then
						if not isElement(cigarro[player]) then
							local x, y, z = getElementPosition(player)
							local int = getElementInterior(player)
							local dim = getElementDimension(player)
							cigarro[player] = createObject(1485, x, y, z)
							setElementInterior(cigarro[player], int)
							setElementDimension(cigarro[player], dim)
							acao[player] = setTimer(function() end, 7000, 1)
							--GiveAndTakeAndGetItem("take", player, itemUsed, 1)
							setPedAnimation(player, "GANGS", "smkcig_prtl", 7000, false, true, false, false, _, true)
							exports.bone_attach:attachElementToBone(cigarro[player], player, 12, -0.03, 0.06, 0.04, 30, -50, -24)
							local random = math.random(1, 10)
							if random == 1 then
								exports["CzInventory"]:takeItem(player, nil, "isqueiro", 1)
							end
							setTimer(function()
								exports["CzInventory"]:sendNotification(player, "info", "Pressione 'E' para fumar")
								--triggerClientEvent(player, "TB:UsarMaconha")
								bindKey(player, "e", "down", fumarCigarro)
								setTimer(function()
									destroyElement(cigarro[player])
									cigarro[player] = nil
									unbindKey(player, "e", "down", fumarCigarro)
								end, 60000*3, 1)
							end, 7000, 1)
						else
							exports["CzInventory"]:sendNotification(player, "error", "Você já está fumando um baseado")
						end
					end
				end
			else
				exports["CzInventory"]:sendNotification(player, "error", "Você não tem isqueiro.")
				exports["CzInventory"]:sendItem(player, "baseado", 0, 1, "none", false)
			end
		elseif item == "capacete2" then
            local position = { getElementPosition(player) }
            local dimension = getElementDimension(player)
            local interior = getElementInterior(player)

            if capacete[player] then
                sendNotification(player, "error", "Você já tem uma capacete na cabeça, use /capacete.")
                return
            end
		elseif item == "capacete" then
            if not isElement(mascara[player]) then
				mascara[player] = createObject(1937, 0, 0, 0)
				exports['bone_attach']:attachElementToBone(mascara[player], player, 1, 0, 0.026, 0, 0, 270, 0)
			else
				--setElementData(player, 'pesoMax', 35)
				destroyElement(mascara[player])
			end
			--[[if cavalo[player] then
                sendNotification(player, "error", "Você já tem uma mascara na cabeça, use /mascara.")
                return
            end
            capacete[player] = createObject(1937, unpack(position))
            setElementDimension(capacete[player], dimension)
            setElementInterior(capacete[player], interior)
            exports.bone_attach:attachElementToBone(capacete[player], player, 1, 0, 0.026, 0, 0, 270, 0)
            sendNotification(player, "success", "Agora o capacete está em sua cabeça.")
            sendNotification(player, "info", "Para remover o cabeça utilize /capacete.")
			]]
		elseif item == "cavalo" then
            local position = { getElementPosition(player) }
            local dimension = getElementDimension(player)
            local interior = getElementInterior(player)

            if cavalo[player] then
                sendNotification(player, "error", "Você já tem uma mascara na cabeça, use /mascara.")
                return
            end
			if capacete[player] then
                sendNotification(player, "error", "Você já tem uma capacete na cabeça.")
                return
            end
            cavalo[player] = createObject(1882, unpack(position))
            setElementDimension(cavalo[player], dimension)
            setElementInterior(cavalo[player], interior)
            exports.bone_attach:attachElementToBone(cavalo[player], player, 1, -0.003, 0, -0.6, 0, 0, 90)
            sendNotification(player, "success", "Agora você está usando uma máscara.")
            sendNotification(player, "info", "Para remover a máscara utilize /mascara.")
		elseif item == "mochila" then
            local position = { getElementPosition(player) }
            local dimension = getElementDimension(player)
            local interior = getElementInterior(player)

           
			if mochila[player] then
                sendNotification(player, "error", "Você já tem uma mochila nas costa, use /mochila.")
                return
            end
            mochila[player] = createObject(1666, unpack(position))
            setElementDimension(mochila[player], dimension)
            setElementInterior(mochila[player], interior)
            exports.bone_attach:attachElementToBone(mochila[player], player, 3, 0, -0.17, 0.07, 0, 0, 0)
            sendNotification(player, "success", "Agora você está usando uma mochila.")
            sendNotification(player, "info", "Para remover a mochila utilize /mochila.")
        elseif item == "vest" then
            local armor = getPedArmor(player)
            if armor >= 1 then
                sendNotification("error", "Você já está usando um colete, use /colete para removê-lo.")
                return
            end
            local result = takeItem(player, slot, item, amount)
            if result then
                setPedArmor(player, durability)
            end
		elseif item == "M4A1" then
			giveWeapon(player, 31, 30)
		end
    end
end)


--retirar itens  
addCommandHandler("colete", function(player,_)
    local armor = getPedArmor(player)
    if armor == 0 then
        sendNotification(player, "error", "Você não está usando colete.")
        return
    end

    local result = sendItem(player, "vest", armor, 1, "none", false)
    if result then
        setPedArmor(player, 0)
        sendNotification(player, "success", "Colete removido.")
    end
end)

--Maleta

addCommandHandler("maleta", function(player,_)
    if maleta[player] and isElement(maleta[player]) then
        destroyElement(maleta[player])
        maleta[player] = nil
        sendNotification(player, "success", "Maleta removida com sucesso.")
    else
        sendNotification(player, "error", "Você não está usando uma maleta.")
    end
end)

-- Capacete

addCommandHandler("capacete", function(player,_)
    if capacete[player] and isElement(capacete[player]) then
        destroyElement(capacete[player])
        capacete[player] = nil
        sendNotification(player, "success", "capacete removido com sucesso.")
    else
        sendNotification(player, "error", "Você não está usando um capacete.")
    end
end)

--mascara cabeça cavalo

addCommandHandler("mascara", function(player,_)
    if cavalo[player] and isElement(cavalo[player]) then
        destroyElement(cavalo[player])
        cavalo[player] = nil
        sendNotification(player, "success", "Máscara removida com sucesso.")
    else
        sendNotification(player, "error", "Você não está usando uma máscara.")
    end
end)

--mochila

addCommandHandler("mochila", function(player,_)
    if mochila[player] and isElement(mochila[player]) then
        destroyElement(mochila[player])
        mochila[player] = nil
        sendNotification(player, "success", "Mochila removida com sucesso.")
    else
        sendNotification(player, "error", "Você não está usando uma mochila.")
    end
end)









-------------------Cigarro------------

function onWasted()
	if isElement(cigarro[source]) then
		destroyElement(cigarro[source])
		cigarro[source] = nil
		unbindKey(source, "e", "down", fumarCigarro)
	end
end
addEventHandler("onPlayerWasted", root, onWasted)

function Refresh(player)
	local int = getElementInterior(player)
	local dim = getElementDimension(player)
	if isElement(cigarro[player]) then
		setElementInterior(cigarro[player], int)
		setElementDimension(cigarro[player], dim)
	end
end
addEvent("RefreshBoneAttach", true)
addEventHandler("RefreshBoneAttach", root, Refresh)


-----------Player kit------

function onQuit()
	local account = getPlayerAccount(source)
	if not isGuestAccount(account) then
		if isElement(cigarro[source]) then destroyElement(cigarro[source]) cigarro[source] = nil end
	end
end
addEventHandler("onPlayerQuit", root, onQuit)

function fumarCigarro(source)
	if isElement(cigarro[source]) then
		if not isTimer(acao[source]) then
			acao[source] = setTimer(function() end, 7000, 1)
			setPedAnimation(source, "GANGS", "smkcig_prtl", 7000, false, true, false, false, _, true)
		end
	end
end



function quitPlayer()
	if isElement(mascara[player]) then
		destroyElement(mascara[player])
	end
end
addEventHandler('onPlayerQuit', root, quitPlayer)


function wasted()
	if isElement(mascara[player]) then
		destroyElement(mascara[player])
	end
end
addEventHandler('onPlayerWasted', root, wasted)