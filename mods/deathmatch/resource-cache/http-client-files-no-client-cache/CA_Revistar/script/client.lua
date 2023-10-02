
local screenW, screenH = guiGetScreenSize ()
local resW, resH = 1920,1080
local x, y = (screenW/resW), (screenH/resH)

local dxfont0_MontserratBoldItalic = dxCreateFont("assets/font/MontserratBoldItalic.ttf", y*24)
local dxfont1_MontserratSemiBold = dxCreateFont("assets/font/MontserratSemiBold.ttf", y*13)
local dxfont2_MontserratSemiBold = dxCreateFont("assets/font/MontserratSemiBold.ttf", y*10)
local dxfont3_MontserratSemiBold = dxCreateFont("assets/font/MontserratSemiBold.ttf", y*15)
local dxfont4_MontserratSemiBold = dxCreateFont("assets/font/MontserratSemiBold.ttf", y*11)


Scroll1 = dxCreateTexture("assets/img/Scroll1.png", "argb")
Scroll2 = dxCreateTexture("assets/img/Scroll2.png", "argb")

PosSlots = {}

for i = 1,4 do
    for i2 = 1,5 do
        local Index = (i * 5) - (5 - i2)
        PosSlots[Index] = {-98 + (i2 * 144), 124 + (i * 158)}
    end
end

PosSlots2 = {}

for i = 1,4 do
    for i2 = 1,5 do
        local Index = (i * 5) - (5 - i2)
        PosSlots2[Index] = {995 + (i2 * 144), 124 + (i * 158)}
    end
end

Police = false

addEvent("MST.OpenPolice",true)
addEventHandler("MST.OpenPolice",root,function(itensm,itenst,target)
    if Police then
        removeEventHandler("onClientRender",root,dxPolice)
        Police = false
        showCursor(false)
        EditBox.DestroyEdit("Quantidade")
    else
        addEventHandler("onClientRender",root,dxPolice)
        Police = true
        PosScrollbar = 1
        PosScrollbar2 = 1
        ItensMeu = itensm
        ItensPolice = itenst
        TargetPlayer = target
        InfosInv = {}
        for i = 1,20 do
            InfosInv[i] = i
        end
        InfosTarget = {}
        for i = 1,20 do
            InfosTarget[i] = i
        end
        SelectTarget = 0
        EditBox.Create("Quantidade", x*848, y*476, x*223, y*74, false, 8, tocolor(0,0,0,0), dxfont3_MontserratSemiBold, "QUANTIDADE")
        EditBox.SetVisible("Quantidade",true)
        showCursor(true)

    end
end)

addEvent("MST.AttPolice",true)
addEventHandler("MST.AttPolice",root,function(itensm, itenst)
    if Police then
        ItensMeu = itensm
        ItensPolice = itenst
    end
end)

bindKey("backspace","down",function()
    if Police then
        removeEventHandler("onClientRender",root,dxPolice)
        Police = false
        showCursor(false)
        EditBox.DestroyEdit("Quantidade")
    end
end)

