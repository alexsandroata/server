local screenW, screenH = guiGetScreenSize()
local resW, resH = 1920,1080
local x, y = (screenW/resW), (screenH/resH)

local screenW2, screenH2 = guiGetScreenSize()
local resW2, resH2 = 1360,768
local x2, y2 = (screenW2/resW2), (screenH2/resH2)
local AvisoTecla = false
local font3 = dxCreateFont("assets/font/fontt.ttf", 8)

bindKey(Config.ConfigRotas["Tecla Iniciar Rota"], "down",function()
        triggerServerEvent("NC.IniciarRota",localPlayer)
end)


bindKey(Config.ConfigRotas["Tecla Iniciar Rota"], "down",function()
if getElementData(localPlayer, "NC.Rota") == true then
        triggerServerEvent("NC.IniciarRota2",localPlayer)
    end
end)


addEventHandler("onClientRender",root,function()
    local Markers = getElementsWithinRange(Vector3(getElementPosition(localPlayer)), 15, "marker")
    if Markers and #Markers ~= 0 then
        for i, v in ipairs(Markers) do
            if getElementData(v, "NC.MarkerDroga") then
                if getElementData(localPlayer, "NC.Rota") then
    
                    dxDrawTextOnElement(v, "#ffffffPRESSIONE #00FF7F"..string.upper(Config.ConfigRotas["Tecla Iniciar Rota"]).." #ffffffPARA FINALIZAR A ROTA", 1.5, 15,255,255,255,255, 1.5)
                else
                    dxDrawTextOnElement(v, "#ffffffPRESSIONE #00FF7F"..string.upper(Config.ConfigRotas["Tecla Iniciar Rota"]).." #ffffffPARA INICIAR A ROTA", 1.5, 15,255,255,255,255, 1.5)
                end
            end
        end
    end
end)



function MensagemnaTela()
        dxDrawText("Aperta #00FF7FF7 #ffffffpara cancelar o destino\nVá até o destino e entregue tora.", x2*270+1, y2*725+1, x2*794+1, y2*700+1, tocolor(10, 10, 10), 1.0, font3, "left", "center", false, false, false, true, false)
        dxDrawText("Aperta #00FF7FF7 #ffffffpara cancelar o destino\nVá até o destino e entregue tora.", x2*270, y2*725, x2*794, y2*700, tocolor(255, 255, 255), 1.0, font3, "left", "center", false, false, false, true, false)
    end


addEvent("NIGHT>MSG",true)
addEventHandler("NIGHT>MSG",root,
function()
    if AvisoTecla == false then
        addEventHandler("onClientRender",root,MensagemnaTela)
        AvisoTecla = true
    end
end)

addEvent("NIGHT>SAIR",true)
addEventHandler("NIGHT>SAIR",root,
function()
if AvisoTecla == true then
removeEventHandler("onClientRender",root,MensagemnaTela)
AvisoTecla = false
    end
end)


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
				--dxDrawRectangle(sx-95, sy-12, sx - 185, 20, tocolor(0, 0, 0, 100))
				dxDrawText(text, sx+2, sy+2, sx, sy, tocolor(R or 255, G or 255, B or 255, alpha or 255), (size or 1)-(distanceBetweenPoints / distance), font or font3, "center", "center",false,false,false,true)
			end
		end
	end
end


Posicoes = {
    [1] = {
        Botao = {1324, 237, 245, 48},
        Quadrados = {
            {555,293},
            {704,293},
            {853,293},
            {1002,293},
        },
        Arco = {555,237},
        QuadradoPrincipal = {355,237},
        Desc = {1213,293},
        Fundo2 = {335,214},
    },

    [2] = {
        Botao = {1324, 482, 245, 48},
        Quadrados = {
            {555,538},
            {704,538},
            {853,538},
            {1002,538},
        },
        Arco = {555,482},
        QuadradoPrincipal = {355,482},
        Desc = {1213,538},
        Fundo2 = {335,459},
    },
    
    [3] = {
        Botao = {1324, 727, 245, 48},
        Quadrados = {
            {555,783},
            {704,783},
            {853,783},
            {1002,783},
        },
        Arco = {555,727},
        QuadradoPrincipal = {355,727},
        Desc = {1213,783},
        Fundo2 = {335,704},
    },
}

