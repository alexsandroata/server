local screen = {guiGetScreenSize()}
local sx, sy = (screen[1]/1366), (screen[2]/768)

TimerColetarSalario = {}

function isMouseInPosition(x,y,w,h)
    if isCursorShowing() then
        local sx,sy = guiGetScreenSize()
        local cx,cy = getCursorPosition()
        local cx,cy = (cx*sx),(cy*sy)
        if (cx >= x and cx <= x+w) and (cy >= y and cy <= y+h) then
            return true
        end
    end
end

_dxDrawImage = dxDrawImage
function dxDrawImage (x, y, w, h, ...)
    local x, y, w, h = sx * x, sy * y, sx * w, sy * h
    return _dxDrawImage (x, y, w, h, ...)
end

_dxDrawImageSection = dxDrawImageSection
function dxDrawImageSection (x, y, w, h, ...)
    local x, y, w, h = sx * x, sy * y, sx * w, sy * h
    return _dxDrawImageSection (x, y, w, h, ...)
end

_isMouseInPosition = isMouseInPosition
function isMouseInPosition (x, y, w, h)
    local x, y, w, h = sx * x, sy * y, sx * w, sy * h
    return _isMouseInPosition (x, y, w, h)
end

_dxCreateFont = dxCreateFont
function dxCreateFont (file, tamanho)
    local tamanho = sx * tamanho
    return _dxCreateFont (file, tamanho)
end

_dxDrawRectangle = dxDrawRectangle
function dxDrawRectangle (x, y, w, h, ...)
    local x, y, w, h = sx * x, sy * y, sx * w, sy * h
    return _dxDrawRectangle (x, y, w, h, ...)
end

_dxDrawText = dxDrawText
function dxDrawText (text, x, y, w, h, ...)
    local x, y, w, h = sx * x, sy * y, sx * w, sy * h
    return _dxDrawText (text, x, y, w, h, ...)
end

local font = dxCreateFont("files/fonts/Roboto-Regular.ttf", 10)
local font2 = dxCreateFont("files/fonts/Roboto-Regular.ttf", 10)
local font3 = dxCreateFont("files/fonts/Roboto-Medium.ttf", 10)
local font4 = dxCreateFont("files/fonts/Roboto-Regular.ttf", 8)
local font5 = dxCreateFont("files/fonts/Roboto-Regular.ttf", 11)
local font6 = dxCreateFont("files/fonts/Roboto-Regular.ttf", 13)

local edits = {}

