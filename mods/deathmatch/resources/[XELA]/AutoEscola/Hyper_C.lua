local screenW, screenH = guiGetScreenSize()
local resW, resH = 1365,767
local x, y = (screenW/resW), (screenH/resH)
local _event = addEvent
local _eventH = addEventHandler
local select = 1
local Tempo = {}

var = {
    functions = {},
    pergunta = 1,
    acertos = 0,
    select = false,
    tick = false,
    Imagens = {
        ["Logo"] = dxCreateTexture('ui/logo.png'),
        ["Bateria"] = dxCreateTexture('ui/bateria.png'),
        ["Wifi"] = dxCreateTexture('ui/wifi.png'),
        ["Buy"] = dxCreateTexture('ui/buy.png'),
    },
    Fonts = {
        ["8"] = dxCreateFont('ui/Fonts/RobotoBold.ttf', 8),
        ["10"] = dxCreateFont('ui/Fonts/RobotoBold.ttf', 10),
        ["12"] = dxCreateFont('ui/Fonts/RobotoBold.ttf', 12),
        ["14"] = dxCreateFont('ui/Fonts/RobotoBold.ttf', 14),
        ["16"] = dxCreateFont('ui/Fonts/RobotoBold.ttf', 16),
        ["18"] = dxCreateFont('ui/Fonts/RobotoBold.ttf', 18),
        ["20"] = dxCreateFont('ui/Fonts/RobotoBold.ttf', 20),
        ["22"] = dxCreateFont('ui/Fonts/RobotoBold.ttf', 22),
    },
    Dx = {
        Image = dxDrawImage,
        Text = dxDrawText,
    },
    
    Selecao = {
        {x*285, y*339, x*32, y*32},
        {x*285, y*381, x*32, y*32},
        {x*284, y*423, x*32, y*32},
        {x*284, y*465, x*32, y*32},
    },
}

var.functions.register =
function(event, ...)
    _event(event, true)
    _eventH(event, ...)
end

