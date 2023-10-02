--- ░█████╗░░█████╗░███╗░░██╗████████╗██╗░░░██╗ ░░██╗░░░░██╗██╗░░
--- ██╔══██╗██╔══██╗████╗░██║╚══██╔══╝██║░░░██║  ░██╔╝░░░██╔╝╚██╗░
--- ██║░░╚═╝███████║██╔██╗██║░░░██║░░░██║░░░██║  ██╔╝░░░██╔╝░░╚██╗
--- ██║░░██╗██╔══██║██║╚████║░░░██║░░░██║░░░██║  ╚██╗░░██╔╝░░░██╔╝
--- ╚█████╔╝██║░░██║██║░╚███║░░░██║░░░╚██████╔╝  ░╚██╗██╔╝░░░██╔╝░
--- ░╚════╝░╚═╝░░╚═╝╚═╝░░╚══╝░░░╚═╝░░░░╚═════╝░  ░░╚═╝╚═╝░░░░╚═╝░░

--- Qualquer duvida: Cantu#5945
--- Qualquer duvida: Cantu#0764
--- Qualquer duvida: Cantu#0007
--- Qualquer duvida: @cantuzinho

bindKey(Config.Home.TeclaEntrarSairComprar,"down",function(b)
    triggerServerEvent("MST.RedirectHome",localPlayer,b)
end)

bindKey(Config.Home.TeclaTrancar,"down",function(b)
    triggerServerEvent("MST.RedirectHome",localPlayer,b)
end)

addEventHandler("onClientRender",root,function()
    local Markers = getElementsWithinRange(Vector3(getElementPosition(localPlayer)), 10, "marker")
    if Markers and #Markers ~= 0 then
        for _, v in ipairs(Markers) do
            local x,y,z = getElementPosition(localPlayer)
            local cx,cy,cz = getCameraMatrix()
            if isLineOfSightClear(cx, cy, cz, x,y,z, true, false, false) then
                local Infos = getElementData(v, "MST.VerifyHome")
                if Infos then
                    local x2,y2,z2 = getElementPosition(v)
                    if Infos[2] == "Enter" then
                        if type(Infos[3]) ~= "table" then
                            local Valor = Infos[3]
                            dxDrawTextOnElement(v, "Propriedade a Venda por #424949R$ "..Valor..",00\n #ffffffPressione #424949["..string.upper(Config.Home.TeclaEntrarSairComprar).."] #ffffffPara Adquirir a Residência", 1, 10, 255,255,255,255, 2, "default-bold")
                        else
                            local Owner = Infos[3][1]
                            local Locked = Infos[3][2]
                            local ID = Infos[3][3]
                            dxDrawTextOnElement(v, "Propriedade de: #424949"..Owner.." #ffffffID: #424949"..ID.."\n#ffffffPorta #424949"..(Locked == "true" and "Trancada" or "Aberta").."\n#ffffffPressione #424949"..string.upper(Config.Home.TeclaTrancar).." #ffffffPara Trancar #424949| #ffffffPressione #424949"..string.upper(Config.Home.TeclaEntrarSairComprar).." #ffffffPara Entrar", 1, 10, 255,255,255,255, 2, "default-bold")
                        end
                    elseif Infos[2] == "Exit" then
                        dxDrawTextOnElement(v, "Pressione #424949["..string.upper(Config.Home.TeclaEntrarSairComprar).."] #ffffffPara Sair da Residência", 1, 10, 255,255,255,255, 2, "default-bold")
                    end
                end
            end
        end
    end
end)

local screenW, screenH = guiGetScreenSize ()
local resW, resH = 1920,1080
local x, y = (screenW/resW), (screenH/resH)

local dxfont0_RobotoRegular = dxCreateFont("assets/font/RobotoRegular.ttf", x*12)
local dxfont1_RobotoRegular = dxCreateFont("assets/font/RobotoRegular.ttf", x*10)



addEvent("MST.OferecerVenda",true)
addEventHandler("MST.OferecerVenda",root,function(idh, valor, vendedor)
    if not Venda then
        Venda = true
    end
    if Timer and isTimer(Timer) then
        killTimer(Timer)
    end
    Valor = valor
    IDh = idh
    Vendedor = vendedor
    tick = getTickCount()
    Timer = setTimer(function()
        Venda = false
    end,10000,1)
end)

function Homes(b)
    if Venda then
        if b == "q" then
            Venda = false
        elseif b == "e" then
            triggerServerEvent("MST.AceitarHome",localPlayer, IDh, Valor, Vendedor)
            Venda = false
        end
    end
end
bindKey("e", "down", Homes)
bindKey("q", "down", Homes)

addEventHandler("onClientRender", root,
    function()
        if Venda then
            local posX = interpolateBetween(2000, 0, 0, 1480, 0, 0, (getTickCount() - tick)/500, "Linear")
            dxDrawImage(x*posX, y*102, x*425, y*64, "assets/img/fundo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(x*(posX + 15), y*111, x*49, y*45, "assets/img/button.png", 0, 0, 0, tocolor(111, 33, 211, 255), false)
            dxDrawImage(x*(posX + 77), y*111, x*49, y*45, "assets/img/button.png", 0, 0, 0, tocolor(211, 33, 33, 255), false)
            dxDrawText("E", x*(posX + 34), y*123, x*1563, y*168, tocolor(255, 255, 255, 255), 1.00, dxfont0_RobotoRegular, "left", "top", false, false, false, false, false)
            dxDrawText("Q", x*(posX + 95), y*123, x*1624, y*168, tocolor(255, 255, 255, 255), 1.00, dxfont0_RobotoRegular, "left", "top", false, false, false, false, false)
            dxDrawText("Pressione [E] para Aceitar ou [Q] Para Recusar\na Venda da Residência | Valor : R$"..Valor..",00", x*(posX + 133), y*118, x*1867, y*158, tocolor(255, 255, 255, 255), 1.00, dxfont1_RobotoRegular, "left", "top", false, false, false, false, false)
        end
    end
)

function dxDrawTextOnElement(TheElement,text,height,distance,R,G,B,alpha,size,font,...)
	local x, y, z = getElementPosition(TheElement)
	local x2, y2, z2 = getCameraMatrix()
	local distance = distance or 20
	local height = height or 1

	if (isLineOfSightClear(x, y, z+2, x2, y2, z2, ...)) then
		local sx, sy = getScreenFromWorldPosition(x, y, z+height)
		if(sx) and (sy) then
			local distanceBetweenPoints = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
			if(distanceBetweenPoints < distance) then
				dxDrawText(text, sx+2, sy+2, sx, sy, tocolor(R or 255, G or 255, B or 255, alpha or 255), (size or 1)-(distanceBetweenPoints / distance), font or "arial", "center", "center",false,false,false,true)
			end
		end
	end
end