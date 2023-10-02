local fly = false
local invisible = false
local holdingVeh = false

function msg(mensagem)
  local data = {
      content = "",
      username = Apolo_Config.Discord["UserName"],
      avatar_url = Apolo_Config.Discord["AvatarUrl"],
      embeds = {
          {
              title = Apolo_Config.Discord["TituloEmbed"],
              color = Apolo_Config.Discord["ColorEmbed"],
              description = ""..mensagem.."",
              footer = {
                  text = Apolo_Config.Discord["MsgDireitos"],
                  icon_url = Apolo_Config.Discord["IconUrl"],
              },
                  image = {
                    url = Apolo_Config.Discord["ImageUrl"],
                  },
                  thumbnail = { 
                    url = Apolo_Config.Discord["ThumbnailUrl"],
                  },
          }
      }
  }

  local jsonData = toJSON(data)
        jsonData = string.sub(jsonData, 3, #jsonData - 2)

  local sendOptions = {
      headers = {
          ["Content-Type"] = "application/json"
      },
      postData = jsonData,
  }

  fetchRemote ( Apolo_Config.Url["UrlDiscord"], sendOptions, WebhookCallback )
end

function  WebhookCallback()
end


function getPlayerID(id)
  v = false
  for i, player in ipairs (getElementsByType("player")) do
    if getElementData(player, Apolo_Config.Geral["Id"]) == id then
      v = player
      break
    end
  end
  return v
end


addCommandHandler(Apolo_Config.Comandos["Nc"], function(thePlayer, commandName)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (Apolo_Config.Acls["AclNc"])) then
  if fly then
    triggerClientEvent(thePlayer, "onClientFlyToggle", thePlayer)
    outputMessage(thePlayer, Apolo_Config.Mensagens["MsgDesativouNC"], "success")
    --msg("`🗽` **Staff:** "..getPlayerName(thePlayer).." ("..(getElementData(thePlayer, "ID") or 0)..") \n`📑` **Mensagem:** Desativou o modo de voar e invisivel:")
    fly = false
  else
    triggerClientEvent(thePlayer, "onClientFlyToggle", thePlayer)
    outputMessage(thePlayer, Apolo_Config.Mensagens["MsgAtivouNC"], "success")
    -- msg("`🗽` **Staff:** "..getPlayerName(thePlayer).." ("..(getElementData(thePlayer, "ID") or 0)..") \n`📑` **Mensagem:** Ativou o modo de voar e invisivel:")
    fly = true
  end
else
  outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPermissao"], "error")
end
end)

addCommandHandler(Apolo_Config.Comandos["Nc"], function(thePlayer, commandName)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (Apolo_Config.Acls["AclNc"])) then
  if invisible then
    setElementAlpha(thePlayer, 255)
    invisible = false
  else
    setElementAlpha(thePlayer, 0)

    invisible = true
  end
else
  outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPermissao"], "error")
end
end)

addCommandHandler(Apolo_Config.Comandos["Vida"], function(thePlayer, commandName, id, life)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (Apolo_Config.Acls["AclVida"])) then
  if not tonumber(id) then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroID"], "error") return end
  if not tonumber(life) then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroVida"], "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPlayer"], "error") return end
  setElementHealth(targetPlayer, life)
  outputMessage(targetPlayer, "O Staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."] Alterou sua vida para o valor "..life, "success")
  outputMessage(thePlayer, "Voce alterou da vida do player "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."] para o valor "..life, "success")
  msg(">>> `🗽` **Staff:** "..getPlayerName(thePlayer).." ("..(getElementData(thePlayer, "ID") or 0)..") \n`📑` **Mensagem:** Alterou a vida do player: "..getPlayerName(targetPlayer).." ("..(getElementData(targetPlayer, "ID") or 0)..") para "..life.."")
else
  outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPermissao"], "error")
end
end)

