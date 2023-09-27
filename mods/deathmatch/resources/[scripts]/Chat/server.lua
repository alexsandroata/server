addEventHandler("onPlayerCommand",root,
    function(command)
    if command == "me" or command == "register" or command == "login" or command == "msg" then
        cancelEvent ( )
    end
end)

function AntiFlood (source)
    if not isObjectInACLGroup ("user."..getAccountName( getPlayerAccount (source) ), aclGetGroup ( "Console" ) ) then
        setElementData(source, "TS:AntiFlood", true)
        setTimer(function()
          if isElement(source) and getElementType(source) == "player" then 
            setElementData(source, "TS:AntiFlood", false)
          end 
          end, 4000, 1)
      end
  end





------------------[[CHAT TWITTER]]--------------------

DESATIVAR_TWITTER = {}

function Desabilitar_Habilitar_TWITTER (source, cmd, type)
     contaJogador = getPlayerAccount(source)
    if not isGuestAccount(contaJogador) then
        if hasObjectPermissionTo ( source, "command.mute", true ) then
            if type == "twitter" or type == "Twitter" then
                if DESATIVAR_TWITTER == true then
                    DESATIVAR_TWITTER = false
                    outputChatBox ( "* #FFFFFFO#FF0000(A) Admin "..getPlayerName(source).." #ffffffAtivou o Chat #1E90FFTWITTER #FFFFFFdo Servidor!", root, 255, 255, 255, true )
                else
                    DESATIVAR_TWITTER = true
                    outputChatBox ( "* #FFFFFFO#FF0000(A) Admin "..getPlayerName(source).." #ffffffDesativou o Chat #1E90FFTWITTER #FFFFFFdo Servidor!", root, 255, 255, 255, true )
                    end
                end
            end
        end
    end

addCommandHandler ( "desativar", Desabilitar_Habilitar_TWITTER )


