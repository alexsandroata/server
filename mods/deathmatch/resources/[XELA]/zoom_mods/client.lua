--== Script feito por:
--== ● Caio ●
--== Discord: Caio#8888
--===================================================
--== Qualquer problema procure pelo meu discord.
--===================================================

status, ativado = {}, {}

function isMouseInPosition (x, y, w, h)
	if isCursorShowing() then
		local sx,sy = guiGetScreenSize()
		local cx,cy = getCursorPosition()
		local cx,cy = (cx*sx),(cy*sy)
		if (cx >= x and cx <= x+w) and (cy >= y and cy <= y+h) then
			return true
		end
	end
end

function isEventHandlerAdded (sEventName, pElementAttachedTo, func)
    if type(sEventName) == 'string' and isElement(pElementAttachedTo) and type(func) == 'function' then
        local aAttachedFunctions = getEventHandlers(sEventName, pElementAttachedTo)
        if type(aAttachedFunctions) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs(aAttachedFunctions) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end

local screen = {guiGetScreenSize()}

local font = {
    dxCreateFont('assets/fonts/bold.ttf', 14, false),
    dxCreateFont('assets/fonts/regular.ttf', 11, false),
    dxCreateFont('assets/fonts/regular.ttf', 9, false),
    dxCreateFont('assets/fonts/regular.ttf', 20, false),
    dxCreateFont('assets/fonts/bold.ttf', 10, false),
}

color = {25, 23, 25, 23, 25, 23, 25, 23, 25}

