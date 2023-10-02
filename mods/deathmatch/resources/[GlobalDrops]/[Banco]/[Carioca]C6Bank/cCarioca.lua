local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1366), (screenH/768)


local medium = dxCreateFont("files/FONTs/font_medium.ttf", 10)
local medium2 = dxCreateFont("files/FONTs/font_medium.ttf", 15)
local medium3 = dxCreateFont("files/FONTs/font_medium.ttf", 8)
local montserrat = dxCreateFont("files/FONTs/font_montserrat.ttf", 15)
local montserratNor = dxCreateFont("files/FONTs/font_montserrat.ttf", 10)
local montserrat2 = dxCreateFont("files/FONTs/font_montserrat.ttf", 13)
local montserrat3 = dxCreateFont("files/FONTs/font_montserrat.ttf", 20)



local keyTable = {
    "mouse2", "mouse3", "mouse4", "mouse5", "mouse_wheel_up", "mouse_wheel_down", "arrow_l", "arrow_u",
    "arrow_r", "arrow_d", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", 
    "v", "w", "x", "y", "z", "num_0", "num_1", "num_2", "num_3", "num_4", "num_5", "num_6", "num_7", "num_8", "num_9", "num_mul", "num_add", 
    "num_sep", "num_sub", "num_div", "num_dec", "num_enter", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12", "escape", 
    "tab", "lalt", "ralt", "enter", "space", "pgup", "pgdn", "end", "home", "insert", "delete", "lshift", "rshift", "lctrl", "rctrl", "[", "]", "pause", "capslock", "scroll", ";", ",", "-", ".", "/", "#", "\\", "="
}

local transferir = createElement("bankSystem")
local depositar = createElement("bankSystem")
local sacar = createElement("bankSystem")
local pagar = createElement("bankSystem")
local id = createElement("bankSystem")

txd = engineLoadTXD ( "files/MODELs/caixa.txd" ) --Coloque o nome do TXD
engineImportTXD ( txd, 2942) --Coloque o ID do objeto que voce quer modificar
col = engineLoadCOL ( "files/MODELs/caixa.col" ) --Coloque o nome do arquivo COL
engineReplaceCOL ( col, 2942) --Coloque o ID do objeto que voce quer modificar
dff = engineLoadDFF ( "files/MODELs/caixa.dff", 0 ) --Coloque o nome do DFF e não mexa nesse 0
engineReplaceModel ( dff, 2942) --Coloque o ID do objeto que voce quer modificar
engineSetModelLODDistance(2942, 9000) --ID do objeto e a distancia que ele ira carregar - distancia esta como 500

window = "menu"
painel = false


local extractBank = {
    {header = "", body = "", x = 700, y = 384, w = 922, h = 476, s = "desocupado"},
    {header = "", body = "", x = 700, y = 414, w = 922, h = 501, s = "desocupado"},
    {header = "", body = "", x = 700, y = 444, w = 922, h = 525, s = "desocupado"},
    {header = "", body = "", x = 700, y = 474, w = 922, h = 550, s = "desocupado"},
}