function MensagemTwitter ( source, cmd, ...) 

    local contaJogador = getPlayerAccount(source)
    if not isGuestAccount(contaJogador) then
        if DESATIVAR_TWITTER == true then
            return outputChatBox ( "* #1E90FFTWITTER #FFFF00Desativado #FFFFFFTemporariamente!", source, 255, 255, 255, true )
        end
        local MessagemANS = table.concat ( { ... }, " " );
        local MessagemANS222 = string.gsub(MessagemANS, "#%x%x%x%x%x%x", "")
        local MessagemANS333 = string.gsub(MessagemANS222, "#%x%x%x%x%x%x", "")
        local MessagemANS444 = string.gsub(MessagemANS333, "#%x%x%x%x%x%x", "")
        local MessagemANS555 = string.gsub(MessagemANS444, "#%x%x%x%x%x%x", "")
        local MessagemANS666 = string.gsub(MessagemANS555, "#%x%x%x%x%x%x", "")
        local MessagemANS777 = string.gsub(MessagemANS666, "#%x%x%x%x%x%x", "")
        local MessagemANS888 = string.gsub(MessagemANS777, "#%x%x%x%x%x%x", "")
        local MessagemANS999 = string.gsub(MessagemANS888, "#%x%x%x%x%x%x", "")
        local MessagemANS100 = string.gsub(MessagemANS999, "#%x%x%x%x%x%x", "")
        local MessagemANS101 = string.gsub(MessagemANS100, "#%x%x%x%x%x%x", "")
        local MessagemANS102 = string.gsub(MessagemANS101, "#%x%x%x%x%x%x", "")
        local MessagemANS103 = string.gsub(MessagemANS102, "#%x%x%x%x%x%x", "")
        local MessagemANS104 = string.gsub(MessagemANS103, "#%x%x%x%x%x%x", "")
        local MessagemANS105 = string.gsub(MessagemANS104, "#%x%x%x%x%x%x", "")
        Jogador = getPlayerName ( source )
        Jogador2 = string.gsub(Jogador, "#%x%x%x%x%x%x", "")    
        if getElementData(source, "TS:AntiFlood") then 
            outputChatBox("Aguarde 4 segundos para enviar outra mensagem !!",source, 255, 0, 0, true) 
        return end
        if isPlayerMuted ( source ) then
            outputChatBox("Você está mutado !!",source, 255, 0, 0, true) 
        return  end
        AntiFlood(source)
        local ID = getElementData ( source, "ID" ) or "N/C"
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            
            if isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Console" ) ) then
                outputChatBox ("* #969697「 #0091ffTwitter #969697 」 #ffffff- #ffff00♦ Fundador ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #0091ff- "..MessagemANS105, player, 255, 255, 255, true )
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Staff" ) ) then
               outputChatBox ("* #969697「 #0091ffTwitter #969697 」 #ffffff- #ff8a00♦ Staff ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #0091ff- "..MessagemANS105, player, 255, 255, 255, true )
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Diamante" ) ) then
                outputChatBox ("* #969697「 #0091ffTwitter #969697 」 #ffffff- #00BFFF♦ VIP Diamante ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #0091ff- "..MessagemANS105, player, 255, 255, 255, true ) 
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Ouro" ) ) then
                outputChatBox ("* #969697「 #0091ffTwitter #969697 」 #ffffff- #DAA520♦ VIP Ouro ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #0091ff- "..MessagemANS105, player, 255, 255, 255, true ) 
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Prata" ) ) then
                outputChatBox ("* #969697「 #0091ffTwitter #969697 」 #ffffff- #B0C4DE♦ VIP Prata ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #0091ff- "..MessagemANS105, player, 255, 255, 255, true )       
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Bronze" ) ) then
                outputChatBox ("* #969697「 #0091ffTwitter #969697 」 #ffffff- #D2691E♦ VIP Bronze ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #0091ff- "..MessagemANS105, player, 255, 255, 255, true )
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Policial" ) ) then
                outputChatBox ("* #969697「 #0091ffTwitter #969697 」 #ffffff- #696969♦ Policial ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #0091ff- "..MessagemANS105, player, 255, 255, 255, true )
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Bandido" ) ) then
                outputChatBox ("* #969697「 #0091ffTwitter #969697 」 #ffffff- #FF0000♦ Bandido ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #0091ff- "..MessagemANS105, player, 255, 255, 255, true )  
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "SAMU" ) ) then
                outputChatBox ("* #969697「 #0091ffTwitter #969697 」 #ffffff- #FA8072♦ SAMU ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #0091ff- "..MessagemANS105, player, 255, 255, 255, true )  
			elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Mecanico" ) ) then
                outputChatBox ("* #969697「 #0091ffTwitter #969697 」 #ffffff- #FF8C00♦ Mecânico ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #0091ff- "..MessagemANS105, player, 255, 255, 255, true )		
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Everyone" ) ) then
                outputChatBox ("* #969697「 #0091ffTwitter #969697 」 #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #0091ff- "..MessagemANS105, player, 255, 255, 255, true )

            end
        end
        local time = getRealTime()
        local Horas = time.hour
        local Minutos = time.minute
        local Dia = time.monthday
        local Mes = time.month +1
        local Ano = time.year + 1900
    end
end
addCommandHandler ( "Twitter", MensagemTwitter )

function isPlayerOnGroup ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( Chat_Admin ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) ) then
            inGroup = false
            break
        end
    end
    return inGroup
end

---

addEventHandler ( "onPlayerLogin", getRootElement ( ),  
function ( ) 
    bindKey ( source, "i", "down", "chatbox", "Twitter" )
end
)

addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource ( ) ),
function ( ) 
    for index, player in pairs ( getElementsByType ( "player" ) ) do 
        local contaJogador = getPlayerAccount(player)
        if not isGuestAccount(contaJogador) then
            bindKey ( player, "i", "down", "chatbox", "Twitter" )
        end
    end
end
)






------------------[[CHAT COPOM]]----------------------

DESATIVAR_Copom = {}

function Desabilitar_Habilitar_Copom (source, cmd, type)
    local contaJogador = getPlayerAccount(source)
    if not isGuestAccount(contaJogador) then
        if hasObjectPermissionTo ( source, "command.mute", true ) then
            if type == "Copom" or type == "Copom" then
                if DESATIVAR_Copom == true then
                    DESATIVAR_Copom = false
                    outputChatBox ( "* #ffffffO#FF0000(A) Admin "..getPlayerName(source).." #ffffffAtivou o #00FF00Copom #FFFFFFdo Servidor!", root, 255, 255, 255, true )
                else
                    DESATIVAR_Copom = true
                    outputChatBox ( "* #ffffffO#FF0000(A) Admin "..getPlayerName(source).." #ffffffDesativou o #00FF00Copom #FFFFFFdo Servidor!", root, 255, 255, 255, true )
                    end
                end
            end
        end
    end

addCommandHandler ( "desativar", Desabilitar_Habilitar_Copom )




function isPlayerOnGroup ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( Chat_Admin ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( "Policial" ) ) then
            inGroup = false
            break
        end
    end
    return inGroup
