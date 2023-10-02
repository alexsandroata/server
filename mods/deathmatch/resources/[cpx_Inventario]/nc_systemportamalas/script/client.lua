local screenW, screenH = guiGetScreenSize()
local resW, resH = 1920,1080
local res2, resH2 = 1366, 768
local x, y = (screenW/resW), (screenH/resH)
local sx, sy = (screenW/res2), (screenH/resH2)

local dxfont0_MontserratBoldItalic = dxCreateFont("assets/font/MontserratBoldItalic.ttf", y*24)
local dxfont1_MontserratSemiBold = dxCreateFont("assets/font/MontserratSemiBold.ttf", y*13)
local dxfont2_MontserratSemiBold = dxCreateFont("assets/font/MontserratSemiBold.ttf", y*10)
local dxfont3_MontserratSemiBold = dxCreateFont("assets/font/MontserratSemiBold.ttf", y*15)
local dxfont4_MontserratSemiBold = dxCreateFont("assets/font/MontserratSemiBold.ttf", y*11)


Scroll1 = dxCreateTexture("assets/img/Scroll1.png", "argb")
Scroll2 = dxCreateTexture("assets/img/Scroll2.png", "argb")

PosSlots = {}
PosSlotsBau = {}

Chest = false

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

local function roundedRectangle(x, y, width, height, radius, color, colorStroke, sizeStroke, postGUI)
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

bindKey('h', 'down', function()
    triggerServerEvent('OpenPortaMalas', localPlayer, localPlayer)
end)

addEvent("MST.OpenPM",true)
addEventHandler("MST.OpenPM",root,function(id,itensm,itensb, peso, veh)
    local export = exports["MODInventario"]:InventoryReturnsV()
    if not Chest then
        if not export["inventory"] and not export["shop"] then
            addEventHandler("onClientRender",root,dxChest)
            Chest = true
            PosScrollbar = 0
            PosScrollbar2 = 0
            showCursor(true)
            ItensMeu = itensm
            ItensBau = itensb
            IDBau = id
            Select = 0
            Select2 = 0
            EditBox.Create("Quantidade", 605, 333, 66, 29,false, 8,tocolor(255,255,255,0), dxfont1_MontserratBold, "QTD")
            EditBox.SetVisible("Quantidade",true)
            PesoConsumidoInv = getConsumed(ItensMeu, "inv")
            PesoConsumidoBau = getConsumed(ItensBau, "bau")
            PesoBau = peso
            Veiculo = veh
        end
    end
end)


addEvent("MST.AttInvPM",true)
addEventHandler("MST.AttInvPM",root,function()
    if Chest then
        triggerServerEvent("Kings.UpdateID2",localPlayer,localPlayer,IDBau)
    end
end)

addEvent("MST.AttPM",true)
addEventHandler("MST.AttPM",root,function(itensm, itensb)
    if Chest then
        ItensMeu = itensm
        ItensBau = itensb
        PesoConsumidoInv = getConsumed(ItensMeu, "inv")
        PesoConsumidoBau = getConsumed(ItensBau, "bau")
    end
end)

bindKey("backspace","down",function()
    if Chest then
        removeEventHandler("onClientRender",root,dxChest)
        Chest = false
        showCursor(false)
        EditBox.DestroyEdit("Quantidade")
        triggerServerEvent('ClosePortaMalas', localPlayer, localPlayer, Veiculo)
    end
end)

function getConsumed(table,type)
    PesoTotal = 0
    for i,v in ipairs(table) do
        if type == "inv" then
            local Quantidade = v[2]
            local Peso = v[4]
            PesoTotal = PesoTotal + (Peso * Quantidade)
        elseif type == "bau" then
            local Quantidade = v.Quantidade
            local Peso = v.Peso
            PesoTotal = PesoTotal + (Peso * Quantidade)
        end
    end
    return PesoTotal
end

function getWeigthBag()
    if getElementData(localPlayer, "VIP") or getElementData(localPlayer, "Staff") then
        return 50
    end
    return 30
end

local poppins = dxCreateFont(":MODInventario/fontes/Poppins-Bold.ttf", 12)

-- | :MODInventario/gfx/itens/"..Item..".png"