function pullExtractToServer(dados)
    if dados then
        for i = 1, #dados do
            if dados[i].d and dados[i].m then
                if extractBank[1].s == "desocupado" and extractBank[1].header == "" and extractBank[1].body == "" then
                    extractBank[1].header = dados[i].d
                    extractBank[1].body = dados[i].m
                    extractBank[1].s = "ocupado"
                    return false

                elseif extractBank[2].s == "desocupado" and extractBank[2].header == "" and extractBank[2].body == "" then
                    extractBank[2].header = extractBank[1].header
                    extractBank[2].body = extractBank[1].body
                    extractBank[2].s = "ocupado"

                    extractBank[1].header = dados[i].d
                    extractBank[1].body = dados[i].m
                    extractBank[1].s = "ocupado"
                    return false

                elseif extractBank[3].s == "desocupado" and extractBank[3].header == "" and extractBank[3].body == "" then
                    extractBank[3].header = extractBank[2].header
                    extractBank[3].body = extractBank[2].body
                    extractBank[3].s = "ocupado"

                    extractBank[2].header = extractBank[1].header
                    extractBank[2].body = extractBank[1].body
                    extractBank[2].s = "ocupado"

                    extractBank[1].header = dados[i].d
                    extractBank[1].body = dados[i].m
                    extractBank[1].s = "ocupado"
                    return false

                elseif extractBank[4].s == "desocupado" and extractBank[4].header == "" and extractBank[4].body == "" then
                    extractBank[4].header = extractBank[3].header
                    extractBank[4].body = extractBank[3].body
                    extractBank[4].s = "ocupado"

                    extractBank[3].header = extractBank[2].header
                    extractBank[3].body = extractBank[2].body
                    extractBank[3].s = "ocupado"

                    extractBank[2].header = extractBank[1].header
                    extractBank[2].body = extractBank[1].body
                    extractBank[2].s = "ocupado"

                    extractBank[1].header = dados[i].d
                    extractBank[1].body = dados[i].m
                    extractBank[1].s = "ocupado"
                    return false

                elseif extractBank[4].s == "desocupado" and extractBank[4].header == "" and extractBank[4].body == "" then
                    extractBank[4].header = extractBank[3].header
                    extractBank[4].body = extractBank[3].body
                    extractBank[4].s = "ocupado"

                    extractBank[3].header = extractBank[2].header
                    extractBank[3].body = extractBank[2].body
                    extractBank[3].s = "ocupado"

                    extractBank[2].header = extractBank[1].header
                    extractBank[2].body = extractBank[1].body
                    extractBank[2].s = "ocupado"

                    extractBank[1].header = dados[i].d
                    extractBank[1].body = dados[i].m
                    extractBank[1].s = "ocupado"
                    return false
                end
                
                if extractBank[4].s == "ocupado" and extractBank[4].header ~= "" and extractBank[4].body ~= "" then
                    extractBank[4].header = extractBank[3].header
                    extractBank[4].body = extractBank[3].body
                    extractBank[4].s = "ocupado"

                    extractBank[3].header = extractBank[2].header
                    extractBank[3].body = extractBank[2].body
                    extractBank[3].s = "ocupado"
                    
                    extractBank[2].header = extractBank[1].header
                    extractBank[2].body = extractBank[1].body
                    extractBank[2].s = "ocupado"

                    extractBank[1].header = dados[i].d
                    extractBank[1].body = dados[i].m
                    extractBank[1].s = "ocupado"
                    return false
                end
            end
        end
    end
end
    


--[[

             designer          

--]]


