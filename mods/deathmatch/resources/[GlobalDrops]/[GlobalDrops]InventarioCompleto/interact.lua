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

addEvent("Chernaruz.Interact", true)
addEventHandler("Chernaruz.Interact", root, function(player, target, slot, item, durability, amount, serial, temporary)
    if player and isElement(player) and target and isElement(target) and item then
        local drop = true
        local rotation = { getElementRotation(player) }

        if getElementType(target) == "player" then --Interação com jogadores
            drop = false
            if item == "bandage" then --USAR BANDAGEM EM OUTRO JOGADOR
                local health = getElementHealth(target)
                if health >= 100 then
                    sendNotification(player, "error", "Este jogador não precisa de curativo.")
                    return
                end
                local result = takeItem(player, slot, item, 1)
                if result then
                    closeInventory(player)
                    cooldown[target] = setTimer(function()
                        local healthCont = health + 25
                        if healthCont > 100 then
                            setElementHealth(target, 100)
                        else
                            setElementHealth(target, healthCont)
                        end
                        cooldown[player] = nil
                    end, 1000, 1)
                end
            else
                --Enviar proposta de troca
                if not temporary then
                    triggerClientEvent(player, "Chernaruz.Trade", player, target, slot, item, durability, amount, serial, temporary)
                end
            end
        elseif getElementType(target) == "ped" then --Interação com NPC
            local action = getElementData(target, "npc.action")
            if pedCooldown[target] then
                sendNotification(player, "error", "Este NPC já comprou um item recentemente, espere até que esteja disponível novamente.")
                return
            end
            if item == "maconha" then --VENDA DE ENTORPECENTE
                local chance = math.random(1, 100)
                local position = { getElementPosition(target) }
                for _,ped in ipairs(peds) do
                    if action and action == "drogado" then
                        drop = false
                        if 60 >= chance then
                            sendNotification(player, "error", "Este NPC não aceitou sua oferta e acabou de chamar a polícia.")
                            alertPolice(target, "Você recebeu um chamado de tráfico de drogas.", 30, 30)
                            return
                        end
                        local result = takeItem(player, slot, item, 1)
                        if result then
                            closeInventory(player)
                            pedCooldown[target] = setTimer(function() pedCooldown[target] = nil end, 5000 * 60, 1)
                            setElementRotation(target, rotation[1], rotation[2], rotation[3]-180)
                            setPedAnimation(player, "GANGS", "DRUGS_BUY", 0, true, true, false)
                            setPedAnimation(target, "GANGS", "DRUGS_BUY", 0, true, true, false)
                            toggleControl(player, "fire", false)
                            toggleControl(player, "jump", false)
                            sendProgressbar(player, 1, "Vendendo maconha ...")
                            cooldown[player] = setTimer(function()
                                sendItem(player, "dirtymoney", 0, 1200, "none", false)
                                setPedAnimation(player, "ped", "facanger", 0, false, false, false)
                                setPedAnimation(target, ped.style.animation[1], ped.style.animation[2], 0, true, true, false)
                                toggleControl(player, "fire", true)
                                toggleControl(player, "jump", true)
                                sendNotification(player, "success", "Você acabou de vender um pacote de Maconha por $1200 para este NPC.")
                                cooldown[player] = nil
                            end, 5000, 1)
                        end
                        break
                    end
                end
            elseif item == "dirtymoney" then  --LAVAGEM DE DINHEIRO
                local chance = math.random(1, 100)
                local position = { getElementPosition(target) }
                for _,ped in ipairs(peds) do
                    if ped.action == "dirtymoney" and action and action == "dirtymoney" then
                        drop = false
                        if 50 >= chance then
                            alertPolice(target, "Você recebeu um chamado de lavagem de dinheiro.", 30, 30)
                        end
                        local result = takeItem(player, slot, item, amount)
                        if result then
                            sendNotification(player, "info", "Você está lavando o dinheiro...")
                            closeInventory(player)
                            pedCooldown[target] = setTimer(function() pedCooldown[target] = nil end, 1000 * 60, 1)
                            setElementRotation(target, rotation[1], rotation[2], rotation[3]-180)
                            setPedAnimation(player, "CASINO", "Slot_win_out", 0, true, true, false)
                            setPedAnimation(target, "GANGS", "DRUGS_BUY", 0, true, true, false)
                            toggleControl(player, "fire", false)
                            toggleControl(player, "jump", false)
                            sendProgressbar(player, 8, "Lavando dinheiro sujo...")
                            cooldown[player] = setTimer(function()
                                givePlayerMoney(player, amount)
                                setPedAnimation(player, "ped", "facanger", 0, false, false, false)
                                setPedAnimation(target, ped.style.animation[1], ped.style.animation[2], 0, true, true, false)
                                toggleControl(player, "fire", true)
                                toggleControl(player, "jump", true)
                                cooldown[player] = nil
                                sendNotification(player, "success", "Você lavou $"..amount.." dinheiro sujo.")
                            end, 1000 * 8, 1)
                        end
                        break
                    end
                end
            end
        elseif getElementType(target) == "vehicle" then --Interação com veículos
            if item == "toolbox" then --Reparar o veículos
                drop = false
                
                local health = getElementHealth(target)
                if health >= 1000 then
                    sendNotification(player, "error", "O veículo não precisa de reparo.")
                    return false
                end

                local result = takeItem(player, slot, "toolbox", 1)
                if result then
                    closeInventory(player)
                    setPedAnimation(player, "OTB", "betslp_loop", 0, true, true, false)
                    toggleControl(player, "fire", false)
                    toggleControl(player, "jump", false)
                    setElementFrozen(target, true)
                    toggleAllControls(player, false)
                    playSound3D(target, "fix.mp3", 20)
                    sendProgressbar(player, 15, "Reparando o veículo...")
                    cooldown[player] = setTimer(function()
                        setPedAnimation( player, "ped", "facanger", 0, false, false, false)
                        toggleControl(player, "fire", true)
                        toggleControl(player, "jump", true)
                        setElementFrozen(target, false)
                        toggleAllControls(player, true)
                        setElementHealth(target, 1000)
                        fixVehicle(target)
                        cooldown[player] = nil
                        sendNotification(player, "success", "Veículo reparado com sucesso.")
                    end, 1000*15, 1)
                else
                    sendNotification(player, "error", "Ocorreu um erro ao usar este item.")
                end
            end
        elseif getElementType(target) == "object" then --Interação com objetos
            if item == "keylock" and getElementModel(target) == 2332 then --Colocar uma fechadura no baú.
                drop = false
                putKeyLock(player, slot, target)
            end
        end
        if drop then
            dropItem(slot, item, durability, amount, serial, temporary)
        end
    end
end)