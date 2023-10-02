MarkerIniciarRota = {}
MarkerRota = {}
BlipRota = {}
IndexComecar = {}

for i = 1,#Config.PosicoesIniciarRota do
    MarkerIniciarRota[i] = createMarker(Config.PosicoesIniciarRota[i].Pos[1],Config.PosicoesIniciarRota[i].Pos[2],Config.PosicoesIniciarRota[i].Pos[3] -1.3, "cylinder",1.5, 5, 134, 249,0)
    setElementData(MarkerIniciarRota[i], "NC.MarkerDroga",true)
    
    addEvent("NC.IniciarRota",true)
    addEventHandler("NC.IniciarRota",root,function()
        if not isGuestAccount(getPlayerAccount(source)) then
            if isElementWithinMarker(source, MarkerIniciarRota[i]) then
                local Acls = Config.PosicoesIniciarRota[i].Acls
                if isObjectInTableACLGroups(source, Acls) then
                    if getElementData(source, "NC.Rota") then
                        removeElementData(source, "NC.Rota")
                        if MarkerRota[source] and isElement(MarkerRota[source]) then
                            destroyElement(MarkerRota[source])
                            MarkerRota[source] = nil
                            triggerClientEvent(source,"NIGHT>SAIR",source)
                        end
                        if BlipRota[source] and isElement(BlipRota[source]) then
                            destroyElement(BlipRota[source])
                            BlipRota[source] = nil
                        end
                        IndexComecar[source] = nil
                    else
                        triggerClientEvent(source,"NIGHT>MSG",source)
                        IndexComecar[source] = {1, i}
                        local Index = IndexComecar[source][1]
                        local x,y,z = Config.PosicoesRotas[i][Index][1],Config.PosicoesRotas[i][Index][2],Config.PosicoesRotas[i][Index][3]
                        setElementData(source, "NC.Rota",true)
                        MarkerRota[source] = createMarker(x,y,z -1, "cylinder",1.2,0, 255, 127,100)
                        BlipRota[source] = createBlipAttachedTo(MarkerRota[source], 0)
                        setElementVisibleTo(MarkerRota[source],root,false)
                        setElementVisibleTo(MarkerRota[source],source,true)
                        setElementVisibleTo(BlipRota[source],root,false)
                        setElementVisibleTo(BlipRota[source],source,true)
                        addEventHandler("onMarkerHit",MarkerRota[source],ContinuarTrabalho)
                    end
                else
                    --message(source, "server", "Sem Permissão", "erro")
					exports["infoBox"]:addBox(source, "Sem Permissão", "error")
                end
            end
        end
    end)
end

addEvent("NC.IniciarRota2",true)
addEventHandler("NC.IniciarRota2",root,
function()
    destroyElement(MarkerRota[source])
    MarkerRota[source] = nil
    IndexComecar[source] = nil
    triggerClientEvent(source,"NIGHT>SAIR",source)
    setElementData(source, "NC.Rota",false)
    destroyElement(BlipRota[source])
    BlipRota[source] = nil
   -- triggerClientEvent( source, 'Notify', source, "importante", "Você Finalizou a Rota com Sucesso")
	exports["infoBox"]:addBox(source, "Você Finalizou a Rota com Sucesso", "info")
end)