function dxPainel()
    if painel == true then
        local dados = getElementData(localPlayer, "bankDados")
        local Name = getPlayerName(localPlayer)  
        local IDPlayer = getElementData(getLocalPlayer(), "ID") or "N/A"
        local money = string.format(getPlayerMoney(getLocalPlayer()))
        local dados = getElementData(localPlayer, "bankDados")

        local satu = interpolateBetween(0, 0, 0, 255, 0, 0, (getTickCount() - tickC)/1100, "Linear")
        local satu2 = interpolateBetween(0, 0, 0, 99, 0, 0, (getTickCount() - tickC)/1100, "Linear")

        exports.Blur:dxDrawBluredRectangle(x*0, y*0, screenW, screenH, tocolor(255,255,255))

        dxDrawImage(x*312, y*150, x*741, y*468, "files/IMGs/fundo.png", 0, 0, 0, tocolor(255, 255, 255, satu), false)
        dxDrawText("Seja bem-vindo(a)", x*384, y*173, x*318, y*201, tocolor(255, 255, 255, satu), 1.00, montserrat, "left", "top", false, false, false, false, false)
        dxDrawText(""..Name.." - conta: "..IDPlayer.."", x*384, y*190, x*758, y*216, tocolor(255, 255, 255, satu), 1.00, montserrat2, "left", "top", false, false, false, false, false)
        dxDrawText("Saldo em Conta Corrente:", x*708, y*187, x*796, y*277, tocolor(255, 255, 255, satu), 1.00, medium, "left", "top", false, false, false, false, false)
        dxDrawText("Sua Carteira:", x*708, y*262, x*806, y*330, tocolor(255, 255, 255, satu), 1.00, medium, "left", "top", false, false, false, false, false)
        dxDrawText("R$ "..(formatNumber(dados["AMOUNT"]) or 0).."", x*710, y*214, x*959, y*305, tocolor(255, 255, 255, 255), 1.00, medium2, "left", "top", false, false, false, false, false)
        dxDrawText("R$ "..(formatNumber(money) or 0).."", x*710, y*290, x*959, y*358, tocolor(255, 255, 255, satu), 1.00, medium2, "left", "top", false, false, false, false, false)
        dxDrawImage(x*340, y*168, x*40, y*40, "files/IMGs/logo.png", 0, 0, 0, tocolor(255, 255, 255, satu), false)


        if extractBank[1].s == "ocupado" then
                dxDrawText(extractBank[1].header.." - "..extractBank[1].body, x * extractBank[1].x, y * extractBank[1].y, x * extractBank[1].w, y * extractBank[1].h, tocolor(255, 255, 255, 255), x*1, "default-bold", "left", "top", false, false, false, false, false)
            end

            if extractBank[2].s == "ocupado" then
                dxDrawText(extractBank[2].header.." - "..extractBank[2].body, x * extractBank[2].x, y * extractBank[2].y, x * extractBank[2].w, y * extractBank[2].h, tocolor(255, 255, 255, 255), x*1, "default-bold", "left", "top", false, false, false, false, false)
            end

            if extractBank[3].s == "ocupado" then
                dxDrawText(extractBank[3].header.." - "..extractBank[3].body, x * extractBank[3].x, y * extractBank[3].y, x * extractBank[3].w, y * extractBank[3].h, tocolor(255, 255, 255, 255), x*1, "default-bold", "left", "top", false, false, false, false, false)
            end

            if extractBank[4].s == "ocupado" then
                dxDrawText(extractBank[4].header.." - "..extractBank[4].body, x * extractBank[4].x, y * extractBank[4].y, x * extractBank[4].w, y * extractBank[4].h, tocolor(255, 255, 255, 255), x*1, "default-bold", "left", "top", false, false, false, false, false)
            end


        if Ms(x*380, y*478, x*46, y*44) then
            dxDrawImage(x*380, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(20, 20, 20, 255), false)
               dxDrawImage(x*391, y*487, x*24, y*24, "files/IMGs/depositar.png", 0, 0, 0, tocolor(254, 254, 254, 255), false)
            else
                dxDrawImage(x*380, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(38, 38, 38, 255), false)
               dxDrawImage(x*391, y*487, x*24, y*24, "files/IMGs/depositar.png", 0, 0, 0, tocolor(254, 254, 254, 255), false)
            end
        if Ms(x*433, y*478, x*46, y*44) then
            dxDrawImage(x*433, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(20, 20, 20, 255), false)
               dxDrawImage(x*444, y*487, x*24, y*24, "files/IMGs/sacar.png", 0, 0, 0, tocolor(254, 254, 254, 255), false)
            else
                dxDrawImage(x*433, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(38, 38, 38, 255), false)
              dxDrawImage(x*444, y*487, x*24, y*24, "files/IMGs/sacar.png", 0, 0, 0, tocolor(254, 254, 254, 255), false) 
            end
        if Ms(x*539, y*478, x*46, y*44) then
              dxDrawImage(x*539, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(20, 20, 20, 255), false)
               dxDrawImage(x*550, y*487, x*24, y*24, "files/IMGs/multar.png", 0, 0, 0, tocolor(254, 254, 254, 255), false)
            else
                dxDrawImage(x*539, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(38, 38, 38, 255), false)
               dxDrawImage(x*550, y*487, x*24, y*24, "files/IMGs/multar.png", 0, 0, 0, tocolor(254, 254, 254, 255), false) 
            end
        if Ms(x*486, y*478, x*46, y*44) then
               dxDrawImage(x*486, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(20, 20, 20, 255), false)
               dxDrawImage(x*497, y*487, x*24, y*24, "files/IMGs/ciclo.png", 0, 0, 0, tocolor(254, 254, 254, 255), false)
            else
                dxDrawImage(x*486, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(38, 38, 38, 255), false)
               dxDrawImage(x*497, y*487, x*24, y*24, "files/IMGs/ciclo.png", 0, 0, 0, tocolor(254, 254, 254, 255), false) 
            end
        if Ms(x*1020, y*158, x*18, y*18) then
               dxDrawImage(x*1020, y*158, x*25, y*25, "files/IMGs/exit.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            else
               dxDrawImage(x*1020, y*158, x*25, y*25, "files/IMGs/exit.png", 0, 0, 0, tocolor(229, 80, 80, 255), false)
            end

        if window == "pagar" then
                if Ms(x*539, y*478, x*46, y*44) then
                dxDrawImage(x*539, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(x*550, y*487, x*24, y*24, "files/IMGs/multar.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)
                else
                dxDrawImage(x*539, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(38, 38, 38, 255), false)
                dxDrawImage(x*550, y*487, x*24, y*24, "files/IMGs/multar.png", 0, 0, 0, tocolor(254, 254, 254, 255), false) 
                end
                dxDrawImage(x*1060, y*300, x*280, y*140, "files/IMGs/painel2.png", 0, 0, 0, tocolor(254, 254, 254, 255), false)
                dxDrawRoundedRectangle(x*1085, y*403, x*110, y*28, (isCursorOnElement(x*1085, y*403, x*110, y*28) and tocolor(13, 92, 7, 255) or tocolor(20, 20, 20, 255)), 10)  -- BOTÃO REALIZAR TRANSFERENCIA
                dxDrawRoundedRectangle(x*1205, y*403, x*110, y*28, (isCursorOnElement(x*1205, y*403, x*110, y*28) and tocolor(254, 71, 71, 255) or tocolor(20, 20, 20, 255)), 10)  -- BOTAO VOLTAR
                dxDrawText("Cancelar", x*1233, y*409, x*690, y*427, (isCursorOnElement(x*1205, y*403, x*110, y*28) and tocolor(255, 255, 255, 255) or tocolor(255, 255, 255, 200)), x*1.00, "default-bold", "left", "top", false, false, false, false, false)
                dxDrawText("Confirmar", x*1108, y*409, x*825, y*427, (isCursorOnElement(x*1085, y*403, x*110, y*28) and tocolor(255, 255, 255, 255) or tocolor(255, 255, 255, 200)), x*1.00, "default-bold", "left", "top", false, false, false, false, false)
                dxDrawText(""..(formatNumber(dados["PENALLY"]) or 0).."", x*1196, y*326, x*218, y*37, tocolor(255, 255, 255, 255), x*1.0, "default-bold", "left", "top", false, false, false, false, false)
                dxDrawText("Multas Pendentes", x*1146, y*282, x*669, y*228, tocolor(255, 255, 255, 255), x*1, "default-bold", "left", "top", false, false, false, false, false)   
                dxDrawEditBox("Digite aqui o valor!", x*1093, y*355, x*218, y*37, false, 10, pagar)

            elseif window == "sacar" then
               if Ms(x*433, y*478, x*46, y*44) then
                    dxDrawImage(x*433, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    dxDrawImage(x*444, y*487, x*24, y*24, "files/IMGs/sacar.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)
                else
                    dxDrawImage(x*433, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(38, 38, 38, 255), false)
                    dxDrawImage(x*444, y*487, x*24, y*24, "files/IMGs/sacar.png", 0, 0, 0, tocolor(254, 254, 254, 255), false) 
                end
                dxDrawImage(x*1060, y*300, x*280, y*140, "files/IMGs/painel1.png", 0, 0, 0, tocolor(254, 254, 254, 255), false)
                dxDrawRoundedRectangle(x*1085, y*390, x*110, y*28, (isCursorOnElement(x*1085, y*390, x*110, y*28) and tocolor(13, 92, 7, 255) or tocolor(20, 20, 20, 255)), 10)  -- BOTÃO REALIZAR DEPOSITO
                dxDrawRoundedRectangle(x*1205, y*390, x*110, y*28, (isCursorOnElement(x*1205, y*390, x*110, y*28) and tocolor(254, 71, 71, 255) or tocolor(20, 20, 20, 255)), 10)  -- BOTAO VOLTAR
                dxDrawEditBox("Digite aqui o valor!", x*1090, y*322, x*218, y*37, false, 8, sacar)
                dxDrawText("Cancelar", x*1233, y*396, x*690, y*427, (isCursorOnElement(x*1205, y*390, x*110, y*28) and tocolor(255, 255, 255, 255) or tocolor(255, 255, 255, 200)), x*1.00, "default-bold", "left", "top", false, false, false, false, false)
                dxDrawText("Confirmar", x*1108, y*396, x*825, y*427, (isCursorOnElement(x*1085, y*390, x*110, y*28) and tocolor(255, 255, 255, 255) or tocolor(255, 255, 255, 200)), x*1.00, "default-bold", "left", "top", false, false, false, false, false)
                dxDrawText("Saque", x*1177, y*282, x*669, y*228, tocolor(255, 255, 255, 255), x*1, "default-bold", "left", "top", false, false, false, false, false)   

            elseif window == "transf" then
               if Ms(x*486, y*478, x*46, y*44) then
                    dxDrawImage(x*486, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    dxDrawImage(x*497, y*487, x*24, y*24, "files/IMGs/ciclo.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)
                else
                    dxDrawImage(x*486, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(38, 38, 38, 255), false)
                    dxDrawImage(x*497, y*487, x*24, y*24, "files/IMGs/ciclo.png", 0, 0, 0, tocolor(254, 254, 254, 255), false) 
                end
                dxDrawImage(x*1060, y*300, x*280, y*140, "files/IMGs/painel2.png", 0, 0, 0, tocolor(254, 254, 254, 255), false)
                dxDrawRoundedRectangle(x*1085, y*403, x*110, y*28, (isCursorOnElement(x*1085, y*403, x*110, y*28) and tocolor(13, 92, 7, 255) or tocolor(20, 20, 20, 255)), 10)  -- BOTÃO REALIZAR TRANSFERENCIA
                dxDrawRoundedRectangle(x*1205, y*403, x*110, y*28, (isCursorOnElement(x*1205, y*403, x*110, y*28) and tocolor(254, 71, 71, 255) or tocolor(20, 20, 20, 255)), 10)  -- BOTAO VOLTAR
                dxDrawEditBox("Conta", x*1093, y*316, x*218, y*37, false, 12, id)
                dxDrawEditBox("Digite aqui o valor!", x*1093, y*355, x*218, y*37, false, 8, transferir)  
                dxDrawText("Cancelar", x*1233, y*409, x*690, y*427, (isCursorOnElement(x*1233, y*396, x*690, y*427) and tocolor(255, 255, 255, 255) or tocolor(255, 255, 255, 200)), x*1.00, "default-bold", "left", "top", false, false, false, false, false)
                dxDrawText("Confirmar", x*1108, y*409, x*825, y*427, (isCursorOnElement(x*1085, y*403, x*110, y*28) and tocolor(255, 255, 255, 255) or tocolor(255, 255, 255, 200)), x*1.00, "default-bold", "left", "top", false, false, false, false, false)
                dxDrawText("Transferência", x*1158, y*282, x*669, y*228, tocolor(255, 255, 255, 255), x*1, "default-bold", "left", "top", false, false, false, false, false)   

            elseif window == "depositar" then
               if Ms(x*380, y*478, x*46, y*44) then
                    dxDrawImage(x*380, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    dxDrawImage(x*391, y*487, x*24, y*24, "files/IMGs/depositar.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)
                else
                    dxDrawImage(x*380, y*478, x*46, y*44, "files/IMGs/cir.png", 0, 0, 0, tocolor(38, 38, 38, 255), false)
                    dxDrawImage(x*391, y*487, x*24, y*24, "files/IMGs/depositar.png", 0, 0, 0, tocolor(254, 254, 254, 255), false)
                end
                dxDrawImage(x*1060, y*300, x*280, y*140, "files/IMGs/painel1.png", 0, 0, 0, tocolor(254, 254, 254, 255), false)
                dxDrawRoundedRectangle(x*1085, y*390, x*110, y*28, (isCursorOnElement(x*1085, y*390, x*110, y*28) and tocolor(13, 92, 7, 255) or tocolor(20, 20, 20, 255)), 10)  -- BOTÃO REALIZAR DEPOSITO
                dxDrawRoundedRectangle(x*1205, y*390, x*110, y*28, (isCursorOnElement(x*1205, y*390, x*110, y*28) and tocolor(254, 71, 71, 255) or tocolor(20, 20, 20, 255)), 10)  -- BOTAO VOLTAR
                dxDrawEditBox("Digite aqui o valor!", x*1090, y*322, x*218, y*37, false, 8, depositar)
                dxDrawText("Cancelar", x*1233, y*396, x*690, y*427, (isCursorOnElement(x*1205, y*390, x*110, y*28) and tocolor(255, 255, 255, 255) or tocolor(255, 255, 255, 200)), x*1.00, "default-bold", "left", "top", false, false, false, false, false)
                dxDrawText("Confirmar", x*1108, y*396, x*825, y*427, (isCursorOnElement(x*1085, y*390, x*110, y*28) and tocolor(255, 255, 255, 255) or tocolor(255, 255, 255, 200)), x*1.00, "default-bold", "left", "top", false, false, false, false, false)
                dxDrawText("Deposito", x*1170, y*282, x*669, y*228, tocolor(255, 255, 255, 255), x*1, "default-bold", "left", "top", false, false, false, false, false)   

                end
            end
        end

    

--[[

            Códigos               

--]]

function dxController()
    if painel == false then
        tickC = getTickCount()
        addEventHandler("onClientRender", root, dxPainel)
        setElementData(transferir, "text2", "")
        setElementData(depositar, "text2", "")
        setElementData(pagar, "text2", "")
        setElementData(sacar, "text2", "")
        setElementData(id, "text2", "")
        showCursor(true)
        showChat(false)
        window = "menu"
        painel = true
    else
        removeEventHandler("onClientRender", root, dxPainel)
        showCursor(false)
        painel = false
        showChat(true)
    end
end


function dxClick(_, state)
    if painel == true then
        if state == "down" then
            if isCursorOnElement(x*1020, y*158, x*18, y*18) then
                dxController()
            end
            if window == "menu" then

                if isCursorOnElement(x * 652, y * 543, x * 74, y * 74) then  
                    window = "extrato"
                elseif isCursorOnElement(x*539, y*478, x*46, y*44) then  
                    window = "pagar"
                elseif isCursorOnElement(x*380, y*478, x*46, y*44) then  
                    window = "depositar"
                elseif isCursorOnElement(x*433, y*478, x*46, y*44) then  
                    window = "sacar"
                elseif isCursorOnElement(x*486, y*478, x*46, y*44) then  
                    window = "transf"
                   end
                 elseif window == "extrato" then
                if isCursorOnElement(x * 626, y * 482, x * 114, y * 30) then
                    window = "menu"
                 end
            elseif window == "pagar" then
                if isCursorOnElement(x*1205, y*403, x*110, y*28) then
                    window = "menu"  
                elseif isCursorOnElement(x*1085, y*403, x*110, y*28) then
                    local valor = getElementData(pagar, "text2")
                    if tonumber(valor) then
                        triggerServerEvent("efetuarPagamento", localPlayer, localPlayer, valor)
                    end
                end
            elseif window == "transf" then
                if isCursorOnElement(x*1205, y*403, x*110, y*28) then
                    window = "menu"
                elseif isCursorOnElement(x*1085, y*403, x*110, y*28) then
                    local conta = getElementData(id, "text2")
                    local valor = getElementData(transferir, "text2")
                    if tonumber(conta) and tonumber(valor) then
                        triggerServerEvent("efetuarTransferencia", localPlayer, localPlayer, conta, valor)
                    end
                end
            elseif window == "sacar" then
                if isCursorOnElement(x*1205, y*390, x*110, y*28) then
                    window = "menu"
                elseif isCursorOnElement(x*1085, y*390, x*110, y*28) then
                    local valor = getElementData(sacar, "text2")
                    if tonumber(valor) then
                        triggerServerEvent("efetuarSaque", localPlayer, localPlayer, valor)
                    end
                end
            elseif window == "depositar" then
                if isCursorOnElement(x*1205, y*390, x*110, y*28) then
                    window = "menu"
                elseif isCursorOnElement(x*1085, y*390, x*110, y*28) then
                    local valor = getElementData(depositar, "text2")
                    if tonumber(valor) then
                        triggerServerEvent("efetuarDeposito", localPlayer, localPlayer, valor)
                    end
                end
            end
        end
    end
end

        
addEventHandler("onClientKey", root, 
    function(button, press)
        if painel == true then 
            if window == "menu" or window == "deposito" or  window == "extrato" or  window == "sacar" or window == "pagar" or window == "transf" then
                for i, v in ipairs(keyTable) do
                    if button == v then
                        cancelEvent()
                    end
                end
                return false
            end
        end
    end 
)

addEvent("openBankSystem", true)
addEvent("passExtractToClient", true)
addEventHandler("onClientClick", root, dxClick)
addEventHandler("openBankSystem", root, dxController)
addEventHandler("passExtractToClient", root, pullExtractToServer)

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

function Ms (x,y,w,h)
    if isCursorShowing() then
        local mx, my = getCursorPosition()
        local resx, resy = guiGetScreenSize()
        mousex, mousey = mx*resx, my*resy
        if mousex > x and mousex < x + w and mousey > y and mousey < y + h then
            return true
        else
            return false
        end
    end
end