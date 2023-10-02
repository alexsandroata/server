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

local Select = 0
local Select2 = 0
local PosScrollbar = 0
local PosScrollbar2 = 0
local shop = nil
local qntd = nil
local shop = nil
isShopVisible = false
local tabelaSearch = {}

--

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
--

function onStart()
    font1 = dxCreateFont("fontes/Roboto.ttf", 9)
    font2 = dxCreateFont("fontes/RobotoBold.ttf", 10)
    font3 = dxCreateFont("fontes/Roboto.ttf", 10)
end
addEventHandler("onClientResourceStart", resourceRoot, onStart)
Food = {}
Guns = {}
Utility = {}
Bar = {}
Ilegal = {}
Ferramentas = {}
bone = {}
GB = {}


PosSlots = {}
PosSlotsShop = {}
-------------------------------------------------------------------------------------------------------------------------------------------------
local texts = {
	["food"] = "Gueto Food",
	["guns"] = "AmmuNation",
	["utility"] = "Gueto Market",
	["bone"] = "Bone Vips",
	["ferramentas"] = "Vendedor de Ferramentas",
	["bar"] = "GuetoRacing",
	["ilegal"] = "Mercado Negro",
    ["gb"] = "Gueto Pharmacy",
}

local poppins = dxCreateFont(":MODInventario/fontes/Poppins-Bold.ttf", 12)

