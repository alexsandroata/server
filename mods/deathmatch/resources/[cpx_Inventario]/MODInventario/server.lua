--  ____    ______   _____  
-- |  _ \  |  ____| |  __ \ 
-- | |_) | | |__    | |__) |
-- |  _ <  |  __|   |  _  / 
-- | |_) | | |____  | | \ \ 
-- |____/  |______| |_|  \_\
-----------------------------------------------------------------------------------------------------------------------------------------
inventario = {}
timerStart = {}
gates = {}
boxes = {}
acao = {}
item = {}
arma = {}
capacete = {}
maleta = {}
mascara = {}
vara = {} 
pneu = {} 
oculos = {}
oculos1 = {}
oculos3 = {}
colete1 = {}
colete2 = {}
bag = {}
bag2 = {}
chapeu = {}
chapeu1 = {}
cordao = {}
coldrepeito1 = {}
cinturao = {}
shoulder1 = {}
bandana = {}
bone = {}
bone2 = {}
bone3 = {}
mec = {}
mergulho = {}
oculos2 = {}
mochila1 = {}
katana = {}
katana2 = {}
bagnike = {}
mochila2 = {}
mochila3 = {}
mochila4 = {}
mochila5 = {}
mochila6 = {}
asas = {}
iphone = {}
som = {}
flor = {}
tempo = {}
cigarro = {}
algemado = {}
algemando = {}
blip = {}
curado = {}
timerAlgema = {}
bau = {}

-----------------------------------------------------------------------------------------------------------------------------------------
for i, v in pairs(GatePositions) do
	gates[i] = createObject(GatePositions[i][2], GatePositions[i][3], GatePositions[i][4], GatePositions[i][5], 0, 0, GatePositions[i][11])
end
for i, v in pairs(BoxPositions) do
    boxes[i] = createObject(1227, BoxPositions[i][3], BoxPositions[i][4], BoxPositions[i][5]-0.2, BoxPositions[i][6], BoxPositions[i][7], BoxPositions[i][8])
    setElementData(boxes[i], "IsBox", BoxPositions[i][1])
    bau[BoxPositions[i][1]] = {}
    setElementInterior(boxes[i], BoxPositions[i][9])
    setElementDimension(boxes[i], BoxPositions[i][10])
end
-----------------------------------------------------------------------------------------------------------------------------------------

function SendItem(item,quantidade)
	local source = source
	local target = getNearestPlayer(source,2)
	if target and not itensCantRemoved[item] then
		local result = GiveAndTakeAndGetItem("give", target, item, quantidade)
		if result then
			GiveAndTakeAndGetItem("take", source, item, quantidade)
			setPedAnimation(source, "GANGS","prtial_hndshk_biz_01",3000,true,false,false,false)
        	setPedAnimation(target, "GANGS","prtial_hndshk_biz_01",3000,true,false,false,false)
		end
	end
end
addEvent("MST.SendItem",true)
addEventHandler("MST.SendItem",root,SendItem)


function getNearestPlayer(player,radius)
	for i,v in ipairs(getElementsByType("player")) do
		if v ~= player then
			if getDistanceBetweenPoints3D(Vector3(getElementPosition(player)), Vector3(getElementPosition(v))) <= radius then
				return v
			end
		end
	end
	return false
end

function getNearestPlayers(element,radius)
	local tabela = {}

	for i,v in ipairs(getElementsByType("player")) do
		if v ~= player then
			if getDistanceBetweenPoints3D(Vector3(getElementPosition(element)), Vector3(getElementPosition(v))) <= radius then
				tabela[#tabela + 1] = v
			end
		end
	end

	return tabela
end

function getNearestVehicle(player,radius)
	for i,v in ipairs(getElementsByType("vehicle")) do
		if getDistanceBetweenPoints3D(Vector3(getElementPosition(player)), Vector3(getElementPosition(v))) <= radius then
			return v
		end
	end
	return false
end

addEventHandler("onPlayerVehicleEnter", getRootElement(),
function()
		setGameSpeed(1)
end)


function giveItem(playerSource, commandName, item, qntd)
	local name = getPlayerName(playerSource)
	local ID1 = getElementData(playerSource, "ID") or "N/A"
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup("Admin")) or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup("Console")) then
		if not qntd then return triggerClientEvent(playerSource, "Notify", playerSource, "aviso", "Utilize: /giveitem ID ITEM QUANTIDADE", 10) end
		if GiveAndTakeAndGetItem("give", playerSource, item, qntd) then
			triggerClientEvent(playerSource, "notifyitem", playerSource, "sucesso", ""..qntd.."", ""..(realName[item][1]).."")
			exports["[Script]Logs"]:CreateLog("[INVENTARIO]\nStaff: "..name.." ["..ID1.."]\nItem: "..(realName[item][1]).."\nQuantidade: "..qntd.."\nOperação: Give")
		else
		triggerClientEvent(playerSource, "Notify", playerSource, "negado", "O jogador não possui espaço em sua mochila ou o item avisormado não existe", 10)		end
	end
end
addCommandHandler("item", giveItem)
-----------------------------------------------------------------------------------------------------------------------------------------
function takeItem(playerSource, commandName, id, item, qntd)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup("Admin")) or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup("Console")) then
		if not id then return addBox(playerSource, "Utilize: /takeitem ID ITEM", "erro") end
		for i, v in pairs(getElementsByType("player")) do
			if getElementData(v, "ID") == tonumber(id) then
				if (qntd) then
					if GiveAndTakeAndGetItem("take", v, item, tonumber(qntd)) then
						addBox(playerSource, "Você removeu "..qntd.."x '"..(realName[item][1]).."' do inventário do jogador "..getPlayerName(v), "sucesso")
						addBox(v, "O Deus "..getPlayerName(playerSource).." removeu "..qntd.."x '"..(realName[item][1]).."' do seu inventário", "aviso")
						triggerClientEvent(playerSource, "notifyitens", playerSource, "-", item, qntd, realName[item][1])
						local name = getPlayerName(playerSource)
						local ID1 = getElementData(playerSource, "ID") or "N/A"
						local name2 = getPlayerName(v)
						local ID2 = getElementData(v, "ID") or "N/A"
						exports["[Script]Logs"]:CreateLog("[INVENTARIO]\nStaff: "..name.." ["..ID1.."]\nJogador: "..name2.." ["..ID2.."]\nItem: "..item.."\nQuantidade: "..qntd.."\nOperação: Take")
					else
						addBox(playerSource, "O jogador não possui "..qntd.."x deste item em sua mochila ou o item informado não existe", "erro")
					end
				else
					if GiveAndTakeAndGetItem("take", v, item, "all") then
						addBox(playerSource, "Você removeu todos os(as) '"..(realName[item][1]).."' do inventário do jogador "..getPlayerName(v), "sucesso")
						addBox(v, "O Deus "..getPlayerName(playerSource).." removeu o item '"..(realName[item][1]).."' do seu inventário", "aviso")
						local name = getPlayerName(playerSource)
						local ID1 = getElementData(playerSource, "ID") or "N/A"
						local name2 = getPlayerName(v)
						local ID2 = getElementData(v, "ID") or "N/A"
						exports["[Script]Logs"]:CreateLog("[INVENTARIO]\nStaff: "..name.." ["..ID1.."]\nJogador: "..name2.." ["..ID2.."]\nItem: "..item.."\nQuantidade: All\nOperação: Take")
					else
						addBox(playerSource, "O jogador não possui este item em sua mochila ou o item informado não existe", "erro")
					end
				end
			end
		end
	end
end
addCommandHandler("takeitem", takeItem)
-----------------------------------------------------------------------------------------------------------------------------------------
function resetInv(playerSource, commandName, id)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup("Admin")) or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup("Console")) then
		if not id then return addBox(playerSource, "Utilize: /takeitem ID ITEM", "erro") end
		for i, v in pairs(getElementsByType("player")) do
			if getElementData(v, "ID") == tonumber(id) then
				for index = #inventario[v], 1, -1 do
					local item = inventario[v][index][1]
					if not itensCantRemoved[item] then
						GiveAndTakeAndGetItem("take", v, item, "all")
					end
				end
				addBox(playerSource, "Você resetou o inventário do jogador "..getPlayerName(v), "sucesso")
				addBox(v, "O Deus "..getPlayerName(playerSource).." resetou seu inventário", "aviso")
				local name = getPlayerName(playerSource)
				local ID1 = getElementData(playerSource, "ID") or "N/A"
				local name2 = getPlayerName(v)
				local ID2 = getElementData(v, "ID") or "N/A"
				exports["[Script]Logs"]:CreateLog("[INVENTARIO]\nStaff: "..name.." ["..ID1.."]\nJogador: "..name2.." ["..ID2.."]\nOperação: Reset")
			end
		end
	end
end
addCommandHandler("resetinv", resetInv)
-----------------------------------------------------------------------------------------------------------------------------------------
function getItem(jogador, item)
	item = "lockpick"
	v = false
	for i, v in pairs(inventario[jogador]) do
		if inventario[jogador][i][1] == item then
			if inventario[jogador][i][2] > 0 then
				local qnt = inventario[jogador][i][2]
				GiveAndTakeAndGetItem("take", jogador, item, 1)
				v = "Sim"
				return v, qnt
			else
				return false, 0
			end
		end
	end
	return false, 0
end

function GiveAndTakeAndGetItem(tipo, playerSource, item, qntd)
	if realName[item] then
		if tipo == "give" then
    		local peso = 0
    		local maxPeso = 30
			for i, v in pairs(pesoItens) do
        		for index, value in pairs(inventario[playerSource]) do
            		if inventario[playerSource][index][1] == i then
                		peso = peso + (pesoItens[i][1] * inventario[playerSource][index][2])
            		end
        		end
    		end
			
    		if getElementData( playerSource, "VIP" ) or getElementData( playerSource, "Staff" ) then
    			maxPeso = 50
    		end

			if getElementData( playerSource, 'bag.current' ) then 
				maxPeso = tonumber( getElementData( playerSource, 'bag.current' ) )
			end
			
    		if (peso + (pesoItens[item][1] * qntd)) <= maxPeso then
				local count = false
				for i, v in pairs(inventario[playerSource]) do
					if inventario[playerSource][i][1] == item then
						count = true
					end
				end
				if count then
					for i, v in pairs(inventario[playerSource]) do
						if inventario[playerSource][i][1] == item then
							inventario[playerSource][i][2] = inventario[playerSource][i][2] + tonumber(qntd)
							triggerClientEvent(playerSource, "refresh", resourceRoot, inventario[playerSource])
							--triggerClientEvent(playerSource, "MST.AttInv",playerSource)
							return true
						end
					end
				else
					if #inventario[playerSource] < 30 then
						local edit = {item, tonumber(qntd)}
						triggerClientEvent(playerSource, "notifyitens", playerSource, "+", item, qntd, realName[item][1])
						table.insert(inventario[playerSource], edit)
						triggerClientEvent(playerSource, "refresh", resourceRoot, inventario[playerSource])
						--
						return true
					else
						return false
					end
				end
			else
				return false
			end
		elseif tipo == "take" then
			for i, v in pairs(inventario[playerSource]) do
				if inventario[playerSource][i][1] == item then
					if tostring(qntd) == "all" then
						table.remove(inventario[playerSource], i)
						removeItem(playerSource, item)
					else
						if inventario[playerSource][i][2] >= tonumber(qntd) then
							inventario[playerSource][i][2] = inventario[playerSource][i][2] - tonumber(qntd)
						else
							return false
						end
					end
					if inventario[playerSource][i] then
						if inventario[playerSource][i][2] <= 0 then
							table.remove(inventario[playerSource], i)
							triggerClientEvent(playerSource, "notifyitens", playerSource, "-", item, qntd, realName[item][1])
                    		removeItem(playerSource, item)
						end
					end
					triggerClientEvent(playerSource, "refresh", resourceRoot, inventario[playerSource])
					--
					return true
				end
			end
		elseif tipo == "get" then
			for i, v in pairs(inventario[playerSource]) do
				if inventario[playerSource][i][1] == item then
					if inventario[playerSource][i][2] > 0 then
						return inventario[playerSource][i][2]
					else
						return 0
					end
				end
			end
			return 0
		end
	end
end



function formatItens(table, type)
	TableItens = table
	if #TableItens ~= 0 then
		if type == "bau" then
			for i,v in ipairs(TableItens) do
				local Item = v.Item
				local Quantidade = v.Quantidade
				TableItens[i].Nome = realName[Item][1]
				TableItens[i].Peso = pesoItens[Item][1] 
			end
		else
			for i,v in ipairs(TableItens) do
				local Item = v[1]
				local Quantidade = v[2]
				TableItens[i][3] = realName[Item][1]
				TableItens[i][4] = pesoItens[Item][1]
			end
		end
	end
	return TableItens
end

function getItensPlayer(player)
	return (inventario[player] and formatItens(inventario[player]) or {})
end

function uselockpick(veh, ply, tipo)
    if ply and veh then
        if tipo == 1 then
            local rr = math.random(1, 10)
            if rr == 3 then
				GiveAndTakeAndGetItem("take", ply, "lockpick",1)


                setElementFrozen(ply, false)
                setElementFrozen(veh, false)
                setElementData(ply, "AC-EmAçãoHud", false)                
                setPedAnimation(ply, nil)

                setElementData(ply, "AC-Animação", false)
                setElementData(ply, "AC-Animação2", nil)
                setElementData(ply, "AC-Animação3", nil)
                print("2")
                
                           -- end
                        --end
                    end
                end

            else
            	GiveAndTakeAndGetItem("take", ply, "lockpick",1)
                            	print("1")
                setElementFrozen(ply, false)
                setElementFrozen(veh, false)
                setTimer(setVehicleOverrideLights, 100, 2, veh, 2)
                setTimer(setVehicleOverrideLights, 300, 2, veh, 1)
                setVehicleLocked(veh, false)
                setPedAnimation(ply, nil)
                setElementData(ply, "AC-EmAçãoHud", false)                                
                setElementData(ply, "AC-Animação", false)
                setElementData(ply, "AC-Animação2", nil)
                setElementData(ply, "AC-Animação3", nil)
                            end
                        end

                --- < PM > ---

      


                          -- -end
                       -- end
                   -- end
                ---end
            --end
       --[[ elseif tipo == 2 then

            setElementFrozen(ply, false)
            setElementFrozen(veh, false)
            setPedAnimation(ply, nil)
            setElementData(ply, "AC-EmAçãoHud", false)                            
            setElementData(ply, "AC-Animação", false)
            setElementData(ply, "AC-Animação2", nil)
            setElementData(ply, "AC-Animação3", nil)

            --- < PM > ---

            --for theKey, player in ipairs (getElementsByType("player")) do
               -- if getElementData(player, "AC-Grupo") == "Police" then
                   -- if getElementData(player, "POLICIA-ComPonto") == true then
                      --  if getElementData(player, "AC-OffCodPm") == false then
                           -- if cfg.vehicles[getElementModel(veh)] then
                               -- triggerClientEvent(player, "AC-NotificacaoPm", root, "lockpick", ply, cfg.vehicles[getElementModel(veh)], "Placa - "..getVehiclePlateText(veh))
                            --else
                               -- triggerClientEvent(player, "AC-NotificacaoPm", root, "lockpick", ply, getVehicleName(veh), "Placa - "..getVehiclePlateText(veh))
                            end
                        end
                   --end
                --end
            --end
        --end
    --end]]
--end
addEvent("AC-DestrancarVehLock", true)
addEventHandler("AC-DestrancarVehLock", root, uselockpick)