addCommandHandler(Apolo_Config.Comandos["Fix"], function(thePlayer, commandName, id)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (Apolo_Config.Acls["AclFix"])) then
  if not tonumber(id) then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroID"], "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPlayer"], "error") return end
  if not getPedOccupiedVehicle(targetPlayer) then outputMessage(thePlayer, ERRORNOVEHICLE, "error") return end
  local veh = getPedOccupiedVehicle(targetPlayer)
  fixVehicle(veh)
  outputMessage(targetPlayer, "O Staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."] Consertou seu veiculo", "success")
  outputMessage(thePlayer, "Voce consertou o veiculo do player "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."]", "success")
  msg(">>> `🗽` **Staff:** "..getPlayerName(thePlayer).." ("..(getElementData(thePlayer, "ID") or 0)..") \n`📑` **Mensagem:** Concertou o veiculo do player: "..getPlayerName(targetPlayer).." ("..(getElementData(targetPlayer, "ID") or 0)..")")
else
  outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPermissao"], "error")
end
end)

addCommandHandler(Apolo_Config.Comandos["Dv"], function(thePlayer, commandName, id)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (Apolo_Config.Acls["AclDv"])) then
  if not tonumber(id) then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroID"], "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPlayer"], "error") return end
  if not getPedOccupiedVehicle(targetPlayer) then outputMessage(thePlayer, ERRORNOVEHICLE, "error") return end
  local veh = getPedOccupiedVehicle(targetPlayer)
  destroyElement(veh)
  outputMessage(targetPlayer, "O Staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."] Destruiu seu veiculo", "success")
  outputMessage(thePlayer, "Voce destruiu o veiculo do player "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."]", "success")
  msg(">>> `🗽` **Staff:** "..getPlayerName(thePlayer).." ("..(getElementData(thePlayer, "ID") or 0)..") \n`📑` **Mensagem:** Destruiu o carro do player: "..getPlayerName(targetPlayer).." ("..(getElementData(targetPlayer, "ID") or 0)..")")
else
  outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPermissao"], "error")
end
end)

addCommandHandler(Apolo_Config.Comandos["Colete"], function(thePlayer, commandName, id, armor)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (Apolo_Config.Acls["AclColete"])) then
  if not tonumber(id) then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroID"], "error") return end
  if not tonumber(armor) then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroArmor"], "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPlayer"], "error") return end
  setPedArmor(targetPlayer, armor)
  outputMessage(targetPlayer, "O Staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."] Alterou seu colete para o valor "..armor, "success")
  outputMessage(thePlayer, "Voce alterou o colete do player "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."] para o valor "..armor, "success")
  msg(">>> `🗽` **Staff:** "..getPlayerName(thePlayer).." ("..(getElementData(thePlayer, "ID") or 0)..") \n`📑` **Mensagem:** Deu um colete ao player: "..getPlayerName(targetPlayer).." ("..(getElementData(targetPlayer, "ID") or 0)..")")
else
  outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPermissao"], "error")
end
end)

addCommandHandler(Apolo_Config.Comandos["Car"], function(thePlayer, commandName, id, vehid)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (Apolo_Config.Acls["AclCar"])) then
  if not tonumber(id) then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroID"], "error") return end
  if not tonumber(vehid) then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroIdVeiculo"], "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPlayer"], "error") return end
  if getPedOccupiedVehicle(targetPlayer) then outputMessage(thePlayer, ERRORVEHICLEEXISTS, "error") return end
  local veh = createVehicle(vehid, getElementPosition(targetPlayer))
  warpPedIntoVehicle(targetPlayer, veh)
  outputMessage(targetPlayer, "Voce recebeu um veiculo do staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."]", "success")
  outputMessage(thePlayer, "Voce deu um veiculo ao player "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."]", "success")
  msg(">>> `🗽` **Staff:** "..getPlayerName(thePlayer).." ("..(getElementData(thePlayer, "ID") or 0)..") \n`📑` **Mensagem:** Deu um veiculo ao player: "..getPlayerName(targetPlayer).." ("..(getElementData(targetPlayer, "ID") or 0)..") \n`🚗` **Veiculo de ID:**: ("..vehid..")")
else
  outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPermissao"], "error")
end
end)

