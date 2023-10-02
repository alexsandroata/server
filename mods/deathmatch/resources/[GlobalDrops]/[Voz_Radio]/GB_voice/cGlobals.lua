voicePlayers = {}
globalMuted = {}
VolumeVoz = 5 

addEventHandler("onClientRender", root,
	function()
		local index = 0
		for player in pairs(voicePlayers) do
			local x,y,z = getElementPosition(localPlayer)
			local x2, y2, z2 = getElementPosition(player)
			local dist = getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)
			if dist <= 10 then
				local color = tocolor(255, 255, 255, 255)
				dxDrawVoiceLabel ( player, index, color )
				index = index + 1
			end
		end
	end
)

function dxDrawVoiceLabel ( player, index, color )
	local sx, sy = guiGetScreenSize ()
	local scale = sy / 800
	local spacing = ( 20 * scale )
	local px, py = sx - 200, sy * 0.7 + spacing * index

	px = px + spacing
	ID = getElementData (player, "ID") or "N/C"

	dxDrawText ( "["..ID.."] "..getPlayerName ( player ), px, py, px, py, tocolor(255, 255, 255, 195), 1.00, "default-bold", "left", "top", false, false, false, true, false)
end

addEventHandler ( "onClientPlayerVoiceStart", root,
    function()
		if (source and isElement(source) and getElementType(source) == "player") and localPlayer ~= source then 
			local call = (getElementData(localPlayer, 'Call') or false)
        	local callS = (getElementData(source, 'Call') or false) 
        	if (call and callS and (call == callS)) then 
            	voicePlayers[source] = true
            	setSoundVolume(source, VolumeVoz)
            	return
        	end
			if (getElementData(localPlayer, 'tr4jado.radinho')) and (getElementData(source, 'tr4jado.radinho')) and (getElementData(localPlayer, 'tr4jado.frequencia') == getElementData(source, 'tr4jado.frequencia')) and (not getElementData(source, 'tr4jado.muted')) then
				voicePlayers[source] = true
				setSoundVolume(source, 5)
				return
			end
			--if then [ TREM DO RADIN PDCS?]
            --  voicePlayers[source] = true
			--	setSoundVolume(source, VolumeVoz)
			--else 
            	if getDistanceBetweenPoints3D(Vector3(getElementPosition(source)), Vector3(getElementPosition(localPlayer))) < 10 then --and getElementData(localPlayer, "BMV:RadioAtivo") ~= true
                	voicePlayers[source] = true
					setSoundVolume(source, VolumeVoz)
            	else
                	cancelEvent()
            	end
			--end 
        end
    end
)

addEventHandler ( "onClientPlayerVoiceStop", root,
	function()
		voicePlayers[source] = nil
	end
)

addEventHandler ( "onClientPlayerQuit", root,
	function()
		voicePlayers[source] = nil
	end
)

---

function checkValidPlayer ( player )
	if not isElement(player) or getElementType(player) ~= "player" then
		outputDebugString ( "is/setPlayerVoiceMuted: Bad 'player' argument", 2 )
		return false
	end
	return true
end