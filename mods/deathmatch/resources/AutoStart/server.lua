﻿scripts = {
	[1] = {
		--admin
		"admin",
		--xela
		"XELA_Admin",
		"XELA_HUD",
		"XELA_Notify",
		"XELA_Maps",
		--essential
		"SaveSystem",
		"SpawnConfig",
		"TB_id",
		--shaders
		
		--maps
		"MAPA-LOJA-DE-ROUPA",

		--texture
		"Txr_Jetdoor[MTA]",
		"Txr_Madeira16500-16501[MTA]",
		"Txr_Porta2[MTA]",
		"Txr_Ruas[MTA]",
		"Txr_Vidro[MTA]",

		"PainelLogin",
	},
}

function startServer(id)
	local sucess = 0
	local fail = 0
	local att = 0
	local size = #scripts[(id)]	
	for i=1 , size do
		local resource = getResourceFromName(scripts[tonumber(id)][tonumber(i)])
		if (resource) then
			resstate = startResource(resource, true)
			if resstate then
				sucess = sucess + 1
				outputDebugString("Recurso: '"..scripts[tonumber(id)][tonumber(i)].."' iniciado!" )	
			else
				att = att + 1
			end
		else
			fail = fail + 1
			outputDebugString("Recurso: '"..scripts[tonumber(id)][tonumber(i)].."' não encontrado, indo para o próximo...")
		end
	end
end

function displayLoadedRes ( res )
    local thisResource = getThisResource ( )
    local resourceName = getResourceName ( thisResource )
	if res == thisResource then
	    startServer ( tonumber ( 1 ) )
	end
end
addEventHandler ( "onResourceStart", getRootElement ( ), displayLoadedRes )