function dxChest()
    local multPx, multPx2 = 0, 0
    local multPy, multPy2 = 0, 0

    exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW, screenH, tocolor(255, 255, 255, alpha))

    pesoMax = getWeigthBag()
    
    if getElementData( localPlayer, 'bag.current' ) then 
        pesoMax = tonumber( getElementData( localPlayer, 'bag.current' ) )
    end
    pesoMax = (pesoMax and pesoMax > 0 and pesoMax or 0)
    peso = (PesoConsumidoInv and PesoConsumidoInv > 0 and PesoConsumidoInv or 0)

    roundedRectangle(176, 194, 458, 56, 3, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false) -- | Fundo baixo inventario

    roundedRectangle(186, 237, 442, 9, 3, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false) -- | Fundo barrinha
    roundedRectangle(186, 237, 442/pesoMax*peso, 9, 3, tocolor(255, 0, 255), "#ff0000", 0, false) -- | Barrinha
    dxDrawText((verifyFloor(peso) and peso..".00" or peso).." / "..(verifyFloor(pesoMax) and pesoMax..".00" or pesoMax), 187, 217, 100, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

    roundedRectangle(188, 187, 110, 25, 5, tocolor(66, 73, 73, alpha), "#ff0000", 0, false) -- | Fundo inventario
    dxDrawText("INVENTÁRIO", 205, 189, 75, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

    roundedRectangle(176, 251, 458, 348, 3, tocolor(0, 0, 0, 51), "#ff0000", 0, false) -- | Fundo Slots

    roundedRectangle(649, 359, 66, 29, 3, tocolor(0, 0, 0, 51), "#ff0000", 0, false)

    -- | Scroll

    roundedRectangle(628, 251 + (12 * PosScrollbar), 6, 41, 3, tocolor(255, 0, 255), "#ff0000", 0, false)

    -- | Slots

    for i = 1, 15 do
        roundedRectangle(182 + (multPx * 89), 260 + (multPy * 113), 83, 107, 10, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false)
        PosSlots[i] = {182 + (multPx * 89), 260 + (multPy * 113)}
        
        i = i + PosScrollbar
        if ItensMeu[i] then
            if Select ~= i then
                local Item = ItensMeu[i][1]
                local Quantidade = ItensMeu[i][2]
                local Peso = (ItensMeu[i][4] and (ItensMeu[i][4] * ItensMeu[i][2]) or "0.0")

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
                local Item = ItensMeu[Select][1]
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

    -- | Parte do Bau

    roundedRectangle(732, 195, 458, 56, 3, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false) -- | Fundo baixo Bau
    roundedRectangle(741, 186, 62, 25, 5, tocolor(66, 73, 73, alpha), "#ff0000", 0, false) -- | Fundo Bau
    dxDrawText("PORTA-MALAS", 759, 190, 26, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

    roundedRectangle(740, 237, 442, 9, 3, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false) -- | Fundo barrinha
    roundedRectangle(740, 237, 442/PesoBau*PesoConsumidoBau, 9, 3, tocolor(255, 0, 255), "#ff0000", 0, false) -- | Barrinha
    dxDrawText((verifyFloor(PesoConsumidoBau) and PesoConsumidoBau..".00" or PesoConsumidoBau).." / "..(verifyFloor(PesoBau) and PesoBau..".00" or PesoBau), 748, 217, 100, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

    roundedRectangle(731, 251, 458, 348, 3, tocolor(0, 0, 0, 51), "#ff0000", 0, false) -- | Fundo Slots Bau

    -- | Scroll Bau

    roundedRectangle(1186, 251 + (12 * PosScrollbar2), 6, 41, 3, tocolor(255, 0, 255), "#ff0000", 0, false)

    -- | Slots Bau

    for i = 1, 15 do
        roundedRectangle(738 + (multPx2 * 89), 260 + (multPy2 * 113), 83, 107, 10, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false)
        PosSlotsBau[i] = {738 + (multPx2 * 89), 260 + (multPy2 * 113)}

        i = i + PosScrollbar2
        if ItensBau[i] then
            if Select2 ~= i then
                local Item = ItensBau[i].Item
                local Quantidade = ItensBau[i].Quantidade
                local Peso = ItensBau[i].Peso * Quantidade

                local width = dxGetTextSize(Quantidade.."x", 10, 1, poppins, 1)
                local posXQuant = (738 + (multPx2 * 89) + (83/2)) - (width)

                local posX = (738 + (multPx2 * 89) + (83/2)) - (80/2)
                local posY = (260 + (multPy2 * 113) + (107/2)) - (80/2)

                roundedRectangle(755 + (multPx2 * 89), 361 + (multPy2 * 113), 49, 2, 3, tocolor(255, 0, 255), "#ff0000", 0, false)
                dxDrawImage(posX, posY, 80, 80, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

                if i > 5 then
                    dxDrawText(string.sub(""..Peso.."", 1, 3), 744 + (multPx2 * 89), 264 + (multPy2 * 113), 15, 20, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                    dxDrawText(Quantidade.."x", posXQuant + 37, 264 + (multPy2 * 113), 16, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                else
                    roundedRectangle(738 + (multPx2 * 89), 260 + (multPy2 * 113), 20, 19, 5, tocolor(255, 0, 255), "#ff0000", 0, false)
                    dxDrawText(i, 744 + (multPx2 * 89), 259 + (multPy2 * 113), 15, 20, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

                    dxDrawText(Quantidade.."x", posXQuant + 37, 264 + (multPy2 * 113), 16, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                end
            else
                local Item = ItensBau[Select2].Item
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

    if Select ~= 0 or Select2 ~= 0 then
        local selected = Select ~= 0 and ItensMeu or Select2 ~= 0 and ItensBau
        local numberSelected = Select ~= 0 and Select or Select2 ~= 0 and Select2

        local Item = Select and selected[numberSelected][1] or selected[numberSelected].Item
        local Nome = Select and selected[numberSelected][3] or selected[numberSelected].Nome
        local Quantidade = Select and selected[numberSelected][2] or selected[numberSelected].Quantidade
        local Peso = Select and (selected[numberSelected][4] and (selected[numberSelected][4] * selected[numberSelected][2]) or "0.0") or selected[numberSelected].Peso * Quantidade

        local width = dxGetTextSize(Nome, 75, 1, poppins, 1)

        local posName = (187 + (90/2) - (width/2))

        roundedRectangle(179, 615, 193, 77, 5, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false)

        roundedRectangle(187, 605, 90, 23, 5, tocolor(255, 0, 255), "#ff0000", 0, false)

        dxDrawText(Nome, posName, 607, 75, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
        dxDrawImage(182, 638, 49, 45, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("PESO: "..string.sub(""..Peso.."", 1, 3), 241, 641, 36, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
        dxDrawText("MAXIMO: "..Quantidade, 241, 659, 36, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
    end
end

addEventHandler("onClientClick",root,function(b,s)
    if Chest then
        if b == "left" then
            if s == "down" then
                for i = 1,#PosSlots do
                    if isCursorOnElement(sx*PosSlots[i][1], sy*PosSlots[i][2], x*138, y*152) then
                        if ItensMeu[i + PosScrollbar] then
                            Select = i + PosScrollbar
                        end
                    end
                end

                for i = 1,#PosSlotsBau do
                    if isCursorOnElement(sx*PosSlotsBau[i][1], sy*PosSlotsBau[i][2], x*138, y*152) then
                        if ItensBau[i + PosScrollbar2] then
                            Select2 = i + PosScrollbar2
                        end
                    end
                end

            elseif s == "up" then
                local Quantidade = (EditBox.GetText("Quantidade") ~= "" and tonumber(EditBox.GetText("Quantidade")) or 1)
                if Select ~= 0 then
                	for i = 1, #PosSlotsBau do
	                    if isCursorOnElement(sx*PosSlotsBau[i][1], sy*PosSlotsBau[i][2], sx*83, sy*107) then
	                        local Item = ItensMeu[Select][1]
	                        local QuantidadeT = ItensMeu[Select][2]
	                        if QuantidadeT >= Quantidade then
	                            local PesoAdd = ItensMeu[Select][4] * Quantidade
	                            local PesoLivre = PesoBau - PesoConsumidoBau
	                            if PesoLivre >= PesoAdd then
	                                triggerServerEvent("Kings.AddPM",localPlayer,IDBau,Item,Quantidade)
	                            end
	                        end
	                    end
                    end
                elseif Select2 ~= 0 then
                	for i = 1, #PosSlots do
	                    if isCursorOnElement(sx*PosSlots[i][1], sy*PosSlots[i][2], sx*83, sy*107) then
		                    local Item = ItensBau[Select2].Item
		                    local QuantidadeT = ItensBau[Select2].Quantidade
		                    if QuantidadeT >= Quantidade then
		                        triggerServerEvent("Kings.RemovePM",localPlayer,IDBau,Item,Quantidade)
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

function ScrollBar(b)
    if Chest then
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
bindKey("mouse_wheel_up", "down", ScrollBar)
bindKey("mouse_wheel_down", "down", ScrollBar)

function verifyFloor(number)
    return not ((number - math.floor(number)) == 0)
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

function ChestReturnsV( ... )
    local visibles = {
        chest = Chest,
    }

    return visibles
end