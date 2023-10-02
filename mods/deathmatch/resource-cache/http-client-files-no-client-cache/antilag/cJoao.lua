local screen = {guiGetScreenSize()}
local sx, sy = (screen[1]/1366), (screen[2]/768)

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

activeRotate = {}
posIr = {}
posAcabar = {}
tickRotate = {}
typeSelect = {}
selectType = {}

local font = dxCreateFont("files/fonts/Roboto-Medium.ttf", 11)
local font2 = dxCreateFont("files/fonts/Roboto-Medium.ttf", 9)

function dx()
    if window == "index" then
        dxDrawImage(365, 160, 635, 458, "files/imgs/base.png")
        if isMouseInPosition(678, 561, 15, 15) or selectPre == "fraco" then
            dxDrawImage(678, 561, 15, 15, "files/imgs/rec_select.png")
        else
            dxDrawImage(678, 561, 15, 15, "files/imgs/rec.png")
        end
        if isMouseInPosition(787, 561, 15, 15) or selectPre == "médio" then
            dxDrawImage(787, 561, 15, 15, "files/imgs/rec_select.png")
        else
            dxDrawImage(787, 561, 15, 15, "files/imgs/rec.png")
        end
        if isMouseInPosition(901, 561, 15, 15) or selectPre == "forte" then
            dxDrawImage(901, 561, 15, 15, "files/imgs/rec_select.png")
        else
            dxDrawImage(901, 561, 15, 15, "files/imgs/rec.png")
        end
        if getKeyState("mouse1") and isCursorShowing() and (isMouseInPosition((401 + (config["Renderizações"]["Mapa"] / 5000 * 230)), 272, 11, 11) or rolandobarra) then
            _, config["Renderizações"]["Mapa"] = BarraUtil(5000, 0, 401, 629, "x")
            rolandobarra = true
        end 
        dxDrawImageSection(406, 274, (230 / 100 * (config["Renderizações"]["Mapa"] / 5000 * 100)), 7, 0, 0, (230 / 100 * (config["Renderizações"]["Mapa"] / 5000 * 100)), 7, 'files/imgs/bar.png')
        dxDrawImage((401 + (config["Renderizações"]["Mapa"] / 5000 * 230)), 272, 11, 11, 'files/imgs/circle.png')
        if getKeyState("mouse1") and isCursorShowing() and (isMouseInPosition((401 + (config["Renderizações"]["Personagens"] / 500 * 230)), 369, 11, 11) or rolandobarra2) then
            _, config["Renderizações"]["Personagens"] = BarraUtil(500, 0, 401, 629, "x")
            rolandobarra2 = true
        end 
        dxDrawImageSection(406, 371, (230 / 100 * (config["Renderizações"]["Personagens"] / 500 * 100)), 7, 0, 0, (230 / 100 * (config["Renderizações"]["Personagens"] / 500 * 100)), 7, 'files/imgs/bar.png')
        dxDrawImage((401 + (config["Renderizações"]["Personagens"] / 500 * 230)), 369, 11, 11, 'files/imgs/circle.png')
        if getKeyState("mouse1") and isCursorShowing() and (isMouseInPosition((401 + (config["Renderizações"]["Veículos"] / 500 * 230)), 466, 11, 11) or rolandobarra3) then
            _, config["Renderizações"]["Veículos"] = BarraUtil(500, 0, 401, 629, "x")
            rolandobarra3 = true
        end 
        dxDrawImageSection(406, 468, (230 / 100 * (config["Renderizações"]["Veículos"] / 500 * 100)), 7, 0, 0, (230 / 100 * (config["Renderizações"]["Veículos"] / 500 * 100)), 7, 'files/imgs/bar.png')
        dxDrawImage((401 + (config["Renderizações"]["Veículos"] / 500 * 230)), 466, 11, 11, 'files/imgs/circle.png')
        if getKeyState("mouse1") and isCursorShowing() and (isMouseInPosition((401 + (config["Renderizações"]["Objetos"] / 5000 * 230)), 563, 11, 11) or rolandobarra4) then
            _, config["Renderizações"]["Objetos"] = BarraUtil(5000, 0, 401, 629, "x")
            rolandobarra4 = true
        end 
        dxDrawImageSection(406, 565, (230 / 100 * (config["Renderizações"]["Objetos"] / 5000 * 100)), 7, 0, 0, (230 / 100 * (config["Renderizações"]["Objetos"] / 5000 * 100)), 7, 'files/imgs/bar.png')
        dxDrawImage((401 + (config["Renderizações"]["Objetos"] / 5000 * 230)), 563, 11, 11, 'files/imgs/circle.png')
        linha = 0
        for i, v in ipairs(config["Adicionais"]) do
            if (i > proxPage and linha < 6) then
                linha = linha + 1
                if tickRotate[i] then activeRotate[i] = interpolateBetween(posIr[i], 0, 0, posAcabar[i], 0, 0, ((getTickCount() - tickRotate[i]) / 600), 'Linear') end
                dxDrawText(v[1], 678, (225 + 39 * linha), 788, (249 + 39 * linha), tocolor(223, 228, 235, 216), 1.00, font, "left", "center", false, false, true, false, false)
                if v[2] == "active" then
                    dxDrawImage(922, (227 + 39 * linha), 37, 23, (activeRotate[i] and (activeRotate[i] >= 938 and "files/imgs/active_select.png" or "files/imgs/active.png") or "files/imgs/active.png"))
                    dxDrawImage((activeRotate[i] and activeRotate[i] or 924), (229 + 39 * linha), 19, 19, "files/imgs/active_boll.png")
                else
                    dxDrawImage(869, (228 + 36 * linha), 90, 27, "files/imgs/select.png")
                    if isMouseInPosition(944, (237 + 36 * linha), 5, 9) then
                        dxDrawImage(944, (237 + 36 * linha), 5, 9, "files/imgs/direita.png", 0, 0, 0, tocolor(155, 111, 199))
                    else
                        dxDrawImage(944, (237 + 36 * linha), 5, 9, "files/imgs/direita.png", 0, 0, 0, tocolor(110, 110, 110))
                    end
                    if isMouseInPosition(879, (237 + 36 * linha), 5, 9) then
                        dxDrawImage(879, (237 + 36 * linha), 5, 9, "files/imgs/esquerda.png", 0, 0, 0, tocolor(155, 111, 199))
                    else
                        dxDrawImage(879, (237 + 36 * linha), 5, 9, "files/imgs/esquerda.png", 0, 0, 0, tocolor(110, 110, 110))
                    end
                    if v[3] == "image" then
                        dxDrawImage(905, (233 + 36 * linha), 17, 17, v[5])
                    else
                        dxDrawText(v[5].." FPS", 871, (228 + 36 * linha), 957, (254 + 36 * linha), tocolor(255, 255, 255, 255), 1.00, font2, "center", "center", false, false, true, false, false)
                    end
                end
            end
        end
    end
