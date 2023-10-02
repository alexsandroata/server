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

local TargetPlayer = nil

PosSlots = {}
PosSlotsPolice = {}
PesoConsumidoInv = 0
PesoConsumidoRevistar = 0

Police = false

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

addEvent("MST.OpenPolice",true)
addEventHandler("MST.OpenPolice",root,function(itensm,itenst,target)
    if not Police then
        TargetPlayer = target
        addEventHandler("onClientRender", root, dxPolice)

        Police = true
        PosScrollbar = 0
        PosScrollbar2 = 0
        ItensMeu = itensm
        ItensPolice = itenst
        SelectTarget = 0
        EditBox.Create("Quantidade", 649, 359, 66, 29,false, 8,tocolor(255,255,255,0), dxfont1_MontserratBold, "QTD")
        EditBox.SetVisible("Quantidade",true)
        PesoConsumidoInv = getConsumed(ItensMeu, "inv")
        PesoConsumidoRevistar = getConsumed(ItensPolice, "inv")

        showCursor(true)

    end
end)

addEvent("MST.AttPolice",true)
addEventHandler("MST.AttPolice",root,function(itensm, itenst)
    if Police then
        ItensMeu = itensm
        ItensPolice = itenst

        PesoConsumidoInv = getConsumed(ItensMeu, "inv")
        PesoConsumidoRevistar = getConsumed(ItensPolice, "inv")
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

bindKey("backspace","down",function()
    if Police then
        removeEventHandler("onClientRender",root,dxPolice)
        Police = false
        showCursor(false)
        EditBox.DestroyEdit("Quantidade")
    end
end)

function getWeigthBag(element)
    if element and isElement(element) then
        if getElementData(element, "VIP") or getElementData(element, "Staff") then
            return 50
        end
    end

    return 30
end

local poppins = dxCreateFont(":MODInventario/fontes/Poppins-Bold.ttf", 12)

function dxPolice()
    if not TargetPlayer or not isElement(TargetPlayer) then
        Police = false
        showCursor(false)
        EditBox.DestroyEdit("Quantidade")
        removeEventHandler("onClientRender",root,dxPolice)
    end

    local multPx, multPx2 = 0, 0
    local multPy, multPy2 = 0, 0

    exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW, screenH, tocolor(255, 255, 255, alpha))

    pesoMax = getWeigthBag(localPlayer)
    
    if getElementData( localPlayer, 'bag.current' ) then 
        pesoMax = tonumber( getElementData( localPlayer, 'bag.current' ) )
    end
    pesoMax = (pesoMax and pesoMax > 0 and pesoMax or 0)
    peso = (PesoConsumidoInv and PesoConsumidoInv > 0 and PesoConsumidoInv or 0)

    roundedRectangle(176, 194, 458, 56, 3, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false) -- | Fundo baixo inventario

    roundedRectangle(186, 237, 442, 9, 3, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false) -- | Fundo barrinha
    roundedRectangle(186, 237, 442/pesoMax*peso, 9, 3, tocolor(100, 53, 255, 255), "#ff0000", 0, false) -- | Barrinha
    dxDrawText((verifyFloor(peso) and peso..".00" or peso).." / "..(verifyFloor(pesoMax) and pesoMax..".00" or pesoMax), 187, 217, 100, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

    roundedRectangle(188, 187, 110, 25, 5, tocolor(100, 53, 255, alpha), "#ff0000", 0, false) -- | Fundo inventario
    dxDrawText("INVENTÁRIO", 205, 189, 75, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

    roundedRectangle(176, 251, 458, 348, 3, tocolor(0, 0, 0, 51), "#ff0000", 0, false) -- | Fundo Slots

    roundedRectangle(649, 359, 66, 29, 3, tocolor(0, 0, 0, 51), "#ff0000", 0, false)

    -- | Scroll

    roundedRectangle(628, 251 + (12 * PosScrollbar), 6, 41, 3, tocolor(100, 53, 255, 255), "#ff0000", 0, false)

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

                roundedRectangle(199 + (multPx * 89), 361 + (multPy * 113), 49, 2, 3, tocolor(100, 53, 255, 255), "#ff0000", 0, false)
                dxDrawImage(posX, posY, 80, 80, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

                if i > 5 then
                    dxDrawText(string.sub(""..Peso.."", 1, 3), 186 + (multPx * 89), 264 + (multPy * 113), 15, 20, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                    dxDrawText(Quantidade.."x", posXQuant + 37, 264 + (multPy * 113), 16, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                else
                    roundedRectangle(182 + (multPx * 89), 260 + (multPy * 113), 20, 19, 5, tocolor(100, 53, 255, 255), "#ff0000", 0, false)
                    dxDrawText(i, 188 + (multPx * 89), 259 + (multPy * 113), 15, 20, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

                    dxDrawText(Quantidade.."x", posXQuant + 37, 264 + (multPy * 113), 16, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                end
            else
                local Item = ItensMeu[Select][1]
                local xc, yc = getCursorPosition()
                local cursorx, cursory = xc*screenW, yc*screenH

                _dxDrawImage(cursorx - 27, cursory - 27, 80, 80, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
            end
        end

        multPx = multPx + 1
        if multPx == 5 then
            multPx = 0
            multPy = multPy + 1
        end
    end

    -- | Parte do Revistar

    roundedRectangle(732, 195, 458, 56, 3, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false) -- | Fundo baixo Revistar
    roundedRectangle(741, 186, 72, 25, 5, tocolor(100, 53, 255, alpha), "#ff0000", 0, false) -- | Fundo Revistar
    dxDrawText("Revistar", 752, 190, 26, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

    pesoMaxR = getWeigthBag(TargetPlayer)

    if getElementData( TargetPlayer, 'bag.current' ) then 
        pesoMaxR = tonumber( getElementData( TargetPlayer, 'bag.current' ) )
    end

    roundedRectangle(740, 237, 442, 9, 3, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false) -- | Fundo barrinha
    roundedRectangle(740, 237, 442/pesoMaxR*PesoConsumidoRevistar, 9, 3, tocolor(100, 53, 255, 255), "#ff0000", 0, false) -- | Barrinha
    dxDrawText((verifyFloor(PesoConsumidoRevistar) and PesoConsumidoRevistar..".00" or PesoConsumidoRevistar).." / "..(verifyFloor(pesoMaxR) and pesoMaxR..".00" or pesoMaxR), 748, 217, 100, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

    roundedRectangle(731, 251, 458, 348, 3, tocolor(0, 0, 0, 51), "#ff0000", 0, false) -- | Fundo Slots Revistar

    -- | Scroll Revistar

    roundedRectangle(1186, 251 + (12 * PosScrollbar2), 6, 41, 3, tocolor(100, 53, 255, 255), "#ff0000", 0, false)

    -- | Slots Revistar

    for i = 1, 15 do
        roundedRectangle(738 + (multPx2 * 89), 260 + (multPy2 * 113), 83, 107, 10, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false)
        PosSlotsPolice[i] = {738 + (multPx2 * 89), 260 + (multPy2 * 113)}

        i = i + PosScrollbar2
        if ItensPolice[i] then
            if Select2 ~= i then
                local Item = ItensPolice[i][1]
                local Quantidade = ItensPolice[i][2]
                local Peso = ItensPolice[i][4] * Quantidade

                local width = dxGetTextSize(Quantidade.."x", 10, 1, poppins, 1)
                local posXQuant = (738 + (multPx2 * 89) + (83/2)) - (width)

                local posX = (738 + (multPx2 * 89) + (83/2)) - (80/2)
                local posY = (260 + (multPy2 * 113) + (107/2)) - (80/2)

                roundedRectangle(755 + (multPx2 * 89), 361 + (multPy2 * 113), 49, 2, 3, tocolor(100, 53, 255, 255), "#ff0000", 0, false)
                dxDrawImage(posX, posY, 80, 80, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

                if i > 5 then
                    dxDrawText(string.sub(""..Peso.."", 1, 3), 744 + (multPx2 * 89), 264 + (multPy2 * 113), 15, 20, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                    dxDrawText(Quantidade.."x", posXQuant + 37, 264 + (multPy2 * 113), 16, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                else
                    roundedRectangle(738 + (multPx2 * 89), 260 + (multPy2 * 113), 20, 19, 5, tocolor(100, 53, 255, 255), "#ff0000", 0, false)
                    dxDrawText(i, 744 + (multPx2 * 89), 259 + (multPy2 * 113), 15, 20, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)

                    dxDrawText(Quantidade.."x", posXQuant + 37, 264 + (multPy2 * 113), 16, 19, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
                end
            else
                local Item = ItensPolice[Select2].Item
                local xc, yc = getCursorPosition()
                local cursorx, cursory = xc*screenW, yc*screenH

                _dxDrawImage(cursorx - 27, cursory - 27, 80, 80, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
            end
        end

        multPx2 = multPx2 + 1
        if multPx2 == 5 then
            multPx2 = 0
            multPy2 = multPy2 + 1
        end
    end

    if Select ~= 0 or Select2 ~= 0 then
        local selected = Select ~= 0 and ItensMeu or Select2 ~= 0 and ItensPolice
        local numberSelected = Select ~= 0 and Select or Select2 ~= 0 and Select2

        local Item = selected[numberSelected][1]
        local Nome = selected[numberSelected][3]
        local Quantidade = selected[numberSelected][2]
        local Peso = Select and (selected[numberSelected][4] and (selected[numberSelected][4] * selected[numberSelected][2]) or "0.0") or selected[numberSelected].Peso * Quantidade

        local width = dxGetTextSize(Nome, 75, 1, poppins, 1)

        local posName = (187 + (90/2) - (width/2))

        roundedRectangle(179, 615, 193, 77, 5, tocolor(19, 16, 16, 142.8), "#ff0000", 0, false)

        roundedRectangle(187, 605, 90, 23, 5, tocolor(100, 53, 255, 255), "#ff0000", 0, false)

        dxDrawText(Nome, posName, 607, 75, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
        dxDrawImage(182, 638, 49, 45, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("PESO: "..string.sub(""..Peso.."", 1, 3), 241, 641, 36, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
        dxDrawText("MAXIMO: "..Quantidade, 241, 659, 36, 18, tocolor(255, 255, 255, alpha), 1, poppins, "left", "top", false, false, false, false, false)
    end
    
    -- dxDrawRectangle(0, 0, screenW, screenH, tocolor(0,0,0,75), false)
    -- for i = 1,#PosSlots do
    --     dxDrawImage(x*PosSlots[i][1], y*PosSlots[i][2], x*138, y*152, "assets/img/slot.png", 0, 0, 0, (isCursorOnElement(x*PosSlots[i][1], y*PosSlots[i][2], x*138, y*152) and tocolor(255,255,255,255) or tocolor(255,255,255,200)),false)
    --     dxDrawImage(x*PosSlots[i][1], y*(PosSlots[i][2] + 122), x*138, y*30, "assets/img/barra.png", 0, 0, 0, tocolor(255,255,255,255), false)
    -- end
    -- for i = 1,#InfosInv do
    --     local Index = InfosInv[i]
    --     if #ItensMeu >= Index then
    --         local Item = ItensMeu[Index][1]
    --         local Quantidade = ItensMeu[Index][2]
    --         local Nome = ItensMeu[Index][3]
    --         local Peso = ItensMeu[Index][4] * Quantidade
    --         local Width, Height = (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][1] or 64), (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][2] or 64)
    --         local PosX = (PosSlots[i][1] + (138/2)) - (Width/2)
    --         local PosY = (PosSlots[i][2] + (152/2)) - (Height/2)
    --         dxDrawImage(x*PosX, y*PosY, x*Width, y*Height, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255,255,255,255), false)

    --         local Width = dxGetTextWidth(Nome, 1, dxfont4_MontserratSemiBold)
    --         local Height = dxGetFontHeight(1, dxfont4_MontserratSemiBold)
    --         local PosX = (x*(PosSlots[i][1]) + (x*(138)/2)) - (Width/2)
    --         local PosY = (y*(PosSlots[i][2] + 122) + (y*(30)/2)) - (Height/2)
    --         dxDrawText(string.upper(Nome), PosX, PosY, Width, Height, tocolor(255,255,255,255), 1 ,dxfont4_MontserratSemiBold, "left", "top", false,false,false,false)


    --         local PesoFormat = (verifyFloor(Peso) and string.sub(""..Peso.."", 1, 4) or ""..Peso..".00")
    --         local Width = dxGetTextWidth(""..Quantidade.."x ("..PesoFormat..")", 1, dxfont2_MontserratSemiBold)
    --         dxDrawText(""..Quantidade.."x ("..PesoFormat..")", x*(PosSlots[i][1] + 130) - Width, y*(PosSlots[i][2] + 10), x*0, y*0, tocolor(255,255,255,255), 1 ,dxfont2_MontserratSemiBold, "left", "top", false,false,false,false)
    --     end
    -- end
    -- for i = 1,#PosSlots2 do
    --     dxDrawImage(x*PosSlots2[i][1], y*PosSlots2[i][2], x*138, y*152, "assets/img/slot.png", 0, 0, 0, (isCursorOnElement(x*PosSlots2[i][1], y*PosSlots2[i][2], x*138, y*152) and tocolor(255,255,255,255) or tocolor(255,255,255,200)),false)
    --     dxDrawImage(x*PosSlots2[i][1], y*(PosSlots2[i][2] + 122), x*138, y*30, "assets/img/barra.png", 0, 0, 0, tocolor(255,255,255,255), false)
    -- end
    -- for i = 1,#InfosTarget do
    --     local Index = InfosTarget[i]
    --     if #ItensPolice >= Index then
    --         local Item = ItensPolice[Index][1]
    --         local Quantidade = ItensPolice[Index][2]
    --         local Nome = ItensPolice[Index][3]
    --         local Peso = ItensPolice[Index][4] * Quantidade
    --         local Width, Height = (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][1] or 64), (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][2] or 64)
    --         local PosX = ((PosSlots2[i][1]) + ((138)/2)) - ((Width)/2)
    --         local PosY = (PosSlots2[i][2] + (152/2)) - (Height/2)
    --         dxDrawImage(x*PosX, y*PosY, x*Width, y*Height, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255,255,255,255), false)

    --         local Width = dxGetTextWidth(Nome, 1, dxfont4_MontserratSemiBold)
    --         local Height = dxGetFontHeight(1, dxfont4_MontserratSemiBold)
    --         local PosX = (x*(PosSlots2[i][1]) + (x*(138)/2)) - (Width/2)
    --         local PosY = (y*(PosSlots2[i][2] + 122) + (y*(30)/2)) - (Height/2)
    --         dxDrawText(string.upper(Nome), PosX, PosY, Width, Height, tocolor(255,255,255,255), 1 ,dxfont4_MontserratSemiBold, "left", "top", false,false,false,false)


    --         local PesoFormat = (verifyFloor(Peso) and string.sub(""..Peso.."", 1, 4) or ""..Peso..".00")
    --         local Width = dxGetTextWidth(""..Quantidade.."x ("..PesoFormat..")", 1, dxfont2_MontserratSemiBold)
    --         dxDrawText(""..Quantidade.."x ("..PesoFormat..")", x*(PosSlots2[i][1] + 130) - Width, y*(PosSlots2[i][2] + 10), x*0, y*0, tocolor(255,255,255,255), 1 ,dxfont2_MontserratSemiBold, "left", "top", false,false,false,false)
    --     end
    -- end
    -- local mx, my = getCursorPosition()
    -- local fullx, fully = guiGetScreenSize()
    -- local cursorx, cursory = mx*fullx - x*(30), my*fully - y*(30)
    -- if SelectTarget ~= 0 then
    --     local Item = ItensPolice[SelectTarget][1]
    --     local Quantidade = ItensPolice[SelectTarget][2]
    --     local Nome = ItensPolice[SelectTarget][3]
    --     local Peso = ItensPolice[SelectTarget][4] * Quantidade
    --     local Width, Height = (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][1] or 64), (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][2] or 64)
    --     dxDrawImage(cursorx, cursory, x*138, y*152, "assets/img/slot.png", 0, 0, 0, tocolor(255,255,255,255),true)
    --     dxDrawImage(cursorx,  cursory + y*(122), x*138, y*30, "assets/img/barra.png", 0, 0, 0, tocolor(255,255,255,255), true)
    --     local PosX = (cursorx + (x*(138)/2)) - (x*(Width)/2)
    --     local PosY = (cursory + (y*(152)/2)) - (y*(Height)/2)
    --     dxDrawImage(PosX, PosY, x*Width, y*Height, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255,255,255,255), true)

    --     local Width = dxGetTextWidth(Nome, 1, dxfont4_MontserratSemiBold)
    --     local Height = dxGetFontHeight(1, dxfont4_MontserratSemiBold)
    --     local PosX = (cursorx + (x*(138)/2)) - (Width/2)
    --     local PosY = ((cursory + y*(122)) + (y*(30)/2)) - (Height/2)
    --     dxDrawText(string.upper(Nome), PosX, PosY, Width, Height, tocolor(255,255,255,255), 1 ,dxfont4_MontserratSemiBold, "left", "top", false,false,true,false)

    --     local PesoFormat = (verifyFloor(Peso) and string.sub(""..Peso.."", 1, 3) or ""..Peso..".00")
    --     local Width = dxGetTextWidth(""..Quantidade.."x ("..PesoFormat..")", 1, dxfont2_MontserratSemiBold)
    --     dxDrawText(""..Quantidade.."x ("..PesoFormat..")", cursorx + x*(130) - Width, cursory + y*(10), x*0, y*0, tocolor(255,255,255,255), 1 ,dxfont2_MontserratSemiBold, "left", "top", false,false,true,false)
    -- end

    -- --ScrollBar Inv

    -- dxDrawImage(x*770, y*280, x*11, y*630, Scroll2, 0, 0, 0, tocolor(255, 255, 255, 255), false)
    -- dxDrawImage(x*770, y*(154 + (126 * PosScrollbar)), x*11, y*126, Scroll1, 0, 0, 0, tocolor(255, 255, 255, 255), false)

    -- --ScrollBar Bau

    -- dxDrawImage(x*1863, y*280, x*11, y*630, Scroll2, 0, 0, 0, tocolor(255, 255, 255, 255), false)
    -- dxDrawImage(x*1863, y*(154 + (126 * PosScrollbar2)), x*11, y*126, Scroll1, 0, 0, 0, tocolor(255, 255, 255, 255), false)



    -- dxDrawRoundedRectangle(x*825, y*459, x*269, y*222, tocolor(52,31,62, 255), 7)
    -- dxDrawRoundedRectangle(x*848, y*476, x*223, y*74, tocolor(70,47,82,255), 7)  
    -- dxDrawRoundedRectangle(x*848, y*586, x*223, y*74, tocolor(70,47,82,255), 7)  
    -- dxDrawText("EM BREVE", x*848, y*586, x*1071, y*660, tocolor(255, 255, 255, 255), 1.00, dxfont3_MontserratSemiBold, "center", "center", false, false, false, false, false)

    
    -- dxDrawText(""..getPlayerName(localPlayer).." #"..(getElementData(localPlayer, "ID") or "N/A").."", x*52, y*164, x*370, y*207, tocolor(241, 241, 241, 255), 1.00, dxfont0_MontserratBoldItalic, "left", "top", false, false, false, false, false)
    -- dxDrawText("#462F52N: #ffffffN/A   #462F52RG: #ffffff"..(getElementData(localPlayer, "ID") or "N/A").."   #462F52BANCO: #ffffff$"..(getElementData(localPlayer, "bank") or 0 ).."   #462F52CARTEIRA: #ffffff$"..getPlayerMoney(localPlayer).."", x*52, y*213, x*467, y*242, tocolor(255, 255, 255, 255), 1.00, dxfont1_MontserratSemiBold, "left", "top", false, false, false, true, false)
end

addEventHandler("onClientClick",root,function(b,s)
    if Police then
        if b == "left" then
            if s == "down" then
                for i = 1,#PosSlots2 do
                    if isCursorOnElement(sx*PosSlots2[i][1], sy*PosSlots2[i][2], sx*83, sy*107) then
                        if ItensPolice[i + PosScrollbar2] then
                            Select2 = i + PosScrollbar2
                        end
                    end
                end
            elseif s == "up" then
                if Select2 ~= 0 then
                	for i = 1, #PosSlots do
                		if isCursorOnElement(sx*PosSlots[i][1], sx*PosSlots[i][2], sx*83, sy*107) then
		                    local Quantidade = (EditBox.GetText("Quantidade") ~= "" and tonumber(EditBox.GetText("Quantidade")) or 1)
		                    triggerServerEvent("MST.PegarItem", localPlayer, Select2, Quantidade, TargetPlayer)
		                end
                	end
                end
                Select2 = 0
            end
        end
    end
end)

function ScrollBar(b)
    if Police then
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

local dxfont0_RobotoRegular = dxCreateFont("assets/font/RobotoRegular.ttf", 13)
local dxfont1_RobotoRegular = dxCreateFont("assets/font/RobotoRegular.ttf", 11)

Accept = false

addEvent("MST.ProporRevista",true)
addEventHandler("MST.ProporRevista",root,function(revistando)
    if Accept then
        removeEventHandler("onClientRender",root,renderAccept)
        if Timer and isTimer(Timer) then
            killTimer(Timer)
        end
    end
    addEventHandler("onClientRender",root,renderAccept)
    Accept = true
    Revistando = revistando
    Tick = getTickCount()
    Timer = setTimer(function()
        if Accept then
            removeEventHandler("onClientRender",root,renderAccept)
            Accept = false
        end
    end,60000,1)
end)

function renderAccept()
    local PosX = interpolateBetween(2000, 0, 0, 1480, 0, 0, (getTickCount() - Tick)/500, "Linear")
    dxDrawImage(x*PosX, y*102, x*425, y*64, "assets/img/fundo.png", 0, 0, 0, tocolor(255,255,255,255), false)
    dxDrawImage(x*(PosX + 15), y*111, x*49, y*45, "assets/img/button.png", 0, 0, 0, tocolor(0, 147, 65,255), false)
    dxDrawImage(x*(PosX + 77), y*111, x*49, y*45, "assets/img/button.png", 0, 0, 0, tocolor(211, 33, 33,255), false)
    dxDrawText("E", x*(PosX + 35), y*123, x*1562, y*167, tocolor(255, 255, 255, 255), 1.00, dxfont0_RobotoRegular, "left", "top", false, false, true, false, false)
    dxDrawText("U", x*(PosX + 96), y*123, x*1624, y*167, tocolor(255, 255, 255, 255), 1.00, dxfont0_RobotoRegular, "left", "top", false, false, true, false, false)
    dxDrawText("Aperte [E] Para Aceitar a Revista\nou [U] Para Recusar", x*(PosX + 144), y*115, x*1870, y*153, tocolor(255, 255, 255, 255), 1.00, dxfont1_RobotoRegular, "left", "top", false, false, true, false, false)
end

function AcceptOrRecuse(b)
    if Accept then
        if b == "e" then
            triggerServerEvent("MST.AceitarRevista",localPlayer,Revistando)
            if Timer and isTimer(Timer) then
                killTimer(Timer)
            end
            removeEventHandler("onClientRender",root,renderAccept)
            Accept = false
        elseif b == "u" then
            removeEventHandler("onClientRender",root,renderAccept)
            Accept = false
            if Timer and isTimer(Timer) then
                killTimer(Timer)
            end
        end
    end
end
bindKey("e", "down", AcceptOrRecuse)
bindKey("u", "down", AcceptOrRecuse)

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

