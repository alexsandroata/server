
----------------/ logs dc \----------------
function msg(mensagem)
	local data = {
		content = "",
		username = Config.Discord["UserName"],
		avatar_url = Config.Discord["AvatarUrl"],
		embeds = {
			{
				title = Config.Discord["TituloEmbed"],
				color = Config.Discord["ColorEmbed"],
				description = ""..mensagem.."",
				footer = {
					text = Config.Discord["MsgDireitos"],
					icon_url = Config.Discord["IconUrl"],
				},
					image = {
					  url = Config.Discord["ImageUrl"],
					},
					thumbnail = { 
					  url = Config.Discord["ThumbnailUrl"],
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
  
	fetchRemote ( Config.Url["UrlDiscord"], sendOptions, WebhookCallback )
  end
  
  function  WebhookCallback()
  end

  function webComando(mensagem)
	local data = {
		content = "",
		username = Config.Discord["UserName"],
		avatar_url = Config.Discord["AvatarUrl"],
		embeds = {
			{
				title = Config.Discord["TituloEmbed"],
				color = Config.Discord["ColorEmbed"],
				description = ""..mensagem.."",
				footer = {
					text = Config.Discord["MsgDireitos"],
					icon_url = Config.Discord["IconUrl"],
				},
					image = {
					  url = Config.Discord["ImageUrl"],
					},
					thumbnail = { 
					  url = Config.Discord["ThumbnailUrl"],
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
  
	fetchRemote ( Config.Url["UrlDiscord"], sendOptions, WebhookCallback )
  end
  
  function  WebhookCallback()
  end
  ----------------/ logs dc \----------------

local TagStaff = "Staff"
local TagFundador = "Console"

function getPlayerID(id)
    v = false
    for i, player in ipairs (getElementsByType("player")) do
        if getElementData(player, "ID") == id then
            v = player
            break
        end
    end
    return v
end

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

function fly(playerSource, commandName)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup (TagStaff)) then
		if getElementData(playerSource, "staffOn", false) then
			if getElementData( playerSource, "ULTRP:StaffFly" ) == false then
			triggerClientEvent(playerSource, "onClientFlyToggle", playerSource)
				setElementAlpha( playerSource, 0)
				setElementData( playerSource, "ULTRP:StaffFly", true )
			else
				triggerClientEvent(playerSource, "onClientFlyToggle", playerSource)
				setElementAlpha( playerSource, 1000)
				setElementData( playerSource, "ULTRP:StaffFly", false )
			end
		else
			message(playerSource,"Você precisa entrar em serviço.", "error")
		end
	else
		message(playerSource,"Você não tem permissão.", "error")	
	end
end
addCommandHandler("nc", fly, false, false)

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

function CriarCarro(playerSource,commandName,id,vehicleModel)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup (TagFundador)) then
	if getElementData(playerSource, "staffOn", false) then		
    	if(id) then
        local playerID = tonumber(id)
			if(playerID) then
			local targetPlayer = getPlayerID(playerID)
				if targetPlayer then
					if vehicleModel then
						if tonumber(vehicleModel) then
						local x,y,z = getElementPosition(targetPlayer) 
						local createdVehicle = createVehicle(tonumber(vehicleModel),x,y,z)
						local car = getVehicleNameFromModel ( vehicleModel )
						warpPedIntoVehicle( targetPlayer, createdVehicle, 0 )
						setElementData(createdVehicle, 'Owner', playerSource)
						message(playerSource,"Você criou o veículo: "..car.. " para o ID: "..id.."!", "warning")
							if (createdVehicle == false) then
							message(playerSource,"Não foi possível criar o veículo!", "error")
							end
						else
						message(playerSource,"Insira apenas números no ID.", "error")
						end
					else
					message(playerSource,"Insira o ID do veículo desejado.", "error")
					end
				else
				message(playerSource,"Digite /cv + ID do player + ID do veículo.", "error")
				end
			end
		else
		message(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		message(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	message(playerSource,"Você não tem permissão.", "error")
end
end
addCommandHandler( "cv", CriarCarro )

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

function setGas(playerSource,commandName,id,amount)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup (TagStaff)) then
	if getElementData(playerSource, "staffOn", false) then	
    	if(id) then
        local playerID = tonumber(id)
			if(playerID) then
			local targetPlayer = getPlayerID(playerID)
				if targetPlayer then
					if amount then
						local car = getPedOccupiedVehicle( targetPlayer )
						local model = getElementModel( car )
						setElementData(car, "MD:Gasolina", tonumber(amount))
						message(playerSource,"Você setou o combustível do ID: "..id.." para "..amount.."%!", "warning")
					else
						message(playerSource,"Insira uma quantidade entre 0 e 100.", "error")
					end
					if (car == false) then
					message(playerSource,"O player não está em um veículo.", "error")
					end
				else
				message(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		message(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		message(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	message(playerSource,"Você não tem permissão.", "error")
end
end
addCommandHandler( "setgas", setGas)

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

function DV(playerSource,commandName,id, quant)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup (TagStaff)) then
	if getElementData(playerSource, "staffOn", false) then
    	if(id) then
        local playerID = tonumber(id)
			if(playerID) then
			local targetPlayer = getPlayerID(playerID)
				if targetPlayer then
					local car = getPedOccupiedVehicle( targetPlayer )
					if isElement(car) and car then
						local model = getElementModel( car )
						destroyElement(car)
						message(playerSource,"Você destruiu o veículo do ID: "..id.."!", "warning")
					else
						message(playerSource,"O player não está em um veículo.", "error")
					end
				else
				message(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		message(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		message(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	message(playerSource,"Você não tem permissão.", "error")
end
end
addCommandHandler( "dv", DV)

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

function Fix(playerSource,commandName,id)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup (TagStaff)) then
	if getElementData(playerSource, "staffOn", false) then
    	if(id) then
        local playerID = tonumber(id)
			if(playerID) then
			local targetPlayer = getPlayerID(playerID)
				if targetPlayer then
				local car = getPedOccupiedVehicle( targetPlayer )
				fixVehicle( car )
				message(playerSource,"Você consertou o veículo do ID: "..id.."!", "warning")
					if (car == false) then
					message(playerSource,"O player não está em um veículo.", "error")
					end
				else
				message(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		message(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		message(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	message(playerSource,"Você não tem permissão.", "error")
end
end
addCommandHandler( "fix", Fix)
	
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

function getNearestVehicle(thePlayer, distance)
    local lastMinDis = distance-0.0001
    local veicProximo = false
    local px,py,pz = getElementPosition(thePlayer)
    local pInt = getElementInterior(thePlayer)
    local pDim = getElementDimension(thePlayer)
    for _, e in pairs(getElementsByType('vehicle')) do
        local eInt,eDim = getElementInterior(e),getElementDimension(e)
        if eInt == pInt and eDim == pDim and e ~= thePlayer then
            local ex,ey,ez = getElementPosition(e)
            local dis = getDistanceBetweenPoints3D(px,py,pz,ex,ey,ez)
            if dis < distance then
                if dis < lastMinDis then
                    lastMinDis = dis
                    veicProximo = e
                end
            end
        end
    end
    return veicProximo
end

function DVArea(playerSource,commandName)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup (TagStaff)) then
	if getElementData(playerSource, "staffOn", false) then
	   	local vehicleNear = getNearestVehicle(playerSource, 2.5)
	   	if vehicleNear then 
	   		destroyElement( vehicleNear )
		else
		message(playerSource,"Nenhum veículo próximo detectado.", "error")
		end
	else
		message(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	message(playerSource,"Você não tem permissão.", "error")
end
end
addCommandHandler( "dva", DVArea)

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

function Full(playerSource,commandName,id)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup (TagStaff)) then
	if getElementData(playerSource, "staffOn", false) then
    	if(id) then
        local playerID = tonumber(id)
			if(playerID) then
			local targetPlayer = getPlayerID(playerID)
				if targetPlayer then
					setElementHealth( targetPlayer, 100 )
					setPedArmor( targetPlayer, 100 )
					message(playerSource,"A vida e colete do ID: "..id.." foi setada para 100%!", "warning")
				else
					message(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		message(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		message(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	message(playerSource,"Você não tem permissão.", "error")
end
end
addCommandHandler( "setfull", Full )

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

function SetSkin(playerSource,commandName,id,skin)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup (TagFundador)) then
	if getElementData(playerSource, "staffOn", false) then
    	if(id) then
        local playerID = tonumber(id)
			if(playerID) then
			local targetPlayer = getPlayerID(playerID)
				if targetPlayer then
					if skin then
					setElementModel( targetPlayer, skin )
					message(playerSource,"Você alterou a skin do ID: "..id.."!", "warning")
					else
					message(playerSource,"Insira o ID da skin desejada.", "error")
					end
				else
				message(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		message(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		message(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	message(playerSource,"Você não tem permissão.", "error")
end
end
addCommandHandler( "ss", SetSkin )

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

function SetFome(playerSource,commandName,id)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup (TagStaff)) then
	if getElementData(playerSource, "staffOn", false) then
    	if(id) then
        local playerID = tonumber(id)
			if(playerID) then
			local targetPlayer = getPlayerID(playerID)
				if targetPlayer then
				setElementData( targetPlayer, "fome", 100 )
				setElementData( targetPlayer, "sede", 100 )
				message(playerSource,"Você setou a fome e sede do ID: "..id.." para 100%!", "warning")
				else
				message(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		message(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		message(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	message(playerSource,"Você não tem permissão.", "error")
end
end
addCommandHandler( "setfome", SetFome )

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

function GiveMoney(playerSource,commandName,id,amount)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup (TagFundador)) then
	if getElementData(playerSource, "staffOn", false) then
    	if(id) then
        local playerID = tonumber(id)
			if(playerID) then
			local targetPlayer = getPlayerID(playerID)
				if targetPlayer then
					if amount then
					givePlayerMoney( targetPlayer, amount )
					message(playerSource,"Você setou R$"..amount.." para o player: "..id.."!", "warning")
					message(targetPlayer,"Você recebeu R$"..amount.." do governo!", "warning")
					else
					message(playerSource,"Insira uma quantidade.", "error")
					end
					else
					message(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		message(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		message(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	message(playerSource,"Você não tem permissão.", "error")
end
end
addCommandHandler( "setmoney", GiveMoney )

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

function Reviver(playerSource,commandName,id)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup (TagStaff)) then
	if getElementData(playerSource, "staffOn", false) then
    	if(id) then
        local playerID = tonumber(id)
			if(playerID) then
			local targetPlayer = getPlayerID(playerID)
				if targetPlayer then
				local staff3 = getPlayerName( playerSource )
					setElementHealth( targetPlayer, 100 )
					setPedAnimation( targetPlayer, nil )
					setElementFrozen(targetPlayer, false )
					message(playerSource,"Você reviveu o ID: "..id.."!", "warning")
				else
					message(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		message(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		message(playerSource,"Você precisa entrar em serviço!", "error")
	end
else
	message(playerSource,"Você não tem permissão.", "error")
end
end
addCommandHandler( "reviver", Reviver )

----------------------------------
--------TP NAS CORDENADAS---------
----------------------------------

function tpcord(playerSource, cmd, x, y, z)
	if isObjectInACLGroup ( 'user.' ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup (TagStaff)) then
		if (getElementData(playerSource, 'staffOn') or false) == true then
	   		if x then
				setElementPosition(playerSource, x, y, z)
				if isPedInVehicle(playerSource) then
					local theVehicle = getPedOccupiedVehicle ( playerSource )
					setElementPosition(playerSource, x, y, z)
					message(playerSource,"Saia do veiculo para usar este comando", "error")
				else 
					message(playerSource,"Você foi para a cordenada desejada", "success")
					local staff66 = getPlayerName( playerSource )
					webComando("O Staff "..staff66.."\nteleportou para as cordenadas ".. x ..", "..y..", "..x)
				end
		    end
		else
			message(playerSource,"Você precisa entrar em serviço!", "warning")
	   end
	else
	   message(playerSource, "Você não tem permissão.", "error")
   end
end
addCommandHandler("tpcord", tpcord)	

----------------------------------
--------ENTRAR DE SERVIÇO---------
----------------------------------
function getOneACL(playerSource, cmd)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup (TagStaff)) then
		
		if not getElementData(playerSource, "staffOn") then
			local staff20 = getPlayerName( playerSource )
	    	setElementData(playerSource, 'staffOn', true )
			message(playerSource, "Você entrou em serviço!", "success")
			msg("O Staff "..staff20.."\nEntrou de serviço de Serviço")
			outputChatBox ('#ffff00' ..staff20.."#ffffff iniciou o serviço de STAFF!", root, 255, 255, 255, true )
	elseif getElementData(playerSource, "staffOn") then
		    local staff21 = getPlayerName( playerSource )
		    setElementData(playerSource, 'staffOn', false )
			message(playerSource, "Você saiu de serviço!", "success")
			msg("O Staff "..staff21.."\nSaiu de serviço de Staff") 
			outputChatBox ('#ffff00'..staff21.."#ffffff finalizou o serviço de STAFF!", root, 255, 255, 255, true )
		end
	else
		message(playerSource, "Você não tem permissão.", "error")
	end
end
addCommandHandler("staff", getOneACL)


