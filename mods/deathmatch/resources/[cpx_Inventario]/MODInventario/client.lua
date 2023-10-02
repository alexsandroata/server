--  ____    ______   _____  
-- |  _ \  |  ____| |  __ \ 
-- | |_) | | |__    | |__) |
-- |  _ <  |  __|   |  _  / 
-- | |_) | | |____  | | \ \ 
-- |____/  |______| |_|  \_\

-----------------------------------------------------------------------------------------------------------------------------------------





local screenW, screenH = guiGetScreenSize()
local resW, resH = 1920,1080
local res2, resH2 = 1366, 768
local x, y = (screenW/resW), (screenH/resH)
local sx, sy = (screenW/res2), (screenH/resH2)


isInventoryVisible = false
isTradeVisible = false
local isReceivingTrade = false
local assassino = nil
local tableTrade = nil
local loggedIn = false
peso = 0
local itemTrade = nil
local playerTrade = nil
local gangBox = nil
local isDocVisible = false
local document = nil
local color1 = nil
local color2 = nil
local alpha1 = 0
local alpha2 = 0


local editQuantidade = guiCreateEdit(0.51, 0.485, 0.05, 0.03, "1", true)
local editValor = guiCreateEdit(0.51, 0.525, 0.05, 0.03, "0", true)
guiSetVisible(editQuantidade, false)
guiSetVisible(editValor, false)
guiEditSetMaxLength(editQuantidade, 6)
guiEditSetMaxLength(editValor, 6)
guiSetAlpha(editQuantidade, 0)
guiSetAlpha(editValor, 0)
local editQuantidade2 = guiCreateEdit(0.51, 0.485, 0.05, 0.03, "1", true)
guiSetVisible(editQuantidade2, false)
guiEditSetMaxLength(editQuantidade2, 6)
guiSetAlpha(editQuantidade2, 0)
local editQuantidade3 = guiCreateEdit(0.51, 0.485, 0.05, 0.03, "1", true)
guiSetVisible(editQuantidade3, false)
guiEditSetMaxLength(editQuantidade3, 6)
guiSetAlpha(editQuantidade3, 0)
local windowBau = guiCreateWindow(0.40, 0.24, 0.20, 0.52, "BAÚ", true)
guiSetVisible(windowBau, false)
guiWindowSetSizable(windowBau, false)
local quantidadeBau = guiCreateEdit(0.04, 0.78, 0.93, 0.07, "Quantidade", true, windowBau)
local pegarBau = guiCreateButton(0.04, 0.88, 0.43, 0.09, "PEGAR", true, windowBau)
guiSetFont(pegarBau, "default-bold")
fecharBau = guiCreateButton(0.53, 0.88, 0.43, 0.09, "FECHAR", true, windowBau)
guiSetFont(fecharBau, "default-bold")
trashs = {}

function onStart()
    font1 = dxCreateFont("fontes/Roboto.ttf", 9)
    font2 = dxCreateFont("fontes/RobotoBold.ttf", 10)
    font3 = dxCreateFont("fontes/Roboto.ttf", 10)
	for i, v in pairs(TrashPositions) do
		trashs[i] = createObject(1359, TrashPositions[i][1], TrashPositions[i][2], TrashPositions[i][3] - 0.3)
	end
end
addEventHandler("onClientResourceStart", resourceRoot, onStart)

local colors = {}
local textures = {}
local sizes = {}
local text_width = {}
local fonts = {}

local _dxDrawRectangle = dxDrawRectangle
local function dxDrawRectangle(x, y, w, h, color, post)
    return _dxDrawRectangle(sx * x, sy * y, sx * w, sy * h, color, post)
end

local _dxDrawImage = dxDrawImage
local function dxDrawImage(x, y, w, h, image, ...)
    return _dxDrawImage(sx * x, sy * y, sx * w, sy * h, image, ...)
end

local _dxDrawText = dxDrawText
local function dxDrawText( text, x, y, w, h, color, scale, font, assignX, assingY, ...)
    return _dxDrawText(text, sx * x, sy * y, sx * w, sy * h, color, scale, font, assignX, assingY, ...)
end

local _dxCreateTexture = dxCreateTexture
local function dxCreateTexture(directory)
    if not textures[directory] then
        textures[directory] = _dxCreateTexture(directory)
    end

    return textures[directory]
end

local _dxCreateFont = dxCreateFont
local function dxCreateFont(directory, tamanho)
    if not fonts[directory.."_"..tamanho] then
        fonts[directory.."_"..tamanho] = _dxCreateFont(directory, sy * tamanho)
    end

    return fonts[directory.."_"..tamanho]
