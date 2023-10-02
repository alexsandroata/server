function onJoin()
    setPedArmor(source, 100)
    local playerName = getPlayerName(source)
    outputChatBox("Bem vindo ".. playerName .." ao servidor", source, 0, 154, 255)
end
addEventHandler("onPlayerJoin", root, onJoin)