function dx()
    if window == "convites" then
        dxDrawImage(508, 159, 350, 450, "files/imgs/base_convites.png")
        dxDrawImage(845, 222, 3, 368, "files/imgs/bar.png")
        if getKeyState("mouse1") and isCursorShowing() and (isMouseInPosition(845, cursorY, 3, 54) or rolandobarra) and (#dataConvites > 5) then
            cursorY,proxPage = BarraUtilExata(#dataConvites, 5, 222, 536, "y")
            rolandobarra = true
        end
        dxDrawImage(845, cursorY, 3, 54, "files/imgs/scroll.png")
        linha = 0
        for i, v in ipairs(dataConvites) do
            if (i > proxPage and linha < 5) then
                linha = linha + 1
                dxDrawImage(526, (140 + 78 * linha), 314, 65, "files/imgs/cage.png")
                if fileExists("files/imgs/logos/"..string.lower(v.TagGroup)..".png") then
                    dxDrawImage(533, (148 + 78 * linha), 50, 50, "files/imgs/logos/"..string.lower(v.TagGroup)..".png")
                end
                if isMouseInPosition(811, (156 + 78 * linha), 15, 15) then
                    dxDrawImage(811, (156 + 78 * linha), 15, 15, "files/imgs/aceitar.png", 0, 0, 0, tocolor(15, 169, 88, 255))
                else
                    dxDrawImage(811, (156 + 78 * linha), 15, 15, "files/imgs/aceitar.png", 0, 0, 0, tocolor(255, 255, 255, 165))
                end
                if isMouseInPosition(810, (174 + 78 * linha), 17, 17) then
                    dxDrawImage(810, (174 + 78 * linha), 17, 17, "files/imgs/negar.png", 0, 0, 0, tocolor(255, 100, 100, 255))
                else
                    dxDrawImage(810, (174 + 78 * linha), 17, 17, "files/imgs/negar.png", 0, 0, 0, tocolor(255, 255, 255, 165))
                end
                dxDrawText("Convite para entrar no grupo", 585+10, (155 + 78 * linha), 789+10, (172 + 78 * linha), tocolor(129, 129, 130, 255), 1.00, font, "left", "center", false, false, true, false, false)
                dxDrawText(v.NameGroup, 585+10, (172 + 78 * linha), 789+10, (189 + 78 * linha), tocolor(255, 255, 255, 255), 1.00, font, "left", "center", false, false, true, false, false)
            end
        end
    elseif window == "criargrupo" then
        dxDrawImage(508, 159, 350, 450, "files/imgs/base_criar.png")
        dxDrawText(select == 1 and guiGetText(edits[1]).."|" or guiGetText(edits[1]), 541, 247, 665, 269, tocolor(185, 185, 185, 255), 1.00, font, "left", "center", false, false, false, false, false)
        dxDrawText(select == 2 and guiGetText(edits[2]).."|" or guiGetText(edits[2]), 709, 247, 833, 269, tocolor(185, 185, 185, 255), 1.00, font, "left", "center", false, false, false, false, false)
        dxDrawText(select == 3 and guiGetText(edits[3]).."|" or guiGetText(edits[3]), 541, 439, 665, 461, tocolor(185, 185, 185, 255), 1.00, font, "left", "center", false, false, false, false, false)
        dxDrawText(select == 4 and guiGetText(edits[4]).."|" or guiGetText(edits[4]), 709, 439, 833, 461, tocolor(185, 185, 185, 255), 1.00, font, "left", "center", false, false, false, false, false)
        if isMouseInPosition(536, 325, 298, 27) or typeSelect == "Corporação" then
            dxDrawImage(813, 333, 11, 11, "files/imgs/check.png")
        end
        if isMouseInPosition(536, 355, 298, 27) or typeSelect == "Facção" then
            dxDrawImage(813, 363, 11, 11, "files/imgs/check.png")
        end
        if isMouseInPosition(531, 560, 303, 35) then
            dxDrawImage(531, 560, 303, 35, "files/imgs/create_select.png")
        else
            dxDrawImage(531, 560, 303, 35, "files/imgs/create.png")
        end
    elseif window == "index" then
        if dataInfos then
            local dataGroupInfos = fromJSON(dataInfos[1].dataGroup)
            dxDrawImage(318, 159, 730, 450, "files/imgs/base.png")
            dxDrawText("Página inicial - "..dataInfos[1].NameGroup, 433, 174, 557, 196, tocolor(145, 145, 135, 255), 1.00, font2, "left", "center", false, false, true, false, false)
            if isMouseInPosition(335, 178, 56, 56) or window == "index" then
                dxDrawImage(335, 178, 56, 56, "files/imgs/icons/home.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 178, 56, 56, "files/imgs/icons/home.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            if isMouseInPosition(335, 234, 56, 56) or window == "index_members" then
                dxDrawImage(335, 234, 56, 56, "files/imgs/icons/members.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 234, 56, 56, "files/imgs/icons/members.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            if isMouseInPosition(335, 290, 56, 56) or window == "index_cofre" then
                dxDrawImage(335, 290, 56, 56, "files/imgs/icons/cofre.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 290, 56, 56, "files/imgs/icons/cofre.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            if isMouseInPosition(335, 346, 56, 56) or window == "index_logs" then
                dxDrawImage(335, 346, 56, 56, "files/imgs/icons/logs.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 346, 56, 56, "files/imgs/icons/logs.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            dxDrawImage(435, 217, 457, 297, "files/imgs/index.png")
            dxDrawText(dataMember.cargo, 483, 225, 666, 241, tocolor(129, 129, 130, 255), 1.00, font, "left", "center", false, false, true, false, false)
            dxDrawText(dataMember.account, 483, 241, 666, 257, tocolor(255, 255, 255, 255), 1.00, font, "left", "center", false, false, true, false, false)
            dxDrawText(dataInfos[1].TypeGroup == "Corporação" and "Drogas apreendidas" or "Armas Fabricadas", 457, 293, 640, 309, tocolor(129, 129, 130, 255), 1.00, font, "left", "center", false, false, true, false, false)
            dxDrawText(dataInfos[1].TypeGroup == "Corporação" and "Jogadores presos" or "Munições Fabricadas", 683, 293, 866, 309, tocolor(129, 129, 130, 255), 1.00, font, "left", "center", false, false, true, false, false)
            dxDrawText(totalCage1, 457, 316, 640, 332, tocolor(255, 255, 255, 255), 1.00, font2, "left", "center", false, false, true, false, false)
            dxDrawText(totalCage2, 683, 316, 866, 332, tocolor(255, 255, 255, 255), 1.00, font2, "left", "center", false, false, true, false, false)
            dxDrawText(dataInfos[1].TypeGroup == "Corporação" and "D. apreendidas" or "A. Fabricadas", 457, 426, 561, 442, tocolor(129, 129, 130, 255), 1.00, font, "left", "center", false, false, true, false, false)
            dxDrawText(dataInfos[1].TypeGroup == "Corporação" and "J. presos" or "M. Fabricadas", 551, 426, 655, 442, tocolor(129, 129, 130, 255), 1.00, font, "right", "center", false, false, true, false, false)
            dxDrawText(membersCalc[1].account.." #"..membersCalc[1].idPlayer, 457, 392, 622, 417, tocolor(255, 255, 255, 255), 1.00, font3, "left", "center", false, false, true, false, false)
            dxDrawText(dataInfos[1].TypeGroup == "Corporação" and membersCalc[1].drogaApreendida or membersCalc[1].armasFabricadas, 457, 446, 551, 462, tocolor(255, 255, 255, 255), 1.00, font2, "left", "center", false, false, true, false, false)
            dxDrawText(dataInfos[1].TypeGroup == "Corporação" and membersCalc[1].jogadoresPresos or membersCalc[1].municoesFabricadas, 561, 446, 655, 462, tocolor(255, 255, 255, 255), 1.00, font2, "right", "center", false, false, true, false, false)
            dxDrawText(membersCalc[1].tempOn, 457, 487, 551, 503, tocolor(255, 255, 255, 255), 1.00, font2, "left", "center", false, false, true, false, false)
            if isMouseInPosition(445, 524, 104, 30) then
                dxDrawImage(445, 524, 104, 30, "files/imgs/button_select.png")
                dxDrawText(dataMember.account == dataGroupInfos.accountLider and "Desfazer o grupo" or "Sair do grupo", 445, 523, 548, 553, tocolor(24, 24, 25, 255), 1.00, font4, "center", "center", false, false, false, false, false)
            else
                dxDrawImage(445, 524, 104, 30, "files/imgs/button.png")
                dxDrawText(dataMember.account == dataGroupInfos.accountLider and "Desfazer o grupo" or "Sair do grupo", 445, 523, 548, 553, tocolor(145, 145, 135, 255), 1.00, font4, "center", "center", false, false, false, false, false)
            end
        end
    elseif window == "index_members" then
        if dataInfos then
            local dataGroupInfos = fromJSON(dataInfos[1].dataGroup)
            dxDrawImage(318, 159, 730, 450, "files/imgs/base.png")
            dxDrawText("Membros - "..dataInfos[1].NameGroup, 433, 174, 557, 196, tocolor(145, 145, 135, 255), 1.00, font2, "left", "center", false, false, true, false, false)
            if isMouseInPosition(335, 178, 56, 56) or window == "index" then
                dxDrawImage(335, 178, 56, 56, "files/imgs/icons/home.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 178, 56, 56, "files/imgs/icons/home.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            if isMouseInPosition(335, 234, 56, 56) or window == "index_members" then
                dxDrawImage(335, 234, 56, 56, "files/imgs/icons/members.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 234, 56, 56, "files/imgs/icons/members.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            if isMouseInPosition(335, 290, 56, 56) or window == "index_cofre" then
                dxDrawImage(335, 290, 56, 56, "files/imgs/icons/cofre.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 290, 56, 56, "files/imgs/icons/cofre.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            if isMouseInPosition(335, 346, 56, 56) or window == "index_logs" then
                dxDrawImage(335, 346, 56, 56, "files/imgs/icons/logs.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 346, 56, 56, "files/imgs/icons/logs.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            dxDrawImage(435, 217, 597, 330, "files/imgs/index_member.png")
            linha = 0
            for i, v in ipairs(membersCalc) do
                if (i > proxPage and linha < 8) then
                    linha = linha + 1
                    if isMouseInPosition(445, (307 + 25 * linha), 464, 25) or selectMember == i then
                        dxDrawRectangle(445, (307 + 25 * linha), 464, 25, tocolor(131, 131, 196))
                        dxDrawText(v.account.." ("..(v.idPlayer)..")", 451, (307 + 25 * linha), 562, (331 + 25 * linha), tocolor(0, 0, 0, 200), 1.00, font4, "left", "center", false, false, true, false, false)
                        dxDrawText(v.cargo, 587, (307 + 25 * linha), 698, (331 + 25 * linha), tocolor(0, 0, 0, 200), 1.00, font4, "right", "center", false, false, true, false, false)
                        dxDrawText("R$ "..formatNumber(v.renda)..",00", 693, (307 + 25 * linha), 804, (331 + 25 * linha), tocolor(0, 0, 0, 200), 1.00, font4, "right", "center", false, false, true, false, false)
                        dxDrawText(v.status, 860, (307 + 25 * linha), 901, (331 + 25 * linha), tocolor(0, 0, 0, 200), 1.00, font4, "center", "center", false, false, true, false, false)
                    else
                        dxDrawText(v.account.." ("..(v.idPlayer)..")", 451, (307 + 25 * linha), 562, (331 + 25 * linha), tocolor(129, 129, 130, 255), 1.00, font4, "left", "center", false, false, true, false, false)
                        dxDrawText(v.cargo, 587, (307 + 25 * linha), 698, (331 + 25 * linha), tocolor(129, 129, 130, 255), 1.00, font4, "right", "center", false, false, true, false, false)
                        dxDrawText("R$ "..formatNumber(v.renda)..",00", 693, (307 + 25 * linha), 804, (331 + 25 * linha), tocolor(129, 129, 130, 255), 1.00, font4, "right", "center", false, false, true, false, false)
                        dxDrawText(v.status, 860, (307 + 25 * linha), 901, (331 + 25 * linha), v.status == "ONLINE" and tocolor(198, 255, 141, 165) or tocolor(255, 100, 100, 255), 1.00, font4, "center", "center", false, false, true, false, false)
                    end
                end
            end
            if isMouseInPosition(579, 227, 104, 30) then
                dxDrawImage(579, 227, 104, 30, "files/imgs/button_select.png")
                dxDrawText("Rebaixar", 579, 226, 682, 256, tocolor(24, 24, 25, 255), 1.00, font4, "center", "center", false, false, true, false, false)
            else
                dxDrawImage(579, 227, 104, 30, "files/imgs/button.png")
                dxDrawText("Rebaixar", 579, 226, 682, 256, tocolor(145, 145, 135, 255), 1.00, font4, "center", "center", false, false, true, false, false)
            end
            if isMouseInPosition(692, 227, 104, 30) then
                dxDrawImage(692, 227, 104, 30, "files/imgs/button_select.png")
                dxDrawText("Promover", 692, 226, 795, 256, tocolor(24, 24, 25, 255), 1.00, font4, "center", "center", false, false, true, false, false)
            else
                dxDrawImage(692, 227, 104, 30, "files/imgs/button.png")
                dxDrawText("Promover", 692, 226, 795, 256, tocolor(145, 145, 135, 255), 1.00, font4, "center", "center", false, false, true, false, false)
            end
            if isMouseInPosition(805, 227, 104, 30) then
                dxDrawImage(805, 227, 104, 30, "files/imgs/button_select.png")
                dxDrawText("Remover", 805, 226, 908, 256, tocolor(24, 24, 25, 255), 1.00, font4, "center", "center", false, false, true, false, false)
            else
                dxDrawImage(805, 227, 104, 30, "files/imgs/button.png")
                dxDrawText("Remover", 805, 226, 908, 256, tocolor(145, 145, 135, 255), 1.00, font4, "center", "center", false, false, true, false, false)
            end
            if isMouseInPosition(922, 291, 105, 20) then
                dxDrawImage(922, 291, 105, 20, "files/imgs/enviar_select.png")
            else
                dxDrawImage(922, 291, 105, 20, "files/imgs/enviar.png")
            end
            dxDrawText((#membersCalc).."/"..(dataGroupInfos.membersCapacity), 487, 241, 562, 256, tocolor(255, 255, 255, 255), 1.00, font, "left", "center", false, false, true, false, false)
            dxDrawText(select == 5 and guiGetText(edits[5]).."|" or guiGetText(edits[5]), 921, 256, 1027, 284, tocolor(95, 95, 95, 255), 1.00, font4, "center", "center", false, false, true, false, false)
        end
    elseif window == "index_cofre" then
        if dataInfos then
            local dataGroupInfos = fromJSON(dataInfos[1].dataGroup)
            dxDrawImage(318, 159, 730, 450, "files/imgs/base.png")
            dxDrawText("Cofre - "..dataInfos[1].NameGroup, 433, 174, 557, 196, tocolor(145, 145, 135, 255), 1.00, font2, "left", "center", false, false, true, false, false)
            if isMouseInPosition(335, 178, 56, 56) or window == "index" then
                dxDrawImage(335, 178, 56, 56, "files/imgs/icons/home.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 178, 56, 56, "files/imgs/icons/home.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            if isMouseInPosition(335, 234, 56, 56) or window == "index_members" then
                dxDrawImage(335, 234, 56, 56, "files/imgs/icons/members.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 234, 56, 56, "files/imgs/icons/members.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            if isMouseInPosition(335, 290, 56, 56) or window == "index_cofre" then
                dxDrawImage(335, 290, 56, 56, "files/imgs/icons/cofre.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 290, 56, 56, "files/imgs/icons/cofre.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            if isMouseInPosition(335, 346, 56, 56) or window == "index_logs" then
                dxDrawImage(335, 346, 56, 56, "files/imgs/icons/logs.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 346, 56, 56, "files/imgs/icons/logs.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            dxDrawImage(435, 221, 408, 140, dataInfos[1].TypeGroup == "Corporação" and "files/imgs/index_cofre.png" or "files/imgs/index_cofre2.png")
            dxDrawText("Saldo total", 439, 225, 553, 243, tocolor(129, 129, 130, 255), 1.00, font, "left", "center", false, false, true, false, false)
            dxDrawText("Renda mensal", 583, 225, 697, 243, tocolor(129, 129, 130, 255), 1.00, font, "left", "center", false, false, true, false, false)
            dxDrawText("Renda total", 723, 225, 837, 243, tocolor(129, 129, 130, 255), 1.00, font, "left", "center", false, false, true, false, false)
            dxDrawText("R$ "..formatNumber(dataGroupInfos.saldo)..",00", 439, 245, 553, 263, tocolor(255, 255, 255, 255), 1.00, font5, "left", "center", false, false, true, false, false)
            dxDrawText("R$ "..formatNumber(dataGroupInfos.rendam)..",00", 583, 245, 697, 263, tocolor(255, 255, 255, 255), 1.00, font5, "left", "center", false, false, true, false, false)
            dxDrawText("R$ "..formatNumber(dataGroupInfos.rendat)..",00", 723, 245, 837, 263, tocolor(255, 255, 255, 255), 1.00, font5, "left", "center", false, false, true, false, false)
            dxDrawText("Depositar", 439, 289, 553, 307, tocolor(129, 129, 130, 255), 1.00, font, "left", "center", false, false, true, false, false)
            dxDrawText(select == 4 and "R$ "..guiGetText(edits[4]).."|,00" or "R$ "..guiGetText(edits[4])..",00", 439, 313, 553, 331, tocolor(255, 255, 255, 255), 1.00, font5, "left", "center", false, false, true, false, false)
            dxDrawText(select == 6 and "R$ "..guiGetText(edits[6]).."|,00" or "R$ "..guiGetText(edits[6])..",00", 583, 313, 697, 331, tocolor(255, 255, 255, 255), 1.00, font5, "left", "center", false, false, true, false, false)
            dxDrawText("Sacar", 583, 289, 697, 307, tocolor(129, 129, 130, 255), 1.00, font, "left", "center", false, false, true, false, false)
            if isMouseInPosition(494, 342, 59, 17) then
                dxDrawText("Confirmar", 439, 341, 553, 359, tocolor(189, 189, 189, 255), 1.00, font, "right", "center", false, false, true, false, false)
            else
                dxDrawText("Confirmar", 439, 341, 553, 359, tocolor(129, 129, 130, 255), 1.00, font, "right", "center", false, false, true, false, false)
            end
            if isMouseInPosition(638, 342, 59, 17) then
                dxDrawText("Confirmar", 583, 341, 697, 359, tocolor(189, 189, 189, 255), 1.00, font, "right", "center", false, false, true, false, false)
            else
                dxDrawText("Confirmar", 583, 341, 697, 359, tocolor(129, 129, 130, 255), 1.00, font, "right", "center", false, false, true, false, false)
            end
            if dataInfos[1].TypeGroup == "Corporação" then
                dxDrawText("Salário acumulado", 723, 289, 837, 307, tocolor(129, 129, 130, 255), 1.00, font, "left", "center", false, false, true, false, false)
                dxDrawText("R$ "..formatNumber(dataMember.salario)..",00", 723, 313, 837, 331, tocolor(255, 255, 255, 255), 1.00, font5, "left", "center", false, false, true, false, false)
                if isMouseInPosition(778, 342, 59, 17) then
                    dxDrawText("Coletar", 723, 341, 837, 359, tocolor(189, 189, 189, 255), 1.00, font, "right", "center", false, false, true, false, false)
                else
                    dxDrawText("Coletar", 723, 341, 837, 359, tocolor(129, 129, 130, 255), 1.00, font, "right", "center", false, false, true, false, false)
                end
            end
        end
    elseif window == "index_logs" then
        if dataInfos then
            local dataGroupInfos = fromJSON(dataInfos[1].dataGroup)
            dxDrawImage(318, 159, 730, 450, "files/imgs/base.png")
            dxDrawText("Logs - "..dataInfos[1].NameGroup, 433, 174, 557, 196, tocolor(145, 145, 135, 255), 1.00, font2, "left", "center", false, false, true, false, false)
            if isMouseInPosition(335, 178, 56, 56) or window == "index" then
                dxDrawImage(335, 178, 56, 56, "files/imgs/icons/home.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 178, 56, 56, "files/imgs/icons/home.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            if isMouseInPosition(335, 234, 56, 56) or window == "index_members" then
                dxDrawImage(335, 234, 56, 56, "files/imgs/icons/members.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 234, 56, 56, "files/imgs/icons/members.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            if isMouseInPosition(335, 290, 56, 56) or window == "index_cofre" then
                dxDrawImage(335, 290, 56, 56, "files/imgs/icons/cofre.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 290, 56, 56, "files/imgs/icons/cofre.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            if isMouseInPosition(335, 346, 56, 56) or window == "index_logs" then
                dxDrawImage(335, 346, 56, 56, "files/imgs/icons/logs.png", 0, 0, 0, tocolor(102, 127, 201))
            else
                dxDrawImage(335, 346, 56, 56, "files/imgs/icons/logs.png", 0, 0, 0, tocolor(145, 145, 135))
            end
            dxDrawImage(435, 221, 577, 352, "files/imgs/index_logs.png")
            dxDrawText("Registros", 458, 220, 1007, 266, tocolor(129, 129, 130, 255), 1.00, font6, "left", "center", false, false, true, false, false)
            if logsGroup then
                linha = 0
                for i, v in ipairs(logsGroup) do
                    if (i > proxPage and linha < 12) then
                        linha = linha + 1
                        local tag = string.format("[%02d:%02d - %02d/%02d/%d]", getRealTime(v.timestamp).hour, getRealTime(v.timestamp).minute, getRealTime(v.timestamp).monthday, getRealTime(v.timestamp).month+1, getRealTime(v.timestamp).year+1900)
                        dxDrawText(tag.." - "..v.mensagem, 447, (262 + 23 * linha), 996, (285 + 23 * linha), tocolor(129, 129, 130, 255), 1.00, font4, "left", "center", true, false, false, false, false)
                    end
                end
            end
        end
    end
end

addEvent("JOAO.openPanelGroupC", true)
addEventHandler("JOAO.openPanelGroupC", root,
function(window_)
    if not isEventHandlerAdded("onClientRender", root, dx) then
        window = window_
        cursorY = ((222)/screen[1]) * screen[1]
        select = false
        selectMember = false
        typeSelect = false
        EditBox("add")
        proxPage = 0
        addEventHandler("onClientRender", root, dx)
        showCursor(true)
    end
end)

addEventHandler("onClientClick", root,
function(_, state)
    if state == "up" then
        if isEventHandlerAdded("onClientRender", root, dx) then
            if window == "convites" then
                linha = 0
                for i, v in ipairs(dataConvites) do
                    if (i > proxPage and linha < 5) then
                        linha = linha + 1
                        if isMouseInPosition(811, (156 + 78 * linha), 15, 15) then
                            triggerServerEvent("JOAO.manageConviteGroup", localPlayer, localPlayer, dataConvites[i], "aceitar")
                        end
                        if isMouseInPosition(810, (174 + 78 * linha), 17, 17) then
                            triggerServerEvent("JOAO.manageConviteGroup", localPlayer, localPlayer, dataConvites[i], "negar")
                        end
                    end
                end
            elseif window == "index" then
                if dataInfos then
                    if isMouseInPosition(335, 178, 56, 56) then
                        trocarAba("index")
                    end
                    if isMouseInPosition(335, 234, 56, 56) then
                        trocarAba("index_members")
                    end
                    if isMouseInPosition(335, 290, 56, 56) then
                        trocarAba("index_cofre")
                    end
                    if isMouseInPosition(335, 346, 56, 56) then
                        trocarAba("index_logs")
                    end
                    if isMouseInPosition(445, 524, 104, 30) then
                        local dataGroupInfos = fromJSON(dataInfos[1].dataGroup)
                        if dataMember.account == dataGroupInfos.accountLider then
                            triggerServerEvent("JOAO.manageIndexGROUPSA", localPlayer, localPlayer, "desfazer", dataInfos[1])
                        else
                            triggerServerEvent("JOAO.manageIndexGROUPSA", localPlayer, localPlayer, "sair", dataInfos[1])
                        end
                    end
                end
            elseif window == "index_members" then
                if dataInfos then
                    if isMouseInPosition(335, 178, 56, 56) then
                        trocarAba("index")
                    end
                    if isMouseInPosition(335, 234, 56, 56) then
                        trocarAba("index_members")
                    end
                    if isMouseInPosition(335, 290, 56, 56) then
                        trocarAba("index_cofre")
                    end
                    if isMouseInPosition(335, 346, 56, 56) then
                        trocarAba("index_logs")
                    end
                    linha = 0
                    for i, v in ipairs(membersCalc) do
                        if (i > proxPage and linha < 8) then
                            linha = linha + 1
                            if isMouseInPosition(445, (307 + 25 * linha), 464, 25) then
                                selectMember = i
                            end
                        end
                    end
                    if isMouseInPosition(579, 227, 104, 30) then
                        if selectMember then
                            if dataInfos[1].TypeGroup == "Corporação" then
                                if config["Permissions"][dataInfos[1].TypeGroup][dataInfos[1].TagGroup][dataMember.cargo]["buttonRebaixar"] then
                                    triggerServerEvent("JOAO.manageMemberGroupCC", localPlayer, localPlayer, membersCalc[selectMember], "rebaixar", dataInfos[1])
                                else
                                    notifyC("Você não possui permissão!", "error")
                                end
                            else
                                if config["Permissions"][dataInfos[1].TypeGroup][dataMember.cargo]["buttonRebaixar"] then
                                    triggerServerEvent("JOAO.manageMemberGroupCC", localPlayer, localPlayer, membersCalc[selectMember], "rebaixar", dataInfos[1])
                                else
                                    notifyC("Você não possui permissão!", "error")
                                end
                            end
                        end
                    end
                    if isMouseInPosition(692, 227, 104, 30) then
                        if selectMember then
                            if dataInfos[1].TypeGroup == "Corporação" then
                                if config["Permissions"][dataInfos[1].TypeGroup][dataInfos[1].TagGroup][dataMember.cargo]["buttonPromover"] then
                                    triggerServerEvent("JOAO.manageMemberGroupCC", localPlayer, localPlayer, membersCalc[selectMember], "promover", dataInfos[1])
                                else
                                    notifyC("Você não possui permissão!", "error")
                                end
                            else
                                if config["Permissions"][dataInfos[1].TypeGroup][dataMember.cargo]["buttonPromover"] then
                                    triggerServerEvent("JOAO.manageMemberGroupCC", localPlayer, localPlayer, membersCalc[selectMember], "promover", dataInfos[1])
                                else
                                    notifyC("Você não possui permissão!", "error")
                                end
                            end
                        end
                    end
                    if isMouseInPosition(805, 227, 104, 30) then
                        if selectMember then
                            if dataInfos[1].TypeGroup == "Corporação" then
                                if config["Permissions"][dataInfos[1].TypeGroup][dataInfos[1].TagGroup][dataMember.cargo]["buttonRemover"] then
                                    triggerServerEvent("JOAO.manageMemberGroupCC", localPlayer, localPlayer, membersCalc[selectMember], "remover", dataInfos[1])
                                    selectMember = false
                                else
                                    notifyC("Você não possui permissão!", "error")
                                end
                            else
                                if config["Permissions"][dataInfos[1].TypeGroup][dataMember.cargo]["buttonRemover"] then
                                    triggerServerEvent("JOAO.manageMemberGroupCC", localPlayer, localPlayer, membersCalc[selectMember], "remover", dataInfos[1])
                                    selectMember = false
                                else
                                    notifyC("Você não possui permissão!", "error")
                                end
                            end
                        end
                    end
                    if isMouseInPosition(922, 291, 105, 20) then
                        if dataInfos[1].TypeGroup == "Corporação" then
                            if config["Permissions"][dataInfos[1].TypeGroup][dataInfos[1].TagGroup][dataMember.cargo]["buttonConvidar"] then
                                if verifyBoxText(5, "id do convidado") then
                                    triggerServerEvent("JOAO.convidarMember", localPlayer, localPlayer, tonumber(guiGetText(edits[5])), dataInfos)
                                else
                                    notifyC("Digite o ID para convidar!", "error")
                                end
                            else
                                notifyC("Você não possui permissão!", "error")
                            end
                        else
                            if config["Permissions"][dataInfos[1].TypeGroup][dataMember.cargo]["buttonConvidar"] then
                                if verifyBoxText(5, "id do convidado") then
                                    triggerServerEvent("JOAO.convidarMember", localPlayer, localPlayer, tonumber(guiGetText(edits[5])), dataInfos)
                                else
                                    notifyC("Digite o ID para convidar!", "error")
                                end
                            else
                                notifyC("Você não possui permissão!", "error")
                            end
                        end
                    end
                    if isMouseInPosition(922, 257, 105, 26) then
                        select = false
                        if guiEditSetCaretIndex(edits[5], string.len(guiGetText(edits[5]))) then
                            select = 5
                            guiBringToFront(edits[5])
                            guiSetInputMode("no_binds_when_editing") 
                            if (guiGetText(edits[5]) == "id do convidado") then 
                                guiSetText(edits[5], "")
                            end
                        end
                    end
                end
            elseif window == "index_cofre" then
                if dataInfos then
                    if isMouseInPosition(335, 178, 56, 56) then
                        trocarAba("index")
                    end
                    if isMouseInPosition(335, 234, 56, 56) then
                        trocarAba("index_members")
                    end
                    if isMouseInPosition(335, 290, 56, 56) then
                        trocarAba("index_cofre")
                    end
                    if isMouseInPosition(335, 346, 56, 56) then
                        trocarAba("index_logs")
                    end
                    if isMouseInPosition(439, 310, 116, 22) then
                        select = false
                        if guiEditSetCaretIndex(edits[4], string.len(guiGetText(edits[4]))) then
                            select = 4
                            guiBringToFront(edits[4])
                            guiSetInputMode("no_binds_when_editing") 
                            if (guiGetText(edits[4]) == "0") then 
                                guiSetText(edits[4], "")
                            end
                        end
                    end
                    if isMouseInPosition(582, 310, 116, 22) then
                        select = false
                        if guiEditSetCaretIndex(edits[6], string.len(guiGetText(edits[6]))) then
                            select = 6
                            guiBringToFront(edits[6])
                            guiSetInputMode("no_binds_when_editing") 
                            if (guiGetText(edits[6]) == "0") then 
                                guiSetText(edits[6], "")
                            end
                        end
                    end
                    if isMouseInPosition(494, 342, 59, 17) then
                        if dataInfos[1].TypeGroup == "Corporação" then
                            if config["Permissions"][dataInfos[1].TypeGroup][dataInfos[1].TagGroup][dataMember.cargo]["buttonDepositar"] then
                                if verifyBoxText(4, "0") then
                                    triggerServerEvent("JOAO.manageCofreGroup", localPlayer, localPlayer, tonumber(guiGetText(edits[4])), dataInfos, "deposito")
                                else
                                    notifyC("Digite um valor!", "error")
                                end
                            else
                                notifyC("Você não possui permissão!", "error")
                            end
                        else
                            if config["Permissions"][dataInfos[1].TypeGroup][dataMember.cargo]["buttonDepositar"] then
                                if verifyBoxText(4, "0") then
                                    triggerServerEvent("JOAO.manageCofreGroup", localPlayer, localPlayer, tonumber(guiGetText(edits[4])), dataInfos, "deposito")
                                else
                                    notifyC("Digite um valor!", "error")
                                end
                            else
                                notifyC("Você não possui permissão!", "error")
                            end
                        end
                    end
                    if isMouseInPosition(638, 342, 59, 17) then
                        if dataInfos[1].TypeGroup == "Corporação" then
                            if config["Permissions"][dataInfos[1].TypeGroup][dataInfos[1].TagGroup][dataMember.cargo]["buttonSacar"] then
                                if verifyBoxText(6, "0") then
                                    triggerServerEvent("JOAO.manageCofreGroup", localPlayer, localPlayer, tonumber(guiGetText(edits[6])), dataInfos, "saque")
                                else
                                    notifyC("Digite um valor!", "error")
                                end
                            else
                                notifyC("Você não possui permissão!", "error")
                            end
                        else
                            if config["Permissions"][dataInfos[1].TypeGroup][dataMember.cargo]["buttonSacar"] then
                                if verifyBoxText(6, "0") then
                                    triggerServerEvent("JOAO.manageCofreGroup", localPlayer, localPlayer, tonumber(guiGetText(edits[6])), dataInfos, "saque")
                                else
                                    notifyC("Digite um valor!", "error")
                                end
                            else
                                notifyC("Você não possui permissão!", "error")
                            end
                        end
                    end
                    if dataInfos[1].TypeGroup == "Corporação" then
                        if isMouseInPosition(778, 342, 59, 17) then
                            if isTimer(TimerColetarSalario[localPlayer]) then
                                notifyC("Aguarde um pouco!", "error")
                            else
                                TimerColetarSalario[localPlayer] = setTimer(function()
                                end, 10000, 1)
                                triggerServerEvent("JOAO.coletarSalarioGroup", localPlayer, localPlayer, dataInfos, dataMember)
                            end
                        end
                    end
                end
            elseif window == "index_logs" then
                if dataInfos then
                    if isMouseInPosition(335, 178, 56, 56) then
                        trocarAba("index")
                    end
                    if isMouseInPosition(335, 234, 56, 56) then
                        trocarAba("index_members")
                    end
                    if isMouseInPosition(335, 290, 56, 56) then
                        trocarAba("index_cofre")
                    end
                    if isMouseInPosition(335, 346, 56, 56) then
                        trocarAba("index_logs")
                    end
                end
            elseif window == "criargrupo" then
                if isMouseInPosition(541, 250, 124, 19) then
                    select = false
                    if guiEditSetCaretIndex(edits[1], string.len(guiGetText(edits[1]))) then
                        select = 1
                        guiBringToFront(edits[1])
                        guiSetInputMode("no_binds_when_editing") 
                        if (guiGetText(edits[1]) == "Group name") then 
                            guiSetText(edits[1], "")
                        end
                    end
                end
                if isMouseInPosition(709, 250, 124, 19) then
                    select = false
                    if guiEditSetCaretIndex(edits[2], string.len(guiGetText(edits[2]))) then
                        select = 2
                        guiBringToFront(edits[2])
                        guiSetInputMode("no_binds_when_editing") 
                        if (guiGetText(edits[2]) == "Tag name") then 
                            guiSetText(edits[2], "")
                        end
                    end
                end
                if isMouseInPosition(541, 442, 124, 19) then
                    select = false
                    if guiEditSetCaretIndex(edits[3], string.len(guiGetText(edits[3]))) then
                        select = 3
                        guiBringToFront(edits[3])
                        guiSetInputMode("no_binds_when_editing") 
                        if (guiGetText(edits[3]) == "0") then 
                            guiSetText(edits[3], "")
                        end
                    end
                end
                if isMouseInPosition(709, 442, 124, 19) then
                    select = false
                    if guiEditSetCaretIndex(edits[4], string.len(guiGetText(edits[4]))) then
                        select = 4
                        guiBringToFront(edits[4])
                        guiSetInputMode("no_binds_when_editing") 
                        if (guiGetText(edits[4]) == "0") then 
                            guiSetText(edits[4], "")
                        end
                    end
                end
                if isMouseInPosition(536, 325, 298, 27) then
                    typeSelect = "Corporação"
                end
                if isMouseInPosition(536, 355, 298, 27) then
                    typeSelect = "Facção"
                end
                if isMouseInPosition(531, 560, 303, 35) then
                    if verifyBoxText(1, "Group name") and verifyBoxText(2, "Tag name") and verifyBoxText(3, "0") and verifyBoxText(4, "0") then
                        if typeSelect then
                            triggerServerEvent("JOAO.createGroup", localPlayer, localPlayer, guiGetText(edits[1]), guiGetText(edits[2]), tonumber(guiGetText(edits[3])), tonumber(guiGetText(edits[4])), typeSelect)
                        else
                            notifyC("Selecione o tipo!", "error")
                        end
                    else
                        notifyC("Digite todas informações!", "error")
                    end
                end
            end
        end
    end
end)

function trocarAba(windowK_)
    if dataInfos[1].TypeGroup == "Corporação" then
        if config["Permissions"][dataInfos[1].TypeGroup][dataInfos[1].TagGroup][dataMember.cargo][windowK_] then
            selectMember = false
            proxPage = 0
            window = windowK_
        else
            notifyC("Você não possui permissão!", "error")
        end
    else
        if config["Permissions"][dataInfos[1].TypeGroup][dataMember.cargo][windowK_] then
            selectMember = false
            proxPage = 0
            window = windowK_
        else
            notifyC("Você não possui permissão!", "error")
        end
    end
end

function verifyBoxText(indexBox, textBox)
    if guiGetText(edits[indexBox]) == "" or guiGetText(edits[indexBox]) == textBox then
        return false
    end
    return true
end

function closeMenu()
    if isEventHandlerAdded("onClientRender", root, dx) then
        EditBox("destroy")
        removeEventHandler("onClientRender", root, dx)
        showCursor(false)
    end
end
bindKey("backspace", "down", closeMenu)
addEvent("JOAO.closeMenuGroup", true)
addEventHandler("JOAO.closeMenuGroup", root, closeMenu)

addEvent("JOAO.sendInfosGroup", true)
addEventHandler("JOAO.sendInfosGroup", root,
function(dataConvites_, dataInfos_, accountMember_)
    dataConvites = dataConvites_
    dataInfos = dataInfos_
    if dataInfos then
        local membersData = fromJSON(dataInfos[1]["membersGroup"])
        for i, v in ipairs(membersData) do
            if accountMember_ == v.account then
                dataMember = v
            end
        end
        totalCage1 = 0
        totalCage2 = 0
        logsGroup = fromJSON(dataInfos[1]["logsGroup"])
        membersCalc = fromJSON(dataInfos[1]["membersGroup"])
        if dataInfos[1].TypeGroup == "Corporação" then
            for i, v in ipairs(membersCalc) do
                membersCalc[i].totalLace = v.drogaApreendida + v.jogadoresPresos + v.tempOn
                membersCalc[i].status = (getPlayerFromID(v.idPlayer) and "ONLINE" or "OFFLINE")
                totalCage1 = totalCage1 + v.drogaApreendida
                totalCage2 = totalCage2 + v.jogadoresPresos
            end
        else
            for i, v in ipairs(membersCalc) do
                membersCalc[i].totalLace = v.armasFabricadas + v.municoesFabricadas + v.tempOn
                membersCalc[i].status = (getPlayerFromID(v.idPlayer) and "ONLINE" or "OFFLINE")
                totalCage1 = totalCage1 + v.armasFabricadas
                totalCage2 = totalCage2 + v.municoesFabricadas
            end
        end
        table.sort(membersCalc, function(a, b) return (a.totalLace > b.totalLace) end)
    end
end)



addEventHandler("onClientKey", root,
function (button, press)
	if isEventHandlerAdded("onClientRender", root, dx) then
		if button == "mouse_wheel_up" and press then
            if window == "convites" then
                if (proxPage > 0) then
                    proxPage = proxPage - 1
                end
                if #dataConvites > 5 then
                    cursorY = MoveBarraUtil(#dataConvites, 5, 222, 536, "y", proxPage)
                end
            elseif window == "index_logs" or window == "index_members" then
                if (proxPage > 0) then
                    proxPage = proxPage - 1
                end
            end
		elseif button == "mouse_wheel_down" and press then
            if window == "convites" then
                proxPage = proxPage + 1
                if (proxPage > #dataConvites - 5) then
                    proxPage = #dataConvites - 5
                end
                if #dataConvites > 5 then
                    cursorY = MoveBarraUtil(#dataConvites, 5, 222, 536, "y", proxPage)
                end
            elseif window == "index_logs" then
                proxPage = proxPage + 1
                if (proxPage > #logsGroup - 8) then
                    proxPage = #logsGroup - 8
                end
            elseif window == "index_members" then
                proxPage = proxPage + 1
                if (proxPage > #membersCalc - 8) then
                    proxPage = #membersCalc - 8
                end
            end
		end
	end
end)

bindKey("f9", "down",
function()
    triggerServerEvent("JOAO.openPanelGroupS", localPlayer, localPlayer)
end)

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == "string" and isElement( pElementAttachedTo ) and type( func ) == "function" then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == "table" and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end

function EditBox(tipo)
    if tipo == 'destroy' then
        for i=1, #edits do
            if isElement(edits[i]) then 
                destroyElement(edits[i])
            end
        end
    elseif tipo == 'add' then
        edits[1] = guiCreateEdit(-1000, -1000, 325, 50, 'Group name', false)
        guiEditSetMaxLength(edits[1], 16)
        edits[2] = guiCreateEdit(-1000, -1000, 325, 50, 'Tag name', false)
        guiEditSetMaxLength(edits[2], 8)
        edits[3] = guiCreateEdit(-1000, -1000, 325, 50, '0', false)
        guiEditSetMaxLength(edits[3], 3)
        guiSetProperty(edits[3], 'ValidationString', '[0-9]*')
        edits[4] = guiCreateEdit(-1000, -1000, 325, 50, '0', false)
        guiEditSetMaxLength(edits[4], 10)
        guiSetProperty(edits[4], 'ValidationString', '[0-9]*')
        edits[5] = guiCreateEdit(-1000, -1000, 325, 50, 'id do convidado', false)
        guiEditSetMaxLength(edits[5], 12)
        guiSetProperty(edits[5], 'ValidationString', '[0-9]*')
        edits[6] = guiCreateEdit(-1000, -1000, 325, 50, '0', false)
        guiEditSetMaxLength(edits[6], 10)
        guiSetProperty(edits[6], 'ValidationString', '[0-9]*')
	end 
end