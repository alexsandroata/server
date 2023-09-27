scripts = {
	[1] = {
		--admin
		"admin",
		"ComandosStaff",
		--essential
		"Blur",
		"bone_attach",
		"Cursor",
		"dgs",
		"FR_DxMessages",
		"infobox",
		"n3xt_dxmessages",
		"object_preview",
		"SaveSystem",
		"SpawnConfig",
		--fx
		"dl_shader_detail",
		"shader_car_paint_reflect",
		"shader_dynamic_sky",
		"shader_water_refract",
		"shader_watershine",
		--maps
		"Mapa-Concessionaria",
		--n3xt
		"n3xt_concessionaria",
		"n3xt_inventario",
		--scripts
		"Banco",
		"Chat",
		"FomeSede",
		"getpos",
		"Hud",
		"RadarMinimapa",
		"SistemaGasolina",
		"Velocimetro",
		--skins

		--vehicles
		"[411]lambo-essenza",
			
		--start por ultimo
		"infobox",
		"RadarMinimapa",
		"Hud",
		"FomeSede",
		"FR_DxMessages",
		"Banco",
		"Blur",
		"Cursor",
		"star_assets",
		"star_inventario",
		"getpos",

		"bone_attach",
		"dgs",
		"Mapa-Concessionaria",
		"n3xt_dxmessages",
		"object_preview",
		"n3xt_concessionaria",

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