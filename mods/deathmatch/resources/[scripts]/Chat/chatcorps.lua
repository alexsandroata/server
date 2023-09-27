------------------[[CHAT ROTA]]---------------------------

function chatrota ( thePlayer, _, ... )
    local message = table.concat ( { ... }, " " )
    local ID = getElementData ( thePlayer, "ID" ) or "N/C"
    if ( isPlayerOnGroupROTA ( thePlayer ) ) then
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            if ( isPlayerOnGroupROTA ( player ) ) then
                outputChatBox("* #969697「 #00fff7@ROTA #969697 」 #00fff7- #ffffff".. getPlayerName(thePlayer).."("..ID..") #00fff7- #00fff7".. message, player, 255, 255, 255, true )
            end
        end
    end
end
addCommandHandler ( "rota", chatrota )
 
function isPlayerOnGroupROTA ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( rota ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) )   then
            inGroup = true
            break
        end
    end
 
    return inGroup
end

------------------[[CHAT PRF]]---------------------------

function chatprf ( thePlayer, _, ... )
    local message = table.concat ( { ... }, " " )
    local ID = getElementData ( thePlayer, "ID" ) or "N/C"
    if ( isPlayerOnGroupPRF ( thePlayer ) ) then
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            if ( isPlayerOnGroupPRF ( player ) ) then
                outputChatBox("* #969697「 #00fff7@PRF #969697 」 #00fff7- #ffffff".. getPlayerName(thePlayer).."("..ID..") #00fff7- #00fff7".. message, player, 255, 255, 255, true )
            end
        end
    end
end
addCommandHandler ( "prf", chatprf )
 
function isPlayerOnGroupPRF ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( prf ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) )   then
            inGroup = true
            break
        end
    end
 
    return inGroup
end

------------------[[CHAT SAMU]]---------------------------

function chatsamu ( thePlayer, _, ... )
    local message = table.concat ( { ... }, " " )
    local ID = getElementData ( thePlayer, "ID" ) or "N/C"
    if ( isPlayerSAMU ( thePlayer ) ) then
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            if ( isPlayerSAMU ( player ) ) then
                outputChatBox("* #969697「 #00fff7@SAMU #969697 」 #00fff7- #ffffff".. getPlayerName(thePlayer).."("..ID..") #00fff7- #00fff7".. message, player, 255, 255, 255, true )
            end
        end
    end
end
addCommandHandler ( "samu", chatsamu )
 
function isPlayerSAMU ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( samu ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) )   then
            inGroup = true
            break
        end
    end
    return inGroup
end

------------------[[CHAT MEC]]---------------------------

function chatmec ( thePlayer, _, ... )
    local message = table.concat ( { ... }, " " )
    local ID = getElementData ( thePlayer, "ID" ) or "N/C"
    if ( isPlayermec ( thePlayer ) ) then
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            if ( isPlayermec ( player ) ) then
                outputChatBox("* #969697「 #00fff7@MEC #969697 」 #00fff7- #ffffff".. getPlayerName(thePlayer).."("..ID..") #00fff7- #00fff7".. message, player, 255, 255, 255, true )
            end
        end
    end
end
addCommandHandler ( "mec", chatmec )
 
function isPlayermec ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( mec ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) )   then
            inGroup = true
            break
        end
    end
    return inGroup
end