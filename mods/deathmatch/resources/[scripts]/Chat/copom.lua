function copom ( thePlayer, _, ... )
    local message = table.concat ( { ... }, " " )
    local ID = getElementData ( thePlayer, "ID" ) or "N/C"
    if ( isPlayerCOPOM ( thePlayer ) ) then
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            if ( isPlayerCOPOM ( player ) ) then
                outputChatBox ( "* #969697「 #ff7700@Copom #969697 」 #ff7700- #ffffff".. getPlayerName(thePlayer).."#ffffff("..ID..") #ff7700- #ffffff".. message, player, 255, 255, 255, true )
            end
        end
    end
end
addCommandHandler ( "c", copom )
 
function isPlayerCOPOM ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( policial ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) )   then
            inGroup = true
            break
        end
    end
 
    return inGroup
end