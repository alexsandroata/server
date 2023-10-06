local Escola = {}
local Blip = {}
local Pratica = {}
local BlipPratica = {}
local RotasAutoEscola = {}
local TimerCorrida = {}
local RotasBlip = {}
local Veiculos = {}
local IndexAutoEscola = {}
local TimerCont = {}

addEventHandler('onResourceStart', getRootElement(),
function()
    for i, v in ipairs(Hyper_Config.Escolas) do 
        Escola[i] = createMarker(v[1], v[2], v[3] -1, "cylinder", 1.5, v.RGB[1], v.RGB[2], v.RGB[3], v.RGB[4])
        Blip[i] =  createBlipAttachedTo(Escola[i],v.BlipID)
        addEventHandler('onMarkerHit', Escola[i],
        function(element)
            if element and isElement(element) and getElementType(element) == "player" then
                triggerClientEvent(element, getResourceName(getThisResource())..'Escola', element, i)
            end
        end)
    end
end)

addEventHandler('onResourceStart', getRootElement(),
function()
    for i, v in ipairs(Hyper_Config.Pratica) do 
        Pratica[i] = createMarker(v[1], v[2], v[3] -1, "cylinder", 1.5, v.RGB[1], v.RGB[2], v.RGB[3], v.RGB[4])
        BlipPratica[i] =  createBlipAttachedTo(Pratica[i],v.BlipID)
        addEventHandler('onMarkerHit', Pratica[i],
        function(element)
            if element and isElement(element) and getElementType(element) == "player" then
                triggerClientEvent(element, 'HS:CheckBind', element, i)
                if getElementData(element,"HS:Teorica") ~= "Sem Carteira" then
                    bindKey(element,Hyper_Config.Geral.Bind,"down",IniciarPratica)
                end
            end
        end)
        addEventHandler('onMarkerLeave', Pratica[i],
        function(element)
            if element and isElement(element) and getElementType(element) == "player" then
                triggerClientEvent(element, 'HS:CheckBind', element, i)
                if getElementData(element,"HS:Teorica") ~= "Sem Carteira" then
                    unbindKey(element,Hyper_Config.Geral.Bind,"down",IniciarPratica)
                end
            end
        end)
    end
end)


addEvent("HS:BuyCart",true)
addEventHandler("HS:BuyCart",getRootElement(),
function(player,Data,Valor)
local Cart = getElementData(player,"HS:Carteira("..Data..")")
    if Data == "A" then
    if Cart then outputMessage(player,"Você já está habilitado nesta categoria","error") return end
    elseif Data == "B" then
    if Cart then outputMessage(player,"Você já está habilitado nesta categoria","error") return end
    elseif Data == "C" then
    if Cart then outputMessage(player,"Você já está habilitado nesta categoria","error") return end
    end
    takePlayerMoney(player,tonumber(Valor))
    outputMessage(player,"Você comprou com sucesso sua carteira de motorista da categoria ("..Data.."), você será redirecionado para fazer a nossa prova teórica!","info")
    setTimer(function()
    triggerClientEvent(player,"HS:ProvaTeorica",player)
    end,5*1000,1)
end)

addEvent("HS:CheckCartPassed",true)
addEventHandler("HS:CheckCartPassed",getRootElement(),
function(player,Data)
    if Data == "A" then
        setElementData(player,"HS:Teorica",Data)
    elseif Data == "B" then
        setElementData(player,"HS:Teorica",Data)
    elseif Data == "C" then
        setElementData(player,"HS:Teorica",Data)
    end
end)