end





------------------[[CHAT DEEPWEB]]--------------------

function Desabilitar_Habilitar_DEEP (source, cmd, type)
    contaJogador = getPlayerAccount(source)
   if not isGuestAccount(contaJogador) then
       if hasObjectPermissionTo ( source, "command.mute", true ) then
           if type == "deepweb" or type == "DeepWeb" then
               if DESATIVAR_Olx == true then
                DESATIVAR_Olx = false
                   outputChatBox ( "* #FFFFFFO#FF0000(A) Admin "..getPlayerName(source).." #ffffffAtivou o Chat #1E90FFDEEPWEB #FFFFFFdo Servidor!", root, 255, 255, 255, true )
               else
                DESATIVAR_Olx = true
                   outputChatBox ( "* #FFFFFFO#FF0000(A) Admin "..getPlayerName(source).." #ffffffDesativou o Chat #1E90FFDEEPWEB #FFFFFFdo Servidor!", root, 255, 255, 255, true )
                   end
               end
           end
       end
   end

addCommandHandler ( "desativar", Desabilitar_Habilitar_DEEP )


function MensagemOlx ( source, cmd, ...) 
	local time = getRealTime()
local Horas = time.hour
local Minutos = time.minute
local Dia = time.monthday
local Mes = time.month +1
local Ano = time.year + 1900
    local contaJogador = getPlayerAccount(source)
    if not isGuestAccount(contaJogador) then
        if DESATIVAR_Olx == true then
            return outputChatBox ( "* Chat Desativado Temporariamente!", source, 255, 255, 255, true )
        end
        local MessagemANS = table.concat ( { ... }, " " );
        local MessagemANS222 = string.gsub(MessagemANS, "#%x%x%x%x%x%x", "")
        local MessagemANS333 = string.gsub(MessagemANS222, "#%x%x%x%x%x%x", "")
        local MessagemANS444 = string.gsub(MessagemANS333, "#%x%x%x%x%x%x", "")
        local MessagemANS555 = string.gsub(MessagemANS444, "#%x%x%x%x%x%x", "")
        local MessagemANS666 = string.gsub(MessagemANS555, "#%x%x%x%x%x%x", "")
        local MessagemANS777 = string.gsub(MessagemANS666, "#%x%x%x%x%x%x", "")
        local MessagemANS888 = string.gsub(MessagemANS777, "#%x%x%x%x%x%x", "")
        local MessagemANS999 = string.gsub(MessagemANS888, "#%x%x%x%x%x%x", "")
        local MessagemANS100 = string.gsub(MessagemANS999, "#%x%x%x%x%x%x", "")
        local MessagemANS101 = string.gsub(MessagemANS100, "#%x%x%x%x%x%x", "")
        local MessagemANS102 = string.gsub(MessagemANS101, "#%x%x%x%x%x%x", "")
        local MessagemANS103 = string.gsub(MessagemANS102, "#%x%x%x%x%x%x", "")
        local MessagemANS104 = string.gsub(MessagemANS103, "#%x%x%x%x%x%x", "")
        local MessagemANS105 = string.gsub(MessagemANS104, "#%x%x%x%x%x%x", "")
        Jogador = getPlayerName ( source )
        Jogador2 = string.gsub(Jogador, "#%x%x%x%x%x%x", "")    
        if getElementData(source, "TS:AntiFlood") then 
            outputChatBox("Aguarde 4 segundos para enviar outra mensagem !!",source, 255, 0, 0, true) 
        return end
        if isPlayerMuted ( source ) then
            outputChatBox("Você está mutado !!",source, 255, 0, 0, true) 
        return  end
        AntiFlood(source)   
    local ID = getElementData ( source, "ID" ) or "N/C"
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            
            if isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Everyone" ) ) then
                if isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( player ) ), aclGetGroup ( "Staff" ) ) then
                    outputChatBox ( "*#B9B9B9 「 Deep Web 」 #B9B9B9- #ffffff"..getPlayerName(source).."  #ffffff #"..ID.." #B9B9B9- "..MessagemANS105, player, 255, 255, 255, true )
                    
                else
                    outputChatBox ( "*#B9B9B9 「 Deep Web 」 - "..MessagemANS105, player, 255, 255, 255, true )
    
                end
            end
        end
        --outputServerLog ( "* Hype Anm - ".. Jogador2 .." - "..MessagemANS105 )
    end
end
addCommandHandler ( "DeepWeb", MensagemOlx )