function renderShop()
	if not isShopVisible then
		isShopVisible = true
	end

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

    roundedRectangle(sx*690, sy*395, sx*66, sy*29, 3, tocolor(0, 0, 0, 51), "#ff0000", 0, false)

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
                dxDrawImage(posX, posY, 80, 80, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

                if i > 5 then
                    dxDrawText(string.sub(""..Peso.."", 1, 3), 186 + (multPx * 89), 264 + (multPy * 113), 15, 20, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                    dxDrawText(Quantidade.."x", posXQuant + 37, 264 + (multPy * 113), 16, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                else
                    roundedRectangle(182 + (multPx * 89), 260 + (multPy * 113), 20, 19, 5, tocolor(255, 0, 255), "#ff0000", 0, false)
                    dxDrawText(i, 188 + (multPx * 89), 259 + (multPy * 113), 15, 20, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

                    dxDrawText(Quantidade.."x", posXQuant + 37, 264 + (multPy * 113), 16, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                end
            else
                local Item = inventario[Select][1]
                local xc, yc = getCursorPosition()
                local cursorx, cursory = xc*screenW, yc*screenH

                dxDrawImage(cursorx - 27, cursory - 27, 80, 80, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
            end
        end

        multPx = multPx + 1
        if multPx == 5 then
            multPx = 0
            multPy = multPy + 1
        end
    end

    -- | Parte do Shop Name

    local getWidth = dxGetTextSize(texts[shop], 26, 1, poppins, 1)

    roundedRectangle(732, 195, 458, 56, 3, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false) -- | Fundo baixo Shop Name
    roundedRectangle(741, 186, 34 + getWidth, 25, 5, tocolor(255, 0, 255, alpha), "#ff0000", 0, false) -- | Fundo Shop Name
    dxDrawText(texts[shop], 759, 190, 26, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

    roundedRectangle(731, 251, 458, 348, 3, tocolor(0, 0, 0, 51), "#ff0000", 0, false) -- | Fundo Slots Shop Name

    -- | Scroll Shop Name

    roundedRectangle(1186, 251 + (12 * PosScrollbar2), 6, 41, 3, tocolor(255, 0, 255), "#ff0000", 0, false)

    -- | Slots Shop Name

    for i = 1, 15 do
        roundedRectangle(738 + (multPx2 * 89), 260 + (multPy2 * 113), 83, 107, 10, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false)
        PosSlotsShop[i] = {738 + (multPx2 * 89), 260 + (multPy2 * 113)}

        i = i + PosScrollbar2
        if tabelaSearch[i] then
            if Select2 ~= i then
                local Item = tabelaSearch[i][1]
                local Quantidade = 1

                local width = dxGetTextSize(Quantidade.."x", 10, 1, poppins, 1)
                local posXQuant = (738 + (multPx2 * 89) + (83/2)) - (width)

                local posX = (738 + (multPx2 * 89) + (83/2)) - (80/2)
                local posY = (260 + (multPy2 * 113) + (107/2)) - (80/2)

                roundedRectangle(755 + (multPx2 * 89), 361 + (multPy2 * 113), 49, 2, 3, tocolor(255, 0, 255), "#ff0000", 0, false)
                dxDrawImage(posX, posY, 80, 80, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

                if i <= 5 then
                    roundedRectangle(738 + (multPx2 * 89), 260 + (multPy2 * 113), 20, 19, 5, tocolor(255, 0, 255), "#ff0000", 0, false)
                    dxDrawText(i, 744 + (multPx2 * 89), 259 + (multPy2 * 113), 15, 20, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                end
                dxDrawText(Quantidade.."x", posXQuant + 37, 264 + (multPy2 * 113), 16, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
            else
                local Item = tabelaSearch[Select2][1]
                local xc, yc = getCursorPosition()
                local cursorx, cursory = xc*screenW, yc*screenH

                dxDrawImage(cursorx - 27, cursory - 27, 80, 80, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
            end
        end

        multPx2 = multPx2 + 1
        if multPx2 == 5 then
            multPx2 = 0
            multPy2 = multPy2 + 1
        end
    end

    -- | Selected

    if Select2 ~= 0 then
        local Item = tabelaSearch[Select2][1]
        local Nome = realName[Item][1]
        local Valor = tabelaSearch[Select2][2]
        local Quantidade = tonumber(EditBox.GetText("Quantidade")) or 0
        
        local width = dxGetTextSize(Nome, 75, 1, poppins, 1)

        local posName = (187 + (90/2) - (width/2))

        roundedRectangle(179, 615, 193, 77, 5, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false)

        roundedRectangle(187, 605, 90, 23, 5, tocolor(255, 0, 255), "#ff0000", 0, false)

        dxDrawText(Nome, posName, 607, 75, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
        dxDrawImage(182, 638, 49, 45, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("Valor: "..Valor, 241, 641, 36, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
        dxDrawText("Valor a pagar: "..(Valor * Quantidade), 241, 659, 36, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
    end
end

bindKey("backspace","down",function()
    if isShopVisible then
        removeEventHandler("onClientRender",root,renderShop)
        isShopVisible = false
        showCursor(false)
        EditBox.DestroyEdit("Quantidade")

        PosScrollbar = 0
		PosScrollbar2 = 0
    end
end)

-------------------------------------------------------------------------------------------------------------------------------------------------
function onClick(button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedWorld)
	if not isInventoryVisible then
		if (button == "left" and state == "down") then
			if not isShopVisible then
				if isElement(clickedWorld) then
					if getElementType(clickedWorld) == "ped" then
						local x, y, z = getElementPosition(localPlayer)
						local x2, y2, z2 = getElementPosition(clickedWorld)
						if getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) <= 3 then
							if Food[clickedWorld] then
								qntd = #FoodShopItems
								tabelaSearch = FoodShopItems
								shop = "food"

								ped = clickedWorld
								addEventHandler("onClientRender", root, renderShop)

								EditBox.Create("Quantidade", sx*649, sy*359, sx*66, sy*29,false, 8,tocolor(255,255,255,0), dxfont1_MontserratBold, "QTD")
								EditBox.SetVisible("Quantidade", true)
							elseif Guns[clickedWorld] then
								qntd = #GunShopItems
								tabelaSearch = GunShopItems
								shop = "guns"

								ped = clickedWorld
								addEventHandler("onClientRender", root, renderShop)

								EditBox.Create("Quantidade", sx*649, sy*359, sx*66, sy*29,false, 8,tocolor(255,255,255,0), dxfont1_MontserratBold, "QTD")
								EditBox.SetVisible("Quantidade", true)
							elseif Utility[clickedWorld] then
								qntd = #UtilityShopItems
								tabelaSearch = UtilityShopItems
								shop = "utility"

								ped = clickedWorld
								addEventHandler("onClientRender", root, renderShop)

								EditBox.Create("Quantidade", sx*649, sy*359, sx*66, sy*29,false, 8,tocolor(255,255,255,0), dxfont1_MontserratBold, "QTD")
								EditBox.SetVisible("Quantidade", true)
							elseif Bar[clickedWorld] then
								qntd = #BarShopItems
								tabelaSearch = BarShopItems
								shop = "bar"

								ped = clickedWorld
								addEventHandler("onClientRender", root, renderShop)

								EditBox.Create("Quantidade", sx*649, sy*359, sx*66, sy*29,false, 8,tocolor(255,255,255,0), dxfont1_MontserratBold, "QTD")
								EditBox.SetVisible("Quantidade", true)
							elseif GB[clickedWorld] then
								qntd = #GBShopItems
								tabelaSearch = GBShopItems
								shop = "gb"

								ped = clickedWorld
								addEventHandler("onClientRender", root, renderShop)

								EditBox.Create("Quantidade", sx*649, sy*359, sx*66, sy*29,false, 8,tocolor(255,255,255,0), dxfont1_MontserratBold, "QTD")
								EditBox.SetVisible("Quantidade", true)
							elseif Ilegal[clickedWorld] then
								qntd = #IlegalShopItems
								tabelaSearch = IlegalShopItems
								shop = "ilegal"

								ped = clickedWorld
								addEventHandler("onClientRender", root, renderShop)

								EditBox.Create("Quantidade", sx*649, sy*359, sx*66, sy*29,false, 8,tocolor(255,255,255,0), dxfont1_MontserratBold, "QTD")
								EditBox.SetVisible("Quantidade", true)
							elseif Ferramentas[clickedWorld] then
								qntd = #FerramentasShopItems
								tabelaSearch = FerramentasShopItems
								shop = "ferramentas"

								ped = clickedWorld
								addEventHandler("onClientRender", root, renderShop)

								EditBox.Create("Quantidade", sx*649, sy*335, sx*66, sy*100,false, 8,tocolor(255,255,255,0), dxfont1_MontserratBold, "QTD")
								EditBox.SetVisible("Quantidade", true)
							elseif bone[clickedWorld] then
								qntd = #boneShopItems
								tabelaSearch = boneShopItems
								shop = "bone"

								ped = clickedWorld
								addEventHandler("onClientRender", root, renderShop)

								EditBox.Create("Quantidade", sx*649, sy*359, sx*66, sy*29,false, 8,tocolor(255,255,255,0), dxfont1_MontserratBold, "QTD")
								EditBox.SetVisible("Quantidade", true)
							end
						end
					end
				end
			else
				for i = 1, 15 do
					if isCursorOnElement(PosSlotsShop[i][1], PosSlotsShop[i][2], sx*83, sy*107) then
						i = i + PosScrollbar2
						if tabelaSearch[i] then
							Select2 = i
						end
					end
				end
			end
		elseif button == "left" and state == "up" then
			if isShopVisible then
				if Select2 ~= 0 then
					for i = 1, 15 do
						if isCursorOnElement(sx*PosSlots[i][1], sy*PosSlots[i][2], sx*83, sy*107) then
							i = i + PosScrollbar
							if not inventario[i] or inventario[i][1] == tabelaSearch[Select2][1] then
								local editQuantidade = EditBox.GetText("Quantidade")

								if tonumber(editQuantidade) and tonumber(editQuantidade) > 0 then
									if not isTimer(TempoBuy) then
										local x, y, z = getElementPosition(localPlayer)
										local x2, y2, z2 = getElementPosition(ped)
										if getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) <= 3 then
											TempoBuy = setTimer(function() end, 1000, 1)
											triggerServerEvent("BuyItem", resourceRoot, localPlayer, Select2, shop, tonumber(editQuantidade))
										end
									end
								else
									addBox(playerSource,"Digite um número válido no campo 'Quantidade'", "erro")
								end
							end
						end
					end
				end
			end
			Select2 = 0
		end
	end
end
addEventHandler("onClientClick", root, onClick)

function Scrollbar(b)
    if isShopVisible and isCursorShowing() then
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
-------------------------------------------------------------------------------------------------------------------------------------------------
for i, v in pairs(FoodShopSpawns) do
	local index
	local ped = createPed(FoodShopSpawns[i][1], FoodShopSpawns[i][2], FoodShopSpawns[i][3], FoodShopSpawns[i][4], FoodShopSpawns[i][5])
	index = ped

    Food[index] = index
    setElementInterior(Food[index], FoodShopSpawns[i][6])
    setElementDimension(Food[index], FoodShopSpawns[i][7])
    local blipf = createBlipAttachedTo(Food[index], 5)
    setElementData(blipf,"BlipName","GuetoFood")
    setBlipVisibleDistance ( blipf, 150 )
    setElementFrozen(Food[index], true)
end

for i, v in pairs(GunShopSpawns) do
	local index
	local ped = createPed(GunShopSpawns[i][1], GunShopSpawns[i][2], GunShopSpawns[i][3], GunShopSpawns[i][4], GunShopSpawns[i][5])
	index = ped

    Guns[index] = index
    setElementInterior(Guns[index], GunShopSpawns[i][6])
    setElementDimension(Guns[index], GunShopSpawns[i][7])
    local blipg = createBlipAttachedTo(Guns[index], 24)
    setElementData(blipg,"BlipName","AmmuNation")
    setBlipVisibleDistance ( blipg, 150 )
    setElementFrozen(Guns[index], true)
end

for i, v in pairs(UtilityShopSpawns) do
	local index
	local ped = createPed(UtilityShopSpawns[i][1], UtilityShopSpawns[i][2], UtilityShopSpawns[i][3], UtilityShopSpawns[i][4], UtilityShopSpawns[i][5])
	index = ped

    Utility[index] = index
    setElementInterior(Utility[index], UtilityShopSpawns[i][6])
    setElementDimension(Utility[index], UtilityShopSpawns[i][7])
    local blipu = createBlipAttachedTo(Utility[index], 5)
    setElementData(blipu,"BlipName","GuetoMarket")
     setBlipVisibleDistance ( blipu, 150 )
    setElementFrozen(Utility[index], true)
end

for i, v in pairs(BarShopSpawns) do
	local index
	local ped = createPed(BarShopSpawns[i][1], BarShopSpawns[i][2], BarShopSpawns[i][3], BarShopSpawns[i][4], BarShopSpawns[i][5])
	index = ped

    Bar[index] = index
    setElementInterior(Bar[index], BarShopSpawns[i][6])
    setElementDimension(Bar[index], BarShopSpawns[i][7])
    setElementFrozen(Bar[index], true)
end

for i, v in pairs(IlegalShopSpawns) do
	local index
	local ped = createPed(IlegalShopSpawns[i][1], IlegalShopSpawns[i][2], IlegalShopSpawns[i][3], IlegalShopSpawns[i][4], IlegalShopSpawns[i][5])
	index = ped

    Ilegal[index] = index
    setElementInterior(Ilegal[index], IlegalShopSpawns[i][6])
    setElementDimension(Ilegal[index], IlegalShopSpawns[i][7])
    local blipm = createBlipAttachedTo(Ilegal[index], 1)
    setElementData(blipm,"BlipName","Mercado Negro")
     setBlipVisibleDistance ( blipm, 150 )
    setElementFrozen(Ilegal[index], true)
end

for i, v in pairs(FerramentasShopSpawns) do
	local index
	local ped = createPed(FerramentasShopSpawns[i][1], FerramentasShopSpawns[i][2], FerramentasShopSpawns[i][3], FerramentasShopSpawns[i][4], FerramentasShopSpawns[i][5])
	index = ped

    Ferramentas[index] = index
    setElementInterior(Ferramentas[index], FerramentasShopSpawns[i][6])
    setElementDimension(Ferramentas[index], FerramentasShopSpawns[i][7])
    setElementFrozen(Ferramentas[index], true)
end

for i, v in pairs(boneShopSpawns) do
	local index
	local ped = createPed(boneShopSpawns[i][1], boneShopSpawns[i][2], boneShopSpawns[i][3], boneShopSpawns[i][4], boneShopSpawns[i][5])
	index = ped

    bone[index] = index
    setElementInterior(bone[index], boneShopSpawns[i][6])
    setElementDimension(bone[index], boneShopSpawns[i][7])
    setElementFrozen(bone[index], true)
end

for i, v in pairs(GBShopSpawns) do
	local index
	local ped = createPed(GBShopSpawns[i][1], GBShopSpawns[i][2], GBShopSpawns[i][3], GBShopSpawns[i][4], GBShopSpawns[i][5])
	index = ped

    GB[index] = index
    setElementInterior(GB[index], GBShopSpawns[i][6])
    setElementDimension(GB[index], GBShopSpawns[i][7])
    local blipf = createBlipAttachedTo(GB[index], 3)
    setElementData(blipf,"BlipName","Farmácia")
    setBlipVisibleDistance ( blipf, 150 )
    setElementFrozen(GB[index], true)
end

addEventHandler("onClientRender", root, function()
    for i, v in pairs(Food) do
        --dxDrawTextOnElement(v, "Vendedor de#00ff73 Alimentos", 1.05, 15, 255, 255, 255, 255, 1.3, font2)
    end
    for i, v in pairs(Guns) do
        --dxDrawTextOnElement(v, "Vendedor de#00ff73 Armas", 1.05, 15, 255, 255, 255, 255, 1.3, font2)
    end
    for i, v in pairs(Utility) do
        --dxDrawTextOnElement(v, "Vendedor de#00ff73 Utilitários", 1.05, 15, 255, 255, 255, 255, 1.3, font2)
    end
    for i, v in pairs(Bar) do
        dxDrawTextOnElement(v, "(17)", 1.05, 15, 255, 255, 255, 255, 1.3, font2)
    end
    for i, v in pairs(Ilegal) do
        --dxDrawTextOnElement(v, "?", 1.05, 15, 255, 255, 255, 255, 1.3, font2)
    end
    for i, v in pairs(Ferramentas) do
        --dxDrawTextOnElement(v, "Vendedor de#00ff73 Ferramentas", 1.05, 15, 255, 255, 255, 255, 1.3, font2)
    end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------
function dxDrawTextOnElement(TheElement,text,height,distance,R,G,B,alpha,size,font,...)
    local x, y, z = getElementPosition(TheElement)
    local x2, y2, z2 = getCameraMatrix()
    local distance = distance or 20
    local height = height or 1
    local sx, sy = getScreenFromWorldPosition(x, y, z+height)
     if(sx) and (sy) then
        local distanceBetweenPoints = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
        if(distanceBetweenPoints < distance) then
			dxDrawText(text, sx+2, sy+2, sx, sy, tocolor(R or 255, G or 255, B or 255, alpha or 255), (size or 1)-(distanceBetweenPoints / distance), font or "arial", "center", "center", _, _, _, true)
        end
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------

function dxDrawRectangleBorde(x, y, w, h, borderColor, bgColor, postGUI)
    if (x and y and w and h) then
        if (not borderColor) then
            borderColor = tocolor(0, 0, 0, 200)
        end

        if (not bgColor) then
            bgColor = borderColor
        end

        dxDrawRectangle(x, y, w, h, bgColor, postGUI)

        dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI) -- top
        dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI) -- bottom
        dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI) -- left
        dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI) -- right
    end
end