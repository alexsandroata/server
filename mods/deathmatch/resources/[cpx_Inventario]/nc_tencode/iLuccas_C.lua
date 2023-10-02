---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- RESOLUÇÃO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local screenW, screenH = guiGetScreenSize()
local resW, resH = 1360,768
local x, y = (screenW/resW), (screenH/resH)

local font = dxCreateFont("files/fontt4.ttf", 8)
local font2 = dxCreateFont("files/fontt3.ttf", 9)
local font3 = dxCreateFont("files/fontt4.ttf", 7)
local font4 = dxCreateFont("files/fontt3.ttf", 9)
local font5 = dxCreateFont("files/fontt4.ttf", 14)
local font6 = dxCreateFont("files/fontt4.ttf", 8)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- DX
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

chamadospm = {}
pplayer = nil
ttipo = nil
ppos, ppos2, ppos3 = nil
function dxnotificacoes()

    tickJ = getTickCount()

    if #chamadospm > 4 then
        table.remove(chamadospm, 1)
    end 
    
    for i,v in ipairs(chamadospm) do

        pplayer = v[4]
        ppos, ppos2, ppos3 = v[7], v[8], v[9]

        if v[3] == "loc" then

            ttipo = "Localização"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-20", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Localização", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText(v[10], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true) 

        elseif v[3] == "reforço" then

            ttipo = "Reforço"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-78", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Reforço", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText(v[10], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)

        elseif v[3] == "prisão" then

            ttipo = "Fuga da Prisão"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-98", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Fuga da Prisão", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText("Recebido às "..v[5], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)
            
        elseif v[3] == "abordagem" then

            ttipo = "Iniciando abordagem"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-38", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Iniciando abordagem", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText(v[10], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)

        elseif v[3] == "acidente" then

            ttipo = "acidente"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-50", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Acidente", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText(v[10], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)
            
        elseif v[3] == "oficialf" then

            ttipo = "Oficial Ferido"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-13", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Oficial Ferido", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText(v[10], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)

        elseif v[3] == "HArmado" then

            ttipo = "Civil Armado"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-32", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Civil Armado", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText("Recebido às "..v[5], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)

        elseif v[3] == "caixa" then

            ttipo = "Caixa Eletrônico"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-90", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Caixa Eletrônico", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText("Recebido às "..v[5], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)

        elseif v[3] == "tcaixa" then

            ttipo = "Tentativa de roubo"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-90", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Tentativa de roubo", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText("Recebido às "..v[5], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)

        elseif v[3] == "tcasa" then

            ttipo = "Tentativa de invasão"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-90", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Tentativa de invasão", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText("Recebido às "..v[5], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)            

        elseif v[3] == "registradora" then

            ttipo = "Registradora"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-90", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Registradora", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText("Recebido às "..v[5], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)

        elseif v[3] == "confronto" then

            ttipo = "Confronto em andamento"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-10", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Confronto em andamento", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText("Recebido às "..v[5], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)

        elseif v[3] == "compdroga" then

            ttipo = "Venda de Drogas"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(139, 0, 0))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(139, 0, 0))

            dxDrawText("10-90", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Venda de Drogas", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText("Recebido às "..v[5], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 150), true)
            
        elseif v[3] == "ammunation" then

            ttipo = "Loja de Armas"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-90", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Loja de Armas", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText("Recebido às "..v[5], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)

        elseif v[3] == "lojinha" then

            ttipo = "Loja de Departamento"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-90", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Loja de Departamento", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText("Recebido às "..v[5], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)

        elseif v[3] == "casa" then

            ttipo = "Invasão a propriedade"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-90", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Invasão a propriedade", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[14], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText("Recebido às "..v[5], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)

        elseif v[3] == "droga" then

            ttipo = "Venda de Drogas"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-90", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Venda de Drogas", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[6], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText("Recebido às "..v[5], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)

        elseif v[3] == "lockpick" then

            ttipo = "Roubo de veículo"
            
            dxDrawRectangle(x*1110, y*20 + (i*y*105), x*250, y*95, tocolor(30, 30, 30))
            dxDrawRectangle(x*1108, y*20 + (i*y*105), x*5, y*95, tocolor(20, 20, 20))
            dxDrawRectangle(x*1125, y*35 + (i*y*105), x*45, y*20, tocolor(36, 133, 53, 200))

            dxDrawText("10-90", x*1147, y*-110 + (i*y*210), x*1147, y*200, tocolor(255, 255, 255, 150), 1.0, font3, "center", "center", false, false, true, true, false)
            dxDrawText("Roubo de veículo", x*1178, y*-111 + (i*y*210), x*1178, y*200, tocolor(255, 255, 255, 150), 1.0, font4, "left", "center", false, false, true, true, false)

            dxDrawText("➜", x*1137, y*-58 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)
            dxDrawText("➜", x*1137, y*-15 + (i*y*210), x*1137, y*200, tocolor(255, 255, 255, 120), 1.0, font5, "center", "center", false, false, true, true, false)

            dxDrawText(v[11], x*1150, y*-58 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)
            dxDrawText(v[12], x*1150, y*-15 + (i*y*210), x*1150, y*200, tocolor(255, 255, 255, 120), 1.0, font6, "left", "center", false, false, true, true, false)

            dxDrawImage(x*1330, y*35 + (i*y*105), x*20, y*20, "files/gps.png", 0, 0, 0, tocolor(255, 255, 255, 180), true)

        end

        if tickJ >= v[1] then
            chamadospm[i][2] = v[2]-2
            if v[2] <= 5 then
                table.remove(chamadospm,i)
            end
        end
    end

end
addEventHandler("onClientRender", root, dxnotificacoes)

---

slctcode = nil
function dxtencode()

    --- < FUNDO > ---

    local x2 = dxGetTextWidth("10-10       10-13       10-20       10-32       10-38       10-50      10-78", 1.0, font, true)
    roundedRectangle(x*660 - (10 + (0.5 * x2)), y*700, x2 + 17, y*30, tocolor(39, 42, 53))

    dxDrawText("10-10      10-13       10-20       10-32       10-38       10-50      10-78", x*660, y*1232, x*660, y*200, tocolor(255, 255, 255, 130), 1.0, font, "center", "center", false, false, true, true, false)

    --- < LINHAS > ---

    dxDrawRectangle(x*525, y*700, x*1, y*30, tocolor(255, 255, 255, 20))
    dxDrawRectangle(x*578, y*700, x*1, y*30, tocolor(255, 255, 255, 20))
    dxDrawRectangle(x*632, y*700, x*1, y*30, tocolor(255, 255, 255, 20))
    dxDrawRectangle(x*686, y*700, x*1, y*30, tocolor(255, 255, 255, 20))
    dxDrawRectangle(x*740, y*700, x*1, y*30, tocolor(255, 255, 255, 20))
    dxDrawRectangle(x*792, y*700, x*1, y*30, tocolor(255, 255, 255, 20))

    if slctcode == 1 then
        roundedRectangle(x*474, y*700, x*50, y*30, tocolor(56, 63, 87))
    elseif slctcode == 2 then
        dxDrawRectangle(x*526, y*699, x*53, y*32, tocolor(56, 63, 87))
    elseif slctcode == 3 then
        dxDrawRectangle(x*579, y*699, x*53, y*32, tocolor(56, 63, 87))
    elseif slctcode == 4 then
        dxDrawRectangle(x*633, y*699, x*53, y*32, tocolor(56, 63, 87))
    elseif slctcode == 5 then
        dxDrawRectangle(x*687, y*699, x*53, y*32, tocolor(56, 63, 87))
    elseif slctcode == 6 then
        dxDrawRectangle(x*740, y*699, x*53, y*32, tocolor(56, 63, 87))
    elseif slctcode == 7 then
        roundedRectangle(x*792, y*700, x*52, y*30, tocolor(56, 63, 87))
    end

end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- ABRIR TEN CODE
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function acabrirtencode()
    if getElementData(localPlayer, "AC-Grupo") == "Police" then
        if not isEventHandlerAdded("onClientRender", root, dxtencode) then
            addEventHandler("onClientRender", root, dxtencode)
            showCursor(true, false)
            toggleControl("fire", false)
            slctcode = nil
        else
            removeEventHandler("onClientRender", root, dxtencode)
            showCursor(false, true)
            toggleControl("fire", true)
        end
    end
end
bindKey("f3", "down", acabrirtencode)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- CLICKS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function dxclicks(_, state)
    if state == "down" then
        if isEventHandlerAdded("onClientRender", root, dxtencode) then

            --- < SELECT > ---

            if isCursorOnElement(x*474, y*700, x*50, y*30) then
                slctcode = 1
                triggerServerEvent("AC-EventTenCode", localPlayer, localPlayer, slctcode)
                setTimer(function()
                    slctcode = nil
                end, 100, 1)
            elseif isCursorOnElement(x*526, y*699, x*52, y*32) then
                slctcode = 2
                triggerServerEvent("AC-EventTenCode", localPlayer, localPlayer, slctcode)
                setTimer(function()
                    slctcode = nil
                end, 100, 1)
            elseif isCursorOnElement(x*579, y*699, x*52, y*32) then
                slctcode = 3
                triggerServerEvent("AC-EventTenCode", localPlayer, localPlayer, slctcode)
                setTimer(function()
                    slctcode = nil
                end, 100, 1)
            elseif isCursorOnElement(x*633, y*699, x*52, y*32) then
                slctcode = 4
                triggerServerEvent("AC-EventTenCode", localPlayer, localPlayer, slctcode)
                setTimer(function()
                    slctcode = nil
                end, 100, 1)
            elseif isCursorOnElement(x*687, y*699, x*52, y*32) then
                slctcode = 5
                triggerServerEvent("AC-EventTenCode", localPlayer, localPlayer, slctcode)
                setTimer(function()
                    slctcode = nil
                end, 100, 1)
            elseif isCursorOnElement(x*740, y*699, x*52, y*32) then
                slctcode = 6
                triggerServerEvent("AC-EventTenCode", localPlayer, localPlayer, slctcode)
                setTimer(function()
                    slctcode = nil
                end, 100, 1)
            elseif isCursorOnElement(x*792, y*700, x*52, y*30) then
                slctcode = 7
                triggerServerEvent("AC-EventTenCode", localPlayer, localPlayer, slctcode)
                setTimer(function()
                    slctcode = nil
                end, 100, 1)
            end
        end

        if isEventHandlerAdded("onClientRender", root, dxnotificacoes) then
            for i, v in ipairs(chamadospm) do
                if isCursorOnElement(x*1330, y*35 + (i*y*105), x*20, y*20) then
                    if #chamadospm == 0 then
                    else
                        table.remove(chamadospm, 1)
                        triggerServerEvent("AC-MarcarLocalizaçãoPM", localPlayer, localPlayer, localPlayer, ttipo, ppos, ppos2, ppos3)
                    end
                end
            end

        end
    end
end
addEventHandler("onClientClick", root, dxclicks)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- CRIAR BLIP LOC
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

bliploc = {}
function criarbliploc(ply, x, y, z, tipoocb)
    if isElement(bliploc[ply]) then
        destroyElement(bliploc[ply])

        bliploc[ply] = createBlip(x, y, z, 6)
        setElementData(bliploc[ply], "BlipName", tipoocb)
        setElementData(bliploc[ply], "BlipTam", 10)
        setElementData(bliploc[ply], "BlipColor", tocolor(119, 174, 230))
        setTimer(function()
            if isElement(bliploc[ply]) then
                destroyElement(bliploc[ply])
            end
        end, 1*60000, 1)

    else
        bliploc[ply] = createBlip(x, y, z, 6)
        setElementData(bliploc[ply], "BlipName", tipoocb)
        setElementData(bliploc[ply], "BlipTam", 10)
        setElementData(bliploc[ply], "BlipColor", tocolor(119, 174, 230))
        setTimer(function()
            if isElement(bliploc[ply]) then
                destroyElement(bliploc[ply])
            end
        end, 1*60000, 1)
    end
end
addEvent("AC-CriarBlipLoc", true)
addEventHandler("AC-CriarBlipLoc", root, criarbliploc)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEL
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function dxDrawACRectangle(text, x, y, z, distance, color, color2, scale, font) 
    if (getDistanceBetweenPoints3D(x, y, z, getElementPosition(getLocalPlayer()))) < distance then
    local rx = {getScreenFromWorldPosition( x, y, z )}
    local x2 = dxGetTextWidth(text, 1.0, font, true)
        if rx[1] and rx[2] and rx[3] then
            dxDrawRectangle(rx[1] - (10 + (0.5 * x2)), rx[2], x2 + 20, 25, color2)
            dxDrawText(text, rx[1], rx[2] + 27, rx[1], rx[2], color, scale, font, "center", "center", false, false, false, true, false)
        end    
    end
end

---

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

---

function convert ( number )  
    return tonumber(("%.1f"):format(number))
end

---

function isCursorOnElement( posX, posY, width, height )
    if isCursorShowing( ) then
      local mouseX, mouseY = getCursorPosition( )
      local clientW, clientH = guiGetScreenSize( )
      local mouseX, mouseY = mouseX * clientW, mouseY * clientH
      if ( mouseX > posX and mouseX < ( posX + width ) and mouseY > posY and mouseY < ( posY + height ) ) then
        return true
      end
    end
    return false
end

---

function convertTime(ms) 
    local min = math.floor(ms/60000) 
    local sec = math.floor((ms/1000)%60) 
    return min, sec 
end

---

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if 
        type( sEventName ) == 'string' and 
        isElement( pElementAttachedTo ) and 
        type( func ) == 'function' 
    then
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

---

function roundedRectangle(x, y, w, h, borderColor, bgColor, postGUI)
    if (x and y and w and h) then
        if (not borderColor) then
            borderColor = tocolor(0, 255, 0, 200);
        end
        
        if (not bgColor) then
            bgColor = borderColor;
        end
        
        --> Background
        dxDrawRectangle(x, y, w, h, bgColor);
        
        --> Border
        dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor); -- top
        dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor); -- bottom
        dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor); -- left
        dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor); -- right
    end
end

---

function ACNotificacaoPm(type, ply, xn, yn, zn, veh)

    local time = getRealTime()
    local Hora = time.hour
    local Minuto = time.minute
    --local Nome = getElementData(ply, "Nome")
    --local SNome = getElementData(ply, "Sobrenome")
    xx, yy, zz = getElementPosition(ply)
    zone = getZoneName(xx, yy, zz)
    city = getZoneName(xx, yy, zz, true)
    if xn and yn and zn then
    zone2 = getZoneName(xn, yn, zn)
    end

    if Hora < 10 then
        Hora = "0"..Hora
    end

    if Minuto < 10 then
        Minuto = "0"..Minuto
    end

    pplayer = nil
    tickJ = getTickCount()
    table.insert(chamadospm, {tickJ+15000, 255, type, ply, ""..Hora..":"..Minuto.."", zone, xx, yy, zz, "Crackudo", xn, yn, zn, zone2})
    playSoundFrontEnd(10)

end
addEvent("AC-NotificacaoPm", true)
addEventHandler("AC-NotificacaoPm", resourceRoot, ACNotificacaoPm)