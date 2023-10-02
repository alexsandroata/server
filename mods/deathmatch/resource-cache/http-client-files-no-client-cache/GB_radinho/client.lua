local screen = {guiGetScreenSize()} local x, y = (screen[1]/1366), (screen[2]/768)

local font = dxCreateFont('assets/font.ttf', 7)

local range = 16
local talking = false
local press = {}

local visible

function dxDraw()
	dxDrawRectangle(x * 1059, y * 18.58, x * 45, y * 46.58, tocolor(19, 19, 19, 255), false)
	dxDrawRectangle(x * 1059, y * 17, x * 45, y * 3.16, tocolor(102, 127, 201, 255), false)
	dxDrawImage(x * 1062.16, y * 21.74, x * 7.89, y * 7.89, 'assets/bolinha.png', 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x * 1070.05, y * 21.74, x * 23.68, y * 35.53, 'assets/radinho.png', 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText((getElementData(localPlayer, 'tr4jado.frequencia') or 0), x * 2135, y * 103, x * 4, y * 16, tocolor(255, 255, 255, 255), 1.00, font, "center", "center", false, false, false, false, false)
	if press then
		dxDrawImage(x * 1062.16, y * 21.74, x * 7.89, y * 7.89, press[localPlayer], 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawText((getElementData(localPlayer, 'tr4jado.frequencia') or 0), x * 2135, y * 103, x * 4, y * 16, tocolor(255, 255, 255, 255), 1.00, font, "center", "center", false, false, false, false, false)
	end
end

function function_radinho(button, state)
	if (state == 'down') then
		if (getElementData(localPlayer, 'tr4jado.radinho') == true) then
			if (getElementData(localPlayer, 'tr4jado.muted') == false) then
				press[localPlayer] = 'assets/bolinhaverde.png'
				playSound('assets/sounds/inicio.ogg')
				talking = true
			end
		end
	elseif (state == 'up') then
		if (getElementData(localPlayer, 'tr4jado.radinho') == true) then
			if (getElementData(localPlayer, 'tr4jado.muted') == false) then
				press[localPlayer] = 'assets/bolinha.png'
				playSound('assets/sounds/final.ogg')
				talking = false
			end
		end
	end
end
bindKey('z', 'down', function_radinho)
bindKey('z', 'up', function_radinho)

function openR(tipo)
	if tipo == 'true' then
		addEventHandler("onClientRender", root, dxDraw)
		press[localPlayer] = 'assets/bolinha.png'
	elseif tipo == 'false' then
		removeEventHandler("onClientRender", root, dxDraw)
    end
end
addEvent("S:Radio", true)
addEventHandler("S:Radio", root, openR)

local table_anim = {
	[5] = {0, 0, -30};
	[32] = {-30, -30, 50};
	[33] = {0, -160, 0};
	[34] = {-120, 0, 0};
}

addEventHandler('onClientPedsProcessed', getRootElement(),
	function()
		if (talking == true) then
			for i, v in pairs(table_anim) do
				setElementBoneRotation(localPlayer, i, v[1], v[2], v[3])
			end
			updateElementRpHAnim(localPlayer)
		end
	end
)