end

local _dxGetTextSize = dxGetTextSize 
local function dxGetTextSize(text, widthText, scaleFont, font, identify)
    if not sizes[text.."_"..identify] then
        sizes[text.."_"..identify] = _dxGetTextSize(text, sx * widthText, sy * scaleFont, font)
        --print(text, sx * sizes[text.."_"..identify])
    end
    return sizes[text.."_"..identify]
end

local buttons = {}

function roundedRectangle(x, y, width, height, radius, color, colorStroke, sizeStroke, postGUI)
    if width == 0 then
        width = 1
    end

    if height == 0 then
        height = 1
    end

    local sla = width + height + radius
    if (not buttons[sla]) then

        colorStroke = tostring(colorStroke)
        sizeStroke = tostring(sizeStroke)

        local raw = string.format([[
            <svg width='%s' height='%s' fill='none' xmlns='http://www.w3.org/2000/svg'>
                <mask id='path_inside' fill='#FFFFFF' >
                    <rect width='%s' height='%s' rx='%s' />
                </mask>
                <rect opacity='1' width='%s' height='%s' rx='%s' fill='#FFFFFF' stroke='%s' stroke-width='%s' mask='url(#path_inside)'/>
            </svg>
        ]], width, height, width, height, radius, width, height, radius, colorStroke, sizeStroke)

        buttons[sla] = svgCreate(width, height, raw)
    end

    if (buttons[sla]) then -- Se já existir um botão com o mesmo Radius, reaproveitaremos o mesmo, para não criar outro.
        dxSetBlendMode('add')
            dxDrawImage(x, y, width, height, buttons[sla], 0, 0, 0, color, postGUI or false)
        dxSetBlendMode('blend')
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
trade = {}
inventario = {}
slotAlpha = {
    {0},
    {0},
    {0},
    {0},
    {0},
    {0},
}

itensDropados = {}

function atualizarDropados( tipo, tabela )
    if tipo == 1 then
        itensDropados = {}

        triggerServerEvent("Carimbo:CallbackDropar", localPlayer, "Carimbo:CallbackCDropar")
    elseif tipo == 2 then
        itensDropados = tabela
    end
end
addEvent("Carimbo:CallbackCDropar", true)
addEventHandler("Carimbo:CallbackCDropar", getRootElement(), atualizarDropados)


PosInfos = {}

-----------------------------------------------------------------------------------------------------------------------------------------
function refreshInv(tableInv)
	inventario = {}
	peso = 0
	if (tableInv) then
        for i = 1,15 do
            PosInfos[i] = i
        end
		for i, v in pairs(tableInv) do
    		if tableInv[i][1] == "identidade" then
        		table.insert(inventario, v)
        	end
		end
		for i, v in pairs(tableInv) do
    		if tableInv[i][1] == "cnh" then
        		table.insert(inventario, v)
        	end
		end
		for i, v in pairs(tableInv) do
    		if tableInv[i][1] == "porte" then
        		table.insert(inventario, v)
       		end
		end
   		for i, v in pairs(tableInv) do
    		if tableInv[i][1] ~= "identidade" and tableInv[i][1] ~= "cnh" and tableInv[i][1] ~= "porte" then
        		table.insert(inventario, v)
        	end
    	end
    	for i, v in pairs(pesoItens) do
        	for index, value in pairs(inventario) do
           		if inventario[index][1] == i then
                	peso = peso + (pesoItens[i][1] * inventario[index][2])
            	end
        	end
    	end
       
    end
end
addEvent("refresh", true)
addEventHandler("refresh", resourceRoot, refreshInv)

PosSlots = {}
PosSlotsChao = {}


Slot = dxCreateTexture("gfx/img/slot.png", "argb")
Barra = dxCreateTexture("gfx/img/barra.png", "argb")
Scroll1 = dxCreateTexture("gfx/img/Scroll1.png", "argb")
Scroll2 = dxCreateTexture("gfx/img/Scroll2.png", "argb")
Shop = dxCreateTexture("gfx/img/shop.png", "argb")
Mao = dxCreateTexture("gfx/img/mao.png", "argb")

local dxfont0_MontserratBold = dxCreateFont("fontes/MontserratBold.ttf", y*15)
local dxfont1_MontserratBold = dxCreateFont("fontes/MontserratBold.ttf", y*10)
local dxfont2_MontserratSemiBold = dxCreateFont("fontes/MontserratSemiBold.ttf", y*11)
local dxfont3_MontserratSemiBold = dxCreateFont("fontes/MontserratSemiBold.ttf", y*13)
local dxfont4_MontserratSemiBold = dxCreateFont("fontes/MontserratSemiBold.ttf", y*10)
local dxfont0_MontserratBoldItalic = dxCreateFont("fontes/MontserratBoldItalic.ttf", y*20)