-----------------------------------------------------------------------------------------------------------------------------------------
function use(playerSource, itemUsed)
    if itemUsed == "suco" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
      			local x, y, z = getElementPosition(playerSource)
				item[playerSource] = createObject(1544, x, y, z)
				acao[playerSource] = setTimer(function() end, 60000, 1)
				GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
      			local dim = getElementDimension(playerSource)
      			local int = getElementInterior(playerSource)
      			setElementDimension(item[playerSource], dim)
      			setElementInterior(item[playerSource], int)
      			setPedAnimation(playerSource, "VENDING", "VEND_Drink2_P", 0, true, false, false)
      			setTimer(setPedAnimationProgress, 100, 1, playerSource, "vend_drink2_p", 1.16)
                setTimer(setPedAnimationSpeed, 60000, 1, playerSource, "vend_drink2_p", 0)
				triggerClientEvent(playerSource, "progressBar", playerSource, 60000)
      			PlaySound3D(playerSource, "drink", 15)
      			exports.bone_attach:attachElementToBone(item[playerSource], playerSource, 11, -0.26, -0.05, 0.14, 34, 108, 4)
      			setTimer(function()
      				destroyElement(item[playerSource])
      				item[playerSource] = nil
      				local random = math.random(80, 99)
      				local sede = getElementData(playerSource, "sede") or 0
					setElementData(playerSource, "sede", sede + random)
					if getElementData(playerSource, "sede") > 100 then
						setElementData(playerSource, "sede", 100)
					end
      			end, 60000, 1)
      		end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
    elseif itemUsed == "refrigerante" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
				local x, y, z = getElementPosition(playerSource)
				item[playerSource] = createObject(2601, x, y, z)
				acao[playerSource] = setTimer(function() end, 30000, 1)
				GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
      			local dim = getElementDimension(playerSource)
      			local int = getElementInterior(playerSource)
				setObjectScale(item[playerSource], 0.9)
      			setElementDimension(item[playerSource], dim)
      			setElementInterior(item[playerSource], int)
      			setPedAnimation(playerSource, "VENDING", "VEND_Drink2_P", 0, true, false, false)
      			setTimer(setPedAnimationProgress, 100, 1, playerSource, "vend_drink2_p", 1.16)
                setTimer(setPedAnimationSpeed, 30000, 1, playerSource, "vend_drink2_p", 0)
				triggerClientEvent(playerSource, "progressBar", playerSource, 30000)
      			PlaySound3D(playerSource, "drink", 15)
      			exports.bone_attach:attachElementToBone(item[playerSource], playerSource, 11, -0.01, 0.04, 0.06, 46, 110, -14)
      			setTimer(function()
      				destroyElement(item[playerSource])
      				item[playerSource] = nil
      				local random = math.random(15, 20)
      				local sede = getElementData(playerSource, "sede") or 0
					setElementData(playerSource, "sede", sede + random)
					if getElementData(playerSource, "sede") > 100 then
						setElementData(playerSource, "sede", 100)
					end
      			end, 30000, 1)
      		end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
             elseif itemUsed == "energetico" then
             	--nome do item
             	if isPedInVehicle( playerSource ) then return end
             	--função que bloqueia usar no carro
      	local DuracaoEnergetico = 30 -- | Segundos
      	        --tempo do energetico
      	
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
				local x, y, z = getElementPosition(playerSource)
				item[playerSource] = createObject(2601, x, y, z)
				acao[playerSource] = setTimer(function() end, 15000, 1)
				GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
      			local dim = getElementDimension(playerSource)
      			local int = getElementInterior(playerSource)
				setObjectScale(item[playerSource], 0.9)
      			setElementDimension(item[playerSource], dim)
      			setElementInterior(item[playerSource], int)
      			setPedAnimation(playerSource, "VENDING", "VEND_Drink2_P", 0, true, false, false)
      			setTimer(setPedAnimationProgress, 100, 1, playerSource, "vend_drink2_p", 1.16)
                setTimer(setPedAnimationSpeed, 15000, 1, playerSource, "vend_drink2_p", 0)
				triggerClientEvent(playerSource, "progressBar", playerSource, 15000)
      			PlaySound3D(playerSource, "drink", 15)
      			exports.bone_attach:attachElementToBone(item[playerSource], playerSource, 11, -0.01, 0.04, 0.06, 46, 110, -14)
      			setTimer(function()
      				destroyElement(item[playerSource])
      				item[playerSource] = nil
						triggerClientEvent(playerSource, "setSpeed", playerSource)
      			end, 15000, 1)
      		end
      	else
      		addBox(playerSource, "  Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end

		setTimer(function()
			setGameSpeed(1.0)
		end, DuracaoEnergetico * 1000 + 3000, 1)

	elseif itemUsed == "drill" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
				local x, y, z = getElementPosition(playerSource)
				acao[playerSource] = setTimer(function() end, 5000, 1)
				GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
      			setPedAnimation(playerSource, "VENDING", "VEND_Drink2_P", 0, true, false, false)
      			setTimer(setPedAnimationProgress, 100, 1, playerSource, "vend_drink2_p", 1.16)
                setTimer(setPedAnimationSpeed, 2000, 1, playerSource, "vend_drink2_p", 0)
				triggerClientEvent(playerSource, "progressBar", playerSource, 5000)
      			PlaySound3D(playerSource, "drink", 15)
      			setTimer(function()
      				item[playerSource] = nil
      			end, 5000, 1)
      		end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
             elseif itemUsed == "cocainaembalada" then
             	--nome do item
             	if isPedInVehicle( playerSource ) then return end
             	--função que bloqueia usar no carro
      	local DuracaoCocaina = 20 -- | Segundos
      	        --tempo do energetico
      	
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
				local x, y, z = getElementPosition(playerSource)
				acao[playerSource] = setTimer(function() end, 5000, 1)
				GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
      			setPedAnimation(playerSource, "VENDING", "VEND_Drink2_P", 0, true, false, false)
      			setTimer(setPedAnimationProgress, 100, 1, playerSource, "vend_drink2_p", 1.16)
                setTimer(setPedAnimationSpeed, 5000, 1, playerSource, "vend_drink2_p", 0)
				triggerClientEvent(playerSource, "progressBar", playerSource, 5000)
      			PlaySound3D(playerSource, "drink", 15)
      			setTimer(function()
      				item[playerSource] = nil
						triggerClientEvent(playerSource, "setSpeed", playerSource)
      			end, 5000, 1)
      		end
      	else
      		addBox(playerSource, "  Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end

		setTimer(function()
			setGameSpeed(1.0)
		end, DuracaoCocaina * 1000 + 2000, 1)
		
    elseif itemUsed == "whisky" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
      			local x, y, z = getElementPosition(playerSource)
				item[playerSource] = createObject(1520, x, y, z)
				acao[playerSource] = setTimer(function() end, 15000, 1)
				GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
      			local dim = getElementDimension(playerSource)
      			local int = getElementInterior(playerSource)
      			setElementDimension(item[playerSource], dim)
      			setElementInterior(item[playerSource], int)
      			setPedAnimation(playerSource, "VENDING", "VEND_Drink2_P", 0, true, false, false)
      			setTimer(setPedAnimationProgress, 100, 1, playerSource, "vend_drink2_p", 1.16)
                setTimer(setPedAnimationSpeed, 15000, 1, playerSource, "vend_drink2_p", 0)
				triggerClientEvent(playerSource, "progressBar", playerSource, 15000)
      			PlaySound3D(playerSource, "drink", 15)
      			exports.bone_attach:attachElementToBone(item[playerSource], playerSource, 11, -0.25, 0.01, 0.11, 44, 100, -4)
      			setTimer(function()
      				destroyElement(item[playerSource])
      				item[playerSource] = nil
      				local random = math.random(15, 20)
      				local sede = getElementData(playerSource, "sede") or 0
					setElementData(playerSource, "sede", sede + random)
					if getElementData(playerSource, "sede") > 100 then
						setElementData(playerSource, "sede", 100)
					end
      			end, 15000, 1)
      		end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
    elseif itemUsed == "baldecheio" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
      			local x, y, z = getElementPosition(playerSource)
				item[playerSource] = createObject(1484, x, y, z)
				acao[playerSource] = setTimer(function() end, 10000, 1)
				GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
      			local dim = getElementDimension(playerSource)
      			local int = getElementInterior(playerSource)
      			setElementDimension(item[playerSource], dim)
      			setElementInterior(item[playerSource], int)
      			setPedAnimation(playerSource, "VENDING", "VEND_Drink2_P", 0, true, false, false)
      			setTimer(setPedAnimationProgress, 100, 1, playerSource, "vend_drink2_p", 1.16)
                setTimer(setPedAnimationSpeed, 10000, 1, playerSource, "vend_drink2_p", 0)
				triggerClientEvent(playerSource, "progressBar", playerSource, 10000)
      			PlaySound3D(playerSource, "drink", 15)
      			exports.bone_attach:attachElementToBone(item[playerSource], playerSource, 11, -0.01, -0.02, 0.13, 22, 132, 12)
      			setTimer(function()
      				destroyElement(item[playerSource])
      				item[playerSource] = nil
      				local sede = getElementData(playerSource, "sede") or 0
					setElementData(playerSource, "sede", sede + 50)
					if getElementData(playerSource, "sede") > 100 then
						setElementData(playerSource, "sede", 100)
					end
      			end, 10000, 1)
      		end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "burrito" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
      			local x, y, z = getElementPosition(playerSource)
				item[playerSource] = createObject(2769, x, y, z)
				acao[playerSource] = setTimer(function() end, 5000, 1)
				GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
      			local dim = getElementDimension(playerSource)
      			local int = getElementInterior(playerSource)
      			setElementDimension(item[playerSource], dim)
      			setElementInterior(item[playerSource], int)
      			setPedAnimation(playerSource, "FOOD", "EAT_Burger", 0, true, false, false)
      			setTimer(setPedAnimationProgress, 100, 1, playerSource, "eat_burger", 1.16)
                setTimer(setPedAnimationSpeed, 5000, 1, playerSource, "eat_burger", 0)
				triggerClientEvent(playerSource, "progressBar", playerSource, 5000)
      			PlaySound3D(playerSource, "eat", 15)
      			exports.bone_attach:attachElementToBone(item[playerSource], playerSource, 12, 0.06, 0.03, 0.02, 50, 74, -88)
      			setTimer(function()
      				destroyElement(item[playerSource])
      				item[playerSource] = nil
      				local random = math.random(5, 10)
      				local hunger = getElementData(playerSource, "hunger") or 0
      				local fezes = getElementData(playerSource, "fezes") or 0
					setElementData(playerSource, "hunger", hunger + random)
					setElementData(playerSource, "fezes", fezes + random)
					if getElementData(playerSource, "fezes") > 100 then
						setElementData(playerSource, "fezes", 100)
					end
					if getElementData(playerSource, "hunger") > 100 then
						setElementData(playerSource, "hunger", 100)
						setPedStat(playerSource, 21, getPedStat(playerSource, 21) + 100)
					end
      			end, 5000, 1)
      		end
      	else
        end
        elseif itemUsed == "frutas" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
      			local x, y, z = getElementPosition(playerSource)
				item[playerSource] = createObject(2663, x, y, z)
				acao[playerSource] = setTimer(function() end, 5000, 1)
				GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
      			local dim = getElementDimension(playerSource)
      			local int = getElementInterior(playerSource)
                        setObjectScale(item[playerSource], 0.7)
      			setElementDimension(item[playerSource], dim)
      			setElementInterior(item[playerSource], int)
      			setPedAnimation(playerSource, "FOOD", "EAT_Burger", 0, true, false, false)
      			setTimer(setPedAnimationProgress, 100, 1, playerSource, "eat_burger", 1.16)
                setTimer(setPedAnimationSpeed, 5000, 1, playerSource, "eat_burger", 0)
				triggerClientEvent(playerSource, "progressBar", playerSource, 5000)
      			PlaySound3D(playerSource, "eat", 5)
      			exports.bone_attach:attachElementToBone(item[playerSource], playerSource, 12, 0.06, 0.03, 0.02, 50, 74, -88)
      			setTimer(function()
      				destroyElement(item[playerSource])
      				item[playerSource] = nil
      				local random = math.random(5, 10)
      				local hunger = getElementData(playerSource, "hunger") or 0
      				local fezes = getElementData(playerSource, "fezes") or 0
					setElementData(playerSource, "hunger", hunger + random)
					setElementData(playerSource, "fezes", fezes + random)
					if getElementData(playerSource, "fezes") > 100 then
						setElementData(playerSource, "fezes", 100)
					end
					if getElementData(playerSource, "hunger") > 100 then
						setElementData(playerSource, "hunger", 100)
						setPedStat(playerSource, 21, getPedStat(playerSource, 21) + 100)
					end
      			end, 5000, 1)
      		end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "pizza" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
      			local x, y, z = getElementPosition(playerSource)
				item[playerSource] = createObject(2702, x, y, z)
				acao[playerSource] = setTimer(function() end, 45000, 1)
				GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
      			local dim = getElementDimension(playerSource)
      			local int = getElementInterior(playerSource)
				setObjectScale(item[playerSource], 0.8)
      			setElementDimension(item[playerSource], dim)
      			setElementInterior(item[playerSource], int)
      			setPedAnimation(playerSource, "FOOD", "EAT_Pizza", 0, true, false, false)
      			setTimer(setPedAnimationProgress, 100, 1, playerSource, "eat_pizza", 1.16)
                setTimer(setPedAnimationSpeed, 45000, 1, playerSource, "eat_pizza", 0)
				triggerClientEvent(playerSource, "progressBar", playerSource, 45000)
      			PlaySound3D(playerSource, "eat", 15)
      			exports.bone_attach:attachElementToBone(item[playerSource], playerSource, 12, -3.4694469519536e-18, 0.08, 0.05, -6, 251.5, 10)
      			setTimer(function()
      				destroyElement(item[playerSource])
      				item[playerSource] = nil
      				local random = math.random(40, 55)
      				local hunger = getElementData(playerSource, "hunger") or 0
      				local fezes = getElementData(playerSource, "fezes") or 0
					setElementData(playerSource, "hunger", hunger + random)
					setElementData(playerSource, "fezes", fezes + random)
					if getElementData(playerSource, "fezes") > 100 then
						setElementData(playerSource, "fezes", 100)
					end
					if getElementData(playerSource, "hunger") > 100 then
						setElementData(playerSource, "hunger", 100)
						setPedStat(playerSource, 21, getPedStat(playerSource, 21) + 150)
					end
      			end, 45000, 1)
      		end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "hamburguer" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
				local x, y, z = getElementPosition(playerSource)
				item[playerSource] = createObject(2703, x, y, z)
				acao[playerSource] = setTimer(function() end, 60000, 1)
				GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
      			local dim = getElementDimension(playerSource)
      			local int = getElementInterior(playerSource)
      			setElementDimension(item[playerSource], dim)
      			setElementInterior(item[playerSource], int)
      			setPedAnimation(playerSource, "FOOD", "EAT_Burger", 0, true, false, false)
      			setTimer(setPedAnimationProgress, 100, 1, playerSource, "eat_burger", 1.16)
                setTimer(setPedAnimationSpeed, 60000, 1, playerSource, "eat_burger", 0)
      			triggerClientEvent(playerSource, "progressBar", playerSource, 60000)
      			PlaySound3D(playerSource, "eat", 15)
      			exports.bone_attach:attachElementToBone(item[playerSource], playerSource, 12, -0.02, 0.06, 0.05, -14, 8, -18)
      			setTimer(function()
      				destroyElement(item[playerSource])
      				item[playerSource] = nil
      				local random = math.random(80, 99)
      				local hunger = getElementData(playerSource, "hunger") or 0
      				local fezes = getElementData(playerSource, "fezes") or 0
					setElementData(playerSource, "hunger", hunger + random)
					setElementData(playerSource, "fezes", fezes + random)
					if getElementData(playerSource, "fezes") > 100 then
						setElementData(playerSource, "fezes", 100)
					end
					if getElementData(playerSource, "hunger") > 100 then
						setElementData(playerSource, "hunger", 100)
						setPedStat(playerSource, 21, getPedStat(playerSource, 21) + 200)
					end
      			end, 60000, 1)
      		end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end

	elseif itemUsed == "stikercamo" then -- copie daqui
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			exports["[HS]SetTextures"]:addAplicTexture(playerSource,"ak","ak_5")
		end -- ate aqui
	elseif itemUsed == "colete" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				if getPedArmor(playerSource) < 100 then
					acao[playerSource] = setTimer(function() end, 10000, 1)
					GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
      				setPedAnimation(playerSource, "CLOTHES", "CLO_Pose_Torso", 10000, true, false, false)
      				setTimer(setPedAnimationProgress, 100, 1, playerSource, "clo_pose_torso", 1.16)
                    setTimer(setPedAnimationSpeed, 10000, 1, playerSource, "clo_pose_torso", 0)
					triggerClientEvent(playerSource, "progressBar", playerSource, 10000)
      				setTimer(function()
      					setPedArmor(playerSource, 100)
      				end, 10000, 1)
      			else
      				addBox(playerSource, "Você já está usando um '"..realName[itemUsed][1].."'", "erro")
      			end
      		end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
    elseif itemUsed == "faca" or itemUsed == "machado" or  itemUsed == "picareta" or itemUsed == "cabra" or itemUsed == "taco" or itemUsed == "socoingles" or itemUsed == "cassetete" or itemUsed == "pa" then
    	if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
    		if not isTimer(acao[playerSource]) then
    			if not arma[playerSource] then
    				setPedAnimation(playerSource, "BUDDY", "buddy_reload", 500, false, true, false, false, _, true)
    				arma[playerSource] = itemUsed
    				giveWeapon(playerSource, weapons[itemUsed][1], 1, true)
    				PlaySound3D(playerSource, "put", 15)
					toggleControl(playerSource, "next_weapon", true)
					toggleControl(playerSource, "previous_weapon", true)
    			else
    				if arma[playerSource] == itemUsed then
    					arma[playerSource] = nil
    					takeWeapon(playerSource, weapons[itemUsed][1])
    					PlaySound3D(playerSource, "put", 15)
						toggleControl(playerSource, "next_weapon", true)
						toggleControl(playerSource, "previous_weapon", true)
    				else
    					addBox(playerSource, "Você já está com uma arma em mãos", "erro")
    				end
    			end
    		end
    	else
    		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
    	end
    elseif itemUsed == "taser" then
    	if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
    		if not isTimer(acao[playerSource]) then
    			if not arma[playerSource] then
    				arma[playerSource] = itemUsed
    				giveWeapon(playerSource, weapons[itemUsed][1], 30, true)
    				PlaySound3D(playerSource, "pick", 15)
					setPedAnimation(playerSource, "BUDDY", "buddy_reload", 1300, false, true, false, false, _, true)
					toggleControl(playerSource, "next_weapon", false)
					toggleControl(playerSource, "previous_weapon", false)
    			else
    				if arma[playerSource] == itemUsed then
    					arma[playerSource] = nil
    					takeWeapon(playerSource, weapons[itemUsed][1])
    					PlaySound3D(playerSource, "put", 15)
						toggleControl(playerSource, "next_weapon", true)
						toggleControl(playerSource, "previous_weapon", true)
    				else
    					addBox(playerSource, "Você já está com uma arma em mãos", "erro")
    				end
    			end
    		end
    	else
    		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
    	end
    elseif itemUsed == "glock" or itemUsed == "taser" or itemUsed == "escopeta" or itemUsed == "tec9" or itemUsed == "mp5" or itemUsed == "g36c" or itemUsed == "hk" or itemUsed == "m1911" or itemUsed == "awm" then
    	if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
    		if not isTimer(acao[playerSource]) then
    			if not arma[playerSource] then
    				local ammo = GiveAndTakeAndGetItem("get", playerSource, weapons[itemUsed][2]) or 0
    				if ammo > 0 then
    					giveWeapon(playerSource, weapons[itemUsed][1], ammo + 1, true)
    					GiveAndTakeAndGetItem("take", playerSource, weapons[itemUsed][2], "all")
    				else
    					giveWeapon(playerSource, weapons[itemUsed][1], 1, false)
    				end
    				setControlState(playerSource, "fire", false)
    				setControlState(playerSource, "action", false)
    				PlaySound3D(playerSource, "pick", 15)
    				arma[playerSource] = itemUsed
					setPedAnimation(playerSource, "BUDDY", "buddy_reload", 1300, false, true, false, false, _, true)
					toggleControl(playerSource, "next_weapon", true)
					toggleControl(playerSource, "previous_weapon", true)
    			else
    				if arma[playerSource] == itemUsed then
    					local ammo = getPedTotalAmmo(playerSource, weapons[itemUsed][3]) or 0
    					if ammo > 1 then
    						GiveAndTakeAndGetItem("give", playerSource, weapons[itemUsed][2], ammo - 1)
    					end
    					PlaySound3D(playerSource, "put", 15)
    					takeWeapon(playerSource, weapons[itemUsed][1])
    					arma[playerSource] = nil
						toggleControl(playerSource, "next_weapon", true)
						toggleControl(playerSource, "previous_weapon", true)
    				else
    					addBox(playerSource, "Você já está com uma arma em mãos", "erro")
    				end
    			end
    		end
    	else
    		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
    	end
	elseif itemUsed == "drill" or itemUsed == "dinamite" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			addBox(playerSource, "Clique e arraste o '"..realName[itemUsed][1].."' em uma porta próxima de você para usá-lo.", "info")
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "pendrive" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			addBox(playerSource, "Clique e arraste o '"..realName[itemUsed][1].."' em um painel de controle próximo de você para usá-lo.", "info")
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "celular" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			addBox(playerSource, "Pressione a tecla 'F1' para usar o '"..realName[itemUsed][1].."'", "info")
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "dado" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			local random = math.random(1, 4)
			if random ~= 2 then
				local random2 = math.random(1, 6)
				for i, v in pairs(getElementsByType("player")) do
					local x1, y1, z1 = getElementPosition(playerSource)
					local x2, y2, z2 = getElementPosition(v)
					if getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2) <= 10 then
						outputChatBox("[DADO]:#FFFFFF "..random2, v, 30, 144, 255, true)
					end
				end
			else
				addBox(playerSource, "O dado caiu longe e você o perdeu", "erro")
				GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
			end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "radio" then
        if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
            triggerEvent ("MST.onPlayerUseRadinhoFromInventory", playerSource, playerSource)
        else
            addBox(playerSource, "  Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
        end
	elseif itemUsed == "notepad" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			triggerClientEvent(playerSource, "AC-AbrirNotepad", playerSource)
		else
			addBox(playerSource, "  Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
		end
	elseif itemUsed == "MisterBox" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
				GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
			triggerClientEvent(playerSource, "MeloSCR:ExecuteMisteryBox", playerSource)
      	end
	elseif itemUsed == "capacete" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(capacete[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(capacete[playerSource])
            			capacete[playerSource] = nil
            			setElementData(playerSource, "Capacete", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				capacete[playerSource] = createObject(1937, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(capacete[playerSource], int)
            			setElementDimension(capacete[playerSource], dim)
            			setElementData(playerSource, "Capacete", true)                               
            			exports.mistic_attach:attach(capacete[playerSource], playerSource, 8, 0,0.02,-0.01,0,0,-111.6)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end

	elseif itemUsed == "corda" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			local ply2 = exports.acrp:getproxply(playerSource, 3)
            if ply2 then
                if not getPedOccupiedVehicle(playerSource) then
                    if not getPedOccupiedVehicle(ply2) then
						if getElementData(ply2, "AC-CarregandoAlguém") == false then 
                            if getElementData(ply2, "RoubandoCaixinha") == false then
                                if getElementData(playerSource, "AC-CarregandoAlguém") == false then
                                    setElementData(ply2, "AC-SendoCarregado", true)
                                    setPedAnimation(ply2, nil)
                                    setElementData(playerSource, "AC-CarregandoAlguém", true)
                                    attachElements(ply2, playerSource, 0, -0.2, 1.05)
                                    setPedAnimation(ply2, "int_office", "off_sit_idle_loop")
                                    setElementCollisionsEnabled(ply2, false)
                                    setElementData(ply2, "AC-SendoCarregado", true)
                                    setElementData(ply2, "AC-EmAçãoHud", true)
                                    setElementData(ply2, "AC-InvOpen", true)
                                    setElementData(ply2, "AC-PSendoCarregado", playerSource)

                                    toggleControl(playerSource, "fire", false)
                                    toggleControl(playerSource, "jump", false)
                                    toggleControl(playerSource, "crouch", false)
                                    toggleControl(playerSource, "enter_exit", false)
                                    toggleControl(playerSource, "enter_passenger", false)
                                    setElementData(playerSource, "AC-PPSendoCarregado", ply2)

                                    toggleAllControls(ply2, false)
                                else
                                    if ply2 == getElementData(playerSource, "AC-PPSendoCarregado") then
                                        detachElements(playerSource)
                                        detachElements(ply2)

                                        setElementCollisionsEnabled(ply2, true)
                                        setElementData(ply2, "AC-SendoCarregado", false)
                                        setElementData(ply2, "AC-EmAçãoHud", false)
                                        setElementData(ply2, "AC-InvOpen", false)
                                        setElementData(ply2, "AC-PSendoCarregado", nil)
                                        setPedAnimation(ply2, nil)
                                        
                                        toggleControl(playerSource, "fire", true)
                                        toggleControl(playerSource, "jump", true)
                                        toggleControl(playerSource, "crouch", true)
                                        toggleControl(playerSource, "enter_exit", true)
                                        toggleControl(playerSource, "enter_passenger", true)
                                        setElementData(playerSource, "AC-CarregandoAlguém", false)

                                        toggleAllControls(ply2, true)
                                    end
                                end
                            end
                        end
                    end
                end
            end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end

	--[[elseif itemUsed == "vara" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(vara[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(vara[playerSource])
            			vara[playerSource] = nil
            			setElementData(playerSource, "vara", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				vara[playerSource] = createObject(1950, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(vara[playerSource], int)
            			setElementDimension(vara[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "vara", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(vara[playerSource], playerSource, 5, -0.05,0,-0.6,-86.4,-178.4,0 )
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end--]]
	elseif itemUsed == "pneu" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(pneu[playerSource]) then
					setPedAnimation(playerSource, "CARRY", "crry_prtial", 4.1, true, true, true)
					--setPedAnimation(playerSource, "CARRY", "liftup", -1, false) amin soltando objt!!
        			setTimer(function()
            			destroyElement(pneu[playerSource])
            			pneu[playerSource] = nil
            			setElementData(playerSource, "pneu", false)
        			end, 800, 1)
        		else
					setPedAnimation(playerSource, "CARRY", "crry_prtial", 4.1, true, true, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				pneu[playerSource] = createObject(1097, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(pneu[playerSource], int)
            			setElementDimension(pneu[playerSource], dim)          
            			setElementData(playerSource, "pneu", true)                       
						exports.mistic_attach:attach(pneu[playerSource], playerSource, 'backpack', 0, 0.65, 0.15)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "bone" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(bone[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(bone[playerSource])
            			bone[playerSource] = nil
            			setElementData(playerSource, "bone", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				bone[playerSource] = createObject(1951, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(bone[playerSource], int)
            			setElementDimension(bone[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "bone", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(bone[playerSource], playerSource, 5, 0,0,0.07,0,3.6,0 )
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "bone2" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(bone2[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(bone2[playerSource])
            			bone2[playerSource] = nil
            			setElementData(playerSource, "bone2", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				bone2[playerSource] = createObject(1910, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(bone2[playerSource], int)
            			setElementDimension(bone2[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "bone2", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(bone2[playerSource], playerSource, 5, 0,0,0.07,0,3.6,0 )
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "bone3" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(bone3[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(bone3[playerSource])
            			bone3[playerSource] = nil
            			setElementData(playerSource, "bone3", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				bone3[playerSource] = createObject(1894, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(bone3[playerSource], int)
            			setElementDimension(bone3[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "bone3", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(bone3[playerSource], playerSource, 5, 0,0,0.07,0,3.6,0 )
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "chapeu" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(chapeu[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(chapeu[playerSource])
            			chapeu[playerSource] = nil
            			setElementData(playerSource, "chapeu", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				chapeu[playerSource] = createObject(1913, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(chapeu[playerSource], int)
            			setElementDimension(chapeu[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "chapeu", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(chapeu[playerSource], playerSource, 5, 0, 0, 0.07, 0, 3.6, 0 )
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "chapeu1" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(chapeu1[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(chapeu1[playerSource])
            			chapeu1[playerSource] = nil
            			setElementData(playerSource, "chapeu1", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				chapeu1[playerSource] = createObject(1914, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(chapeu1[playerSource], int)
            			setElementDimension(chapeu1[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "chapeu1", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(chapeu1[playerSource], playerSource, 5, 0, 0, 0.07, 0, 3.6, 0 )
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "bone1" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(bone1[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(bone1[playerSource])
            			bone1[playerSource] = nil
            			setElementData(playerSource, "bone1", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				bone1[playerSource] = createObject(1951, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(bone1[playerSource], int)
            			setElementDimension(bone1[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "bone1", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(bone1[playerSource], playerSource, 5, 0,0,0.07,0,3.6,0 )
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "oculos" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(oculos[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(oculos[playerSource])
            			oculos[playerSource] = nil
            			setElementData(playerSource, "oculos", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				oculos[playerSource] = createObject(1952, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(oculos[playerSource], int)
            			setElementDimension(oculos[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "oculos", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(oculos[playerSource], playerSource, 5, 0,-0.05,-0.24,0,3.6,0 )
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "oculos1" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(oculos1[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(oculos1[playerSource])
            			oculos1[playerSource] = nil
            			setElementData(playerSource, "oculos1", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				oculos1[playerSource] = createObject(1952, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(oculos1[playerSource], int)
            			setElementDimension(oculos1[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "oculos1", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(oculos1[playerSource], playerSource, 5, 0,-0.04,-0.32,0,3.6,0 )
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "mergulho" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(mergulho[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(mergulho[playerSource])
            			mergulho[playerSource] = nil
            			setElementData(playerSource, "mergulho", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				mergulho[playerSource] = createObject(1953, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(mergulho[playerSource], int)
            			setElementDimension(mergulho[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "mergulho", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(mergulho[playerSource], playerSource, 3, -0.01,0.01,-0.18,90,-7.2,-176.4 )
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "colete1" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(colete1[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(colete1[playerSource])
            			colete1[playerSource] = nil
            			setElementData(playerSource, "colete1", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				colete1[playerSource] = createObject(1879, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(colete1[playerSource], int)
            			setElementDimension(colete1[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "colete1", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(colete1[playerSource], playerSource, 3,  0, 0.03, 0.12, 90, 0, 0)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "colete2" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(colete2[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(colete2[playerSource])
            			colete2[playerSource] = nil
            			setElementData(playerSource, "colete2", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				colete2[playerSource] = createObject(1908, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(colete2[playerSource], int)
            			setElementDimension(colete2[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "colete2", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(colete2[playerSource], playerSource, 3,  0, -0.01, -0.18, 0, 0, 0)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "bagnike" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(bagnike[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(bagnike[playerSource])
            			bagnike[playerSource] = nil
            			setElementData(playerSource, "bagnike", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				bagnike[playerSource] = createObject(1893, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(bagnike[playerSource], int)
            			setElementDimension(bagnike[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "bagnike", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(bagnike[playerSource], playerSource, 3,  0, -0.03, -0.19, 0, 0, 0)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "mochila2" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(mochila2[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(mochila2[playerSource])
            			mochila2[playerSource] = nil
            			setElementData(playerSource, "mochila2", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				mochila2[playerSource] = createObject(1881, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(mochila2[playerSource], int)
            			setElementDimension(mochila2[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "mochila2", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(mochila2[playerSource], playerSource, 3,  0, 0.03, -0.19, 90, 0, 180)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "katana" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(katana[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(katana[playerSource])
            			katana[playerSource] = nil
            			setElementData(playerSource, "katana", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				katana[playerSource] = createObject(1891, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(katana[playerSource], int)
            			setElementDimension(katana[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "katana", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(katana[playerSource], playerSource, 3,  0, 0.03, -0.19, 90, 0, 180)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "katana2" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(katana2[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(katana2[playerSource])
            			katana2[playerSource] = nil
            			setElementData(playerSource, "katana2", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				katana2[playerSource] = createObject(1892, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(katana2[playerSource], int)
            			setElementDimension(katana2[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "katana2", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(katana2[playerSource], playerSource, 3,  0, 0.03, -0.19, 90, 0, 180)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "asas" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(asas[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(asas[playerSource])
            			asas[playerSource] = nil
            			setElementData(playerSource, "asas", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				asas[playerSource] = createObject(1886, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(asas[playerSource], int)
            			setElementDimension(asas[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "asas", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(asas[playerSource], playerSource, 3,  0, 0.03, -0.19, 90, 0, 180)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "mochila3" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(mochila3[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(mochila3[playerSource])
            			mochila3[playerSource] = nil
            			setElementData(playerSource, "mochila3", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				mochila3[playerSource] = createObject(1884, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(mochila3[playerSource], int)
            			setElementDimension(mochila3[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "mochila3", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(mochila3[playerSource], playerSource, 3,  0, -0.22, -0.17, 90, 0, 0)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "mochila4" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(mochila4[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(mochila4[playerSource])
            			mochila4[playerSource] = nil
            			setElementData(playerSource, "mochila4", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				mochila4[playerSource] = createObject(1885, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(mochila4[playerSource], int)
            			setElementDimension(mochila4[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "mochila4", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(mochila4[playerSource], playerSource, 3,  0, -0.22, -0.17, 90, 0, 0)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "mochila5" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(mochila5[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(mochila5[playerSource])
            			mochila5[playerSource] = nil
            			setElementData(playerSource, "mochila5", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				mochila5[playerSource] = createObject(1888, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(mochila5[playerSource], int)
            			setElementDimension(mochila5[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "mochila5", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(mochila5[playerSource], playerSource, 3,  0, 0.03, -0.20, 90, 0, 180)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "mochila6" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(mochila6[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(mochila6[playerSource])
            			mochila6[playerSource] = nil
            			setElementData(playerSource, "mochila6", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				mochila6[playerSource] = createObject(1889, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(mochila6[playerSource], int)
            			setElementDimension(mochila6[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "mochila6", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(mochila6[playerSource], playerSource, 3,  0, 0.01, -0.19, 90, 0, 180)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "bag" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(bag[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(bag[playerSource])
            			bag[playerSource] = nil
            			setElementData(playerSource, "bag", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				bag[playerSource] = createObject(1909, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(bag[playerSource], int)
            			setElementDimension(bag[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "bag", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(bag[playerSource], playerSource, 3,  0.02, -0.01, -0.22, 0, 0, 0)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "bag2" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(bag2[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(bag2[playerSource])
            			bag2[playerSource] = nil
            			setElementData(playerSource, "bag2", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				bag2[playerSource] = createObject(1883, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(bag2[playerSource], int)
            			setElementDimension(bag2[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "bag2", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(bag2[playerSource], playerSource, 3,  0.02, -0.01, -0.22, 0, 0, 0)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "cordao" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(cordao[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(cordao[playerSource])
            			cordao[playerSource] = nil
            			setElementData(playerSource, "cordao", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				cordao[playerSource] = createObject(1912, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(cordao[playerSource], int)
            			setElementDimension(cordao[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "cordao", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(cordao[playerSource], playerSource, 3,  0, 0.05, -0.18, 90, 0, 180)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "bandana" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(bandana[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(bandana[playerSource])
            			bandana[playerSource] = nil
            			setElementData(playerSource, "bandana", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				bandana[playerSource] = createObject(1907, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(bandana[playerSource], int)
            			setElementDimension(bandana[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "bandana", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(bandana[playerSource], playerSource, 3,  -0.0, 0.06, -0.20, 90, 0, 180)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
     elseif itemUsed == "coldrepeito1" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(coldrepeito1[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(coldrepeito1[playerSource])
            			coldrepeito1[playerSource] = nil
            			setElementData(playerSource, "coldrepeito1", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				coldrepeito1[playerSource] = createObject(1905, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(coldrepeito1[playerSource], int)
            			setElementDimension(coldrepeito1[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "coldrepeito1", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(coldrepeito1[playerSource], playerSource, 3,  0, 0.03, -0.18, 90, 0, 180)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
     elseif itemUsed == "cinturao" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(cinturao[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(cinturao[playerSource])
            			cinturao[playerSource] = nil
            			setElementData(playerSource, "cinturao", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				cinturao[playerSource] = createObject(1906, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(cinturao[playerSource], int)
            			setElementDimension(cinturao[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "cinturao", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(cinturao[playerSource], playerSource, 3,  0.02, 0.06, -0.17, 90, 0, 180)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
     elseif itemUsed == "iphone" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(iphone[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(iphone[playerSource])
            			iphone[playerSource] = nil
            			setElementData(playerSource, "iphone", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				iphone[playerSource] = createObject(1890, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(iphone[playerSource], int)
            			setElementDimension(iphone[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "iphone", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(iphone[playerSource], playerSource, 3,  0.23, 0.08, -0.17, 90, 0, 270)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "shoulder1" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(shoulder1[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(shoulder1[playerSource])
            			shoulder1[playerSource] = nil
            			setElementData(playerSource, "shoulder1", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				shoulder1[playerSource] = createObject(1887, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(shoulder1[playerSource], int)
            			setElementDimension(shoulder1[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "shoulder1", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(shoulder1[playerSource], playerSource, 3,  0.02, -0.01, -0.22, 0, 0, 0)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
     elseif itemUsed == "mec" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(mec[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(mec[playerSource])
            			mec[playerSource] = nil
            			setElementData(playerSource, "mec", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				mec[playerSource] = createObject(1911, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(mec[playerSource], int)
            			setElementDimension(mec[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "mec", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(mec[playerSource], playerSource, 3,  0.01, 0.04, -0.17, 90, 0, 180)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "oculos2" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(oculos2[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(oculos2[playerSource])
            			oculos2[playerSource] = nil
            			setElementData(playerSource, "oculos2", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				oculos2[playerSource] = createObject(1880, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(oculos2[playerSource], int)
            			setElementDimension(oculos2[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "oculos2", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(oculos2[playerSource], playerSource, 5, 0,-0.04,-0.32,0,3.6,0 )
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "oculos3" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(oculos3[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(oculos3[playerSource])
            			oculos3[playerSource] = nil
            			setElementData(playerSource, "oculos3", false)
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				oculos3[playerSource] = createObject(1878, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(oculos3[playerSource], int)
            			setElementDimension(oculos3[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
            			setElementData(playerSource, "oculos3", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
            			exports.mistic_attach:attach(oculos3[playerSource], playerSource, 5, 0,-0.04,-0.32,0,3.6,0 )
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "mochila1" then
		mochila1[playerSource] = mochila1
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(mochila1[playerSource]) then
					setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
					setTimer(function()
						destroyElement(mochila1[playerSource])
						mochila1[playerSource] = nil
						setElementData(playerSource, "mochila1", false)
					end, 800, 1)
				else
					setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
					setTimer(function()
						local x, y, z = getElementPosition(playerSource)
						mochila1[playerSource] = createObject(1922, x, y, z)
						local dim = getElementDimension(playerSource)
						local int = getElementInterior(playerSource)
						setElementInterior(mochila1[playerSource], int)
						setElementDimension(mochila1[playerSource], dim)          --0.01,0.11,-0.6,90,7.2,180
						setElementData(playerSource, "mochila1", true)                         ---0.06,0,-0.5,-86.4,-176.4,0      
						exports.mistic_attach:attach(mochila1[playerSource], playerSource, "backpack", 0, -0.01, -0.15, 90, 0, 90)
					end, 800, 1)
				end
			end
		  else
			  addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
		  end
	elseif itemUsed == "pedra" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
		   exports.ac_corridas:aciniciarcorrida(ply)
		end

	elseif itemUsed == "porco" or itemUsed == "criatura" or itemUsed == "capeta" or itemUsed == "caveira" or itemUsed == "macaco" or itemUsed == "coruja" or itemUsed == "cavalo" or itemUsed == "touro" or itemUsed == "sacola" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 800, 1)
				if isElement(mascara[playerSource]) then
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
            			destroyElement(mascara[playerSource])
            			mascara[playerSource] = nil
        			end, 800, 1)
        		else
        			setPedAnimation(playerSource, "goggles", "goggles_put_on", 800, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				mascara[playerSource] = createObject(masks[itemUsed][1], x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(mascara[playerSource], int)
            			setElementDimension(mascara[playerSource], dim)
            			exports.bone_attach:attachElementToBone(mascara[playerSource], playerSource, 1, -0.003, 0, -0.565, 0, 1, 90)
        			end, 800, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "som" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			executeCommandHandler ( "daddyvanessadrp", playerSource )
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "maleta" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				if isElement(maleta[playerSource]) then
            		destroyElement(maleta[playerSource])
            		maleta[playerSource] = nil
        		else
        			setPedAnimation(playerSource, "BUDDY", "buddy_reload", 500, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				maleta[playerSource] = createObject(1210, x, y, z)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			setElementInterior(maleta[playerSource], int)
            			setElementDimension(maleta[playerSource], dim)
            			exports.bone_attach:attachElementToBone(maleta[playerSource], playerSource, 11, -3.4694469519536e-18, 0.095, 0.3, -6, -184, 0)
            		end, 500, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "flor" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				if isElement(flor[playerSource]) then
            		destroyElement(flor[playerSource])
            		flor[playerSource] = nil
        		else
        			setPedAnimation(playerSource, "BUDDY", "buddy_reload", 500, false, true, false, false, _, true)
        			setTimer(function()
        				local x, y, z = getElementPosition(playerSource)
        				local dim = getElementDimension(playerSource)
        				local int = getElementInterior(playerSource)
            			flor[playerSource] = createObject(325, x, y, z)
            			setElementInterior(flor[playerSource], int)
            			setElementDimension(flor[playerSource], dim)
            			exports.bone_attach:attachElementToBone(flor[playerSource], playerSource, 12, 0, 0, 0, 0, 270, 0)
            		end, 500, 1)
        		end
        	end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
    elseif itemUsed == "bandagem" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 5000, 1)
				GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
				setPedAnimation(playerSource, "CASINO", "dealone", 5000, true, false, false, false, _, true)
            	setTimer(function()
            		local health = getElementHealth(playerSource)
            		setElementHealth(playerSource, health + 20)
            		setPedAnimation(playerSource, nil)
            	end, 5000, 1)
			end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
    elseif itemUsed == "cigarro" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			if GiveAndTakeAndGetItem("get", playerSource, "isqueiro") >= 1 then
				if not isTimer(acao[playerSource]) then
					if not isElement(cigarro[playerSource]) then
						local x, y, z = getElementPosition(playerSource)
						local int = getElementInterior(playerSource)
						local dim = getElementDimension(playerSource)
						cigarro[playerSource] = createObject(1485, x, y, z)
						setElementInterior(cigarro[playerSource], int)
						setElementDimension(cigarro[playerSource], dim)
						acao[playerSource] = setTimer(function() end, 7000, 1)
						GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
						setPedAnimation(playerSource, "GANGS", "smkcig_prtl", 7000, false, true, false, false, _, true)
						exports.bone_attach:attachElementToBone(cigarro[playerSource], playerSource, 12, -0.03, 0.06, 0.04, 30, -50, -24)
						local random = math.random(1, 10)
						if random == 1 then
							GiveAndTakeAndGetItem("take", playerSource, "isqueiro", 1)
						end
						setTimer(function()
							addBox(playerSource, "Pressione 'X' para fumar", "info")
							bindKey(playerSource, "x", "down", fumarCigarro)
							setTimer(function()
								destroyElement(cigarro[playerSource])
								cigarro[playerSource] = nil
								unbindKey(playerSource, "x", "down", fumarCigarro)
							end, 60000*3, 1)
						end, 7000, 1)
					else
						addBox(playerSource, "Você já está fumando um cigarro", "erro")
					end
				end
			else
				addBox(playerSource, "Você não possui 'Isqueiro' em seu inventario", "erro")
			end
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
    elseif itemUsed == "adrenalina" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
			setPedAnimation(playerSource, "BOMBER", "BOM_Plant_Loop", 10000, true, false, false, false, _, true)
			setTimer(function()
				if isTimer(acao[playerSource]) then killTimer(acao[playerSource]) end
				setElementFrozen(playerSource, false)
				setElementHealth(playerSource, 100)
				setPedArmor(playerSource, 100)
				setPedAnimation(playerSource, nil)
				toggleAllControls(playerSource, true)
				if getElementData(playerSource, "Desmaiado") then
					triggerEvent("Desmaiado", root, playerSource, false)
				end
				local name = getPlayerName(playerSource)
				local ID1 = getElementData(playerSource, "ID") or "N/A"
				exports["[Script]Logs"]:CreateLog("[INVENTARIO]\nJogador: "..name.." ["..ID1.."]\nAção: Usou o item 'Injeção de Adrenalina'")
				for _, players in pairs(getElementsByType("player")) do
					if players ~= playerSource then
						local x, y, z = getElementPosition(playerSource)
						local x2, y2, z2 = getElementPosition(players)
						if getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) <= 30 then
							local name = getPlayerName(playerSource)
							local id = getElementData(playerSource, "ID") or "N/A"
							outputChatBox("[INFO]:#FFFFFF O jogador "..name.."#FFFFFF ("..id..") usou uma '"..realName[itemUsed][1].."'", players, 30, 144, 255, true)
						end
					end
				end
			end, 10000, 1)
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
    elseif itemUsed == "identidade" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			local name = getPlayerName(playerSource)
			local id = getElementData(playerSource, "ID") or "N/A"
			addBox(playerSource, "[IDENTIDADE]  •  Nome: '"..name.."', Nº: '"..id.."'", "info")
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
    elseif itemUsed == "cnh" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			local name = getPlayerName(playerSource)
			local id = getElementData(playerSource, "ID") or "N/A"
			local categoria = getElementData(playerSource, "CNH") or "[ ! ] Geral"
			addBox(playerSource, "[CNH]  •  Nome: '"..name.."', Nº: '"..id.."', categoria: '"..categoria.."'", "info")
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
    elseif itemUsed == "porte" then
		if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
			local name = getPlayerName(playerSource)
			local id = getElementData(playerSource, "ID") or "N/A"
			addBox(playerSource, "[PORTE DE ARMA]  •  Nome: '"..name.."', Nº: '"..id.."', situação: 'Válido'", "info")
      	else
      		addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
      	end
	elseif itemUsed == "algema" then
		local clickedWorld = getNearestPlayer(playerSource, 5)
		if clickedWorld then
			if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
				if not isPedInVehicle(playerSource) then
					if not isTimer(acao[playerSource]) then
						local x, y, z = getElementPosition(playerSource)
						local ex, ey, ez = getElementPosition(clickedWorld)
						if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
							if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup(ACL_PM)) then
								if not algemado[clickedWorld] then
									if isElement(item[clickedWorld]) then destroyElement(item[clickedWorld]) item[clickedWorld] = nil end
									local x, y, z = getElementPosition(clickedWorld)
									item[clickedWorld] = createObject(331, x, y, z)
									setObjectScale(item[clickedWorld], 1.2)
									acao[clickedWorld] = setTimer(function() end, 60000*30, 1)
									GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
									GiveAndTakeAndGetItem("give", playerSource, "chaves", 1)
									setPedAnimation(playerSource, "CASINO", "dealone", 1000, true, false, false, false, _, true)
									setPedAnimation(clickedWorld, "GANGS","prtial_gngtlkA", 1, false, false, false, true, _, true)
									setTimer(function()
										setPedAnimationSpeed(clickedWorld, "prtial_gngtlkA", 0)
										setTimer(function()
											setPedAnimationProgress(clickedWorld, "prtial_gngtlkA", 0.2)
										end, 500, 1)
									end, 800, 1)
									toggleControl(clickedWorld, "sprint", false)
									toggleControl(clickedWorld, "walk", false)
									toggleControl(clickedWorld, "jump", false)
									toggleControl(clickedWorld, "fire", false)
									toggleControl(clickedWorld, "action", false)
									toggleControl(clickedWorld, "crouch", false)
									toggleControl(clickedWorld, "aim_weapon", false)
									toggleControl(clickedWorld, "enter_exit", false)
									setControlState(clickedWorld, "walk", true)
									algemado[clickedWorld] = playerSource
									algemando[playerSource] = clickedWorld
									addBox(playerSource, "Você algemou o criminoso. Use as chaves para soltá-lo novamente", "sucesso")
									addBox(clickedWorld, "Você foi algemado pelo policial "..getPlayerName(playerSource), "aviso")
									exports.bone_attach:attachElementToBone(item[clickedWorld], clickedWorld, 12, 0.09, 0.03, 0.14, -30, 126, -86)
									timerAlgema[clickedWorld] = setTimer(function()
										setPedAnimation(clickedWorld, "GANGS","prtial_gngtlkA", 1, false, false, false, true, _, true)
										setPedAnimationSpeed(clickedWorld, "prtial_gngtlkA", 0)
										setPedAnimationProgress(clickedWorld, "prtial_gngtlkA", 0.2)
									end, 500, 0)
								else
									addBox(playerSource, "Seu alvo já está algemado", "erro")
								end
							end
						else
							addBox(playerSource, "Você está muito distante do seu alvo", "erro")
							end
						end
					else
						addBox(playerSource, "Você precisa estar fora de um veículo para usar a '"..realName[itemUsed][1].."'", "erro")
					end
				else
					addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
				end
			end
	elseif itemUsed == "chaves" then
		local clickedWorld = getNearestPlayer(playerSource, 5)
		if clickedWorld then
			if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
				if not isPedInVehicle(playerSource) then
					if not isTimer(acao[playerSource]) then
						local x, y, z = getElementPosition(playerSource)
						local ex, ey, ez = getElementPosition(clickedWorld)
						if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
							if algemado[clickedWorld] then
								if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup(ACL_PM)) then
									if isElement(item[clickedWorld]) then destroyElement(item[clickedWorld]) item[clickedWorld] = nil end
									if isTimer(acao[clickedWorld]) then killTimer(acao[clickedWorld]) end
									if isTimer(timerAlgema[clickedWorld]) then killTimer(timerAlgema[clickedWorld]) timerAlgema[clickedWorld] = nil end
									GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
									GiveAndTakeAndGetItem("give", playerSource, "algema", 1)
									setPedAnimation(clickedWorld, "CASINO", "dealone", -1, false)
									setTimer(setPedAnimation, 50, 1, clickedWorld, nil)
									toggleAllControls(clickedWorld, true)
									setControlState(clickedWorld, "walk", false)
									addBox(playerSource, "Você tirou as algemas do criminoso", "sucesso")
										addBox(clickedWorld, "O policial "..getPlayerName(playerSource).."#FFFFFF removeu suas algemas", "info")
										local pm = algemado[clickedWorld]
										algemando[pm] = nil
										algemado[clickedWorld] = nil
									end
								end
							end
						end
					else
						addBox(playerSource, "Você precisa estar fora de um veículo para usar as '"..realName[itemUsed][1].."'", "erro")
					end
				else
					addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
				end
			end
		elseif itemUsed == "kit_reparo" then
			local clickedWorld = getNearestVehicle(playerSource, 5)
			if clickedWorld then
				if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
					if not isPedInVehicle(playerSource) then
						if not isTimer(acao[playerSource]) then
							local x, y, z = getElementPosition(playerSource)
							local ex, ey, ez = getElementPosition(clickedWorld)
							if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 3 then
								local counter = 0
								for seat, player in pairs(getVehicleOccupants(clickedWorld)) do
									counter = counter + 1
								end
								if counter < 1 then
									if not getElementData(clickedWorld, "Engine") then
										if getElementHealth(clickedWorld) < 1000 then
											if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup("Everyone")) then
												acao[playerSource] = setTimer(function() end, 14000, 1)
												if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
												local x, y, z = getElementPosition(playerSource)
												item[playerSource] = createObject(1938, x, y, z - 0.65, 0, 90, 0)
												setElementCollisionsEnabled(item[playerSource], false)
												PlaySound3D(playerSource, "repair", "all")
												GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
												triggerClientEvent(playerSource, "progressBar", playerSource, 14000)
						                        --triggerClientEvent(playerSource, "AC-AbrirTimerHud",  playerSource, 14000)
												setElementFrozen(playerSource, true)
												setElementFrozen(clickedWorld, true)
												local _, _, rot = getElementRotation(playerSource)
												setElementRotation(playerSource, _, _, rot + 180)
												setPedAnimation(playerSource, "CAR", "fixn_car_loop", 14000, true, false, false, false, _, true)
												setTimer(function()
													destroyElement(item[playerSource])
													item[playerSource] = nil
													fixVehicle(clickedWorld)
													setVehicleDamageProof(clickedWorld, false)
													setElementFrozen(clickedWorld, false)
													setElementFrozen(playerSource, false)
													local exp = math.random(expRepair1, expRepair2)
													if getElementData(playerSource, "VIP") then
														local xp = (exp + (exp/4))
														triggerEvent("GiveExp", playerSource, playerSource, xp)
													else
														triggerEvent("GiveExp", playerSource, playerSource, exp)
													end
													addBox(playerSource, "Você reparou o veículo", "sucesso")
												end, 14000, 1)
											end
										else
											addBox(playerSource, "O veículo não possui nenhum dano para ser reparado", "erro")
										end
									else
										addBox(playerSource, "O veículo precisa estar desligado para ser reparado", "erro")
									end
								else
									addBox(playerSource, "O veículo precisa estar vazio para ser reparado", "erro")
								end
							else
								addBox(playerSource, "Você está muito distante do veículo", "erro")
								end
							end
						else
							addBox(playerSource, "Você precisa estar fora de um veículo para usar o '"..realName[itemUsed][1].."'", "erro")
						end
					else
						addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
					end
				end
		elseif itemUsed == "pneu"  then
			local clickedWorld = getNearestVehicle(playerSource, 5)
			if clickedWorld then
				if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
					if not isPedInVehicle(playerSource) then
						if not isTimer(acao[playerSource]) then
							local x, y, z = getElementPosition(playerSource)
							local ex, ey, ez = getElementPosition(clickedWorld)
							if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 3 then
								local counter = 0
								for seat, player in pairs(getVehicleOccupants(clickedWorld)) do
									counter = counter + 1
								end
								if counter < 1 then
									if not getElementData(clickedWorld, "Engine") then
										local r1, r2, r3, r4 = getVehicleWheelStates(clickedWorld)
										if r1 ~= 0 or r2 ~= 0 or r3 ~= 0 or r4 ~= 0 then
											if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup("Everyone")) then
												acao[playerSource] = setTimer(function() end, 14000, 1)
												if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
												local x, y, z = getElementPosition(playerSource)
												item[playerSource] = createObject(1025, x, y, z - 0.85, 0, 90, 0)
												setObjectScale(item[playerSource], 0.8)
												setElementCollisionsEnabled(item[playerSource], false)
												PlaySound3D(playerSource, "repair", 100)
												GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
												triggerClientEvent(playerSource, "progressBar", playerSource, 14000)
						                        --triggerClientEvent(playerSource, "AC-AbrirTimerHud", playerSource,  14000)
												setElementFrozen(playerSource, true)
												setElementFrozen(clickedWorld, true)
												local _, _, rot = getElementRotation(playerSource)
												setElementRotation(playerSource, _, _, rot + 180)
												setPedAnimation(playerSource, "CAR", "fixn_car_loop", 14000, true, false, false, false, _, true)
												setTimer(function()
													destroyElement(item[playerSource])
													item[playerSource] = nil
													setVehicleWheelStates(clickedWorld, 0, 0, 0, 0)
													setElementFrozen(clickedWorld, false)
													setElementFrozen(playerSource, false)
													local exp = math.random(expPneu1, expPneu2)
													if getElementData(playerSource, "VIP") then
														local xp = (exp + (exp/4))
														triggerEvent("GiveExp", playerSource, playerSource, xp)
													else
														triggerEvent("GiveExp", playerSource, playerSource, exp)
													end
													addBox(playerSource, "Você trocou os pneus do veículo", "sucesso")
													end, 14000, 1)
												end
											else
												addBox(playerSource, "O veículo não possui nenhum pneu furado", "erro")
											end
										else
											addBox(playerSource, "O veículo precisa estar desligado para ter seu pneu trocado", "erro")
										end
									else
										addBox(playerSource, "O veículo precisa estar vazio para ter seu pneu trocado", "erro")
									end
								else
									addBox(playerSource, "Você está muito distante do veículo", "erro")
									end
								end
							else
								addBox(playerSource, "Você precisa estar fora de um veículo para usar o '"..realName[itemUsed][1].."'", "erro")
							end
						else
							addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
						end
					end
		elseif itemUsed == "gasolina" then
			local clickedWorld = getNearestVehicle(playerSource, 5)
			if clickedWorld then
				if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
					if not isPedInVehicle(playerSource) then
						if not isTimer(acao[playerSource]) then
							local x, y, z = getElementPosition(playerSource)
							local ex, ey, ez = getElementPosition(clickedWorld)
							if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 3 then
								local counter = 0
								for seat, player in pairs(getVehicleOccupants(clickedWorld)) do
									counter = counter + 1
								end
								if counter < 1 then
									if not getElementData(clickedWorld, "Engine") then
										local gas = getElementData(clickedWorld, "Gasolina") or 0
										if gas < 100 then
											acao[playerSource] = setTimer(function() end, 15000, 1)
											if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
											local x, y, z = getElementPosition(playerSource)
											item[playerSource] = createObject(1650, x, y, z)
											GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
											triggerClientEvent(playerSource, "progressBar", playerSource, 15000)
						                    --triggerClientEvent(playerSource, "AC-AbrirTimerHud", playerSource,  15000)
											setElementFrozen(playerSource, true)
											setElementFrozen(clickedWorld, true)
											setPedAnimation(playerSource, "CASINO", "Slot_Plyr", -1, true, false, false, false)
											setTimer(setPedAnimationSpeed, 700, 1, playerSource, "Slot_Plyr", 0)
											exports.bone_attach:attachElementToBone(item[playerSource], playerSource, 12, -0.01, 0.15, 0.05, -48, 62, 140)
											setTimer(function()
												setPedAnimation(playerSource, nil)
												destroyElement(item[playerSource])
												item[playerSource] = nil
												setElementData(clickedWorld, "Gasolina", 100)
												setElementFrozen(clickedWorld, false)
												setElementFrozen(playerSource, false)
												addBox(playerSource, "Você encheu o tanque do veículo", "sucesso")
												end, 15000, 1)
											else
												addBox(playerSource, "O veículo já está com o tanque cheio", "erro")
											end
										else
											addBox(playerSource, "O veículo precisa estar desligado para ser abastecido", "erro")
										end
									else
										addBox(playerSource, "O veículo precisa estar vazio para ser abastecido", "erro")
									end
								else
									addBox(playerSource, "Você está muito distante do veículo", "erro")
									end
								end
							else
								addBox(playerSource, "Você precisa estar fora de um veículo para usar o '"..realName[itemUsed][1].."'", "erro")
							end
						else
							addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
						end
					end
		elseif itemUsed == "kitmedico" then
			local clickedWorld = getNearestPlayer(playerSource, 5)
			if clickedWorld then
				if GiveAndTakeAndGetItem("get", playerSource, itemUsed) >= 1 then
					if not isPedInVehicle(playerSource) and not isPedInVehicle(clickedWorld) then
						if not isTimer(acao[playerSource]) then
							local x, y, z = getElementPosition(playerSource)
							local ex, ey, ez = getElementPosition(clickedWorld)
							if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
								if getElementData(clickedWorld, "Desmaiado") then
									if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup("Everyone")) then
										acao[playerSource] = setTimer(function() end, 20000, 1)
										setElementFrozen(playerSource, true)
										GiveAndTakeAndGetItem("take", playerSource, itemUsed, 1)
										setPedAnimation(playerSource, "MEDIC", "CPR", 20000, true, false, false, false, _, true)
										triggerClientEvent(playerSource, "progressBar", playerSource, 20000)
						                --triggerClientEvent(playerSource, "AC-AbrirTimerHud", playerSource,  20000)
										setTimer(function()
											triggerEvent("Desmaiado", root, clickedWorld, false)
											setElementFrozen(playerSource, false)
											if isTimer(acao[clickedWorld]) then killTimer(acao[clickedWorld]) end
											addBox(playerSource, "Você reanimou o cidadão(ã) "..getPlayerName(clickedWorld), "sucesso")
											addBox(clickedWorld, "Você foi re-animado pelo(a) socorrista do SAMU", "info")
												local name = getPlayerName(playerSource)
												local ID1 = getElementData(playerSource, "ID") or "N/A"
												local name2 = getPlayerName(clickedWorld)
												local ID2 = getElementData(clickedWorld, "ID") or "N/A"
												exports["[Script]Logs"]:CreateLog("[INVENTARIO]\nSAMU: "..name.." ["..ID1.."]\nPaciente: "..name2.." ["..ID2.."]")
												if curado[playerSource] ~= clickedWorld then
												
													
													if getElementData(playerSource, "VIP") then
														local xp = (exp + (exp/4))
														triggerEvent("GiveExp", playerSource, playerSource, xp)
													else
														triggerEvent("GiveExp", playerSource, playerSource, exp)
													end
												end
												curado[playerSource] = clickedWorld
											end, 20000, 1)
										end
									else
										addBox(playerSource, "Este cidadão(ã) não está precisando de socorros", "erro")
									end
								else
									addBox(playerSource, "Você está muito distante do cidadão(ã) indicado", "erro")
									end
								end
							else
								addBox(playerSource, "Você precisa estar fora de um veículo para usar o '"..realName[itemUsed][1].."'", "erro")
							end
						else
							addBox(playerSource, "Você não possui '"..realName[itemUsed][1].."' em seu inventario", "erro")
						end
					end

		elseif itemUsed == 'mochila' then

			if GiveAndTakeAndGetItem( 'get', playerSource, itemUsed ) >= 1 then
				-- variavel do peso atual
				local weightCurrent
				-- peso que irá aumentar ao usar uma mochila
				local weightIncreased = 10
				-- peso máximo que poderá aumentar
				local weightMax = 110
				-- verifica se o playerSource é vip ou staff
				if getElementData( playerSource, 'VIP' ) or getElementData( playerSource, 'Staff' ) then
					-- peso caso seja vip ou staff
					weightCurrent = getElementData( playerSource, 'bag.current' ) or 50
				else
					-- peso caso não seja vip ou staff
					weightCurrent = getElementData( playerSource, 'bag.current' ) or 30
				end
				-- verifica se o peso que será adicionado é maior que o peso máximo
				if ( weightCurrent + weightIncreased ) < weightMax then
					setElementData( playerSource, 'bag.current', tonumber( weightCurrent + weightIncreased ) )
					GiveAndTakeAndGetItem( 'take', playerSource, itemUsed, 1 )
					addBox( playerSource, 'aviso', 'Você usou a mochila com sucesso.', 'erro' )
				else
					addBox( playerSource, 'aviso', 'Você atingiu o peso máximo.', 'erro' )
				end

			else
				-- caso não possua o item
				addBox( playerSource, 'aviso', 'Você não possui "'..realName[itemUsed][1]..'" em seu inventario', 'erro' )
			end

		elseif itemUsed == 'mochilam' then

			if GiveAndTakeAndGetItem( 'get', playerSource, itemUsed ) >= 1 then
				-- variavel do peso atual
				local weightCurrent
				-- peso que irá aumentar ao usar uma mochila
				local weightIncreased = 25
				-- peso máximo que poderá aumentar
				local weightMax = 110
				-- verifica se o playerSource é vip ou staff
				if getElementData( playerSource, 'VIP' ) or getElementData( playerSource, 'Staff' ) then
					-- peso caso seja vip ou staff
					weightCurrent = getElementData( playerSource, 'bag.current' ) or 50
				else
					-- peso caso não seja vip ou staff
					weightCurrent = getElementData( playerSource, 'bag.current' ) or 30
				end
				-- verifica se o peso que será adicionado é maior que o peso máximo
				if ( weightCurrent + weightIncreased ) < weightMax then
					setElementData( playerSource, 'bag.current', tonumber( weightCurrent + weightIncreased ) )
					GiveAndTakeAndGetItem( 'take', playerSource, itemUsed, 1 )
					addBox( playerSource, 'aviso', 'Você usou a mochila com sucesso.', 'erro' )
				else
					addBox( playerSource, 'aviso', 'Você atingiu o peso máximo.', 'erro' )
				end

			elseif itemUsed == 'mochilag' then

				if GiveAndTakeAndGetItem( 'get', playerSource, itemUsed ) >= 1 then
					-- variavel do peso atual
					local weightCurrent
					-- peso que irá aumentar ao usar uma mochila
					local weightIncreased = 35
					-- peso máximo que poderá aumentar
					local weightMax = 110
					-- verifica se o playerSource é vip ou staff
					if getElementData( playerSource, 'VIP' ) or getElementData( playerSource, 'Staff' ) then
						-- peso caso seja vip ou staff
						weightCurrent = getElementData( playerSource, 'bag.current' ) or 50
					else
						-- peso caso não seja vip ou staff
						weightCurrent = getElementData( playerSource, 'bag.current' ) or 30
					end
					-- verifica se o peso que será adicionado é maior que o peso máximo
					if ( weightCurrent + weightIncreased ) < weightMax then
						setElementData( playerSource, 'bag.current', tonumber( weightCurrent + weightIncreased ) )
						GiveAndTakeAndGetItem( 'take', playerSource, itemUsed, 1 )
						addBox( playerSource, 'aviso', 'Você usou a mochila com sucesso.', 'erro' )
					else
						addBox( playerSource, 'aviso', 'Você atingiu o peso máximo.', 'erro' )
					end
	
				else
					-- caso não possua o item
					addBox( playerSource, 'aviso', 'Você não possui "'..realName[itemUsed][1]..'" em seu inventario', 'erro' )
				end

			else
				-- caso não possua o item
				addBox( playerSource, 'aviso', 'Você não possui "'..realName[itemUsed][1]..'" em seu inventario', 'erro' )
			end

		elseif itemUsed == 'lockpick' then
			-- elemento manipulador do veículo
			local vehicle = getNearestVehicle( playerSource, 5 )
			
			if GiveAndTakeAndGetItem( 'get', playerSource, itemUsed ) >= 1 then
				-- bloqueia para não usar dentro de um veículo
				if isPedInVehicle( playerSource ) then return end
				-- verifica se há algum veículo próximo
				if vehicle then
					-- verifica se o próximo está trancado
					if isVehicleLocked( vehicle ) then
						-- cria as runBar, função util que criei no run_bar/scripts/aviso.lua
						userBarInAbas( playerSource,
							-- função que executará ao acertar todas as marcações
							function( )
								setVehicleLocked(vehicle, false)
                                setElementData(vehicle, 'veh:lock', false)
                                setElementData(vehicle, 'veh:status', false) 
								GiveAndTakeAndGetItem( 'take', playerSource, itemUsed, 1 )
								addBox( playerSource, 'aviso', 'Veículo destrancado', 'sucesso' )
							end
						)
						
					else
						-- caso o veículo esteja destrancado
						addBox( playerSource, 'aviso', 'Esse veículo já está destrancado', 'erro' )
					end

				else
					-- caso não haja veículo próximo quando utilizar o item
					addBox( playerSource, 'aviso', 'Nenhum veículo próximo', 'erro' )
				end
				
			else
				-- caso não possua o item
				addBox( playerSource, 'aviso', 'Você não possui "'..realName[itemUsed][1]..'" em seu inventario', 'erro' )
			end
		
		elseif itemActioned == "porte" and getElementType(clickedWorld) == "player" then
			if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
				if not isPedInVehicle(playerSource) then
					if not isTimer(acao[playerSource]) then
						local x, y, z = getElementPosition(playerSource)
						local ex, ey, ez = getElementPosition(clickedWorld)
						if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
							local name = getPlayerName(playerSource)
							local id = getElementData(playerSource, "ID") or "N/A"
							addBox(clickedWorld, "[PORTE DE ARMA]  •  Nome: '"..name.."', Nº: '"..id.."', situação: 'Válido'", "info")
							addBox(playerSource, "Você mostrou seu '"..realName[itemActioned][1].."' para o(a) "..getPlayerName(clickedWorld), "sucesso")
						end
					end
				else
					addBox(playerSource, "Você precisa estar fora de um veículo para mostrar seu '"..realName[itemActioned][1].."'", "erro")
				end
			else
				addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
			end
		elseif itemActioned == "cnh" and getElementType(clickedWorld) == "player" then
			if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
				if not isPedInVehicle(playerSource) then
					if not isTimer(acao[playerSource]) then
						local x, y, z = getElementPosition(playerSource)
						local ex, ey, ez = getElementPosition(clickedWorld)
						if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
							local name = getPlayerName(playerSource)
							local id = getElementData(playerSource, "ID") or "N/A"
							local categoria = getElementData(playerSource, "CNH") or "[ ! ] erro, contate um administrador"
							addBox(clickedWorld, "[CNH]  •  Nome: '"..name.."', Nº: '"..id.."', categoria: '"..categoria.."'", "info")
							addBox(playerSource, "Você mostrou sua '"..realName[itemActioned][1].."' para o(a) "..getPlayerName(clickedWorld), "sucesso")
						end
					end
				else
					addBox(playerSource, "Você precisa estar fora de um veículo para mostrar sua '"..realName[itemActioned][1].."'", "erro")
				end
			else
				addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
			end
		elseif itemActioned == "identidade" and getElementType(clickedWorld) == "player" then
			if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
				if not isPedInVehicle(playerSource) then
					if not isTimer(acao[playerSource]) then
						local x, y, z = getElementPosition(playerSource)
						local ex, ey, ez = getElementPosition(clickedWorld)
						if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
							local name = getPlayerName(playerSource)
							local id = getElementData(playerSource, "ID") or "N/A"
							local wanted = getPlayerWantedLevel(playerSource)
							addBox(clickedWorld, "[IDENTIDADE]  •  Nome: '"..name.."', Nº: '"..id.."', Mandados de prisão: '"..wanted.."'", "info")
							addBox(playerSource, "Você mostrou sua '"..realName[itemActioned][1].."' para o(a) "..getPlayerName(clickedWorld), "sucesso")
						end
					end
				else
					addBox(playerSource, "Você precisa estar fora de um veículo para mostrar sua '"..realName[itemActioned][1].."'", "erro")
				end
			else
				addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
			end
		elseif itemActioned == "dinamite" and getElementType(clickedWorld) == "object" then
			if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
				if not isPedInVehicle(playerSource) then
					if not isTimer(acao[playerSource]) then
						local x, y, z = getElementPosition(playerSource)
						local ex, ey, ez = getElementPosition(clickedWorld)
						if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
							if getElementData(clickedWorld, "Bank:Gate1") then
								triggerEvent("Banco:Iniciar", root, playerSource)
							end
						end
					end
				else
					addBox(playerSource, "Você precisa estar fora de um veículo para usar '"..realName[itemActioned][1].."'", "erro")
				end
			else
				addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
			end
		elseif itemActioned == "pendrive" and getElementType(clickedWorld) == "object" then
			if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
				if not isPedInVehicle(playerSource) then
					if not isTimer(acao[playerSource]) then
						local x, y, z = getElementPosition(playerSource)
						local ex, ey, ez = getElementPosition(clickedWorld)
						if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
							if getElementData(clickedWorld, "Bank:Pass") then
								triggerEvent("Banco:Hackear", root, playerSource)
							end
						end
					end
				else
					addBox(playerSource, "Você precisa estar fora de um veículo para usar '"..realName[itemActioned][1].."'", "erro")
				end
			else
				addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
			end
		elseif itemActioned == "drill" and getElementType(clickedWorld) == "object" then
			if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
				if not isPedInVehicle(playerSource) then
					if not isTimer(acao[playerSource]) then
						local x, y, z = getElementPosition(playerSource)
						local ex, ey, ez = getElementPosition(clickedWorld)
						if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
							if getElementData(clickedWorld, "Bank:Gate3") then
								triggerEvent("Banco:Furadeira", root, playerSource)
							end
						end
					end
				else
					addBox(playerSource, "Você precisa estar fora de um veículo para usar '"..realName[itemActioned][1].."'", "erro")
				end
			else
				addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
			end
	end
end
addEvent("Use", true)
addEventHandler("Use", resourceRoot, use)
-----------------------------------------------------------------------------------------------------------------------------------------
function trade(tipo, arg2, arg3, arg4)
	if tipo == "make" then --tipo, source, player, tabela
		setElementData(arg3, "Trading", arg4)
		addBox(arg3, "Você recebeu uma proposta de venda, abra o inventário para aceitar ou recusar", "info")
		triggerClientEvent(arg3, "refreshTrading", resourceRoot)
	elseif tipo == "accept" then --tipo, source, tabela
		removeElementData(arg2, "Trading")
		if GiveAndTakeAndGetItem("get", arg3[1][1], arg3[2][1]) >= arg3[3][1] then
			if arg3[4][1] > 0 then
				if getPlayerMoney(arg2) >= arg3[4][1] then
					if GiveAndTakeAndGetItem("give", arg2, arg3[2][1], arg3[3][1]) then
						if GiveAndTakeAndGetItem("take", arg3[1][1], arg3[2][1], arg3[3][1]) then
							takePlayerMoney(arg2, arg3[4][1])
							givePlayerMoney(arg3[1][1], arg3[4][1])
							addBox(arg2, "Você aceitou a proposta e pagou $"..arg3[4][1], "money")
							addBox(arg3[1][1], "O comprador aceitou sua proposta e você recebeu $"..arg3[4][1], "money")
							local name = getPlayerName(arg2)
							local ID1 = getElementData(arg2, "ID") or "N/A"
							local name2 = getPlayerName(arg3[1][1])
							local ID2 = getElementData(arg3[1][1], "ID") or "N/A"
							exports["[Script]Logs"]:CreateLog("[INVENTARIO]\nVendedor: "..name2.." ["..ID2.."]\nComprador: "..name.." ["..ID1.."]\nItem: "..arg3[2][1].."\nQuantidade: "..arg3[3][1].."\nValor: $"..arg3[4][1])
						else
							addBox(arg2, "O vendedor não possui o item na sua mochila", "erro")
							addBox(arg3[1][1], "Você não possui o item em sua mochila", "erro")
						end
					else
						addBox(arg2, "Você não possui espaço em sua mochila", "erro")
						addBox(arg3[1][1], "O comprador não possui espaço em sua mochila", "erro")
					end
				else
					addBox(arg2, "Você não possui dinheiro suficiente", "erro")
					addBox(arg3[1][1], "O comprador não possui dinheiro suficiente", "erro")
				end
			else
				if GiveAndTakeAndGetItem("give", arg2, arg3[2][1], arg3[3][1]) then
					if GiveAndTakeAndGetItem("take", arg3[1][1], arg3[2][1], arg3[3][1]) then
						addBox(arg2, "Você aceitou a proposta", "sucesso")
						addBox(arg3[1][1], "O comprador aceitou sua proposta", "sucesso")
						local name = getPlayerName(arg2)
						local ID1 = getElementData(arg2, "ID") or "N/A"
						local name2 = getPlayerName(arg3[1][1])
						local ID2 = getElementData(arg3[1][1], "ID") or "N/A"
						exports["[Script]Logs"]:CreateLog("[INVENTARIO]\nVendedor: "..name2.." ["..ID2.."]\nComprador: "..name.." ["..ID1.."]\nItem: "..arg3[2][1].."\nQuantidade: "..arg3[3][1].."\nValor: $0")
					else
						addBox(arg2, "O vendedor não possui o item na sua mochila", "erro")
						addBox(arg3[1][1], "Você não possui o item em sua mochila", "erro")
					end
				else
					addBox(arg2, "Você não possui espaço em sua mochila", "erro")
					addBox(arg3[1][1], "O comprador não possui espaço em sua mochila", "erro")
				end
			end
		else
			addBox(arg2, "O vendedor não possui o item na sua mochila", "erro")
			addBox(arg3[1][1], "Você não possui o item em sua mochila", "erro")
		end
	elseif tipo == "decline" then --tipo, source, tabela
		removeElementData(arg2, "Trading")
		addBox(arg2, "Você recusou a proposta", "sucesso")
		addBox(arg3[1][1], "O comprador recusou sua proposta", "erro")
	elseif tipo == "distance" then --tipo, source, tabela
		removeElementData(arg2, "Trading")
		addBox(arg2, "A proposta não pode ser aceita pois você está distante do vendedor", "erro")
		addBox(arg3[1][1], "A proposta não pode ser aceita pois você está distante do comprador", "erro")
	end
end
addEvent("Trade", true)
addEventHandler("Trade", resourceRoot, trade)
-----------------------------------------------------------------------------------------------------------------------------------------
function action(playerSource, clickedWorld, itemActioned)
	if itemActioned == "chaves" and getElementType(clickedWorld) == "object" then
		if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
			if not isTimer(acao[playerSource]) then
				local x, y, z = getElementPosition(playerSource)
				local ex, ey, ez = getElementPosition(clickedWorld)
				if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 10 then
					for i, v in pairs(gates) do
						if v == clickedWorld then
							if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup(GatePositions[i][1])) then
								if GatePositions[i][10] == "closed" then
									moveObject(clickedWorld, GatePositions[i][9], GatePositions[i][6], GatePositions[i][7], GatePositions[i][8])
									GatePositions[i][10] = "opened"
									tempo[clickedWorld] = setTimer(function()
										moveObject(clickedWorld, GatePositions[i][9], GatePositions[i][3], GatePositions[i][4], GatePositions[i][5])
										GatePositions[i][10] = "closed"
									end, 10000, 1)
								elseif GatePositions[i][10] == "opened" then
									moveObject(clickedWorld, GatePositions[i][9], GatePositions[i][3], GatePositions[i][4], GatePositions[i][5])
									GatePositions[i][10] = "closed"
									if isTimer(tempo[clickedWorld]) then
										killTimer(tempo[clickedWorld])
									end
								end
							else
								addBox(playerSource, "Você não possui as chaves desse portão", "erro")
							end
						end
					end
				else
					addBox(playerSource, "Você está muito distante do portão", "erro")
				end
			end
		else
			addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
		end
	elseif itemActioned == "kit_reparo" and getElementType(clickedWorld) == "vehicle" then
		if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
			if not isPedInVehicle(playerSource) then
				if not isTimer(acao[playerSource]) then
					local x, y, z = getElementPosition(playerSource)
					local ex, ey, ez = getElementPosition(clickedWorld)
					if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 3 then
						local counter = 0
						for seat, player in pairs(getVehicleOccupants(clickedWorld)) do
    						counter = counter + 1
						end
						if counter < 1 then
							if not getElementData(clickedWorld, "Engine") then
								if getElementHealth(clickedWorld) < 1000 then
									if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup("Everyone")) then
										acao[playerSource] = setTimer(function() end, 14000, 1)
										if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
										local x, y, z = getElementPosition(playerSource)
										item[playerSource] = createObject(1938, x, y, z - 0.65, 0, 90, 0)
										setElementCollisionsEnabled(item[playerSource], false)
										PlaySound3D(playerSource, "repair", "all")
										GiveAndTakeAndGetItem("take", playerSource, itemActioned, 1)
										triggerClientEvent(playerSource, "progressBar", playerSource, 14000)
                                                                                --triggerClientEvent(playerSource, "AC-AbrirTimerHud", playerSource,  14000)
										setElementFrozen(playerSource, true)
										setElementFrozen(clickedWorld, true)
										local _, _, rot = getElementRotation(playerSource)
										setElementRotation(playerSource, _, _, rot + 180)
										setPedAnimation(playerSource, "CAR", "fixn_car_loop", 14000, true, false, false, false, _, true)
										setTimer(function()
											destroyElement(item[playerSource])
											item[playerSource] = nil
											fixVehicle(clickedWorld)
											setVehicleDamageProof(clickedWorld, false)
											setElementFrozen(clickedWorld, false)
											setElementFrozen(playerSource, false)
											local exp = math.random(expRepair1, expRepair2)
											if getElementData(playerSource, "VIP") then
												local xp = (exp + (exp/4))
												triggerEvent("GiveExp", playerSource, playerSource, xp)
											else
												triggerEvent("GiveExp", playerSource, playerSource, exp)
											end
											addBox(playerSource, "Você reparou o veículo", "sucesso")
										end, 14000, 1)
									end
								else
									addBox(playerSource, "O veículo não possui nenhum dano para ser reparado", "erro")
								end
							else
								addBox(playerSource, "O veículo precisa estar desligado para ser reparado", "erro")
							end
						else
							addBox(playerSource, "O veículo precisa estar vazio para ser reparado", "erro")
						end
					else
						addBox(playerSource, "Você está muito distante do veículo", "erro")
					end
				end
			else
				addBox(playerSource, "Você precisa estar fora de um veículo para usar o '"..realName[itemActioned][1].."'", "erro")
			end
		else
			addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
		end
	elseif itemActioned == "pneu" and getElementType(clickedWorld) == "vehicle" then
		if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
			if not isPedInVehicle(playerSource) then
				if not isTimer(acao[playerSource]) then
					local x, y, z = getElementPosition(playerSource)
					local ex, ey, ez = getElementPosition(clickedWorld)
					if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 3 then
						local counter = 0
						for seat, player in pairs(getVehicleOccupants(clickedWorld)) do
    						counter = counter + 1
						end
						if counter < 1 then
							if not getElementData(clickedWorld, "Engine") then
								local r1, r2, r3, r4 = getVehicleWheelStates(clickedWorld)
								if r1 ~= 0 or r2 ~= 0 or r3 ~= 0 or r4 ~= 0 then
									if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup("Everyone")) then
										acao[playerSource] = setTimer(function() end, 14000, 1)
										if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
										local x, y, z = getElementPosition(playerSource)
										item[playerSource] = createObject(1025, x, y, z - 0.85, 0, 90, 0)
										setObjectScale(item[playerSource], 0.8)
										setElementCollisionsEnabled(item[playerSource], false)
										PlaySound3D(playerSource, "repair", 100)
										GiveAndTakeAndGetItem("take", playerSource, itemActioned, 1)
										triggerClientEvent(playerSource, "progressBar", playerSource, 14000)
                                                                                --triggerClientEvent(playerSource, "AC-AbrirTimerHud", playerSource,  14000)
										setElementFrozen(playerSource, true)
										setElementFrozen(clickedWorld, true)
										local _, _, rot = getElementRotation(playerSource)
										setElementRotation(playerSource, _, _, rot + 180)
										setPedAnimation(playerSource, "CAR", "fixn_car_loop", 14000, true, false, false, false, _, true)
										setTimer(function()
											destroyElement(item[playerSource])
											item[playerSource] = nil
											setVehicleWheelStates(clickedWorld, 0, 0, 0, 0)
											setElementFrozen(clickedWorld, false)
											setElementFrozen(playerSource, false)
											local exp = math.random(expPneu1, expPneu2)
											if getElementData(playerSource, "VIP") then
												local xp = (exp + (exp/4))
												triggerEvent("GiveExp", playerSource, playerSource, xp)
											else
												triggerEvent("GiveExp", playerSource, playerSource, exp)
											end
											addBox(playerSource, "Você trocou os pneus do veículo", "sucesso")
										end, 14000, 1)
									end
								else
									addBox(playerSource, "O veículo não possui nenhum pneu furado", "erro")
								end
							else
								addBox(playerSource, "O veículo precisa estar desligado para ter seu pneu trocado", "erro")
							end
						else
							addBox(playerSource, "O veículo precisa estar vazio para ter seu pneu trocado", "erro")
						end
					else
						addBox(playerSource, "Você está muito distante do veículo", "erro")
					end
				end
			else
				addBox(playerSource, "Você precisa estar fora de um veículo para usar o '"..realName[itemActioned][1].."'", "erro")
			end
		else
			addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
		end
	elseif itemActioned == "gasolina" and getElementType(clickedWorld) == "vehicle" then
		if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
			if not isPedInVehicle(playerSource) then
				if not isTimer(acao[playerSource]) then
					local x, y, z = getElementPosition(playerSource)
					local ex, ey, ez = getElementPosition(clickedWorld)
					if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 3 then
						local counter = 0
						for seat, player in pairs(getVehicleOccupants(clickedWorld)) do
    						counter = counter + 1
						end
						if counter < 1 then
							if not getElementData(clickedWorld, "Engine") then
								local gas = getElementData(clickedWorld, "Gasolina") or 0
								if gas < 100 then
									acao[playerSource] = setTimer(function() end, 15000, 1)
									if isElement(item[playerSource]) then destroyElement(item[playerSource]) item[playerSource] = nil end
									local x, y, z = getElementPosition(playerSource)
									item[playerSource] = createObject(1650, x, y, z)
									GiveAndTakeAndGetItem("take", playerSource, itemActioned, 1)
									triggerClientEvent(playerSource, "progressBar", playerSource, 15000)
                                                                        --triggerClientEvent(playerSource, "AC-AbrirTimerHud", playerSource,  15000)
									setElementFrozen(playerSource, true)
									setElementFrozen(clickedWorld, true)
									setPedAnimation(playerSource, "CASINO", "Slot_Plyr", -1, true, false, false, false)
									setTimer(setPedAnimationSpeed, 700, 1, playerSource, "Slot_Plyr", 0)
									exports.bone_attach:attachElementToBone(item[playerSource], playerSource, 12, -0.01, 0.15, 0.05, -48, 62, 140)
									setTimer(function()
										setPedAnimation(playerSource, nil)
										destroyElement(item[playerSource])
										item[playerSource] = nil
										setElementData(clickedWorld, "Gasolina", 100)
										setElementFrozen(clickedWorld, false)
										setElementFrozen(playerSource, false)
										addBox(playerSource, "Você encheu o tanque do veículo", "sucesso")
									end, 15000, 1)
								else
									addBox(playerSource, "O veículo já está com o tanque cheio", "erro")
								end
							else
								addBox(playerSource, "O veículo precisa estar desligado para ser abastecido", "erro")
							end
						else
							addBox(playerSource, "O veículo precisa estar vazio para ser abastecido", "erro")
						end
					else
						addBox(playerSource, "Você está muito distante do veículo", "erro")
					end
				end
			else
				addBox(playerSource, "Você precisa estar fora de um veículo para usar o '"..realName[itemActioned][1].."'", "erro")
			end
		else
			addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
		end
	elseif itemActioned == "kitmedico" and getElementType(clickedWorld) == "player" then
		if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
			if not isPedInVehicle(playerSource) and not isPedInVehicle(clickedWorld) then
				if not isTimer(acao[playerSource]) then
					local x, y, z = getElementPosition(playerSource)
					local ex, ey, ez = getElementPosition(clickedWorld)
					if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
						if getElementData(clickedWorld, "Desmaiado") then
							if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup("SAMU")) then
								acao[playerSource] = setTimer(function() end, 20000, 1)
								setElementFrozen(playerSource, true)
								GiveAndTakeAndGetItem("take", playerSource, itemActioned, 1)
								setPedAnimation(playerSource, "MEDIC", "CPR", 20000, true, false, false, false, _, true)
								triggerClientEvent(playerSource, "progressBar", playerSource, 20000)
                                                                --triggerClientEvent(playerSource, "AC-AbrirTimerHud", playerSource,  20000)
								setTimer(function()
									triggerEvent("Desmaiado", root, clickedWorld, false)
									setElementFrozen(playerSource, false)
									if isTimer(acao[clickedWorld]) then killTimer(acao[clickedWorld]) end
									addBox(playerSource, "Você reanimou o cidadão(ã) "..getPlayerName(clickedWorld), "sucesso")
									addBox(clickedWorld, "Você foi re-animado pelo(a) socorrista do SAMU", "info")
									local name = getPlayerName(playerSource)
									local ID1 = getElementData(playerSource, "ID") or "N/A"
									local name2 = getPlayerName(clickedWorld)
									local ID2 = getElementData(clickedWorld, "ID") or "N/A"
									exports["[Script]Logs"]:CreateLog("[INVENTARIO]\nSAMU: "..name.." ["..ID1.."]\nPaciente: "..name2.." ["..ID2.."]")
									if curado[playerSource] ~= clickedWorld then
										local money = math.random(moneySamu1, moneySamu2)
										givePlayerMoney(playerSource, money)
										addBox(playerSource, "Você recebeu "..money.." reais", "money")
										local exp = math.random(expSamu1, expSamu2)
										if getElementData(playerSource, "VIP") then
											local xp = (exp + (exp/4))
											triggerEvent("GiveExp", playerSource, playerSource, xp)
										else
											triggerEvent("GiveExp", playerSource, playerSource, exp)
										end
									end
									curado[playerSource] = clickedWorld
								end, 20000, 1)
							end
						else
							addBox(playerSource, "Este cidadão(ã) não está precisando de socorros", "erro")
						end
					else
						addBox(playerSource, "Você está muito distante do cidadão(ã) indicado", "erro")
					end
				end
			else
				addBox(playerSource, "Você precisa estar fora de um veículo para usar o '"..realName[itemActioned][1].."'", "erro")
			end
		else
			addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
		end
	--[[elseif itemActioned == "lockpick" and getElementType(clickedWorld) == "vehicle" then
		if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
			if not isPedInVehicle(playerSource) then
				if not isTimer(acao[playerSource]) then
					local x, y, z = getElementPosition(playerSource)
					local ex, ey, ez = getElementPosition(clickedWorld)
					if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 2.5 then
						local counter = 0
						for seat, player in pairs(getVehicleOccupants(clickedWorld)) do
    						counter = counter + 1
						end
						if counter < 1 then
							if getElementData(clickedWorld, "veh:status") then
								acao[playerSource] = setTimer(function() end, 15000, 1)
								GiveAndTakeAndGetItem("take", playerSource, itemActioned, 1)
								PlaySound3D(playerSource, "vehicle-alarm", "all")
								setElementFrozen(playerSource, true)
								setElementFrozen(clickedWorld, true)
								setPedAnimation(playerSource, "CAMERA", "piccrch_take", 15000, true, false, false, false, _, true)
								--triggerClientEvent(playerSource, "progressBar", playerSource, 15000)
                                                                triggerClientEvent(playerSource, "AC-AbrirTimerHud", playerSource,  15000)
								blip[clickedWorld] = createBlipAttachedTo(clickedWorld, 36)
								setElementVisibleTo(blip[clickedWorld], root, false)
								for _, players in pairs(getElementsByType("player")) do
									if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(players)), aclGetGroup(ACL_PM)) then
										addBox(players, "[COPOM]: Denúncia de furto de veículo em andamento, o local da ocorrência foi indicado no seu GPS", "aviso")
										setElementVisibleTo(blip[clickedWorld], players, true)
									end
								end
								setTimer(function()
									setPedAnimation(playerSource, nil)
									setElementFrozen(playerSource, false)
									setElementFrozen(clickedWorld, false)
									destroyElement(blip[clickedWorld])
									blip[clickedWorld] = nil
									local random = math.random(1, 2)
									if random == 1 then
										setElementData(clickedWorld, "Locked", false)
										setVehicleLocked(clickedWorld, false)
										addBox(playerSource, "Você conseguiu mixar o veículo", "sucesso")
										local name = getPlayerName(playerSource)
										local ID1 = getElementData(playerSource, "ID") or "N/A"
										local Scriptel = getElementScriptel(clickedWorld)
										exports["[Script]Logs"]:CreateLog("[INVENTARIO]\nCriminoso: "..name.." ["..ID1.."]\nVeículo: "..Scriptel)
									else
										addBox(playerSource, "Você não conseguiu mixar o veículo", "erro")
									end
								end, 15000, 1)
							else
								addBox(playerSource, "Este veículo já está aberto", "erro")
							end
						else
							addBox(playerSource, "O veículo precisa estar vazio para ser mixado", "erro")
						end
					else
						addBox(playerSource, "Você está muito distante do veículo", "erro")
					end
				end
			else
				addBox(playerSource, "Você precisa estar fora de um veículo para usar o '"..realName[itemActioned][1].."'", "erro")
			end
		else
			addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
		end]]
	elseif itemActioned == "porte" and getElementType(clickedWorld) == "player" then
		if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
			if not isPedInVehicle(playerSource) then
				if not isTimer(acao[playerSource]) then
					local x, y, z = getElementPosition(playerSource)
					local ex, ey, ez = getElementPosition(clickedWorld)
					if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
						local name = getPlayerName(playerSource)
						local id = getElementData(playerSource, "ID") or "N/A"
						addBox(clickedWorld, "[PORTE DE ARMA]  •  Nome: '"..name.."', Nº: '"..id.."', situação: 'Válido'", "info")
						addBox(playerSource, "Você mostrou seu '"..realName[itemActioned][1].."' para o(a) "..getPlayerName(clickedWorld), "sucesso")
					end
				end
			else
				addBox(playerSource, "Você precisa estar fora de um veículo para mostrar seu '"..realName[itemActioned][1].."'", "erro")
			end
		else
			addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
		end
	elseif itemActioned == "cnh" and getElementType(clickedWorld) == "player" then
		if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
			if not isPedInVehicle(playerSource) then
				if not isTimer(acao[playerSource]) then
					local x, y, z = getElementPosition(playerSource)
					local ex, ey, ez = getElementPosition(clickedWorld)
					if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
						local name = getPlayerName(playerSource)
						local id = getElementData(playerSource, "ID") or "N/A"
						local categoria = getElementData(playerSource, "CNH") or "[ ! ] erro, contate um administrador"
						addBox(clickedWorld, "[CNH]  •  Nome: '"..name.."', Nº: '"..id.."', categoria: '"..categoria.."'", "info")
						addBox(playerSource, "Você mostrou sua '"..realName[itemActioned][1].."' para o(a) "..getPlayerName(clickedWorld), "sucesso")
					end
				end
			else
				addBox(playerSource, "Você precisa estar fora de um veículo para mostrar sua '"..realName[itemActioned][1].."'", "erro")
			end
		else
			addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
		end
	elseif itemActioned == "identidade" and getElementType(clickedWorld) == "player" then
		if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
			if not isPedInVehicle(playerSource) then
				if not isTimer(acao[playerSource]) then
					local x, y, z = getElementPosition(playerSource)
					local ex, ey, ez = getElementPosition(clickedWorld)
					if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
						local name = getPlayerName(playerSource)
						local id = getElementData(playerSource, "ID") or "N/A"
						local wanted = getPlayerWantedLevel(playerSource)
						addBox(clickedWorld, "[IDENTIDADE]  •  Nome: '"..name.."', Nº: '"..id.."', Mandados de prisão: '"..wanted.."'", "info")
						addBox(playerSource, "Você mostrou sua '"..realName[itemActioned][1].."' para o(a) "..getPlayerName(clickedWorld), "sucesso")
					end
				end
			else
				addBox(playerSource, "Você precisa estar fora de um veículo para mostrar sua '"..realName[itemActioned][1].."'", "erro")
			end
		else
			addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
		end
	elseif itemActioned == "dinamite" and getElementType(clickedWorld) == "object" then
		if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
			if not isPedInVehicle(playerSource) then
				if not isTimer(acao[playerSource]) then
					local x, y, z = getElementPosition(playerSource)
					local ex, ey, ez = getElementPosition(clickedWorld)
					if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
						if getElementData(clickedWorld, "Bank:Gate1") then
							triggerEvent("Banco:Iniciar", root, playerSource)
						end
					end
				end
			else
				addBox(playerSource, "Você precisa estar fora de um veículo para usar '"..realName[itemActioned][1].."'", "erro")
			end
		else
			addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
		end
	elseif itemActioned == "pendrive" and getElementType(clickedWorld) == "object" then
		if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
			if not isPedInVehicle(playerSource) then
				if not isTimer(acao[playerSource]) then
					local x, y, z = getElementPosition(playerSource)
					local ex, ey, ez = getElementPosition(clickedWorld)
					if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
						if getElementData(clickedWorld, "Bank:Pass") then
							triggerEvent("Banco:Hackear", root, playerSource)
						end
					end
				end
			else
				addBox(playerSource, "Você precisa estar fora de um veículo para usar '"..realName[itemActioned][1].."'", "erro")
			end
		else
			addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
		end
	elseif itemActioned == "drill" and getElementType(clickedWorld) == "object" then
		if GiveAndTakeAndGetItem("get", playerSource, itemActioned) >= 1 then
			if not isPedInVehicle(playerSource) then
				if not isTimer(acao[playerSource]) then
					local x, y, z = getElementPosition(playerSource)
					local ex, ey, ez = getElementPosition(clickedWorld)
					if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
						if getElementData(clickedWorld, "Bank:Gate3") then
							triggerEvent("Banco:Furadeira", root, playerSource)
						end
					end
				end
			else
				addBox(playerSource, "Você precisa estar fora de um veículo para usar '"..realName[itemActioned][1].."'", "erro")
			end
		else
			addBox(playerSource, "Você não possui '"..realName[itemActioned][1].."' em seu inventario", "erro")
		end
	end
end
addEvent("Action", true)
addEventHandler("Action", resourceRoot, action)
-----------------------------------------------------------------------------------------------------------------------------------------
function trash(playerSource, item, qntd)
	if GiveAndTakeAndGetItem("get", playerSource, item) >= qntd then
		if not isPedInVehicle(playerSource) then
			if not isTimer(acao[playerSource]) then
				acao[playerSource] = setTimer(function() end, 1300, 1)
				setPedAnimation(playerSource, "POLICE", "CopTraf_Away", 1300, true, false, false, false, _, true)
				setTimer(function()
					PlaySound3D(playerSource, "trash", 20)
					GiveAndTakeAndGetItem("take", playerSource, item, qntd)
					addBox(playerSource, "Você descartou "..qntd.."x '"..realName[item][1].."'", "sucesso")
					local name = getPlayerName(playerSource)
					local id = getElementData(playerSource, "ID") or "N/A"
					exports["[Script]Logs"]:CreateLog("[INVENTARIO]\nJogador: "..name.." ["..id.."]\nItem: "..item.."\nQuantidade: "..qntd.."\nAção: Descarte lixo")
					for _, players in pairs(getElementsByType("player")) do
						if players ~= playerSource then
							local x, y, z = getElementPosition(playerSource)
							local x2, y2, z2 = getElementPosition(players)
							if getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) <= 30 then
								local name = getPlayerName(playerSource)
								local id = getElementData(playerSource, "ID") or "N/A"
								outputChatBox("[INFO]:#FFFFFF O jogador #FFFF00"..name.."#FFFFFF ("..id..") descartou "..qntd.."x '"..realName[item][1].."' em uma lixeira próxima de você.", players, 30, 144, 255, true)
							end
						end
					end
				end, 1300, 1)
			end
		end
	else
		addBox(playerSource, "Você não possui a quantidade indicada deste item", "erro")
	end
end
addEvent("Trash", true)
addEventHandler("Trash", resourceRoot, trash)
-----------------------------------------------------------------------------------------------------------------------------------------
function box(estado, playerSource, gang, item, qntd)
	if estado == "guardar" then
		for i, v in pairs(BoxPositions) do
			if BoxPositions[i][1] == gang then
				if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup(BoxPositions[i][2])) then
					if GiveAndTakeAndGetItem("get", playerSource, item) >= qntd then
						if not isPedInVehicle(playerSource) then
							if not isTimer(acao[playerSource]) then
								acao[playerSource] = setTimer(function() end, 1300, 1)
								setPedAnimation(playerSource, "POLICE", "CopTraf_Away", 1300, true, false, false, false, _, true)
								setTimer(function()
									PlaySound3D(playerSource, "trash", 20)
									GiveAndTakeAndGetItem("take", playerSource, item, qntd)
									addBox(playerSource, "Você guardou "..qntd.."x '"..realName[item][1].."'", "sucesso")
									local name = getPlayerName(playerSource)
									local id = getElementData(playerSource, "ID") or "N/A"
									exports["[Script]Logs"]:CreateLog("[INVENTARIO]\nJogador: "..name.." ["..id.."]\nItem: "..item.."\nQuantidade: "..qntd.."\nBaú: "..gang.."\nAção: "..estado)
									for _, players in pairs(getElementsByType("player")) do
										if players ~= playerSource then
											local x, y, z = getElementPosition(playerSource)
											local x2, y2, z2 = getElementPosition(players)
											if getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) <= 30 then
												local name = getPlayerName(playerSource)
												local id = getElementData(playerSource, "ID") or "N/A"
												outputChatBox("[INFO]:#FFFFFF O jogador #FFFF00"..name.."#FFFFFF ("..id..") guardou "..qntd.."x '"..realName[item][1].."' em um baú próximo de você.", players, 30, 144, 255, true)
											end
										end
									end
									if bau[gang][item] then
										bau[gang][item][1] = bau[gang][item][1] + tonumber(qntd)
									else
										bau[gang][item] = {}
										bau[gang][item][1] = tonumber(qntd)
									end
								end, 1300, 1)
							end
						end
					else
						addBox(playerSource, "Você não possui a quantidade indicada deste item", "erro")
					end
				end
			end
		end
	elseif estado == "pegar" then
		for i, v in pairs(BoxPositions) do
			if BoxPositions[i][1] == gang then
				if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup(BoxPositions[i][2])) then
					if bau[gang][item] then
						if bau[gang][item][1] >= qntd then
							if GiveAndTakeAndGetItem("give", playerSource, item, qntd) then
								bau[gang][item][1] = bau[gang][item][1] - qntd
								if bau[gang][item][1] <= 0 then
									bau[gang][item] = nil
								end
								addBox(playerSource, "Você pegou "..qntd.."x '"..realName[item][1].."'", "sucesso")
								local name = getPlayerName(playerSource)
								local id = getElementData(playerSource, "ID") or "N/A"
								exports["[Script]Logs"]:CreateLog("[INVENTARIO]\nJogador: "..name.." ["..id.."]\nItem: "..item.."\nQuantidade: "..qntd.."\nBaú: "..gang.."\nAção: "..estado)
								for _, players in pairs(getElementsByType("player")) do
									if players ~= playerSource then
										local x, y, z = getElementPosition(playerSource)
										local x2, y2, z2 = getElementPosition(players)
										if getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) <= 30 then
											local name = getPlayerName(playerSource)
											local id = getElementData(playerSource, "ID") or "N/A"
											outputChatBox("[INFO]:#FFFFFF O jogador #FFFF00"..name.."#FFFFFF ("..id..") pegou "..qntd.."x '"..realName[item][1].."' de um baú próximo à você.", players, 30, 144, 255, true)
										end
									end
								end
							else
								addBox(playerSource, "Você não possui capacidade na mochila para pegar este item", "erro")
							end
						else
							addBox(playerSource, "O baú não possui a quantidade indicada deste item", "erro")
						end
					else
						addBox(playerSource, "O baú não possui este item", "erro")
					end
				end
			end
		end
	end
end
addEvent("Box", true)
addEventHandler("Box", resourceRoot, box)
-----------------------------------------------------------------------------------------------------------------------------------------
function click(button, state, playerSource)
	if button == "left" and state == "down" then
        if getElementType(source) == "object" then
        	if getElementModel(source) == 1227 then
        	    for i, v in pairs(boxes) do
        	        if v == source then
        	            local x, y, z = getElementPosition(playerSource)
        	            local ex, ey, ez = getElementPosition(source)
        	            if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 1.5 then
        	            	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup(BoxPositions[i][2])) then
        	            		local gangBox = BoxPositions[i][1]
        	                	triggerClientEvent(playerSource, "RenderBox", resourceRoot, bau[gangBox], gangBox)
        	                end
        	            end
        	        end
        	    end
        	end
        end
    end
end
addEventHandler("onElementClicked", root, click)
-----------------------------------------------------------------------------------------------------------------------------------------
function fumarCigarro(source)
	if isElement(cigarro[source]) then
		if not isTimer(acao[source]) then
			acao[source] = setTimer(function() end, 7000, 1)
			setPedAnimation(source, "GANGS", "smkcig_prtl", 7000, false, true, false, false, _, true)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

function onLogin(_, account)
	if not isGuestAccount(account) then
		timerStart[source] = setTimer(function(source)
			inventario[source] = {}
			if getAccountData(account, "Inventario") then
				local itens = fromJSON(getAccountData(account, "Inventario"))
				for index, value in pairs(itens) do
					if realName[itens[index][1]] then
						table.insert(inventario[source], value)
					end
				end
			end
			triggerClientEvent(source, "refresh", resourceRoot, inventario[source])
		end, 1000, 1, source)

		local weightCurrent = getAccountData( account, 'bag.current' ) or false

		if not weightCurrent then
	
			if getElementData( source, 'VIP' ) or getElementData( source, 'Staff' ) then
				setElementData( source, 'bag.current', 50 )
			else
				setElementData( source, 'bag.current', 30 )
			end
		
		else

			setElementData( source, 'bag.current', tonumber( weightCurrent ) )

		end

	end
end
addEventHandler("onPlayerLogin", root, onLogin)
-----------------------------------------------------------------------------------------------------------------------------------------
function onQuit()
	local account = getPlayerAccount(source)
	if not isGuestAccount(account) then
		if not isTimer(timerStart[source]) then
			local itens = toJSON(inventario[source])
			setAccountData(account, "Inventario", itens)
			takeAllWeapons(source)
			acao[source] = nil
			arma[source] = nil
			algemado[source] = nil
			algemando[source] = nil
			curado[source] = nil
			inventario[source] = nil
			if isTimer(timerAlgema[source]) then killTimer(timerAlgema[source]) timerAlgema[source] = nil end
			if isElement(item[source]) then destroyElement(item[source]) item[source] = nil end
			if isElement(capacete[source]) then destroyElement(capacete[source]) capacete[source] = nil setElementData(source, "Capacete", false) end
			if isElement(mascara[source]) then destroyElement(mascara[source]) mascara[source] = nil end
			if isElement(maleta[source]) then destroyElement(maleta[source]) maleta[source] = nil end
			if isElement(som[source]) then destroyElement(som[source]) som[source] = nil end
			if isElement(flor[source]) then destroyElement(flor[source]) flor[source] = nil end
			if isElement(cigarro[source]) then destroyElement(cigarro[source]) cigarro[source] = nil end
			if isElement(item[source]) then destroyElement(item[source]) item[source] = nil end
			if isElement(item[source]) then destroyElement(item[source]) item[source] = nil end
			if isElement(item[source]) then destroyElement(item[source]) item[source] = nil end
		end

		local weightCurrent = getElementData( source, 'bag.current' ) or false
		
		if not weightCurrent then
		
			if getElementData( source, 'VIP' ) or getElementData( players, 'Staff' ) then
				setAccountData( account, 'bag.current', 50 )
			else
				setAccountData( account, 'bag.current', 30 )
			end
		
		else

			setAccountData( account, 'bag.current', tonumber( weightCurrent ) )

		end
	end
end
addEventHandler("onPlayerQuit", root, onQuit)
-----------------------------------------------------------------------------------------------------------------------------------------
function onStart()
	for i, players in pairs(getElementsByType("player")) do
		timerStart[players] = setTimer(function()
			local account = getPlayerAccount(players)
			if not isGuestAccount(account) then
				inventario[players] = {}
				if getAccountData(account, "Inventario") then
					local itens = fromJSON(getAccountData(account, "Inventario"))
					for index, value in pairs(itens) do
						if realName[itens[index][1]] then
							table.insert(inventario[players], value)
						end
					end
				end
				triggerClientEvent(players, "refresh", resourceRoot, inventario[players])

				local weightCurrent = getAccountData( account, 'bag.current' ) or false

				if not weightCurrent then
					if getElementData( players, 'VIP' ) or getElementData( players, 'Staff' ) then
						setElementData( players, 'bag.current', 50 )
					else
						setElementData( players, 'bag.current', 30 )
					end
				else
					setElementData( players, 'bag.current', tonumber( weightCurrent ) )
				end

			end
		end, 1000, 1)
	end
	for i, v in pairs(bau) do
		local data = executeSQLQuery("SELECT * FROM Baú WHERE gang = ?", i)
		if data and type(data) == "table" and #data ~= 0 then
			data[1].valor = fromJSON(data[1].valor)
			for index, value in pairs(data[1].valor) do
				bau[i][index] = {}
				bau[i][index][1] = data[1].valor[index][1]
			end
		end
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), onStart)

-----------------------------------------------------------------------------------------------------------------------------------------
function onStop( )
	for i, players in pairs(getElementsByType("player")) do
		local account = getPlayerAccount(players)
		
		if not isGuestAccount(account) then
			
			if not isTimer(timerStart[players]) then
				local itens = toJSON(inventario[players])
				setAccountData(account, "Inventario", itens)
			end

			local weightCurrent = getElementData( players, 'bag.current' ) or false
		
			if not weightCurrent then
				if getElementData( players, 'VIP' ) or getElementData( players, 'Staff' ) then
					setAccountData( account, 'bag.current', 50 )
				else
					setAccountData( account, 'bag.current', 30 )
				end
			else
				setAccountData( account, 'bag.current', tonumber( weightCurrent ) )
			end

		end
	end
	executeSQLQuery("CREATE TABLE IF NOT EXISTS Baú (gang TEXT, valor TEXT)")
	for i, v in pairs(bau) do
		executeSQLQuery("DELETE FROM Baú WHERE gang = ?", i)
		executeSQLQuery("INSERT INTO Baú (gang, valor) VALUES (?, ?)", i, toJSON(bau[i]))
	end
end
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), onStop)
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function Refresh(playerSource)
	local int = getElementInterior(playerSource)
	local dim = getElementDimension(playerSource)
	if isElement(item[playerSource]) then
		setElementInterior(item[playerSource], int)
		setElementDimension(item[playerSource], dim)
	end
	if isElement(capacete[playerSource]) then
		setElementInterior(capacete[playerSource], int)
		setElementDimension(capacete[playerSource], dim)
	end
	if isElement(mascara[playerSource]) then
		setElementInterior(mascara[playerSource], int)
		setElementDimension(mascara[playerSource], dim)
	end
	if isElement(maleta[playerSource]) then
		setElementInterior(maleta[playerSource], int)
		setElementDimension(maleta[playerSource], dim)
	end
	if isElement(som[playerSource]) then
		setElementInterior(som[playerSource], int)
		setElementDimension(som[playerSource], dim)
	end
	if isElement(flor[playerSource]) then
		setElementInterior(flor[playerSource], int)
		setElementDimension(flor[playerSource], dim)
	end
	if isElement(cigarro[playerSource]) then
		setElementInterior(cigarro[playerSource], int)
		setElementDimension(cigarro[playerSource], dim)
	end
end
addEvent("RefreshBoneAttach", true)
addEventHandler("RefreshBoneAttach", root, Refresh)
-----------------------------------------------------------------------------------------------------------------------------------------
function PlaySound3D(playerSource, som, distance)
	if distance == "all" then
		triggerClientEvent(root, "playSound", resourceRoot, som, playerSource)
	else
		for i, players in pairs(getElementsByType("player")) do
			local x, y, z = getElementPosition(playerSource)
			local ex, ey, ez = getElementPosition(players)
			if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= distance then
				triggerClientEvent(players, "playSound", resourceRoot, som, playerSource)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
function onWasted()
	if not getElementData(source, "Staff") then
		for index = #inventario[source], 1, -1 do
			local item = inventario[source][index][1]
			if not itensCantRemoved[item] then
				GiveAndTakeAndGetItem("take", source, item, "all")
			end
		end
	end
	takeAllWeapons(source)
	curado[source] = nil
	acao[source] = nil
	arma[source] = nil
	if isElement(cigarro[source]) then
		destroyElement(cigarro[source])
		cigarro[source] = nil
		unbindKey(source, "x", "down", fumarCigarro)
	end
	if algemado[source] then
		destroyElement(item[source])
		item[source] = nil
		killTimer(timerAlgema[source])
		timerAlgema[source] = nil
		setControlState(source, "walk", false)
	end
	if algemando[source] then
		algemando[source] = nil
	end
end
addEventHandler("onPlayerWasted", root, onWasted)
-----------------------------------------------------------------------------------------------------------------------------------------
function removeItem(playerSource, item)
	if item == "radinho" then
		setElementData(playerSource, "Radinho", false)
	elseif item == "porco" or item == "criatura" or item == "capeta" or item == "caveira" or item == "macaco" or item == "coruja" or item == "cavalo" or item == "touro" or item == "sacola" then
		destroyElement(mascara[playerSource])
		mascara[playerSource] = nil
	elseif item == "maleta" then
		destroyElement(maleta[playerSource])
		maleta[playerSource] = nil
	elseif item == "capacete" then
		destroyElement(capacete[playerSource])
		capacete[playerSource] = nil
		setElementData(playerSource, "Capacete", false)
	elseif item == "som" then
		destroyElement(som[playerSource])
		som[playerSource] = nil
	elseif item == "flor" then
		destroyElement(flor[playerSource])
		flor[playerSource] = nil
	else
		if arma[playerSource] == item then
    		local ammo = getPedTotalAmmo(playerSource, weapons[item][3]) or 0
    		if ammo > 1 then
    			GiveAndTakeAndGetItem("give", playerSource, weapons[item][2], ammo - 1)
    		end
			arma[playerSource] = nil
			takeWeapon(playerSource, weapons[item][1])
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------

------------------------ | Callback Dropar

local function getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2)
    local half2 = 1 / 2
    local vectorX, vectorY, vectorZ = x2 - x1, y2 - y1, z2 - z1
    return ((vectorX * vectorX) + (vectorY * vectorY) + (vectorZ * vectorZ)) ^ half2
end

function callBack( event, player )
	if event then
		local source = source or player

		local tabela = {}
		local x, y, z = getElementPosition(source)

		for i, v in pairs(itensDropados) do
			local pos = v["position"]
			if getDistanceBetweenPoints3D(pos[1], pos[2], pos[3], x, y, z) < 1.5 then
				local newIndex = #tabela + 1

				tabela[newIndex] = v["itemInfo"]
				tabela[newIndex][3] = i
			end
		end

		triggerClientEvent(source, event, source, 2, tabela)
	end
end
addEvent("Carimbo:CallbackDropar", true)
addEventHandler("Carimbo:CallbackDropar", getRootElement(), callBack)

------------------------ | Dropar

itensDropados = {}

function pegarItem( indice, item, qntd )
	local player = source
	if itensDropados[indice] then
		local qntd = tonumber(qntd) or itensDropados[indice]["itemInfo"][2]
		if itensDropados[indice]["itemInfo"][1] == item and itensDropados[indice]["itemInfo"][2] >= qntd and player and isElement(player) and item then
			if GiveAndTakeAndGetItem("give", player, item, qntd) then
				setPedAnimation(source, "BOMBER","BOM_Plant",1000,true,false,false,false)
				if itensDropados[indice]["itemInfo"][2] - qntd == 0 then
					destroyElement(itensDropados[indice]["object"])
					itensDropados[indice] = nil
				else
					itensDropados[indice]["itemInfo"][2] = itensDropados[indice]["itemInfo"][2] - qntd
				end

				callBack("Carimbo:CallbackCDropar", source)

			end
		end
	end
end
addEvent("Carimbo:pegarItem", true)
addEventHandler("Carimbo:pegarItem", getRootElement(), pegarItem)

function dropItem( item, qntd )
	local player = source
	local qntd = tonumber(qntd) or 0

	if player and isElement(player) and item and qntd > 0 then
		if GiveAndTakeAndGetItem("take", player, item, qntd) then
			setPedAnimation(source, "BOMBER","BOM_Plant",1000,true,false,false,false)
			local x, y, z = getElementPosition(player)
			local object = createMarker( x, y, z -1, "cylinder", 0.2, 255, 255, 255, 35 )

			itensDropados[#itensDropados + 1] = {
				object = object,
				position = {x, y, z - 1.0},
				itemInfo = {item, qntd},
			}

			callBack("Carimbo:CallbackCDropar", player)

			local playersProx = getNearestPlayers(object, 1.5)
			for i = 1, #playersProx do
				local v = playersProx[i]
				if v ~= player then
					callBack("Carimbo:CallbackCDropar", v)
				end
			end
		end
	end

end
addEvent("Carimbo:dropItem", true)
addEventHandler("Carimbo:dropItem", getRootElement(), dropItem)


function notifyitens(player, mode, item, amount, name)
	if isElement(player) then
		if type then 
		triggerClientEvent(player, "notifyitens", player, type, text)
		end
	end
end

function addBox(player, text, type)
	if isElement(player) then
		if type then 
		triggerClientEvent(player, "addBox", player, text, type)
		end
	end
end

function AnimationAttSkate()
    triggerClientEvent(root, "BHM.ClientAnimSkate", root, source)
end
addEvent("BHM.AttAnimSkate",true)
addEventHandler("BHM.AttAnimSkate",root,AnimationAttSkate)

addEventHandler("onVehicleExit",root,function(player)
    if getElementModel(source) == 509 then
        setPedAnimation(player)
    end
end)