end

bindKey("F3", "down",
function()
    if not isEventHandlerAdded("onClientRender", root, dx) then
        triggerServerEvent("JOAO.sendDataSystemLag", localPlayer, localPlayer)
        window = "index"
        proxPage = 0
        addEventHandler("onClientRender", root, dx)
        showCursor(true)
    end
end)

addEventHandler("onClientClick", root,
function(_, state)
    if state == "up" then
        if isEventHandlerAdded("onClientRender", root, dx) then
            if window == "index" then
                if rolandobarra then 
                    rolandobarra = false
                    setFarClipDistance(config["Renderizações"]["Mapa"])
                elseif rolandobarra2 then 
                    rolandobarra2 = false
                    setPedsLODDistance(config["Renderizações"]["Personagens"])
                elseif rolandobarra3 then 
                    rolandobarra3 = false
                    setVehiclesLODDistance(config["Renderizações"]["Veículos"])
                elseif rolandobarra4 then 
                    rolandobarra4 = false
                end
                if isMouseInPosition(678, 561, 15, 15) then
                    if selectPre == "fraco" then
                        selectPre = ""
                    else
                        setPredefinido("fraco")
                    end
                end
                if isMouseInPosition(787, 561, 15, 15) then
                    if selectPre == "médio" then
                        selectPre = ""
                    else
                        setPredefinido("médio")
                    end
                end
                if isMouseInPosition(901, 561, 15, 15) then
                    if selectPre == "forte" then
                        selectPre = ""
                    else
                        setPredefinido("forte")
                    end
                end
                linha = 0
                for i, v in ipairs(config["Adicionais"]) do
                    if (i > proxPage and linha < 6) then
                        linha = linha + 1
                        if v[2] == "active" then
                            if isMouseInPosition(activeRotate[i] and activeRotate[i] or 924, (229 + 39 * linha), 19, 19) then
                                if activeRotate[i] then
                                    if activeRotate[i] >= 938 then
                                        posIr[i] = 938
                                        posAcabar[i] = 924
                                        tickRotate[i] = getTickCount()
                                        updateConfig(i, false, v[4])
                                    else
                                        posIr[i] = 924
                                        posAcabar[i] = 938
                                        tickRotate[i] = getTickCount()
                                        updateConfig(i, true, v[4])
                                    end
                                else
                                    posIr[i] = 924
                                    posAcabar[i] = 938
                                    tickRotate[i] = getTickCount()
                                    updateConfig(i, true, v[4])
                                end
                            end
                        else
                            if isMouseInPosition(944, (237 + 36 * linha), 5, 9) then
                                if (typeSelect[i] < #config["select's"][v[4]]) then
                                    typeSelect[i] = typeSelect[i] + 1
                                    v[6] = typeSelect[i]
                                    updateConfig(i, config["select's"][v[4]][typeSelect[i]][2], v[4], config["select's"][v[4]][typeSelect[i]][3])
                                end
                            end
                            if isMouseInPosition(879, (237 + 36 * linha), 5, 9) then
                                if (typeSelect[i] > 1) then
                                    typeSelect[i] = typeSelect[i] - 1
                                    v[6] = typeSelect[i]
                                    updateConfig(i, config["select's"][v[4]][typeSelect[i]][2], v[4], config["select's"][v[4]][typeSelect[i]][3])
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

addEvent("JOAO.receiveDataSystemLag", true)
addEventHandler("JOAO.receiveDataSystemLag", root,
function(table_)
    tableSystem = fromJSON(table_[1].dataAdicionais)
    for i, v in ipairs(tableSystem) do
        config["Adicionais"][i][5] = v[5]
        if v[2] == "active" then
            if v[5] then
                if activeRotate[i] ~= 938 then
                    tickRotate[i] = getTickCount()
                    posIr[i] = 924
                    posAcabar[i] = 938
                end
            end
        else
            typeSelect[i] = v[6]
        end
    end
    tableSystem2 = fromJSON(table_[1].dataRenders)
    for i, v in pairs(tableSystem2) do
        config["Renderizações"][v.name] = v.qnt
    end
end)

function updateConfig(index, state, name, state2)
    if name == "chat" then
        showChat(state)
    elseif name == "hud" then
        setElementData(localPlayer, "BloqHud", state)
    elseif name == "radar" then
        setPlayerHudComponentVisible("radar", state)
    elseif name == "mira" then
        triggerEvent("JOAO.loadSetLag", localPlayer, state2)
    elseif name == "limitfps" then
        setFPSLimit(state)
    end
    config["Adicionais"][index][5] = state
end

function updateLags(table_, predefinido_)
    if predefinido_ ~= "" then
        selectPre = predefinido_
    else
        if #table_ > 0 then
            local dataAdd = fromJSON(table_[1].dataAdicionais)
            local dataRenders = fromJSON(table_[1].dataRenders)
            for i, v in ipairs(dataAdd) do
                if v[4] == "chat" then
                    showChat(v[5])
                elseif v[4] == "hud" then
                    setElementData(localPlayer, "BloqHud", v[5])
                elseif v[4] == "radar" then
                    setPlayerHudComponentVisible("radar", v[5])
                elseif v[4] == "mira" then
                    triggerEvent("JOAO.loadSetLag", localPlayer, config["select's"][v[4]][v[6]][3])
                elseif v[4] == "limitfps" then
                    setFPSLimit(v[5])
                end
                config["Adicionais"][i][5] = v[5]
            end
            for i, v in ipairs(dataRenders) do
                if v.name == "Mapa" then
                    setFarClipDistance(v.qnt)
                elseif v.name == "Personagens" then
                    setPedsLODDistance(v.qnt)
                elseif v.name == "Veículos" then
                    setVehiclesLODDistance(v.qnt)
                end
                config["Renderizações"][v.name] = v.qnt
            end
        end
    end
end
addEvent("JOAO.setStatesLag", true)
addEventHandler("JOAO.setStatesLag", root, updateLags)

function setPredefinido(type)
    selectPre = type
    for i, v in ipairs(config["Predefinições"][selectPre]) do
        if v[1] == "Adicionais" then
            config[v[1]][v[2]][5] = v[3]
            if config[v[1]][v[2]][4] == "chat" then
                showChat(v[3])
            elseif config[v[1]][v[2]][4] == "hud" then
                setElementData(localPlayer, "BloqHud", v[3])
            elseif config[v[1]][v[2]][4] == "radar" then
                setPlayerHudComponentVisible("radar", v[3])
            elseif config[v[1]][v[2]][4] == "limitfps" then
                setFPSLimit(v[3])
            end
       else
            config[v[1]][v[2]] = v[3]
            if v[2] == "Mapa" then
                setFarClipDistance(v[3])
            elseif v[2] == "Personagens" then
                setPedsLODDistance(v[3])
            elseif v[2] == "Veículos" then
                setVehiclesLODDistance(v[3])
            end
        end
    end
end
addEvent("JOAO.setPredefinidoLag", true)
addEventHandler("JOAO.setPredefinidoLag", root, setPredefinido)

function closeMenu()
    if isEventHandlerAdded("onClientRender", root, dx) then
        triggerServerEvent("JOAO.attAntLag", localPlayer, localPlayer, config["Adicionais"], config["Renderizações"], selectPre and selectPre or "")
        removeEventHandler("onClientRender", root, dx)
        showCursor(false)
    end
end
bindKey("backspace", "down", closeMenu)

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

function BarraUtil(TotalConteudos, MaxLinhas, posInicial, posFinal, type)
    if string.lower(type) == "x" then 
        Tela = guiGetScreenSize()
        cy = getCursorPosition()
        posInicial = (posInicial*(Tela/1366)) / Tela
        posFinal = (posFinal*(Tela/1366)) / Tela 
    elseif string.lower(type) == "y" then 
        _,Tela = guiGetScreenSize()
        _,cy = getCursorPosition()
        posInicial = (posInicial*(Tela/768)) / Tela
        posFinal = (posFinal*(Tela/768)) / Tela 
    end 
    if cy >= (posFinal) then 
        cy = (posFinal)
    elseif cy <= (posInicial) then 
        cy = (posInicial)
    end             
    DeltaG = math.floor((Tela *  (posFinal)) - (Tela * (posInicial)))    
    DeltaA = math.floor((Tela *  cy) - (Tela * (posInicial)))
    cursorYProgress = Tela * (cy / (Tela/768)) 
    proximaPaginaProgress = math.floor((TotalConteudos-MaxLinhas)/DeltaG*(DeltaA))
    return cursorYProgress, proximaPaginaProgress
end 

function BarraUtilExata(TotalConteudos, MaxLinhas, posInicial, posFinal, type)
    if string.lower(type) == "x" then 
        Tela = guiGetScreenSize()
        cy = getCursorPosition()
        posInicial = (posInicial*(Tela/1366)) / Tela
        posFinal = (posFinal*(Tela/1366)) / Tela 
    elseif string.lower(type) == "y" then 
        _,Tela = guiGetScreenSize()
        _,cy = getCursorPosition()
        posInicial = (posInicial*(Tela/768)) / Tela
        posFinal = (posFinal*(Tela/768)) / Tela 
    end  
    if cy >= (posFinal) then 
        cy = (posFinal)
    elseif cy <= (posInicial) then 
        cy = (posInicial)
    end             
    DeltaG = (Tela *  (posFinal)) - (Tela * (posInicial))   
    DeltaA = (Tela *  cy) - (Tela * (posInicial))
    cursorYProgress = Tela * (cy / (Tela/768)) 
    proximaPaginaProgress = (TotalConteudos-MaxLinhas)/DeltaG*(DeltaA)
    return cursorYProgress, proximaPaginaProgress
end 

function MoveBarraUtil(TotalConteudos, MaxLinhas, posInicial, posFinal, type, proximaPaginaNovo)
    if string.lower(type) == "x" then 
        Tela = guiGetScreenSize()
        posInicial = (posInicial*(Tela/1366)) / Tela
        posFinal = (posFinal*(Tela/1366)) / Tela 
    elseif string.lower(type) == "y" then 
        _,Tela = guiGetScreenSize()
        posInicial = (posInicial*(Tela/768)) / Tela
        posFinal = (posFinal*(Tela/768)) / Tela 
    end     
    cy = (((posFinal-posInicial)/(TotalConteudos-MaxLinhas))*proximaPaginaNovo)+posInicial
    DeltaG = math.floor((Tela *  (posFinal)) - (Tela * (posInicial)))    
    DeltaA = math.floor((Tela *  cy) - (Tela * (posInicial)))
    cursorYProgress = Tela * (cy / (Tela/768)) 
    return cursorYProgress
end