var.functions.RenderEscola =
function ()
    local Selecionado = Hyper_Config.Categorias[select]
    exports["Blur"]:dxDrawBluredRectangle(0, 0, 1920, 1080, tocolor(255, 255, 255, 255))
    var.functions.Redondo(x*229, y*134, x*907, y*492, tocolor(35, 43, 51, 255), 4)
    var.functions.Redondo(x*242, y*147, x*881, y*467, tocolor(24, 27, 29, 255), 4)
    var.Dx.Image(x*1059, y*158, x*31, y*31, var.Imagens["Bateria"], 0, 0, 0, tocolor(255, 255, 255, 255), false)
    var.Dx.Image(x*269, y*157, x*32, y*32, var.Imagens["Wifi"], 0, 0, 0, tocolor(255, 255, 255, 255), false)
    var.functions.dxTextCenter("Seu Servidor", x*312, y*171, x*149, y*10, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["8"], "left", "top", false, false, false, true, false)
    local time = getRealTime()
    local hours = time.hour
    local minutes = time.minute
    local seconds = time.second
    if (hours >= 0 and hours < 10) then
       hours = "0"..time.hour
    end
    if (minutes >= 0 and minutes < 10) then
       minutes = "0"..time.minute        end
    if (seconds >= 0 and seconds < 10) then
       seconds = "0"..time.second
    end
    local meses = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"}
    local dias = {"Domingo", "Segunda Feira", "Terça Feira", "Quarta Feira", "Quinta Feira", "Sexita Feira", "Sabado"}
    local dia = ("%02d"):format(time.monthday)
    local ano = ("%02d"):format(time.year + 1900)
    local diaa = dias[time.weekday + 1]
    local mes = meses[time.month + 1]
    var.functions.dxTextCenter(""..hours..":"..minutes.."", x*669, y*158, x*37, y*10, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["8"], "center", "center", false, false, false, true, false)
    if Aba == "Inicio" then
        var.Dx.Text("PRESSIONE #E71313BACKSPACE #FFFFFFPARA SAIR", x*314, y*580, x*184, y*11, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["8"], "left", "top", false, false, false, true, false)
        var.Dx.Image(x*251, y*531, x*68, y*68, var.Imagens["Logo"], 0, 0, 0, tocolor(255, 255, 255, 255), false)
        var.Dx.Image(x*398, y*207, x*538, y*366, var.Imagens["Logo"], 0, 0, 0, tocolor(255, 255, 255, 70), false)
        var.Dx.Image(x*426, y*295, x*485, y*247, 'ui/Veiculos/'..Selecionado[1]..'.png', 0, 0, 0, tocolor(255, 255, 255, 255), false)
        var.functions.Redondo(x*846, y*250, x*262, y*43, tocolor(245, 42, 42, 255), 4)
        var.functions.dxTextCenter(Selecionado[2], x*844, y*250, x*264, y*44, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["14"], "center", "center", false, false, false, true, false)
        var.Dx.Text("CATEGORIA: #E71313("..Selecionado[3]..")", x*865, y*307, x*148, y*23, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["10"], "left", "top", false, false, false, true, false)
        var.Dx.Text("VALOR: #E71313R$"..var.functions.convertnumber(Selecionado[4]).."", x*865, y*343, x*187, y*23, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["10"], "left", "top", false, false, false, true, false)
        
        var.functions.Redondo(x*981, y*573, x*127, y*32,(var.functions.Cursor(x*981, y*573, x*127, y*32) and tocolor(185, 28, 28) or tocolor(245, 42, 42, 255)), 4)
        var.functions.Redondo(x*844, y*573, x*127, y*32, (var.functions.Cursor(x*844, y*573, x*127, y*32) and tocolor(185, 28, 28) or tocolor(245, 42, 42, 255)), 4)
        var.functions.Redondo(x*911, y*531, x*128, y*32, (var.functions.Cursor(x*911, y*531, x*128, y*32) and tocolor(185, 28, 28) or tocolor(245, 42, 42, 255)), 4)
        var.functions.dxTextCenter("ANTERIOR", x*844, y*573, x*127, y*32, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["12"], "center", "center", false, false, false, true, false)
        var.functions.dxTextCenter("COMPRAR", x*948, y*539, x*78, y*17, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["10"], "left", "top", false, false, false, true, false)
        var.functions.dxTextCenter("PROXIMO", x*981, y*573, x*127, y*32, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["12"], "center", "center", false, false, false, true, false)
        
        var.Dx.Image(x*918, y*534, x*24, y*25, var.Imagens["Buy"], 0, 0, 0, tocolor(255, 255, 255, 255), false)
    elseif Aba == "Perguntas" then 
        var.Dx.Text(Hyper_Config["Perguntas"][var.pergunta]["Pergunta"], x*341, y*242, x*818, y*34, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["12"], "left", "top", false, false, false, true, false)
        var.functions.Redondo(x*979, y*573, x*127, y*32, tocolor(245, 42, 42, 255), 7)
        
        var.functions.Redondo(x*285, y*339, x*32, y*32, tocolor(245, 42, 42, 255), 4)
        var.functions.Redondo(x*285, y*381, x*32, y*32, tocolor(245, 42, 42, 255), 4)
        var.functions.Redondo(x*284, y*423, x*32, y*32, tocolor(245, 42, 42, 255), 4)
        var.functions.Redondo(x*284, y*465, x*32, y*32, tocolor(245, 42, 42, 255), 4)
        
        var.functions.Redondo(x*284, y*231, x*46, y*45, tocolor(245, 42, 42, 255), 4)
        var.functions.dxTextCenter("PROXIMO", x*979, y*573, x*127, y*32, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["12"], "center", "center", false, false, false, true, false)
        var.Dx.Text(Hyper_Config["Perguntas"][var.pergunta]["Respostas"][1][1], x*324, y*346, x*779, y*25, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["10"], "left", "top", false, false, false, true, false)
        var.Dx.Text(Hyper_Config["Perguntas"][var.pergunta]["Respostas"][2][1], x*324, y*388, x*779, y*25, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["10"], "left", "top", false, false, false, true, false)
        var.Dx.Text(Hyper_Config["Perguntas"][var.pergunta]["Respostas"][3][1], x*324, y*430, x*779, y*25, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["10"], "left", "top", false, false, false, true, false)
        var.Dx.Text(Hyper_Config["Perguntas"][var.pergunta]["Respostas"][4][1], x*324, y*472, x*779, y*25, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["10"], "left", "top", false, false, false, true, false)
        
        if var.select then 
            var.functions.dxTextCenter("X", var.Selecao[var.select][1],  var.Selecao[var.select][2],  var.Selecao[var.select][3],  var.Selecao[var.select][4], tocolor(254, 255, 255, 255), x*1.0, var.Fonts["10"], "center", "center", false, false, false, true, false)
        end
        
        var.functions.dxTextCenter(var.pergunta, x*285, y*231, x*45, y*45, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["14"], "center", "center", false, false, false, true, false)
    elseif Aba == "Finalizar" then  
        var.functions.Redondo(x*979, y*573, x*127, y*32, tocolor(245, 42, 42, 255), 7)
        var.functions.dxTextCenter("Próximo", x*979, y*573, x*127, y*32, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["12"], "center", "center", false, false, false, true, false)
        var.functions.dxTextCenter("RESULTADO PROVA TEÓRICA", x*301, y*320, x*355, y*31, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["18"], "left", "top", false, false, false, true, false)
        if var.acertos >= Hyper_Config.Geral.MinAcertos then 
            var.functions.dxTextCenter("APROVADO", x*301, y*380, x*328, y*62, tocolor(139, 231, 84, 255), x*1.0, var.Fonts["18"], "left", "top", false, false, false, true, false)
        else
            var.functions.dxTextCenter("REPROVADO", x*301, y*380, x*328, y*62, tocolor(245, 42, 42, 255), x*1.0, var.Fonts["18"], "left", "top", false, false, false, true, false)
        end
        var.functions.Redondo(x*753, y*312, x*121, y*119, tocolor(245, 42, 42, 255), 7)
        var.functions.Redondo(x*894, y*312, x*121, y*119, tocolor(139, 231, 84, 200), 7)
        var.functions.dxTextCenter(var.pergunta - var.acertos, x*753, y*312, x*121, y*100, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["18"], "center", "center", false, false, false, true, false)
        var.functions.dxTextCenter(var.acertos, x*894, y*312, x*121, y*100, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["18"], "center", "center", false, false, false, true, false)
        var.functions.dxTextCenter("ERROS", x*753, y*403, x*121, y*16, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["14"], "center", "center", false, false, false, true, false)
        var.functions.dxTextCenter("ACERTOS", x*894, y*400, x*121, y*16, tocolor(254, 255, 255, 255), x*1.0, var.Fonts["14"], "center", "center", false, false, false, true, false)
    end