function toggleInv()
    local exportBau = exports["nc_systembau"]:ChestReturnsV()
    if not isTradeVisible and not isShopVisible and not exportBau["chest"] then
        if not isInventoryVisible then
            PlaySound("open")
            isInventoryVisible = true
            atualizarDropados(1)
            addEventHandler("onClientRender", root, renderInv)
            AlphaFade(true)
            showCursor(true)
            EditBox.Create("Quantidade", sx*649, sy*330, sx*66, sy*24,false, 8,tocolor(255,255,255,0), dxfont1_MontserratBold, "QTD")
            EditBox.SetVisible("Quantidade", true)
            Select = 0
            Select2 = 0
            for i = 1,15 do
                PosInfos[i] = i
            end
            PosScrollbar = 0
            PosScrollbar2 = 0
        else
            PlaySound("close")
            isInventoryVisible = false
            isTradeVisible = false
            itemTrade = nil
            playerTrade = nil
            removeEventHandler("onClientRender", root, renderInv)
            showCursor(false)
            EditBox.DestroyEdit("Quantidade")
        end
    end
end
bindKey("'", "down", toggleInv)

local poppins = dxCreateFont("fontes/Poppins-Bold.ttf", 12)

-----------------------------------------------------------------------------------------------------------------------------------------

function renderInv()
    local multPx, multPx2 = 0, 0
    local multPy, multPy2 = 0, 0

    exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW, screenH, tocolor(255, 255, 255, alpha))

    if getElementData(localPlayer, "VIP") or getElementData(localPlayer, "Staff") then
        pesoMax = 50
    else
        pesoMax = 30
    end
    
    if getElementData( localPlayer, 'bag.current' ) then 
        pesoMax = tonumber( getElementData( localPlayer, 'bag.current' ) )
    end
    pesoMax = (pesoMax and pesoMax > 0 and pesoMax or 0)
    peso = (peso and peso > 0 and peso or 0)

    roundedRectangle(176, 194, 458, 56, 3, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false) -- | Fundo baixo inventario

    roundedRectangle(186, 237, 442, 9, 3, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false) -- | Fundo barrinha
    roundedRectangle(186, 237, 442/pesoMax*peso, 9, 3, tocolor(255, 0, 255), "#ff0000", 0, false) -- | Barrinha
    dxDrawText((verifyFloor(peso) and peso..".00" or peso).." / "..(verifyFloor(pesoMax) and pesoMax..".00" or pesoMax), 187, 217, 100, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

    roundedRectangle(188, 187, 110, 25, 5, tocolor(255, 0, 255, alpha), "#ff0000", 0, false) -- | Fundo inventario
    dxDrawText("INVENTÁRIO", 205, 189, 75, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

    roundedRectangle(176, 251, 458, 348, 3, tocolor(0, 0, 0, 51), "#ff0000", 0, false) -- | Fundo Slots

    roundedRectangle(649, 330, 66, 24, 3, tocolor(0, 0, 0, 51), "#ff0000", 0, false)
    roundedRectangle(649, 359, 66, 29, 3, tocolor(0, 0, 0, 51), "#ff0000", 0, false)
    roundedRectangle(649, 393, 66, 28, 3, tocolor(0, 0, 0, 51), "#ff0000", 0, false)

    dxDrawText("USAR", 665, 365, 38, 16, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
    dxDrawText("ENVIAR", 660, 397, 53, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

    -- | Scroll

    roundedRectangle(628, 251 + (12 * PosScrollbar), 6, 41, 3, tocolor(255, 0, 255), "#ff0000", 0, false)

    -- | Slots

    for i = 1, 15 do
        roundedRectangle(182 + (multPx * 89), 260 + (multPy * 113), 83, 107, 10, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false)
        PosSlots[i] = {182 + (multPx * 89), 260 + (multPy * 113)}

        i = i + PosScrollbar
        if inventario[i] then
            if Select ~= i then
                local Item = inventario[i][1]
                local Quantidade = inventario[i][2]
                local Peso = (pesoItens[Item] and (pesoItens[Item][1] * inventario[i][2]) or "0.0")

                local width = dxGetTextSize(Quantidade.."x", 10, 1, poppins, 1)
                local posXQuant = (182 + (multPx * 89) + (83/2)) - (width)

                local posX = (182 + (multPx * 89) + (83/2)) - (80/2)
                local posY = (260 + (multPy * 113) + (107/2)) - (80/2)

                roundedRectangle(199 + (multPx * 89), 361 + (multPy * 113), 49, 2, 3, tocolor(255, 0, 255), "#ff0000", 0, false)
                dxDrawImage(posX, posY, 80, 80, "gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

                if i > 5 then
                    dxDrawText(Peso, 186 + (multPx * 89), 264 + (multPy * 113), 15, 20, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                    dxDrawText(Quantidade.."x", posXQuant + 37, 264 + (multPy * 113), 16, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                else
                    roundedRectangle(182 + (multPx * 89), 260 + (multPy * 113), 20, 19, 5, tocolor(255, 0, 255), "#ff0000", 0, false)
                    dxDrawText(i, 188 + (multPx * 89), 259 + (multPy * 113), 15, 20, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

                    dxDrawText(Quantidade.."x", posXQuant + 37, 264 + (multPy * 113), 16, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                end
            end
        end

        multPx = multPx + 1
        if multPx == 5 then
            multPx = 0
            multPy = multPy + 1
        end
    end

    -- | Parte do chão

    roundedRectangle(732, 195, 458, 56, 3, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false) -- | Fundo baixo Chão
    roundedRectangle(741, 186, 62, 25, 5, tocolor(255, 0, 255, alpha), "#ff0000", 0, false) -- | Fundo Chão
    dxDrawText("CHÃO", 755, 190, 37, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

    roundedRectangle(731, 251, 458, 348, 3, tocolor(0, 0, 0, 51), "#ff0000", 0, false) -- | Fundo Slots Chão

    -- | Scroll Chão

    roundedRectangle(1186, 251 + (12 * PosScrollbar2), 6, 41, 3, tocolor(255, 0, 255), "#ff0000", 0, false)

    -- | Slots Chão

    for i = 1, 15 do
        roundedRectangle(738 + (multPx2 * 89), 260 + (multPy2 * 113), 83, 107, 10, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false)
        PosSlotsChao[i] = {738 + (multPx2 * 89), 260 + (multPy2 * 113)}

        i = i + PosScrollbar2
        if itensDropados[i] then
            if Select2 ~= i then
                local Item = itensDropados[i][1]
                local Quantidade = itensDropados[i][2]
                local Peso = (pesoItens[Item] and (pesoItens[Item][1] * itensDropados[i][2]) or "0.0")

                local width = dxGetTextSize(Quantidade.."x", 10, 1, poppins, 1)
                local posXQuant = (738 + (multPx2 * 89) + (83/2)) - (width)

                local posX = (738 + (multPx2 * 89) + (83/2)) - (80/2)
                local posY = (260 + (multPy2 * 113) + (107/2)) - (80/2)

                roundedRectangle(755 + (multPx2 * 89), 361 + (multPy2 * 113), 49, 2, 3, tocolor(255, 0, 255), "#ff0000", 0, false)
                dxDrawImage(posX, posY, 80, 80, "gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

                if i > 5 then
                    dxDrawText(Peso, 744 + (multPx2 * 89), 264 + (multPy2 * 113), 15, 20, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                    dxDrawText(Quantidade.."x", posXQuant + 37, 264 + (multPy2 * 113), 16, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                else
                    roundedRectangle(738 + (multPx2 * 89), 260 + (multPy2 * 113), 20, 19, 5, tocolor(255, 0, 255), "#ff0000", 0, false)
                    dxDrawText(i, 744 + (multPx2 * 89), 259 + (multPy2 * 113), 15, 20, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

                    dxDrawText(Quantidade.."x", posXQuant + 37, 264 + (multPy2 * 113), 16, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                end
            end
        end

        multPx2 = multPx2 + 1
        if multPx2 == 5 then
            multPx2 = 0
            multPy2 = multPy2 + 1
        end
    end

    -- | Selected

    if Select ~= 0 or Select2 ~= 0 then
        local selected = Select ~= 0 and inventario or itensDropados
        local numberSelected = Select ~= 0 and Select or Select2

        local Item = selected[numberSelected][1]

        local xc, yc = getCursorPosition()
        local cursorx, cursory = xc*screenW, yc*screenH

        _dxDrawImage(cursorx - (27), cursory - (27), 80, 80, "gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)

        local Nome = realName[Item][1]
        local Quantidade = selected[numberSelected][2]
        local Peso = (pesoItens[Item] and (pesoItens[Item][1] * selected[numberSelected][2]) or "0.0")

        local width = dxGetTextSize(Nome, 75, 1, poppins, 1)

        local posName = (187 + (90/2) - (width/2))

        roundedRectangle(179, 615, 193, 77, 5, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false)

        roundedRectangle(187, 605, 90, 23, 5, tocolor(255, 0, 255), "#ff0000", 0, false)

        dxDrawText(Nome, posName, 607, 75, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
        dxDrawImage(182, 638, 49, 45, "gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("PESO: "..Peso, 241, 641, 36, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
        dxDrawText("MAXIMO: "..Quantidade, 241, 659, 36, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
    end
end

function verifyFloor(number)
    return (number - math.floor(number) == 0)
end

function verifyItem(item)
    for i = 1,6 do
        if actionbar[i][1] and actionbar[i][1] == item then
            return false
        end
    end
    return true
end

addEventHandler("onClientClick",root,function(b,s,_,_,_,_,_,element)
    if isInventoryVisible then
        if b == "left" then
            if s == "down" then
                for i = 1, #PosSlots do
                    if isCursorOnElement(sx*PosSlots[i][1], sy*PosSlots[i][2], sx*83, sy*107) then
                        if inventario[i + PosScrollbar] then
                            Select = i + PosScrollbar
                        end
                    end
                end

               for i = 1, #PosSlotsChao do
                    if isCursorOnElement(sx*PosSlotsChao[i][1], sy*PosSlotsChao[i][2], sx*83, sy*107) then
                        if itensDropados[i + PosScrollbar2] then
                            Select2 = i + PosScrollbar2
                        end
                    end
                end

            elseif s == "up" then 
                if Select ~= 0 then 
                    if element and getElementType(element) == "object" and getElementModel(element) == 1359 and getDistanceBetweenPoints3D(Vector3(getElementPosition(localPlayer)), Vector3(getElementPosition(element))) <= 1.5 then
                        for i, v in pairs(trashs) do
                            if v == element then
                                local x, y, z = getElementPosition(localPlayer)
                                local ex, ey, ez = getElementPosition(element)
                                local Quantidade = EditBox.GetText("Quantidade")
                                if Quantidade ~= "" then
                                    if inventario[Select][2] >= tonumber(Quantidade) then
                                        triggerServerEvent("Trash", resourceRoot, localPlayer, inventario[Select][1], tonumber(Quantidade))
                                        
                                    end
                                end
                            end
                        end
                    else
                        if isCursorOnElement(sx*649, sy*359, sx*66, sy*29) then
                            triggerServerEvent("Use", resourceRoot, localPlayer, inventario[Select][1])
                        elseif isCursorOnElement(sx*649, sy*393, sx*66, sy*29) then
                            local Quantidade = EditBox.GetText("Quantidade")
                            if Quantidade ~= "" then
                                if inventario[Select][2] >= tonumber(Quantidade) then
                                    triggerServerEvent("MST.SendItem", localPlayer, inventario[Select][1], tonumber(Quantidade))
                                end
                            end
                        end
                    end

                    for i = 1,#PosSlotsChao do
                        if isCursorOnElement(sx*PosSlotsChao[i][1], sy*PosSlotsChao[i][2], sx*83, sy*107) then
                            if not itensDropados[i + PosScrollbar2] or itensDropados[i + PosScrollbar2][1] == inventario[Select][1] then
                                local Quantidade = EditBox.GetText("Quantidade")
                                triggerServerEvent("Carimbo:dropItem", localPlayer, inventario[Select][1], tonumber(Quantidade) or inventario[Select][2])
                            end
                        end
                    end
                elseif Select2 ~= 0 then
                    for i = 1,#PosSlots do
                        if isCursorOnElement(sx*PosSlots[i][1], sy*PosSlots[i][2], sx*83, sy*107) then
                            if not inventario[i + PosScrollbar] or inventario[i + PosScrollbar][1] == itensDropados[Select2][1] then
                                local Quantidade = EditBox.GetText("Quantidade")
                                triggerServerEvent("Carimbo:pegarItem", localPlayer, itensDropados[Select2][3], itensDropados[Select2][1], tonumber(Quantidade))
                            end
                        end
                    end
                end
                Select = 0
                Select2 = 0
            end
        end
    end
end)

function Scrollbar(b)
    if isInventoryVisible and isCursorShowing() then
        if isCursorOnElement(sx*166, sy*186, sx*549, sy*506) then
            if b == "mouse_wheel_up" and PosScrollbar > 0 then
                PosScrollbar = PosScrollbar - 5
            elseif b == "mouse_wheel_down" and PosScrollbar < 25 then
                PosScrollbar = PosScrollbar + 5
            end
        elseif isCursorOnElement(sx*732, sy*195, sx*549, sy*506) then
            if b == "mouse_wheel_up" and PosScrollbar2 > 0 then
                PosScrollbar2 = PosScrollbar2 - 5
            elseif b == "mouse_wheel_down" and PosScrollbar2 < 25 then
                PosScrollbar2 = PosScrollbar2 + 5
            end
        end
    end
end
bindKey("mouse_wheel_up", "down", Scrollbar)
bindKey("mouse_wheel_down", "down", Scrollbar)

-----------------------------------------------------------------------------------------------------------------------------------------


function renderBox()
    if isCursorShowing() and isCursorOnElement(screenW * 0.4356, screenH * 0.5664, screenW * 0.1281, screenH * 0.0456) then
        color1 = tocolor(80, 80, 80, 255)
    else
        color1 = tocolor(38, 38, 38, 255)
    end
    if isCursorShowing() and isCursorOnElement(screenW * 0.5461, screenH * 0.3750, screenW * 0.0307, screenH * 0.0430) then
        alpha1 = 255
    else
        alpha1 = 175
    end
    dxDrawRectangle(screenW * 0.4231, screenH * 0.3750, screenW * 0.1537, screenH * 0.2500, tocolor(0, 0, 0), false)
    dxDrawRectangle(screenW * 0.4356, screenH * 0.5664, screenW * 0.1281, screenH * 0.0456, color1, false)
    dxDrawText("       Guardar item", screenW * 0.4231, screenH * 0.3750, screenW * 0.5461, screenH * 0.4180, tocolor(108, 14, 201), 1.00, font2, "left", "center", false, false, false, false, false)
    dxDrawText("Guardar", screenW * 0.4356, screenH * 0.5664, screenW * 0.5637, screenH * 0.6120, tocolor(108, 14, 201), 1.00, font2, "center", "center", false, false, false, false, false)
    dxDrawRectangle(screenW * 0.5461, screenH * 0.3750, screenW * 0.0307, screenH * 0.0430, tocolor(0, 0, 0, alpha1), false)
    dxDrawText("X", screenW * 0.5461, screenH * 0.3750, screenW * 0.5769, screenH * 0.4180, tocolor(108, 14, 201), 1.00, font2, "center", "center", false, false, false, false, false)
    dxDrawImage(screenW * 0.4356, screenH * 0.4844, screenW * 0.0366, screenH * 0.0651, "gfx/itens/"..itemTrade..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawRectangle(screenW * 0.5095, screenH * 0.4844, screenW * 0.0542, screenH * 0.0273, tocolor(38, 38, 38, 255), false)
    dxDrawText("Qntd:", screenW * 0.4795, screenH * 0.4844, screenW * 0.5095, screenH * 0.5117, tocolor(108, 14, 201), 1.00, font3, "left", "center", false, false, false, false, false)
    dxDrawLine(screenW * 0.5095, screenH * 0.5117, screenW * 0.5630, screenH * 0.5117, tocolor(0, 0, 0), 1, false)
    dxDrawText(guiGetText(editQuantidade3), screenW * 0.5120, screenH * 0.4844, screenW * 0.5630, screenH * 0.5117, tocolor(255, 255, 255), 1.00, font3, "left", "center", false, false, false, false, false)
end
-----------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------
function renderBox2(tabela, gang)
	if not isInventoryVisible then
        if not guiGetVisible(windowBau) then
        	gangBox = gang
        	guiSetVisible(windowBau, true)
			gridlistBau = guiCreateGridList(0.04, 0.06, 0.93, 0.70, true, windowBau)
			guiGridListAddColumn(gridlistBau, "Item", 0.75)
			guiGridListAddColumn(gridlistBau, "Qntd", 0.15)
			for i, v in pairs(tabela) do
				guiGridListAddRow(gridlistBau, realName[i][1], tabela[i][1])
			end
			addEventHandler("onClientGUIClick", pegarBau, click2)
			addEventHandler("onClientGUIClick", fecharBau, click2)
        end
    end
end
addEvent("RenderBox", true)
addEventHandler("RenderBox", resourceRoot, renderBox2)
-----------------------------------------------------------------------------------------------------------------------------------------
function click2(button)
    if button == "left" then
    	if source == pegarBau then
    		if guiGridListGetSelectedItem(gridlistBau) >= 0 then
    			local item = guiGridListGetItemText(gridlistBau, guiGridListGetSelectedItem(gridlistBau), 1)
    			local quantidade = guiGetText(quantidadeBau)
    			if tonumber(quantidade) and tonumber(quantidade) > 0 then
    				for i, v in pairs(realName) do
    					if realName[i][1] == item then
    						item = i
    					end
    				end
    				triggerServerEvent("Box", resourceRoot, "pegar", localPlayer, gangBox, item, tonumber(quantidade))
        			guiSetText(quantidadeBau, "Quantidade")
        			guiSetVisible(windowBau, false)
        			destroyElement(gridlistBau)
        			gangBox = nil
					removeEventHandler("onClientGUIClick", pegarBau, click2)
					removeEventHandler("onClientGUIClick", fecharBau, click2)
    			else
    				exports._infobox:addNotification("Insira uma quantidade válida", "error")
    			end
    		else
    			exports._infobox:addNotification("Selecione um item da lista para pegá-lo", "error")
    		end
        elseif source == fecharBau then
        	guiSetText(quantidadeBau, "Quantidade")
        	guiSetVisible(windowBau, false)
        	destroyElement(gridlistBau)
        	gangBox = nil
			removeEventHandler("onClientGUIClick", pegarBau, click2)
			removeEventHandler("onClientGUIClick", fecharBau, click2)
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------

function useActionBar(key)
    if not isCursorShowing() then
        if inventario[tonumber(key)] then
            if not isTimer(timerUse) then
                timerUse = setTimer(function() end, 2500, 1)
                triggerServerEvent("Use", resourceRoot, localPlayer, inventario[tonumber(key)][1])
            end
        end
    end
end
bindKey("1", "down", useActionBar)
bindKey("2", "down", useActionBar)
bindKey("3", "down", useActionBar)
bindKey("4", "down", useActionBar)
bindKey("5", "down", useActionBar)
bindKey("6", "down", useActionBar)
-----------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function AlphaFade(state)
    if state == true then
        if isTimer(timerAlpha) then killTimer(timerAlpha) timerAlpha = nil end
        alpha = 0
        timerAlpha = setTimer(function()
            alpha = alpha + 15
        end, 1, 17)
    elseif state == false then
        if isTimer(timerAlpha) then killTimer(timerAlpha) timerAlpha = nil end
        alpha = 255
        timerAlpha = setTimer(function()
            alpha = alpha - 15
        end, 1, 17)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
function attTrade()
	isReceivingTrade = true
	tableTrade = getElementData(localPlayer, "Trading")
end
addEvent("refreshTrading", true)
addEventHandler("refreshTrading", resourceRoot, attTrade)
-----------------------------------------------------------------------------------------------------------------------------------------
function cancelShoot(weapon)
	if weapon ~= 28 then
		if (weaponsCancelShootOneBullet[weapon]) then
			if getPedTotalAmmo(localPlayer, currentWeaponSlot) < 2 then
				toggleControl("action", false)
				toggleControl("fire", false)
                toggleControl("vehicle_fire", false)
			else
				toggleControl("action", true)
				toggleControl("fire", true)
                toggleControl("vehicle_fire", true)
			end
		else
			toggleControl("action", true)
			toggleControl("fire", true)
            toggleControl("vehicle_fire", true)
		end
	end
end
addEventHandler("onClientPlayerWeaponFire", localPlayer, cancelShoot)
-----------------------------------------------------------------------------------------------------------------------------------------
function cancelShoot2()
   local weapon = getPedWeapon(localPlayer, current)
   if weapon ~= 28 then
       if (weaponsCancelShootOneBullet[weapon]) then
           if getPedTotalAmmo(localPlayer, currentWeaponSlot) == 1 then
               toggleControl("action", false)
               toggleControl("fire", false)
               toggleControl("vehicle_fire", false)
           end
       end
   end
end
bindKey("fire", "down", cancelShoot2)
bindKey("action", "down", cancelShoot2)
-----------------------------------------------------------------------------------------------------------------------------------------
function onlyGuard(_, currentWeaponSlot)
    local weapon = getPedWeapon(localPlayer, currentWeaponSlot)
    if weapon ~= 28 then
    	if not (weaponsCancelShootOneBullet[weapon]) then
    	    toggleControl("action", true)
    	    toggleControl("fire", true)
            toggleControl("vehicle_fire", true)
    	else
    	    if getPedTotalAmmo(localPlayer, currentWeaponSlot) > 1 then
    	        toggleControl("action", true)
    	        toggleControl("fire", true)
                toggleControl("vehicle_fire", true)
    	    else
				toggleControl("action", false)
				toggleControl("fire", false)
                toggleControl("vehicle_fire", false)
    	    end
    	end
    end
end
addEventHandler("onClientPlayerWeaponSwitch", localPlayer, onlyGuard)
-----------------------------------------------------------------------------------------------------------------------------------------
function antiBug()
    local text = guiGetText(source) or ""
    if not tonumber(text) then
        guiSetText(source, string.gsub(text, "%a", ""))
    end
end
addEventHandler("onClientGUIChanged", editValor, antiBug)
addEventHandler("onClientGUIChanged", editQuantidade, antiBug)
-----------------------------------------------------------------------------------------------------------------------------------------
function soundRadinho(key, pressed)
	if (pressed) then
		local keys = getBoundKeys("voiceptt")
		for i, v in pairs(keys) do
			if i == key then
				if getElementData(localPlayer, "Radinho") then
					for index, value in pairs(inventario) do
						if inventario[index][1] == "radinho" then
							if not isTimer(timerRadinho) then
								timerRadinho = setTimer(function() end, 1500, 1)
								local sound = playSound("sfx/radio-beep.mp3")
								setSoundVolume(sound, 5)
							end
						end
					end
				end
			end
		end
	end
end
addEventHandler("onClientKey", root, soundRadinho)
-----------------------------------------------------------------------------------------------------------------------------------------
function GetItemClient(item)
    if realName[item] then
        local count = false
        for i, v in pairs(inventario) do
            if inventario[i][1] == item then
                if inventario[i][2] > 0 then
                    return tonumber(inventario[i][2])
                else
                    return 0
                end
            end
        end
        if count == false then
            return 0
        end
    else
        return 0
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
function PlaySound(som, player)
    if som == "open" or som == "close" or som == "select" then
       -- local sound = playSound("sfx/"..som..".mp3")
        --setSoundVolume(sound, 0.5)
    elseif som == "release" then
        local sound = playSound("sfx/"..som..".mp3")
        setSoundVolume(sound, 0.25)
    elseif som == "eat" or som == "drink" or som == "pick" or som == "put" or som == "radio-toggle" or som == "repair" then
    	--local x, y, z = getElementPosition(player)
    	--local sound = playSound3D("sfx/"..som..".mp3", x, y, z)
        --local dim = getElementDimension(player)
        --local int = getElementInterior(player)
        --setElementDimension(sound, dim)
        --setElementInterior(sound, int)
    	--attachElements(sound, player)
    elseif som == "trash" then
    	local x, y, z = getElementPosition(player)
    	local sound = playSound3D("sfx/"..som..".mp3", x, y, z)
    	setSoundVolume(sound, 0.5)
    elseif som == "vehicle-alarm" then
        local x, y, z = getElementPosition(player)
        local sound = playSound3D("sfx/"..som..".mp3", x, y, z, true)
        local dim = getElementDimension(player)
        local int = getElementInterior(player)
        setElementDimension(sound, dim)
        setElementInterior(sound, int)
        attachElements(sound, player)
        setTimer(function()
            stopSound(sound)
        end, 150000, 1)
    end
end
addEvent("playSound", true)
addEventHandler("playSound", resourceRoot, PlaySound)
-----------------------------------------------------------------------------------------------------------------------------------------
function isCursorOnElement ( x, y, w, h )
    local mx, my = getCursorPosition ()
    local fullx, fully = guiGetScreenSize ()
    local cursorx, cursory = mx*fullx, my*fully
    if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
        return true
    else
        return false
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------

function dxDrawRoundedRectangle(x, y, rx, ry, color, radius)
    rx = rx - radius * 2
    ry = ry - radius * 2
    x = x + radius
    y = y + radius
    if (rx >= 0) and (ry >= 0) then
        dxDrawRectangle(x, y, rx, ry, color)
        dxDrawRectangle(x, y - radius, rx, radius, color)
        dxDrawRectangle(x, y + ry, rx, radius, color)
        dxDrawRectangle(x - radius, y, radius, ry, color)
        dxDrawRectangle(x + rx, y, radius, ry, color)
        dxDrawCircle(x, y, radius, 180, 270, color, color, 7)
        dxDrawCircle(x + rx, y, radius, 270, 360, color, color, 7)
        dxDrawCircle(x + rx, y + ry, radius, 0, 90, color, color, 7)
        dxDrawCircle(x, y + ry, radius, 90, 180, color, color, 7)
    end
end

function convertNumber ( number )   
    local formatted = number   
    while true do       
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')     
        if ( k==0 ) then       
            break   
        end   
    end   
    return formatted 
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function setSpeed()
    setGameSpeed(1.3)
end
addEvent("setSpeed", true)
addEventHandler("setSpeed", getRootElement(), setSpeed)


-- | Export

function InventoryReturnsV( ... )
    local visibles = {
        inventory = isInventoryVisible,
        shop = isShopVisible,
    }

    return visibles
end