local x, y = (screen[1]/2)-885/2, (screen[2]/2)-554/2
function panel ()
    
    if statePanel == 'opening' then
        alpha = interpolateBetween(0, 0, 0, 255, 0, 0, ((getTickCount()-tick)/800), 'Linear')
    else
        alpha = interpolateBetween(255, 0, 0, 0, 0, 0, ((getTickCount()-tick)/800), 'Linear')
        if (alpha <= 10) then
            removeEventHandler('onClientRender', root, panel)
            statePanel = 'close'
        end
    end

    dxDrawRectangle(x, y, 885, 554, tocolor(31, 31, 31, alpha), false)
    dxDrawRectangle(x+24, y+87, 147, 445, tocolor(27, 27, 27, alpha), false)
    dxDrawRectangle(x+182, y+87, 679, 37, tocolor(45, 45, 45, alpha), false)
    dxDrawRectangle(x+802, y, 83, 52, isMouseInPosition(x+802, y, 83, 52) and tocolor(233, 80, 80, alpha) or tocolor(36, 36, 36, alpha), false)
    dxDrawText('X', x+802+83/2-dxGetTextWidth('X', 1, font[4])/2, y+7, 0, 0, tocolor(255, 255, 255, alpha), 1, font[4])
    
    dxDrawImage(x+199, y+98, 16, 16, 'assets/images/nome.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
    dxDrawText('Nome', x+199+16+7, y+95, 0, 0, tocolor(255, 255, 255, alpha), 1, font[2])
    dxDrawImage(x+367, y+98, 16, 16, 'assets/images/status.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
    dxDrawText('Status', x+367+16+7, y+95, 0, 0, tocolor(255, 255, 255, alpha), 1, font[2])
    dxDrawImage(x+535, y+98, 16, 16, 'assets/images/modelo.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
    dxDrawText('Modelo', x+535+16+7, y+95, 0, 0, tocolor(255, 255, 255, alpha), 1, font[2])
    dxDrawImage(x+703, y+98, 16, 16, 'assets/images/tamanho.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
    dxDrawText('Tamanho', x+703+16+7, y+95, 0, 0, tocolor(255, 255, 255, alpha), 1, font[2])

    for i, v in ipairs({
        'Baixar Selecionado',
        (selectModelo ~= nil and (config.abas[aba].mods[selectModelo] and (ativado[config.abas[aba].mods[selectModelo].modelo] and 'Desativar Selecionado' or 'Ativar Selecionado') or 'Ativar Selecionado') or 'Ativar Selecionado'),
        'Ativar Tudo',
        'Baixar Tudo',
        'Desativar Tudo',
    }) do
        posx = x+57+(i*(120+5))
        dxDrawRectangle(posx, y+493, 120, 39, isMouseInPosition(posx, y+493, 120, 39) and tocolor(r, g, b, alpha) or tocolor(39, 39, 39, alpha), false)
        dxDrawText(v, posx+120/2-dxGetTextWidth(v, 1, font[3])/2, y+493+12, 0, 0, isMouseInPosition(posx, y+493, 120, 39) and tocolor(11, 11, 11, alpha) or tocolor(78, 78, 78, alpha), 1, font[3])
    end

    dxDrawText(aba, x+885/2-dxGetTextWidth(aba, 1, font[1])/2, y+20, 0, 0, tocolor(255, 255, 255, alpha), 1, font[1])

    count = 0
    for page, value in pairs(config.abas) do
        if count < 10 then
            count = count + 1
            dxDrawImage(x+24+20, y+37+20+(count*50), 24, 24, value.image, 0, 0, 0, aba == page and tocolor(r, g, b, alpha) or (isMouseInPosition(x+24, y+37+(count*50), 147, 50) and tocolor(r, g, b, alpha) or tocolor(78, 78, 78, alpha)), false)
            dxDrawText(page, x+24+20+24+5, y+37+24+(count*50), 0, 0, aba == page and tocolor(r, g, b, alpha) or (isMouseInPosition(x+24, y+37+(count*50), 147, 50) and tocolor(r, g, b, alpha) or tocolor(78, 78, 78, alpha)), 1, font[5])
            if page == aba then
                linha = 0
                for i, v in ipairs(value.mods) do
                    if (i > proxPag and linha < 9) then
                        linha = linha + 1
                        dxDrawRectangle(x+182, y+87+(linha*38), 668+11, 38, selectModelo == i and tocolor(r, g, b, alpha) or tocolor(color[linha], color[linha], color[linha], alpha), false)
                        dxDrawText(v.name, x+199+16+7+dxGetTextWidth('Nome', 1, font[2])/2-dxGetTextWidth(v.name, 1, font[2])/2, y+87+(linha*38)+8, 0, 0, selectModelo == i and tocolor(11, 11, 11, alpha) or tocolor(255, 255, 255, alpha), 1, font[2])
                        dxDrawText(status[v.modelo] or 'Não baixado', x+367+16+7+dxGetTextWidth('Status', 1, font[2])/2-dxGetTextWidth(status[v.modelo] or 'Não baixado', 1, font[2])/2, y+87+(linha*38)+8, 0, 0, selectModelo == i and tocolor(11, 11, 11, alpha) or tocolor(255, 255, 255, alpha), 1, font[2])
                        dxDrawText(v.modelo, x+535+16+7+dxGetTextWidth('Modelo', 1, font[2])/2-dxGetTextWidth(v.modelo, 1, font[2])/2, y+87+(linha*38)+8, 0, 0, selectModelo == i and tocolor(11, 11, 11, alpha) or tocolor(255, 255, 255, alpha), 1, font[2])
                        dxDrawText(size and size[v.modelo] or 'Erro', x+703+16+7+dxGetTextWidth('Tamanho', 1, font[2])/2-dxGetTextWidth(size and size[v.modelo] or 'Erro', 1, font[2])/2, y+87+(linha*38)+8, 0, 0, selectModelo == i and tocolor(11, 11, 11, alpha) or tocolor(255, 255, 255, alpha), 1, font[2])
                    end
                end
            end
        end
    end

    if #config.abas[aba].mods > 9 then
        dxDrawRectangle(x+850, y+124, 11, 343, tocolor(53, 53, 53, alpha), false)
        dxDrawRectangle(x+850, cursorY, 11, 104, tocolor(69, 69, 69, alpha), false)
    end

end

setTimer(function()
    tab = {}
    for i, v in pairs(ativado) do
        if v == true then
            table.insert(tab, i)
        end
    end
    triggerServerEvent('saveAtivos', localPlayer, tab)
end, 30000, 0)

addEvent('ativeMods', true)
addEventHandler('ativeMods', root, function (tabela)
    for i, modelo in ipairs(tabela) do
        if fileExists('assets/mods/'..modelo..'.dff') and fileExists('assets/mods/'..modelo..'.txd') then
            if not ativado[modelo] then
                ativado[modelo] = true
                status[modelo] = 'Ativado'
                engineImportTXD(engineLoadTXD('assets/mods/'..modelo..'.txd'), modelo)
                engineReplaceModel(engineLoadDFF('assets/mods/'..modelo..'.dff'), modelo)
            end
        end
    end
end)

function onClientClick (button, state)
    if isEventHandlerAdded('onClientRender', root, panel) then
        if button == 'left' and state == 'down' then

            if isMouseInPosition(x+802, y, 83, 52) then
                openGerenciador('remove')
            else
                count = 0
                for page, value in pairs(config.abas) do
                    if count < 10 then
                        count = count + 1
                        if isMouseInPosition(x+24, y+37+(count*50), 147, 50) then
                            aba = page
                            cursorY = y+123
                            proxPag = 0
                        end
                    end
                end            
            end

            linha = 0
            for i, v in ipairs(config.abas[aba].mods) do
                if (i > proxPag and linha < 9) then
                    linha = linha + 1
                    if isMouseInPosition(x+182, y+87+(linha*38), 668, 38) then
                        selectModelo = i
                    end
                end
            end

            for i, v in ipairs({ 'Baixar Selecionado', (selectModelo ~= nil and (config.abas[aba].mods[selectModelo] and (ativado[config.abas[aba].mods[selectModelo].modelo] and 'Desativar Selecionado' or 'Ativar Selecionado') or 'Ativar Selecionado') or 'Ativar Selecionado'), 'Ativar Tudo', 'Baixar Tudo', 'Desativar Tudo'}) do
                posx = x+57+(i*(120+5))
                if isMouseInPosition(posx, y+493, 120, 39) then
                    if v == 'Baixar Selecionado' then
                        if config.abas[aba].mods[selectModelo] and config.abas[aba].mods[selectModelo].modelo then
                            local model = config.abas[aba].mods[selectModelo].modelo
                            if not fileExists('assets/mods/'..model..'.dff') or not fileExists('assets/mods/'..model..'.txd') then
                                downloadFile('assets/mods/'..model..'.dff')
                                downloadFile('assets/mods/'..model..'.txd')
                            else
                                config.notify('client', 'Esse mod já está baixado!', 'error')
                            end
                        end
                    elseif v == 'Ativar Selecionado' then
                        if config.abas[aba].mods[selectModelo] and config.abas[aba].mods[selectModelo].modelo then
                            local model = config.abas[aba].mods[selectModelo].modelo
                            if fileExists('assets/mods/'..model..'.dff') and fileExists('assets/mods/'..model..'.txd') then
                                if ativado[model] then
                                    config.notify('client', 'Este mod já está ativo!', 'error')
                                else
                                    ativado[model] = true
                                    status[model] = 'Ativado'
                                    engineImportTXD(engineLoadTXD('assets/mods/'..model..'.txd'), model)
                                    engineReplaceModel(engineLoadDFF('assets/mods/'..model..'.dff'), model)
                                    config.notify('client', 'Você ativou com sucesso o '..config.abas[aba].mods[selectModelo].name..'.', 'info')
                                end
                            else
                                config.notify('client', 'Você precisa baixar o arquivo primeiro.', 'info')
                            end
                        end
                    elseif v == 'Desativar Selecionado' then
                        if config.abas[aba].mods[selectModelo] and config.abas[aba].mods[selectModelo].modelo then
                            local model = config.abas[aba].mods[selectModelo].modelo
                            if ativado[model] then
                                engineRestoreModel(model)
                                ativado[model] = false
                                status[model] = 'Baixado'
                            else
                                config.notify('client', 'Este mod não está ativo!', 'error')
                            end
                        end
                    elseif v == 'Ativar Tudo' then
                        atived = false
                        for i, v in ipairs(config.abas[aba].mods) do
                            local model = v.modelo
                            if fileExists('assets/mods/'..model..'.dff') and fileExists('assets/mods/'..model..'.txd') then
                                if not ativado[model] then
                                    atived = true
                                    ativado[model] = true
                                    status[model] = 'Ativado'
                                    engineImportTXD(engineLoadTXD('assets/mods/'..model..'.txd'), model)
                                    engineReplaceModel(engineLoadDFF('assets/mods/'..model..'.dff'), model)
                                end
                            end
                        end
                        if atived == true then
                            config.notify('client', 'Você ativou todos os mods baixados.', 'info')
                        else 
                            config.notify('client', 'Não foi possivel ativar todos mods baixados pois você não possui ou ja estão ativados!', 'warning')
                        end
                    elseif v == 'Baixar Tudo' then
                        baixado = false
                        for i, v in ipairs(config.abas[aba].mods) do
                            local model = v.modelo
                            if not fileExists('assets/mods/'..model..'.dff') or not fileExists('assets/mods/'..model..'.txd') then
                                baixado = true
                                downloadFile('assets/mods/'..model..'.dff')
                                downloadFile('assets/mods/'..model..'.txd')
                            end
                        end
                        if baixado == true then
                            config.notify('client', 'Você baixou todos os mods pendentes.', 'info')
                        else 
                            config.notify('client', 'Não foi possivel baixar todos mods pois você já possui!', 'warning')
                        end
                    elseif v == 'Desativar Tudo' then
                        desativou = false
                        for i, v in ipairs(config.abas[aba].mods) do
                            local model = v.modelo
                            if ativado[model] then
                                engineRestoreModel(model)
                                ativado[model] = false
                                status[model] = 'Baixado'
                                desativou = true
                            end
                        end
                        if desativou == true then
                            config.notify('client', 'Você desativou todos os mods ativo.', 'info')
                        else 
                            config.notify('client', 'Não foi possivel desativar todos mods pois você não possui nenhum ativo!', 'warning')
                        end
                    end
                end
            end

        end
    end
end

addEventHandler('onClientFileDownloadComplete', root, function (file, success)
    if source == resourceRoot then
        if success then
            if string.find(file, '.dff') then
                local model = string.gsub(file, 'assets/mods/', '')
                local model = string.gsub(model, '.dff', '')
                status[tonumber(model)] = 'Baixado'
            elseif string.find(file, '.txd') then
                local model = string.gsub(file, 'assets/mods/', '')
                local model = string.gsub(model, '.txd', '')
                status[tonumber(model)] = 'Baixado'
            end
        end
    end
end)

function onClientKey (button, press)
    if isEventHandlerAdded('onClientRender', root, panel) then
        if isMouseInPosition(x, y, 885, 554) then
            if (button == 'mouse_wheel_down' and press) then
                proxPag = proxPag + 1
                if (proxPag > (#config.abas[aba].mods - 9)) then
                    proxPag = (#config.abas[aba].mods - 9)
                end
                if #config.abas[aba].mods > 9 then
                    cursorY = moveScrollBar(#config.abas[aba].mods, 9, y+124, y+124+343-104, proxPag)
                end
            elseif (button == 'mouse_wheel_up' and press) then
                if (proxPag > 0) then
                    proxPag = proxPag - 1
                end
                if #config.abas[aba].mods > 9 then
                    cursorY = moveScrollBar(#config.abas[aba].mods, 9, y+124, y+124+343-104, proxPag)
                end
            end
        end
    end
end

addEvent('setSizeFiles', true)
addEventHandler('setSizeFiles', root, function (sizes)
    size = sizes
end)

function openGerenciador (action)
    if action == 'open' then
        if not isEventHandlerAdded('onClientRender', root, panel) then
            if not size then
                triggerServerEvent('getSizeFiles', localPlayer)
            end
            cursorY = y+124
            proxPag = 0
            addEventHandler('onClientRender', root, panel)
            addEventHandler('onClientClick', root, onClientClick)
            addEventHandler('onClientKey', root, onClientKey)
            showCursor(true)
            showChat(false)
            tick = getTickCount()
            statePanel = 'opening'
            selectModelo = nil
            for page, _ in pairs(config.abas) do
                count = 1
                if count == 1 then
                    aba = page
                    break
                end
            end
        end
    elseif action == 'remove' then
        if isEventHandlerAdded('onClientRender', root, panel) then
            if statePanel == 'opening' then
                removeEventHandler('onClientClick', root, onClientClick)
                removeEventHandler('onClientKey', root, onClientKey)
                showCursor(false)
                showChat(true)
                tick = getTickCount()
                statePanel = 'closeing'
            end
        end
    end
end

setTimer(function()
    r, g, b = unpack(config.colorRGB)

    for page, _ in pairs(config.abas) do
        if config.abas[page] and config.abas[page].mods and type(config.abas[page].mods) == 'table' then
            for i, v in ipairs(config.abas[page].mods) do
                if fileExists('assets/mods/'..v.modelo..'.dff') and fileExists('assets/mods/'..v.modelo..'.txd') then
                    if ativado[v.modelo] == true then
                        status[v.modelo] = 'Ativado'
                    else
                        status[v.modelo] = 'Desativado'
                    end
                else
                    status[v.modelo] = 'Não baixado'
                end
            end
        end
    end

    if (config.panel.type == 'Command') then
        addCommandHandler(config.panel.key, function ()
            if config.panel.vehicle then
            else
                if isPedInVehicle(localPlayer) then
                    return config.notify('client', 'Saia do veículo para abrir este painel.', 'error')
                end
            end
            openGerenciador('open')
        end)
    elseif (config.panel.type == 'Bind') then
        bindKey(config.panel.key, 'down', function ()
            if config.panel.vehicle then
            else
                if isPedInVehicle(localPlayer) then
                    return config.notify('client', 'Saia do veículo para abrir este painel.', 'error')
                end
            end
            openGerenciador('open')
        end)
    end
end, 500, 1)

function moveScrollBar (conteudos, maxconteudosporvez, posx, pox2, proxPagg)
    _,Tela = guiGetScreenSize()
    posx = (posx*(Tela/768)) / Tela
    pox2 = (pox2*(Tela/768)) / Tela 
    cy = (((pox2-posx)/(conteudos-maxconteudosporvez))*proxPagg)+posx
    DeltaG = math.floor((Tela *  (pox2)) - (Tela * (posx)))    
    DeltaA = math.floor((Tela *  cy) - (Tela * (posx)))
    cursorYProgress = Tela * (cy / (Tela/768)) 
    return cursorYProgress
end