addCommandHandler(Apolo_Config.Comandos["Avisar"], function(thePlayer, commandName, id, ...)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (Apolo_Config.Acls["AclAvisar"])) then
  if not tonumber(id) then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroID"], "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPlayer"], "error") return end
  local message = table.concat({...}, " ")
  outputMessage(targetPlayer, "O Staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."] Lhe deu um aviso: "..message, "success")
  outputMessage(thePlayer, "Voce deu um aviso ao player "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."]", "success")
  msg(">>> `🗽` **Staff:** "..getPlayerName(thePlayer).." ("..(getElementData(thePlayer, "ID") or 0)..") \n`📑` **Mensagem:** Deu um aviso ao player: "..getPlayerName(targetPlayer).." ("..(getElementData(targetPlayer, "ID") or 0)..") \n`🧧` **Aviso:** "..message.."")

else
  outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPermissao"], "error")
end
end)

addCommandHandler(Apolo_Config.Comandos["Tp"], function(thePlayer, commandName, id)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (Apolo_Config.Acls["AclTp"])) then
  if not tonumber(id) then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroID"], "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPlayer"], "error") return end
  local x, y, z = getElementPosition(targetPlayer)
  local interior = getElementInterior(targetPlayer)
  local dimension = getElementDimension(targetPlayer)
  local r = getPedRotation(targetPlayer)
  setCameraInterior(thePlayer, interior)
  outputMessage(targetPlayer, "O Staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."] Teleportou ate voce", "success")
  outputMessage(thePlayer, "Voce teleportou ao player "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."]", "success")
  msg(">>> `🗽` **Staff:** "..getPlayerName(thePlayer).." ("..(getElementData(thePlayer, "ID") or 0)..") \n`📑` **Mensagem:** Deu tp no player: "..getPlayerName(targetPlayer).." ("..(getElementData(targetPlayer, "ID") or 0)..")")
  if getPedOccupiedVehicle(thePlayer) then
    local veh = getPedOccupiedVehicle(thePlayer)
    setVehicleTurnVelocity(veh, 0, 0, 0)
    setElementInterior(thePlayer, interior)
    setElementDimension(thePlayer, dimension)
    setElementInterior(veh, interior)
    setElementDimension(veh, dimension)
    setElementPosition(veh, x, y, z + 1)
    warpPedIntoVehicle ( thePlayer, veh )
    setTimer(setVehicleTurnVelocity, 50, 20, veh, 0, 0, 0)
  else
    setElementPosition(thePlayer, x, y, z+2)
    setElementInterior(thePlayer, interior)
    setElementDimension(thePlayer, dimension)
  end
else
  outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPermissao"], "error")
end
end)

addCommandHandler(Apolo_Config.Comandos["Puxar"], function(thePlayer, commandName, id)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (Apolo_Config.Acls["AclPuxar"])) then
  if not tonumber(id) then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroID"], "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPlayer"], "error") return end
  local x, y, z = getElementPosition(thePlayer)
  local interior = getElementInterior(thePlayer)
  local dimension = getElementDimension(thePlayer)
  local r = getPedRotation(thePlayer)
  setCameraInterior(targetPlayer, interior)
  msg(">>> `🗽` **Staff:** "..getPlayerName(thePlayer).." ("..(getElementData(thePlayer, "ID") or 0)..") \n`📑` **Mensagem:** Puxou o player: "..getPlayerName(targetPlayer).." ("..(getElementData(targetPlayer, "ID") or 0)..")")
  if getPedOccupiedVehicle(targetPlayer) then
    local veh = getPedOccupiedVehicle(targetPlayer)
    setVehicleTurnVelocity(veh, 0, 0, 0)
    setElementPosition(veh, x, y, z + 2)
    setTimer(setVehicleTurnVelocity, 50, 10, veh, 0, 0, 0)
    setElementInterior(veh, interior)
    setElementDimension(veh, dimension)
  else
    setElementPosition(targetPlayer, x, y, z+2)
    setElementInterior(targetPlayer, interior)
    setElementDimension(targetPlayer, dimension)
  end
else
  outputMessage(thePlayer, Apolo_Config.Mensagens["ErroPermissao"], "error")
end
end)