end

var.functions.RenderConfirm =
function()
    local Bind = Hyper_Config.Geral.Bind
    local Color = Hyper_Config.Geral.ColorHex
    local Cart = getElementData(localPlayer,"HS:Teorica") or "Sem Carteira"
    if Cart ~= "Sem Carteira" then
        dxDrawText("PRESSIONE "..Color.."("..Bind..") #FFFFFFPARA REALIZAR A PROVA PRÁTICA NA CATEGORIA "..Color.."("..Cart..")", x*500, y*679, x*612, y*27, tocolor(254, 255, 255, 255), x*1.0, "default-bold", "left", "top", false, false, false, true, false)
    else
        dxDrawText("FAÇA A SUA PROVA "..Color.."TEORICA #FFFFFFE VOLTE AQUI", x*550, y*679, x*612, y*27, tocolor(254, 255, 255, 255), x*1.0, "default-bold", "left", "top", false, false, false, true, false)
    end
end

var.functions.RenderTimer =
function()
    local Color = Hyper_Config.Geral.ColorHex
    dxDrawText(""..Color..""..getTimeLeft(Tempo[localPlayer]).."", x*0, y*0, x*1365, y*44, tocolor(254, 255, 255, 255), x*3.0, "default-bold", "center", "center", false, false, false, true, false)
end


var.functions.register('HS:ContTimer', getRootElement(),
function(Timer)
    addEventHandler('onClientRender', getRootElement(), var.functions.RenderTimer)
    Tempo[localPlayer] = setTimer(function()
        removeEventHandler('onClientRender', getRootElement(), var.functions.RenderTimer)
    end,Timer,1)
end)

var.functions.register('HS:KillContTimer', getRootElement(),
function()
    if var.functions.event('onClientRender', getRootElement(), var.functions.RenderTimer) then
        removeEventHandler('onClientRender', getRootElement(), var.functions.RenderTimer)
    end
end)

var.functions.register(getResourceName(getThisResource())..'Escola', getRootElement(),
function()
    if not var.functions.event('onClientRender', getRootElement(), var.functions.RenderEscola) then 
        addEventHandler('onClientRender', getRootElement(), var.functions.RenderEscola)
        showCursor(true)
        showChat(false)
        Aba = "Inicio"
        var.pergunta = 1
        var.select = false
        var.acertos = 0
    end
end)

bindKey('backspace', "down",
function()
    if var.functions.event('onClientRender', getRootElement(), var.functions.RenderEscola) then
        if Aba == "Perguntas" then return end
        removeEventHandler('onClientRender', getRootElement(), var.functions.RenderEscola)
        showCursor(false)
        showChat(true)
        Aba = nil
        var.pergunta = 1
        var.select = false
    end
end)


var.functions.register('HS:CheckBind', getRootElement(),
function()
    if not var.functions.event('onClientRender', getRootElement(), var.functions.RenderConfirm) then 
        addEventHandler('onClientRender', getRootElement(), var.functions.RenderConfirm)
        else
        removeEventHandler('onClientRender', getRootElement(), var.functions.RenderConfirm)
    end
end)