local dxfont0_font = dxCreateFont("assets/font/font.ttf", y*14)
local dxfont1_font = dxCreateFont("assets/font/font.ttf", y*16)
local dxfont2_font = dxCreateFont("assets/font/font.ttf", y*11)

Abas = {}

addEvent("NC.AbrirFabricação",true)
addEventHandler("NC.AbrirFabricação",root,function(drogas)
    if isEventHandlerAdded("onClientRender",root,dxFabrica) then
        removeEventHandler("onClientRender",root,dxFabrica)
    end
    addEventHandler("onClientRender",root,dxFabrica,true,"low-5")
    showCursor(true)
    Drogas = drogas
    tick = getTickCount()
    for i = 1,3 do
        Abas[i] = i
    end
end)

function getDescription(index)
    Desc = ""
    for i, v in ipairs(Drogas[index].Componentes) do
        Desc = Desc.."\n"..v.QuantidadeMinima.."x "..v.Nome
    end
    Desc = Desc.."\nDINHEIRO : R$ "..Config.ConfigRotas["Dinheiro Fabricar"]..",00"
    return Desc
end

function dxFabrica()
    local Alpha = interpolateBetween(0,0,0,255,0,0,(getTickCount() - tick)/500, "Linear")
    exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, x*1920, y*1080, tocolor(255, 255, 255, Alpha))
    dxDrawImage(x*0, y*0, x*1920, y*1080, "assets/img/fundo.png", 0, 0, 0, tocolor(255, 255, 255, Alpha), false)
    for i = 1,#Posicoes do
        local Index = Abas[i]
        if #Drogas >= Index then
            local Nome = Drogas[Index].Nome
            local Diretorio = Drogas[Index].Diretorio
            dxDrawImage(x*Posicoes[i].Fundo2[1], y*Posicoes[i].Fundo2[2],x*1249,y*220, "assets/img/fundo2.png", 0, 0, 0, tocolor(255, 255, 255, Alpha), false)
            dxDrawImage(x*Posicoes[i].Arco[1], y*Posicoes[i].Arco[2],x*1014,y*48, "assets/img/arco.png", 0, 0, 0, tocolor(255, 255, 255, Alpha), false)
            dxDrawText("FABRICA:", x*353, y*161, x*535, y*190, tocolor(255, 255, 255, Alpha), 1.00, dxfont1_font, "left", "top", false, false, false, false, false)
            dxDrawImage(x*Posicoes[i].Botao[1], y*Posicoes[i].Botao[2], x*Posicoes[i].Botao[3], y*Posicoes[i].Botao[4], "assets/img/botao.png", 0, 0, 0, (isCursorOnElement(x*Posicoes[i].Botao[1], y*Posicoes[i].Botao[2], x*Posicoes[i].Botao[3], y*Posicoes[i].Botao[4]) and tocolor(1, 239, 127, Alpha) or tocolor(0, 255, 127, Alpha)), false)
            
            local weight, height = dxGetTextWidth("FABRICAR", 1, dxfont0_font), dxGetFontHeight(1,dxfont0_font )
            local posXText = (x*(Posicoes[i].Botao[1] -2) + x*(Posicoes[i].Botao[3]/2)) - (weight/2)
            local posYText = (y*(Posicoes[i].Botao[2] - 2) + y*(Posicoes[i].Botao[4]/2)) - (height/2)
            dxDrawText("FABRICAR", posXText, posYText, x*1543, y*275, (isCursorOnElement(x*Posicoes[i].Botao[1], y*Posicoes[i].Botao[2], x*Posicoes[i].Botao[3], y*Posicoes[i].Botao[4]) and tocolor(156, 156, 156, Alpha) or tocolor(255, 255, 255, Alpha)), 1.00, dxfont0_font, "left", "top", false, false, false, false, false)
            dxDrawImage(x*Posicoes[i].QuadradoPrincipal[1], y*Posicoes[i].QuadradoPrincipal[2],x*184,y*174, "assets/img/quadrado2.png", 0, 0, 0, tocolor(255, 255, 255, Alpha), false)
            
            local posX = (Posicoes[i].QuadradoPrincipal[1] + (184/2)) - (120/2)
            local posY = (Posicoes[i].QuadradoPrincipal[2] + (174/2)) - (120/2)
            local posW, posH = Drogas[Index].TamanhoImagem[1],Drogas[Index].TamanhoImagem[2]
            dxDrawImage(x*posX, y*posY, x*posW, y*posH, ":[GlobalDrops]InventarioCompleto/assets/icons/"..Diretorio..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(x*Posicoes[i].Desc[1], y*Posicoes[i].Desc[2],x*356,y*118, "assets/img/desc.png", 0, 0, 0, tocolor(255, 255, 255, Alpha), false)
            for k, v in ipairs(Posicoes[i].Quadrados) do
                dxDrawImage(x*v[1], y*v[2], x*128, y*118, "assets/img/quadrado.png", 0, 0, 0, tocolor(255, 255, 255, Alpha), false)
            end
            for k, v in ipairs(Drogas[Index].Componentes) do
                local posX2 = (Posicoes[i].Quadrados[k][1] + (128/2)) - (v.Tamanho[1]/2)
                local posY2 = (Posicoes[i].Quadrados[k][2] + (118/2)) - (v.Tamanho[2]/2)
                dxDrawImage(x*posX2, y*posY2, x*v.Tamanho[1], y*v.Tamanho[2], ":[GlobalDrops]InventarioCompleto/assets/icons/"..v.ID..".png", 0, 0, 0, tocolor(255, 255, 255, Alpha), false)
            end
            dxDrawText(Nome, x*(Posicoes[i].Arco[1] + 15), y*(Posicoes[i].Arco[2] + 10), x*752, y*275, tocolor(255, 255, 255, 255), 1.00, dxfont0_font, "left", "top", false, false, false, false, false)
            dxDrawText(getDescription(Index), x*(Posicoes[i].Desc[1] + 14), y*(Posicoes[i].Desc[2] - 8), x*1409, y*332, tocolor(255, 255, 255, 255), 1.00, dxfont2_font, "left", "top", false, false, false, false, false)
        end
    end
end

function ScrollBar(b)
    if isEventHandlerAdded("onClientRender",root,dxFabrica) then
        if isCursorOnElement(x*335, y*216, x*1249, y*708) then
            if b == "mouse_wheel_up" then
                if Abas[1] ~= 1 then
                    for i = 1,#Abas do
                        Abas[i] = Abas[i] - 1
                    end
                end
            elseif b == "mouse_wheel_down" then
                if #Drogas > Abas[#Abas] then
                    for i = 1,#Abas do
                        Abas[i] = Abas[i] + 1
                    end
                end
            end
        end
    end
end
bindKey("mouse_wheel_up", "down", ScrollBar)
bindKey("mouse_wheel_down", "down", ScrollBar)

addEventHandler("onClientClick",root,function(b,s)
    if isEventHandlerAdded("onClientRender",root,dxFabrica) then
        if b == "left" and s == "down" then
            for i = 1,#Posicoes do
                if isCursorOnElement(x*Posicoes[i].Botao[1], y*Posicoes[i].Botao[2], x*Posicoes[i].Botao[3], y*Posicoes[i].Botao[4]) then
                    local Index = Abas[i]
                    if #Drogas >= Index then
                        triggerServerEvent("NC.FabricarDroga",localPlayer,Drogas[Index] )
                        if isEventHandlerAdded("onClientRender",root,dxFabrica) then
                            removeEventHandler("onClientRender",root,dxFabrica)
                            showCursor(false)
                        end
                    end
                end
            end
        end
    end
end)

bindKey("backspace","down",function()
    if isEventHandlerAdded("onClientRender",root,dxFabrica) then
        removeEventHandler("onClientRender",root,dxFabrica)
        showCursor(false)
    end
end)

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end

function isCursorOnElement(x, y, w, h)
	if (not isCursorShowing()) then
		return false
	end
	local mx, my = getCursorPosition()
	local fullx, fully = guiGetScreenSize()
	cursorx, cursory = mx*fullx, my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end

addEventHandler("onClientPedDamage",root,function()
    if getElementData(source, "NC.PedVerify") then
        cancelEvent()
    end
end)

addEventHandler("onClientPlayerStealthKill",root,function(target)
    if getElementData(target, "NC.PedVerify") then
        cancelEvent()
    end
end)

