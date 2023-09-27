------------------[[CHAT CV]]---------------------------

function chatcv ( thePlayer, _, ... )
    local message = table.concat ( { ... }, " " )
    local ID = getElementData ( thePlayer, "ID" ) or "N/C"
    if ( isPlayercv ( thePlayer ) ) then
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            if ( isPlayercv ( player ) ) then
                outputChatBox ( "* #969697「 #08a300@CV#969697 」 #08a300- #ffffff".. getPlayerName(thePlayer).."("..ID..") #08a300- #08a300".. message, player, 255, 255, 255, true )
            end
        end
    end
end
addCommandHandler ( "cv", chatcv )
 
function isPlayercv ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( cv ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) )   then
            inGroup = true
            break
        end
    end
 
    return inGroup
end

------------------[[CHAT PCC]]---------------------------

function chatpcc ( thePlayer, _, ... )
    local message = table.concat ( { ... }, " " )
    local ID = getElementData ( thePlayer, "ID" ) or "N/C"
    if ( isPlayerpcc ( thePlayer ) ) then
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            if ( isPlayerpcc ( player ) ) then
                outputChatBox ( "* #969697「 #08a300@PCC#969697 」 #08a300- #ffffff".. getPlayerName(thePlayer).."("..ID..") #08a300- #08a300".. message, player, 255, 255, 255, true )
            end
        end
    end
end
addCommandHandler ( "pcc", chatpcc )
 
function isPlayerpcc ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( pcc ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) )   then
            inGroup = true
            break
        end
    end
 
    return inGroup
end