function isPlayerOnGroup ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( Chat_Admin ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( "Staff" ) ) then
            inGroup = false
            break
        end
    end
    return inGroup
end

---

addEventHandler ( "onPlayerLogin", getRootElement ( ),  
function ( ) 
    bindKey ( source, "u", "down", "chatbox", "DeepWeb" )
end
)

addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource ( ) ),
function ( ) 
    for index, player in pairs ( getElementsByType ( "player" ) ) do 
        local contaJogador = getPlayerAccount(player)
        if not isGuestAccount(contaJogador) then
            bindKey ( player, "u", "down", "chatbox", "DeepWeb" )
        end
    end
end
)





------------------[[CHAT LOCAL]]----------------------

DistanciaDoChatLocal = 100

addEventHandler("onPlayerChat", root, function(tresc, msgtype)
    if msgtype == 0 then
        cancelEvent ( )
        local contaJogador = getPlayerAccount(source)
        if not isGuestAccount(contaJogador) then
            local x,y,z = getElementPosition(source)
            if getElementData(source, "TS:AntiFlood") then 
                outputChatBox("Aguarde 4 segundos para enviar outra mensagem !!",source, 255, 0, 0, true) 
            return end
            if isPlayerMuted ( source ) then
                outputChatBox("Você está mutado !!",source, 255, 0, 0, true) 
            return  end
            AntiFlood(source)
            local ID = getElementData(source, "ID") or "N/C"
            for key, gracze in ipairs(getElementsByType("player")) do
                local x2,y2,z2 = getElementPosition(gracze)
                if getDistanceBetweenPoints3D ( x, y, z, x2, y2, z2 ) < DistanciaDoChatLocal then
                    local int = getElementInterior   ( source )
                    local dim = getElementDimension  ( source )
                    local int2 = getElementInterior  ( gracze )
                    local dim2 = getElementDimension ( gracze )
                    local time = getRealTime()
                    local hours = time.hour
                    local minutes = time.minute
                    local seconds = time.second
                    if int == int2 and dim == dim2 then
                        conta = getAccountName ( getPlayerAccount ( source ) )
                    
                        
                        if isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Console" ) ) then
                            outputChatBox ("* #969697「 #ffe62b"..hours..":"..minutes..":"..seconds.." #969697 」 #ffffff- #ffff00♦ Fundador ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ffe62b- ".. tresc, gracze, 255, 255, 255, true)
                        elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Staff" ) ) then
                            outputChatBox ("* #969697「 #ffe62b"..hours..":"..minutes..":"..seconds.." #969697 」 #ffffff- #ff8a00♦ Staff ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ffe62b- ".. tresc, gracze, 255, 255, 255, true)
                        elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Diamante" ) ) then
                            outputChatBox ("* #969697「 #ffe62b"..hours..":"..minutes..":"..seconds.." #969697 」 #ffffff- #00BFFF♦ VIP Diamante ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ffe62b- ".. tresc, gracze, 255, 255, 255, true) 
                        elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Ouro" ) ) then
                            outputChatBox ("* #969697「 #ffe62b"..hours..":"..minutes..":"..seconds.." #969697 」 #ffffff- #DAA520♦ VIP Ouro ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ffe62b- ".. tresc, gracze, 255, 255, 255, true) 
                        elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Prata" ) ) then
                            outputChatBox ("* #969697「 #ffe62b"..hours..":"..minutes..":"..seconds.." #969697 」 #ffffff- #B0C4DE♦ VIP Prata ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ffe62b- ".. tresc, gracze, 255, 255, 255, true)                                                                                                                                                                                                                                
                        elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Bronze" ) ) then
                            outputChatBox ("* #969697「 #ffe62b"..hours..":"..minutes..":"..seconds.." #969697 」 #ffffff- #D2691E♦ VIP Bronze ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ffe62b- ".. tresc, gracze, 255, 255, 255, true)
                        elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Policial" ) ) then
                            outputChatBox ("* #969697「 #ffe62b"..hours..":"..minutes..":"..seconds.." #969697 」 #ffffff- #696969♦ Policial ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ffe62b- ".. tresc, gracze, 255, 255, 255, true)
                        elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Bandido" ) ) then
                            outputChatBox ("* #969697「 #ffe62b"..hours..":"..minutes..":"..seconds.." #969697 」 #ffffff- #FF0000♦ Bandido ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ffe62b- ".. tresc, gracze, 255, 255, 255, true)  
                        elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "SAMU" ) ) then
                            outputChatBox ("* #969697「 #ffe62b"..hours..":"..minutes..":"..seconds.." #969697 」 #ffffff- #FA8072♦ SAMU ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ffe62b- ".. tresc, gracze, 255, 255, 255, true)     
						elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Mecanico" ) ) then
                            outputChatBox ("* #969697「 #ffe62b"..hours..":"..minutes..":"..seconds.." #969697 」 #ffffff- #FF8C00♦ Mecânico ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ffe62b- ".. tresc, gracze, 255, 255, 255, true) 
                        elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Everyone" ) ) then
                            outputChatBox ("* #969697「 #ffe62b"..hours..":"..minutes..":"..seconds.." #969697 」 #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ffe62b- ".. tresc, gracze, 255, 255, 255, true)
                        end
                    end
                end
            end
            local time = getRealTime()
            local Horas = time.hour
            local Minutos = time.minute
            local Dia = time.monthday
            local Mes = time.month +1
            local Ano = time.year + 1900
        end
    end