function dxPolice()
    if not TargetPlayer or not isElement(TargetPlayer) then
        Police = false
        showCursor(false)
        EditBox.DestroyEdit("Quantidade")
        removeEventHandler("onClientRender",root,dxPolice)
    end
    dxDrawRectangle(0, 0, screenW, screenH, tocolor(0,0,0,75), false)
    for i = 1,#PosSlots do
        dxDrawImage(x*PosSlots[i][1], y*PosSlots[i][2], x*138, y*152, "assets/img/slot.png", 0, 0, 0, (isCursorOnElement(x*PosSlots[i][1], y*PosSlots[i][2], x*138, y*152) and tocolor(255,255,255,255) or tocolor(255,255,255,200)),false)
        dxDrawImage(x*PosSlots[i][1], y*(PosSlots[i][2] + 122), x*138, y*30, "assets/img/barra.png", 0, 0, 0, tocolor(255,255,255,255), false)
    end
    for i = 1,#InfosInv do
        local Index = InfosInv[i]
        if #ItensMeu >= Index then
            local Item = ItensMeu[Index][1]
            local Quantidade = ItensMeu[Index][2]
            local Nome = ItensMeu[Index][3]
            local Peso = ItensMeu[Index][4] * Quantidade
            local Width, Height = (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][1] or 64), (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][2] or 64)
            local PosX = (PosSlots[i][1] + (138/2)) - (Width/2)
            local PosY = (PosSlots[i][2] + (152/2)) - (Height/2)
            dxDrawImage(x*PosX, y*PosY, x*Width, y*Height, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255,255,255,255), false)

            local Width = dxGetTextWidth(Nome, 1, dxfont4_MontserratSemiBold)
            local Height = dxGetFontHeight(1, dxfont4_MontserratSemiBold)
            local PosX = (x*(PosSlots[i][1]) + (x*(138)/2)) - (Width/2)
            local PosY = (y*(PosSlots[i][2] + 122) + (y*(30)/2)) - (Height/2)
            dxDrawText(string.upper(Nome), PosX, PosY, Width, Height, tocolor(255,255,255,255), 1 ,dxfont4_MontserratSemiBold, "left", "top", false,false,false,false)


            local PesoFormat = (verifyFloor(Peso) and string.sub(""..Peso.."", 1, 4) or ""..Peso..".00")
            local Width = dxGetTextWidth(""..Quantidade.."x ("..PesoFormat..")", 1, dxfont2_MontserratSemiBold)
            dxDrawText(""..Quantidade.."x ("..PesoFormat..")", x*(PosSlots[i][1] + 130) - Width, y*(PosSlots[i][2] + 10), x*0, y*0, tocolor(255,255,255,255), 1 ,dxfont2_MontserratSemiBold, "left", "top", false,false,false,false)
        end
    end
    for i = 1,#PosSlots2 do
        dxDrawImage(x*PosSlots2[i][1], y*PosSlots2[i][2], x*138, y*152, "assets/img/slot.png", 0, 0, 0, (isCursorOnElement(x*PosSlots2[i][1], y*PosSlots2[i][2], x*138, y*152) and tocolor(255,255,255,255) or tocolor(255,255,255,200)),false)
        dxDrawImage(x*PosSlots2[i][1], y*(PosSlots2[i][2] + 122), x*138, y*30, "assets/img/barra.png", 0, 0, 0, tocolor(255,255,255,255), false)
    end
    for i = 1,#InfosTarget do
        local Index = InfosTarget[i]
        if #ItensPolice >= Index then
            local Item = ItensPolice[Index][1]
            local Quantidade = ItensPolice[Index][2]
            local Nome = ItensPolice[Index][3]
            local Peso = ItensPolice[Index][4] * Quantidade
            local Width, Height = (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][1] or 64), (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][2] or 64)
            local PosX = ((PosSlots2[i][1]) + ((138)/2)) - ((Width)/2)
            local PosY = (PosSlots2[i][2] + (152/2)) - (Height/2)
            dxDrawImage(x*PosX, y*PosY, x*Width, y*Height, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255,255,255,255), false)

            local Width = dxGetTextWidth(Nome, 1, dxfont4_MontserratSemiBold)
            local Height = dxGetFontHeight(1, dxfont4_MontserratSemiBold)
            local PosX = (x*(PosSlots2[i][1]) + (x*(138)/2)) - (Width/2)
            local PosY = (y*(PosSlots2[i][2] + 122) + (y*(30)/2)) - (Height/2)
            dxDrawText(string.upper(Nome), PosX, PosY, Width, Height, tocolor(255,255,255,255), 1 ,dxfont4_MontserratSemiBold, "left", "top", false,false,false,false)


            local PesoFormat = (verifyFloor(Peso) and string.sub(""..Peso.."", 1, 4) or ""..Peso..".00")
            local Width = dxGetTextWidth(""..Quantidade.."x ("..PesoFormat..")", 1, dxfont2_MontserratSemiBold)
            dxDrawText(""..Quantidade.."x ("..PesoFormat..")", x*(PosSlots2[i][1] + 130) - Width, y*(PosSlots2[i][2] + 10), x*0, y*0, tocolor(255,255,255,255), 1 ,dxfont2_MontserratSemiBold, "left", "top", false,false,false,false)
        end
    end
    local mx, my = getCursorPosition()
    local fullx, fully = guiGetScreenSize()
    local cursorx, cursory = mx*fullx - x*(30), my*fully - y*(30)
    if SelectTarget ~= 0 then
        local Item = ItensPolice[SelectTarget][1]
        local Quantidade = ItensPolice[SelectTarget][2]
        local Nome = ItensPolice[SelectTarget][3]
        local Peso = ItensPolice[SelectTarget][4] * Quantidade
        local Width, Height = (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][1] or 64), (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][2] or 64)
        dxDrawImage(cursorx, cursory, x*138, y*152, "assets/img/slot.png", 0, 0, 0, tocolor(255,255,255,255),true)
        dxDrawImage(cursorx,  cursory + y*(122), x*138, y*30, "assets/img/barra.png", 0, 0, 0, tocolor(255,255,255,255), true)
        local PosX = (cursorx + (x*(138)/2)) - (x*(Width)/2)
        local PosY = (cursory + (y*(152)/2)) - (y*(Height)/2)
        dxDrawImage(PosX, PosY, x*Width, y*Height, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255,255,255,255), true)

        local Width = dxGetTextWidth(Nome, 1, dxfont4_MontserratSemiBold)
        local Height = dxGetFontHeight(1, dxfont4_MontserratSemiBold)
        local PosX = (cursorx + (x*(138)/2)) - (Width/2)
        local PosY = ((cursory + y*(122)) + (y*(30)/2)) - (Height/2)
        dxDrawText(string.upper(Nome), PosX, PosY, Width, Height, tocolor(255,255,255,255), 1 ,dxfont4_MontserratSemiBold, "left", "top", false,false,true,false)

        local PesoFormat = (verifyFloor(Peso) and string.sub(""..Peso.."", 1, 3) or ""..Peso..".00")
        local Width = dxGetTextWidth(""..Quantidade.."x ("..PesoFormat..")", 1, dxfont2_MontserratSemiBold)
        dxDrawText(""..Quantidade.."x ("..PesoFormat..")", cursorx + x*(130) - Width, cursory + y*(10), x*0, y*0, tocolor(255,255,255,255), 1 ,dxfont2_MontserratSemiBold, "left", "top", false,false,true,false)
    end

    --ScrollBar Inv

    dxDrawImage(x*770, y*280, x*11, y*630, Scroll2, 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(x*770, y*(154 + (126 * PosScrollbar)), x*11, y*126, Scroll1, 0, 0, 0, tocolor(255, 255, 255, 255), false)

    --ScrollBar Bau

    dxDrawImage(x*1863, y*280, x*11, y*630, Scroll2, 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(x*1863, y*(154 + (126 * PosScrollbar2)), x*11, y*126, Scroll1, 0, 0, 0, tocolor(255, 255, 255, 255), false)



    dxDrawRoundedRectangle(x*825, y*459, x*269, y*222, tocolor(255,188,44, 255), 7)
    dxDrawRoundedRectangle(x*848, y*476, x*223, y*74, tocolor(255,201,86,255), 7)  
    dxDrawRoundedRectangle(x*848, y*586, x*223, y*74, tocolor(255,201,86,255), 7)  
    dxDrawText("EM BREVE", x*848, y*586, x*1071, y*660, tocolor(255, 255, 255, 255), 1.00, dxfont3_MontserratSemiBold, "center", "center", false, false, false, false, false)

    
    --dxDrawText(""..getPlayerName(localPlayer).." #"..(getElementData(localPlayer, "ID") or "N/A").."", x*52, y*164, x*370, y*207, tocolor(241, 241, 241, 255), 1.00, dxfont0_MontserratBoldItalic, "left", "top", false, false, false, false, false)
    --dxDrawText("#462F52N: #ffffffN/A   #462F52RG: #ffffff"..(getElementData(localPlayer, "ID") or "N/A").."   #462F52BANCO: #ffffff$"..(getElementData(localPlayer, "bank") or 0 ).."   #462F52CARTEIRA: #ffffff$"..getPlayerMoney(localPlayer).."", x*52, y*213, x*467, y*242, tocolor(255, 255, 255, 255), 1.00, dxfont1_MontserratSemiBold, "left", "top", false, false, false, true, false)
end

addEventHandler("onClientClick",root,function(b,s)
    if Police then
        if b == "left" then
            if s == "down" then
                for i = 1,#InfosInv do
                    if isCursorOnElement(x*PosSlots2[i][1], y*PosSlots2[i][2], x*138, y*152) then
                        local Index = InfosTarget[i]
                        if #ItensPolice >= Index then
                            SelectTarget = Index
                        end
                    end
                end
            elseif s == "up" then
                if SelectTarget ~= 0 then
                    --local Item = ItensPolice[SelectTarget][1]
                    --local Quantidade = (EditBox.GetText("Quantidade") ~= "" and tonumber(EditBox.GetText("Quantidade")) or 1)
                    --triggerServerEvent("MST.PegarItem", localPlayer, Item, Quantidade, TargetPlayer)
                end
                SelectTarget = 0
            end
        end
    end
end)

function ScrollBar(b)
    if Police then
        if isCursorOnElement(x*41, y*281, x*721, y*627) then
            if b == "mouse_wheel_up" then
                if PosScrollbar ~= 1 then
                    for i = 1, #InfosInv do
                        InfosInv[i] = InfosInv[i] - 5
                    end
                    PosScrollbar = PosScrollbar -1
                end
            elseif b == "mouse_wheel_down" then
                if PosScrollbar ~= 5 then
                    for i = 1, #InfosInv do
                        InfosInv[i] = InfosInv[i] +5
                    end
                    PosScrollbar = PosScrollbar +1
                end
            end
        elseif isCursorOnElement(x*1140, y*281, x*721, y*627) then 
            if b == "mouse_wheel_up" then
                if PosScrollbar2 ~= 1 then
                    for i = 1, #InfosTarget do
                        InfosTarget[i] = InfosTarget[i] - 5
                    end
                    PosScrollbar2 = PosScrollbar2 -1
                end
            elseif b == "mouse_wheel_down" then
                if PosScrollbar2 ~= 5 then
                    for i = 1, #InfosTarget do
                        InfosTarget[i] = InfosTarget[i] +5
                    end
                    PosScrollbar2 = PosScrollbar2 +1
                end
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

