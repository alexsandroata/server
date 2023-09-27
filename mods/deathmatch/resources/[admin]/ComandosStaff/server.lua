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
			exports.FR_DxMessages:addBox(playerSource,"Você precisa entrar em serviço.", "error")
		end
	else
		exports.FR_DxMessages:addBox(playerSource,"Você não tem permissão.", "error")	
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
						exports.FR_DxMessages:addBox(playerSource,"Você criou o veículo: "..car.. " para o ID: "..id.."!", "warning")
							if (createdVehicle == false) then
							exports.FR_DxMessages:addBox(playerSource,"Não foi possível criar o veículo!", "error")
							end
						else
						exports.FR_DxMessages:addBox(playerSource,"Insira apenas números no ID.", "error")
						end
					else
					exports.FR_DxMessages:addBox(playerSource,"Insira o ID do veículo desejado.", "error")
					end
				else
				exports.FR_DxMessages:addBox(playerSource,"Digite /cv + ID do player + ID do veículo.", "error")
				end
			end
		else
		exports.FR_DxMessages:addBox(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		exports.FR_DxMessages:addBox(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	exports.FR_DxMessages:addBox(playerSource,"Você não tem permissão.", "error")
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
						exports.FR_DxMessages:addBox(playerSource,"Você setou o combustível do ID: "..id.." para "..amount.."%!", "warning")
					else
						exports.FR_DxMessages:addBox(playerSource,"Insira uma quantidade entre 0 e 100.", "error")
					end
					if (car == false) then
					exports.FR_DxMessages:addBox(playerSource,"O player não está em um veículo.", "error")
					end
				else
				exports.FR_DxMessages:addBox(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		exports.FR_DxMessages:addBox(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		exports.FR_DxMessages:addBox(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	exports.FR_DxMessages:addBox(playerSource,"Você não tem permissão.", "error")
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
						exports.FR_DxMessages:addBox(playerSource,"Você destruiu o veículo do ID: "..id.."!", "warning")
					else
						exports.FR_DxMessages:addBox(playerSource,"O player não está em um veículo.", "error")
					end
				else
				exports.FR_DxMessages:addBox(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		exports.FR_DxMessages:addBox(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		exports.FR_DxMessages:addBox(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	exports.FR_DxMessages:addBox(playerSource,"Você não tem permissão.", "error")
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
				exports.FR_DxMessages:addBox(playerSource,"Você consertou o veículo do ID: "..id.."!", "warning")
					if (car == false) then
					exports.FR_DxMessages:addBox(playerSource,"O player não está em um veículo.", "error")
					end
				else
				exports.FR_DxMessages:addBox(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		exports.FR_DxMessages:addBox(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		exports.FR_DxMessages:addBox(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	exports.FR_DxMessages:addBox(playerSource,"Você não tem permissão.", "error")
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
		exports.FR_DxMessages:addBox(playerSource,"Nenhum veículo próximo detectado.", "error")
		end
	else
		exports.FR_DxMessages:addBox(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	exports.FR_DxMessages:addBox(playerSource,"Você não tem permissão.", "error")
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
					exports.FR_DxMessages:addBox(playerSource,"A vida e colete do ID: "..id.." foi setada para 100%!", "warning")
				else
					exports.FR_DxMessages:addBox(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		exports.FR_DxMessages:addBox(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		exports.FR_DxMessages:addBox(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	exports.FR_DxMessages:addBox(playerSource,"Você não tem permissão.", "error")
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
					exports.FR_DxMessages:addBox(playerSource,"Você alterou a skin do ID: "..id.."!", "warning")
					else
					exports.FR_DxMessages:addBox(playerSource,"Insira o ID da skin desejada.", "error")
					end
				else
				exports.FR_DxMessages:addBox(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		exports.FR_DxMessages:addBox(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		exports.FR_DxMessages:addBox(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	exports.FR_DxMessages:addBox(playerSource,"Você não tem permissão.", "error")
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
				exports.FR_DxMessages:addBox(playerSource,"Você setou a fome e sede do ID: "..id.." para 100%!", "warning")
				else
				exports.FR_DxMessages:addBox(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		exports.FR_DxMessages:addBox(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		exports.FR_DxMessages:addBox(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	exports.FR_DxMessages:addBox(playerSource,"Você não tem permissão.", "error")
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
					exports.FR_DxMessages:addBox(playerSource,"Você setou R$"..amount.." para o player: "..id.."!", "warning")
					exports.FR_DxMessages:addBox(targetPlayer,"Você recebeu R$"..amount.." do governo!", "warning")
					else
					exports.FR_DxMessages:addBox(playerSource,"Insira uma quantidade.", "error")
					end
					else
					exports.FR_DxMessages:addBox(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		exports.FR_DxMessages:addBox(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		exports.FR_DxMessages:addBox(playerSource,"Você precisa entrar em serviço.", "error")
	end
else
	exports.FR_DxMessages:addBox(playerSource,"Você não tem permissão.", "error")
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
					exports.FR_DxMessages:addBox(playerSource,"Você reviveu o ID: "..id.."!", "warning")
				else
					exports.FR_DxMessages:addBox(playerSource,"O ID informado é inválido.", "error")
				end
			end
		else
		exports.FR_DxMessages:addBox(playerSource,"Insira o ID do jogador desejado.", "error")
		end
	else
		exports.FR_DxMessages:addBox(playerSource,"Você precisa entrar em serviço!", "error")
	end
else
	exports.FR_DxMessages:addBox(playerSource,"Você não tem permissão.", "error")
end
end
addCommandHandler( "reviver", Reviver )

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

function getOneACL(playerSource, cmd)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup (TagStaff)) then
		
		if not getElementData(playerSource, "staffOn") then
			local staff20 = getPlayerName( playerSource )
	    	setElementData(playerSource, 'staffOn', true )
			exports.FR_DxMessages:addBox(playerSource, "Você entrou em serviço!", "success")
			outputChatBox ('#ffff00' ..staff20.."#ffffff iniciou o serviço de STAFF!", root, 255, 255, 255, true )
	elseif getElementData(playerSource, "staffOn") then
		    local staff21 = getPlayerName( playerSource )
		    setElementData(playerSource, 'staffOn', false )
			exports.FR_DxMessages:addBox(playerSource, "Você saiu de serviço!", "success") 
			outputChatBox ('#ffff00'..staff21.."#ffffff finalizou o serviço de STAFF!", root, 255, 255, 255, true )
		end
	else
		exports.FR_DxMessages:addBox(playerSource, "Você não tem permissão.", "error")
	end
end
addCommandHandler("staff", getOneACL)