var.functions.register('HS:ProvaTeorica', getRootElement(),
function()
    Aba = "Perguntas"
    outputMessage("Bem vindo á Prova teórica BCA, Faça sua prova com calma e boa sorte!", "success")
end)

addEventHandler('onClientClick', getRootElement(),
function(_, state)
    if var.functions.event('onClientRender', getRootElement(), var.functions.RenderEscola) then
        if state == "down" then
            if Aba == "Inicio" then 
                if var.functions.Cursor(x*844, y*573, x*127, y*32) then
                    local limiteTrocar2 = #Hyper_Config.Categorias
                    local proximo2 = select - 1
                    if proximo2 >= 1 then 
                        select = select - 1
                    end
                elseif var.functions.Cursor(x*981, y*573, x*127, y*32) then
                    local limiteTrocar2 = #Hyper_Config.Categorias
                    local proximo2 = select + 1
                    if proximo2 <= limiteTrocar2 then 
                        select = select + 1 
                    end
                elseif var.functions.Cursor(x*911, y*531, x*128, y*32) then 
                    local Selecionado = Hyper_Config.Categorias[select]
                    local money = getPlayerMoney(localPlayer)
                    if money >= Selecionado[4] then
                        triggerServerEvent("HS:BuyCart",getLocalPlayer(),localPlayer,Selecionado[3],Selecionado[4])
                    else
                        outputMessage("Dinheiro insuficiente", "error")
                    end
                end
            elseif Aba == "Perguntas" then 
                for i, v in ipairs(var.Selecao) do
                    if var.functions.Cursor(v[1], v[2], v[3], v[4]) then
                        var.select = i
                    end
                    
                end
                if var.functions.Cursor(x*979, y*573, x*127, y*32) then 
                    if var.select then
                        local maximo = #Hyper_Config["Perguntas"]
                        if var.pergunta == maximo then 
                            if Hyper_Config["Perguntas"][var.pergunta]["Respostas"][var.select][2] then
                                var.acertos = var.acertos + 1 
                            end 
                            Aba = "Finalizar"
                        else
                            if Hyper_Config["Perguntas"][var.pergunta]["Respostas"][var.select][2] then
                                var.acertos = var.acertos + 1 
                            end 
                            var.pergunta = var.pergunta + 1
                            var.select = false
                        end
                    end
                end
            elseif Aba == "Finalizar" then 
                if var.functions.Cursor(x*979, y*573, x*127, y*32) then
                    removeEventHandler("onClientRender", getRootElement(), var.functions.RenderEscola)
                    Aba = nil
                    showCursor(false)
                    showChat(true)
                    if var.acertos < Hyper_Config.Geral.MinAcertos then
                    setElementData(localPlayer,"HS:Teorica","Sem Carteira")
                    return end
                    if var.acertos >= Hyper_Config.Geral.MinAcertos then
                        local Selecionado = Hyper_Config.Categorias[select]
                        triggerServerEvent("HS:CheckCartPassed",getLocalPlayer(),localPlayer,Selecionado[3])
                    end
                end
            end
        end
    end
end)

-- IGNORAR

var.functions.Redondo =
function(x, y, rx, ry, color, radius)
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

var.functions.Cursor = 
function(x,y,w,h)
     if isCursorShowing () then
         local mx,my = getCursorPosition ()
         local fullx,fully = guiGetScreenSize()
          cursorx,cursory = mx*fullx,my*fully
         if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
            return true
        else
            return false
         end
     end
end

var.functions.event =
function( sEventName, pElementAttachedTo, func )
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

function getTimeLeft(timer)
    if isTimer(timer) then
        local ms = getTimerDetails(timer)
        local m = math.floor(ms/60000)
        local s = math.floor((ms-m*60000)/1000)
        if m < 10 then m = "0"..m end
        if s < 10 then s = "0"..s end
        return m..":"..s
    end
end

var.functions.dxTextCenter =
function(text, x, y, w, h, color, scale, font)
    local Width = dxGetTextWidth(text, scale, font)
    local Height = dxGetFontHeight(scale, font)
    local PosX = (x + (w/2)) - (Width/2)
    local PosY = (y + (h/2)) - (Height/2)
    dxDrawText(text, PosX, PosY, 0, 0, color, scale, font)
end

var.functions.convertnumber = 
function ( number )   
    local formatted = number   
    while true do       
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')     
        if ( k==0 ) then       
            break   
        end   
    end   
    return formatted 
end 