function GiveItemRandom(player,index)
    local Random = math.random(#Config.PosicoesIniciarRota[index].Itens)
    local Item = Config.PosicoesIniciarRota[index].Itens[Random]
    local Dinheiro = Config.PosicoesIniciarRota[index].DinheiroSujoReceber
    local Quantidade = math.random(Config.PosicoesIniciarRota[index].Quantidade.De,Config.PosicoesIniciarRota[index].Quantidade.Ate)
	exports["[GlobalDrops]InventarioCompleto"]:sendItem(player, Item, 0, 1, "none", false)
	exports["[GlobalDrops]InventarioCompleto"]:sendItem(player, Config.ConfigRotas["ID Dinheiro Sujo"], 0, Dinheiro, "none", false)
   -- triggerEvent("TS:addItem", player, player, Item, Quantidade)
   -- triggerEvent("TS:addItem", player, player, Config.ConfigRotas["ID Dinheiro Sujo"], Dinheiro) 
end

function ContinuarTrabalho(player)
    if player and isElement(player) and getElementType(player) == "player" then
    local vehicle = getPedOccupiedVehicle(player)
	    if ( vehicle ) then  exports["infoBox"]:addBox(source, "Você Finalizou a Rota com Sucesso", "info") return end
        if isElementVisibleTo(source, player) then
            local Index = IndexComecar[player][1]
            local IndexRota = IndexComecar[player][2]
            if Index == #Config.PosicoesRotas[IndexRota] then
                setPedAnimation(player, "bomber", "bom_plant",2000,true,false,false,false)
                setTimer(function()
                    GiveItemRandom(player, IndexRota)
                    if getElementData(player, "NC.Rota") then
                        removeElementData(player, "NC.Rota")
                    end
                    if MarkerRota[player] and isElement(MarkerRota[player]) then
                        destroyElement(MarkerRota[player])
                        MarkerRota[player] = nil
                    end
                    if BlipRota[player] and isElement(BlipRota[player]) then
                        --triggerClientEvent( source, 'Notify', source, "importante", "Você Entregou uma Caixa Prossiga para a Próxima")
						exports["infoBox"]:addBox(source, "Você Entregou uma Caixa Prossiga para a Próxima", "info")
                        destroyElement(BlipRota[player])
                        BlipRota[player] = nil
                    end
                    IndexComecar[player] = nil
                end,2000,1)
            else
                setPedAnimation(player, "bomber", "bom_plant",2000,true,false,false,false)
                setTimer(function()
                    GiveItemRandom(player, IndexRota)
                    if MarkerRota[player] and isElement(MarkerRota[player]) then
                        destroyElement(MarkerRota[player])
                        MarkerRota[player] = nil
                    end
                    if BlipRota[player] and isElement(BlipRota[player]) then
                        destroyElement(BlipRota[player])
                        BlipRota[player] = nil
                    end
                    IndexComecar[player][1] = IndexComecar[player][1] +1
                    local Index = IndexComecar[player][1]
                    local IndexRota = IndexComecar[player][2]
                    local x, y, z = Config.PosicoesRotas[IndexRota][Index][1],Config.PosicoesRotas[IndexRota][Index][2],Config.PosicoesRotas[IndexRota][Index][3]
                    MarkerRota[player] = createMarker(x, y, z -1, "cylinder",1.2,0, 255, 127,100)
                    BlipRota[player] = createBlipAttachedTo(MarkerRota[player], 0)
                    --    local xv, yv, zv = getElementPosition(player)
                    --    triggerClientEvent(player, "setmaptora", player, xv, yv, zv, x, y, z)
                    setElementVisibleTo(MarkerRota[player],root,false)
                    setElementVisibleTo(MarkerRota[player],player,true)
                    setElementVisibleTo(BlipRota[player],root,false)
                    setElementVisibleTo(BlipRota[player],player,true)
                    addEventHandler("onMarkerHit",MarkerRota[player],ContinuarTrabalho)
                end,2000,1)
            end
        end
    end
end

MarkerFabricar = {}

for i = 1,#Config.PocioesFabricar do
    MarkerFabricar[i] = createMarker(Config.PocioesFabricar[i].Pos[1],Config.PocioesFabricar[i].Pos[2],Config.PocioesFabricar[i].Pos[3] -1.3, "cylinder",1.5, 0, 255, 127, 50)

    addEventHandler("onMarkerHit",MarkerFabricar[i],function(player)
        if player and isElement(player) and getElementType(player) == "player" then
            if not isGuestAccount(getPlayerAccount(player)) then
                local Acls = Config.PocioesFabricar[i].Acls
                if isObjectInTableACLGroups(player, Acls) then
                    local Drogas = Config.DrogasFabricar[i]
                    triggerClientEvent(player,"NC.AbrirFabricação",player,Drogas)
                end
            end
        end
    end)
end
--[[
function hasItem(player,item,quantidade)
   if exports["[GlobalDrops]InventarioCompleto"]:hasItem(player, item) ~= 0 and exports["[GlobalDrops]InventarioCompleto"]:hasItem(player, item) >= quantidade then
    return true
else
    return false
end
end

function returnQuantidade(player,item)
    if exports["[GlobalDrops]InventarioCompleto"]:hasItem(player, item) ~= 0 then
    return exports["[GlobalDrops]InventarioCompleto"]:hasItem(player, item)
else
    return false
end
end
]]

function verifyComponents(player,table)
    k = true
    for i, v in ipairs(table) do
        --if not hasItem(player,v.ID, v.QuantidadeMinima) then
        if not exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(player, v.ID, 0, v.QuantidadeMinima, nil) then
            if type(k) == "boolean" then
                k = ""
            end
            if i == #table then
                k = k..""..v.QuantidadeMinima.." "..v.Nome..""
            else
                k = k..""..v.QuantidadeMinima.." "..v.Nome..","
            end
        end
    end
    return k
end

function RetirarComponents(player,table)
    for i, v in ipairs(table) do
        --if hasItem(player,v.ID, v.QuantidadeMinima) then
        if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(player, v.ID, 0, v.QuantidadeMinima, nil) then
			exports["[GlobalDrops]InventarioCompleto"]:takeItem(player, nil, v.ID, v.QuantidadeMinima)
            --triggerEvent("TS:takeItem", player, player, v.ID, v.QuantidadeMinima)
        end
    end
end

Fabricando = {}
--Config.ConfigRotas["Tempo Fabricar"]
addEvent("NC.FabricarDroga",true)
addEventHandler("NC.FabricarDroga",root,function(drogas)
    local ID = drogas.ID
    local Componentes = drogas.Componentes
    local Quantidade = drogas.QuantidadeReceber
    local ResultComponent = verifyComponents(source,Componentes)
    local source = source
    if ResultComponent == true then
        if getPlayerMoney(source) >= Config.ConfigRotas["Dinheiro Fabricar"] then
            if not Fabricando[source] then
                Fabricando[source] = true
                setElementFrozen(source,true)
                setPedAnimation(source,"weapons", "shp_2h_lift", -1,true,false,false,false)
                RetirarComponents(source,Componentes)
                takePlayerMoney(source, Config.ConfigRotas["Dinheiro Fabricar"])
                setTimer(function()
                    print('teste')
                    Fabricando[source] = nil
                    setPedAnimation(source)
                    setElementFrozen(source,false)
					exports["[GlobalDrops]InventarioCompleto"]:sendItem(source, ID, 100, Quantidade, "none", false)
                    --triggerEvent("TS:addItem", source, source, ID, Quantidade)
                   -- triggerClientEvent( source, 'Notify', source, "importante", "Você Fabricou "..ID.." com Sucesso")
					exports["infoBox"]:addBox(source, "Você Fabricou "..ID.." com Sucesso", "success")
                end,Config.ConfigRotas["Tempo Fabricar"],1)
            else
                --triggerClientEvent( source, 'Notify', source, "importante", "Você Já Está Fabricando uma Droga")
				exports["infoBox"]:addBox(source, "Você Já Está Fabricando uma Droga", "info")
            end
        else
            --triggerClientEvent( source, 'Notify', source, "importante", "Sem Dinheiro Suficiente")
			exports["infoBox"]:addBox(source, "Sem Dinheiro Suficiente", "error")
        end
    else
        --triggerClientEvent( source, 'Notify', source, "importante", "Você Precisa dos Componentes ["..ResultComponent.."]")
		exports["infoBox"]:addBox(source, "Você Precisa dos Componentes ["..ResultComponent.."]", "error")
    end
end)

PedRota = {}

--[[
function VenderDrogas(player)
    A = false
    local Polices = 50
    for i, v in ipairs(Config["ConfigNPCS"]["Drogas"]) do
        local Quantidade = returnQuantidade(player,v.ID)
        if Quantidade then
            triggerEvent("TS:addItem", player, player, Config.ConfigRotas["ID Dinheiro Sujo"], v.ValorCada)
            triggerEvent("TS:takeItem", player, player, v.ID, 1)
            A = true
        end
    end
    return A
end



BlipPolicia = {}
Timer = {}
Entregou = {}

function getFreeIndex()
    for i = 1,(#BlipPolicia + 1) do
        if not BlipPolicia[i] then
            return i
        end
    end
    return false
end

function callPolice(x,y,z)
    local Index = getFreeIndex()
    BlipPolicia[Index] = createBlip(x,y,z, 56)
    setElementVisibleTo(BlipPolicia[Index],root,false)
    for i, v in ipairs(getElementsByType("player")) do
        if isObjectInTableACLGroups(v, Config.ConfigRotas["AclsPolicial"]) then
            setElementVisibleTo(BlipPolicia[Index],v,true)
            triggerClientEvent( source, 'Notify', source, "importante", "Denuncia de Venda de Drogas em "..getZoneName(x,y,z,true).." / "..getZoneName(x,y,z).."")
            --triggerClientEvent(v, "AC-NotificacaoPm", root, "compdroga", v,x,y,z)

        end
    end
    Timer[Index] = setTimer(function(Index)
        if BlipPolicia[Index] and isElement(BlipPolicia[Index]) then
            destroyElement(BlipPolicia[Index])
            BlipPolicia[Index] = nil
        end
    end,60000,1,Index)
end

function verifyNot(player,table)
    if #table ~= 0 then
        for i, v in ipairs(table) do
            if v == player then
                return false
            end
        end
    end
    return true
end

function getPolices()
    TablePolices = {}
    local players = getElementsByType("player")
    for i, v in ipairs(players) do
        if verifyNot(v,TablePolices) then
            table.insert(TablePolices, v)
        end
    end
    return #TablePolices
end

for i, v in ipairs(Config.ConfigNPCS["Posicoes"]) do
    PedRota[i] = createPed(v.Skin,v.Posicao[1],v.Posicao[2],v.Posicao[3], v.Rotacao[3])
    setElementData(PedRota[i], "NC.PedVerify",true)
    setElementFrozen(PedRota[i],true)





    addEventHandler("onElementClicked",PedRota[i],function(b,s,player)
        if b == "left" and s == "down" then
        	local vehicle = getPedOccupiedVehicle(player)
	      if ( vehicle ) then return end
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local distance = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 ) 
			if distance < 4 then 
            if not Entregou[player] then
                Entregou[player] = {}
            end
            if not Entregou[player][i] then
                local Random = math.random(1,#Config.Chances)
                if Config.Chances[Random] == "Policia" then
                    local x,y,z = getElementPosition(player)
                    callPolice(x,y,z)
                    triggerClientEvent( source, 'Notify', source, "importante", "Este NPC não aceitou a sua oferta e acabou de chamar a policia.")
                   -- message(player, "Ligando para a policia!")
                    setPedAnimation(PedRota[i], "PED", "phone_talk",7500,true,false,false,false)
                elseif Config.Chances[Random] == "Aceitar" then
                    local Venda = VenderDrogas(player)
                    if Venda then
                        --exporNC._infobox:addNotification(player, "Comprei uma parceiro!", "success")
                        triggerClientEvent( source, 'Notify', source, "importante", "Você acabou de vender um pacote de droga para este NPC.")
                        setPedAnimation(PedRota[i], "PED", "ATM",2600,true,false,false,false)
                    else
                        message(player, "server", "  Você esta sem droga para vender para o NPC.", "erro")
                       -- exporNC._infobox:addNotification(player, "Tu ta sem droga irmão, vaza!", "error")
                        setPedAnimation(PedRota[i], "PED", "pass_smoke_in_car",2000,true,false,false,false)
                    end
                elseif Config.Chances[Random] == "Recusar" then
                    --message(player, "Quero não irmão")
                   -- exporNC._infobox:addNotification(player, "Quero não irmão", "info")
                    setPedAnimation(PedRota[i], "PED", "endchat_02",2000,true,false,false,false)
                end
            else
                triggerClientEvent( source, 'Notify', source, "importante", "Este NPC ja comprou algum item recetemente. aguarde até que ele esteja disponivel novamente.")
                --exporNC._infobox:addNotification(player, "Tu já passou aqui mano.", "info")
                setPedAnimation(PedRota[i], "PED", "endchat_02",2000,true,false,false,false)
            end
            Entregou[player][i] = true
            setTimer(function(i)
                Entregou[player][i] = nil
            end,Config.ConfigRotas["DelayDroga"],1,i)
        end
        end
    end)
end
]]


function isObjectInTableACLGroups(player,acls)
    for i,v in ipairs(acls) do
        if aclGetGroup(v) then
            if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup(v)) then
                return true
            end
        end
    end
    return false
end