end)






------------------[[CHAT STAFF]]---------------------------

function chatstaff ( thePlayer, _, ... )
    local message = table.concat ( { ... }, " " )
    local ID = getElementData ( thePlayer, "ID" ) or "N/C"
    if ( isPlayerSTAFF ( thePlayer ) ) then
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            if ( isPlayerSTAFF ( player ) ) then
                outputChatBox ( "* #969697「 #b800ccSTAFF #969697」 #b800cc- #ffffff".. getPlayerName(thePlayer).." #ffffff #"..ID.." #b800cc- #b800cc".. message, player, 255, 255, 255, true )
            end
        end
    end
end
addCommandHandler ( "s", chatstaff )
 
function isPlayerSTAFF ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( staff ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) )   then
            inGroup = true
            break
        end
    end
 
    return inGroup
end




------------------[[CHAT FORARP]]--------------------

DESATIVAR_FORARP = {}

function Desabilitar_Habilitar_FORARP (source, cmd, type)
     contaJogador = getPlayerAccount(source)
    if not isGuestAccount(contaJogador) then
        if hasObjectPermissionTo ( source, "command.mute", true ) then
            if type == "forarp" or type == "ForaRP" then
                if DESATIVAR_FORARP == true then
                    DESATIVAR_FORARP = false
                    outputChatBox ( "* #FFFFFFO#FF0000(A) Admin "..getPlayerName(source).." #ffffffAtivou o Chat #1E90FFFORARP #FFFFFFdo Servidor!", root, 255, 255, 255, true )
                else
                    DESATIVAR_FORARP = true
                    outputChatBox ( "* #FFFFFFO#FF0000(A) Admin "..getPlayerName(source).." #ffffffDesativou o Chat #1E90FFFORARP #FFFFFFdo Servidor!", root, 255, 255, 255, true )
                    end
                end
            end
        end
    end

addCommandHandler ( "desativar", Desabilitar_Habilitar_FORARP )