IniciarPratica = 
function(player)
    local Dated = getElementData(player,"HS:Teorica") or "Sem Carteira"
    if Dated == "A" then
        Veiculos[player] =  createVehicle(Hyper_Config.Geral.Moto,1712.137, -1313.594, 13.383)
        warpPedIntoVehicle(player,Veiculos[player])
    elseif Dated == "B" then
        Veiculos[player] =  createVehicle(Hyper_Config.Geral.Carro,1712.137, -1313.594, 13.383)
        warpPedIntoVehicle(player,Veiculos[player])
    elseif Dated == "C" then
        Veiculos[player] =  createVehicle(Hyper_Config.Geral.Caminhao,1712.137, -1313.594, 13.383)
        warpPedIntoVehicle(player,Veiculos[player])
    end
    for i = 1,#Hyper_Config.Rotas do
        IndexAutoEscola[player] = {1, i}
        local Index = IndexAutoEscola[player][1]
        local IndexRota = IndexAutoEscola[player][2]
        IndexAutoEscola[player][1] = IndexAutoEscola[player][1] +1
        local x,y,z = Hyper_Config.Rotas[IndexRota][Index][1],Hyper_Config.Rotas[IndexRota][Index][2],Hyper_Config.Rotas[IndexRota][Index][3]
        RotasAutoEscola[player] = createMarker(x,y,z -1, "cylinder",3.0,5,162,238,100)
        setElementDimension(RotasAutoEscola[player],0)
        --triggerClientEvent(player,"Iniciar>Carro",player,Configs.Gerais["TempoAutoEscola"]*60000)
        RotasBlip[player] = createBlipAttachedTo(RotasAutoEscola[player], 0)
        setElementVisibleTo ( RotasAutoEscola[player], root, false )
        setElementVisibleTo ( RotasAutoEscola[player], player, true )
        addEventHandler("onMarkerHit",RotasAutoEscola[player],ContinuarRotas)
        triggerClientEvent(player,"HS:ContTimer",player,Hyper_Config.Geral.TempoFazerProva*1000)
        TimerCont[player] = setTimer(function()
            if isTimer(TimerCont[player]) then 
                if isElement(RotasAutoEscola[player]) then destroyElement(RotasAutoEscola[player]) end
                if isElement(RotasBlip[player]) then destroyElement(RotasBlip[player]) end
                if isElement(Veiculos[player]) then destroyElement(Veiculos[player]) end
                triggerClientEvent(player,"HS:KillContTimer",player)
                outputMessage(player,"Você não chegou a tempo e sua prova foi cancelada","error")
                setElementPosition(player,Hyper_Config.Geral.PosVoltar[1],Hyper_Config.Geral.PosVoltar[2],Hyper_Config.Geral.PosVoltar[3])
            end
        end,Hyper_Config.Geral.TempoFazerProva*1000,1)
    end
end

function ContinuarRotas (element)
    if element and isElement(element ) and getElementType(element ) == "player" then
        if isElement( RotasAutoEscola[element] ) then destroyElement( RotasAutoEscola[element] ) end
        if isElement( RotasBlip[element] ) then destroyElement( RotasBlip[element] ) end
        local Index = IndexAutoEscola[element][1]
        local IndexRota = IndexAutoEscola[element][2]
        local limite = #Hyper_Config.Rotas[1]
        if IndexAutoEscola[element][1] >= limite then
            if isElement( RotasAutoEscola[element] ) then destroyElement( RotasAutoEscola[element] ) end
            if isElement( RotasBlip[element] ) then destroyElement( RotasBlip[element] ) end
            if isTimer(TimerCont[element]) then killTimer(TimerCont[element]) end
            triggerClientEvent(element,"HS:KillContTimer",element)
            destroyElement(Veiculos[element])
            outputMessage(element, "Você Finalizou com Sucesso Sua Prova","success")
            local Dated = getElementData(element,"HS:Teorica") or "Sem Carteira"
            if Dated == "A" then
                setElementData(element,"HS:Carteira(A)",true)
            elseif Dated == "B" then
                setElementData(element,"HS:Carteira(B)",true)
            elseif Dated == "C" then
                setElementData(element,"HS:Carteira(C)",true)
            end
            -- triggerClientEvent(element,"KillTimerCarro",element)
            setTimer(setElementPosition, 1000, 1,element, Hyper_Config.Geral.PosVoltar[1],Hyper_Config.Geral.PosVoltar[2],Hyper_Config.Geral.PosVoltar[3])
            setTimer( setCameraTarget, 1200, 1, element )
            setTimer ( fadeCamera, 50, 1, element,false, 1 )
            setTimer ( fadeCamera, 3000, 1, element, true, 3 ) 
            setTimer(setElementDimension, 3000, 1, element, 0)	
            setTimer(setElementInterior, 3000, 1, element, 0)
            return 
        end
        IndexAutoEscola[element][1] = IndexAutoEscola[element][1] +1
        local x,y,z = Hyper_Config.Rotas[IndexRota][Index][1],Hyper_Config.Rotas[IndexRota][Index][2],Hyper_Config.Rotas[IndexRota][Index][3]
        RotasAutoEscola[element] = createMarker(x,y,z -1, "cylinder",3.0,5,162,238,100)
        setElementDimension(RotasAutoEscola[element],0)
        setElementVisibleTo ( RotasAutoEscola[element], root, false )
        setElementVisibleTo ( RotasAutoEscola[element], element, true )
        RotasBlip[element] = createBlipAttachedTo(RotasAutoEscola[element], 0)
        addEventHandler("onMarkerHit",RotasAutoEscola[element],ContinuarRotas)
    end
end


function NaoSairdoVeiculo ( source ) 			
    if isElement( RotasAutoEscola[source] ) then	
        cancelEvent()
        outputMessage(source, "Você Não Pode Sair do Veiculo Enquanto Faz o Teste","error")
        end
    end
    addEventHandler ( "onVehicleStartExit", getRootElement(), NaoSairdoVeiculo)

function SairServer ( quitType )	
    if isElement( RotasAutoEscola[source] ) then destroyElement( RotasAutoEscola[source] ) end
    if isElement( RotasBlip[source] ) then destroyElement( RotasBlip[source] ) end
end
addEventHandler ( "onPlayerQuit", getRootElement(), SairServer )