function MensagemFORARP ( source, cmd, ...) 

    local contaJogador = getPlayerAccount(source)
    if not isGuestAccount(contaJogador) then
        if DESATIVAR_FORARP == true then
            return outputChatBox ( "* #1E90FFFORARP #FFFF00Desativado #FFFFFFTemporariamente!", source, 255, 255, 255, true )
        end
        local MessagemANS = table.concat ( { ... }, " " );
        local MessagemANS222 = string.gsub(MessagemANS, "#%x%x%x%x%x%x", "")
        local MessagemANS333 = string.gsub(MessagemANS222, "#%x%x%x%x%x%x", "")
        local MessagemANS444 = string.gsub(MessagemANS333, "#%x%x%x%x%x%x", "")
        local MessagemANS555 = string.gsub(MessagemANS444, "#%x%x%x%x%x%x", "")
        local MessagemANS666 = string.gsub(MessagemANS555, "#%x%x%x%x%x%x", "")
        local MessagemANS777 = string.gsub(MessagemANS666, "#%x%x%x%x%x%x", "")
        local MessagemANS888 = string.gsub(MessagemANS777, "#%x%x%x%x%x%x", "")
        local MessagemANS999 = string.gsub(MessagemANS888, "#%x%x%x%x%x%x", "")
        local MessagemANS100 = string.gsub(MessagemANS999, "#%x%x%x%x%x%x", "")
        local MessagemANS101 = string.gsub(MessagemANS100, "#%x%x%x%x%x%x", "")
        local MessagemANS102 = string.gsub(MessagemANS101, "#%x%x%x%x%x%x", "")
        local MessagemANS103 = string.gsub(MessagemANS102, "#%x%x%x%x%x%x", "")
        local MessagemANS104 = string.gsub(MessagemANS103, "#%x%x%x%x%x%x", "")
        local MessagemANS105 = string.gsub(MessagemANS104, "#%x%x%x%x%x%x", "")
        Jogador = getPlayerName ( source )
        Jogador2 = string.gsub(Jogador, "#%x%x%x%x%x%x", "")    
        if getElementData(source, "TS:AntiFlood") then 
            outputChatBox("Aguarde 4 segundos para enviar outra mensagem !!",source, 255, 0, 0, true) 
        return end
        if isPlayerMuted ( source ) then
            outputChatBox("Você está mutado !!",source, 255, 0, 0, true) 
        return  end
        AntiFlood(source)
        local ID = getElementData ( source, "ID" ) or "N/C"
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            
            if isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Console" ) ) then
                outputChatBox ("* #969697「 #ff8a00Fora do RP #969697 」 #ffffff- #ffff00♦ Fundador ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ff8a00- "..MessagemANS105, player, 255, 255, 255, true )
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Staff" ) ) then
                outputChatBox ("* #969697「 #ff8a00Fora do RP #969697 」 #ffffff- #ff8a00♦ Staff ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ff8a00- "..MessagemANS105, player, 255, 255, 255, true )
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Diamante" ) ) then
                outputChatBox ("* #969697「 #ff8a00Fora do RP #969697 」 #ffffff- #00BFFF♦ VIP Diamante ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ff8a00- "..MessagemANS105, player, 255, 255, 255, true ) 
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Ouro" ) ) then
                outputChatBox ("* #969697「 #ff8a00Fora do RP #969697 」 #ffffff- #DAA520♦ VIP Ouro ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ff8a00- "..MessagemANS105, player, 255, 255, 255, true ) 
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Prata" ) ) then
                outputChatBox ("* #969697「 #ff8a00Fora do RP #969697 」 #ffffff- #B0C4DE♦ VIP Prata ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ff8a00- "..MessagemANS105, player, 255, 255, 255, true ) 
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Bronze" ) ) then
                outputChatBox ("* #969697「 #ff8a00Fora do RP #969697 」 #ffffff- #D2691E♦ VIP Bronze ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ff8a00- "..MessagemANS105, player, 255, 255, 255, true )
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Policial" ) ) then
                outputChatBox ("* #969697「 #ff8a00Fora do RP #969697 」 #ffffff- #696969♦ Policial ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ff8a00- "..MessagemANS105, player, 255, 255, 255, true )
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Bandido" ) ) then
                outputChatBox ("* #969697「 #ff8a00Fora do RP #969697 」 #ffffff- #FF0000♦ Bandido ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ff8a00- "..MessagemANS105, player, 255, 255, 255, true )  
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "SAMU" ) ) then
                outputChatBox ("* #969697「 #ff8a00Fora do RP #969697 」 #ffffff- #FA8072♦ SAMU ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ff8a00- "..MessagemANS105, player, 255, 255, 255, true ) 
			elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Mecanico" ) ) then
                outputChatBox ("* #969697「 #ff8a00Fora do RP #969697 」 #ffffff- #FF8C00♦ Mecânico ♦ #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ff8a00- "..MessagemANS105, player, 255, 255, 255, true )			
            elseif isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Everyone" ) ) then
                outputChatBox ("* #969697「 #ff8a00Fora do RP #969697 」 #ffffff- #ffffff"..getPlayerName(source).." #ffffff #"..ID.." #ff8a00- "..MessagemANS105, player, 255, 255, 255, true )

            end
        end
        local time = getRealTime()
        local Horas = time.hour
        local Minutos = time.minute
        local Dia = time.monthday
        local Mes = time.month +1
        local Ano = time.year + 1900
    end
end
addCommandHandler ( "ForaRP", MensagemFORARP )

---

addEventHandler ( "onPlayerLogin", getRootElement ( ),  
function ( ) 
    bindKey ( source, "o", "down", "chatbox", "ForaRP" )
end
)

addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource ( ) ),
function ( ) 
    for index, player in pairs ( getElementsByType ( "player" ) ) do 
        local contaJogador = getPlayerAccount(player)
        if not isGuestAccount(contaJogador) then
            bindKey ( player, "o", "down", "chatbox", "ForaRP" )
        end
    end
end
)