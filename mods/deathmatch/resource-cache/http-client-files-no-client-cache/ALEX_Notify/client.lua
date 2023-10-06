local screen = {guiGetScreenSize()}

local infobox = {}

local font = {
    dxCreateFont('assets/fonts/semibold.ttf', 14, false),
    dxCreateFont('assets/fonts/medium.ttf', 10, false)
}

posy = {}
radary = (screen[2]-37-196)
addEventHandler('onClientRender', root, function ()
    for i, v in ipairs(infobox) do
        if i <= config.limite then
            if v.state == 'iniciando' then
                alpha = interpolateBetween(0, 0, 0, 255, 0, 0, ((getTickCount()-v.tick)/1000), 'Linear')
                v.porcentage = interpolateBetween(0, 0, 0, 100, 0, 0, ((getTickCount()-v.tick)/5000), 'Linear')
                if (v.porcentage >= 99) then
                    v.state = 'fechando'
                    v.tick = getTickCount()
                    v.porcentage = 100
                end
            else
                alpha = interpolateBetween(255, 0, 0, 0, 0, 0, ((getTickCount()-v.tick)/1000), 'Linear')
                if (alpha <= 20) then
                    table.remove(infobox, i)
                    returnPosY()
                end
            end
            dxDrawRectangle(38, radary-(posy[i] or (89 + 8 * i)), 5, v.height, tocolor(90, 94, 103, alpha), true)
            dxDrawRectangle(38, radary-(posy[i] or (89 + 8 * i)), 5, v.height/100*v.porcentage, tocolor(config.types[v.type].color[1], config.types[v.type].color[2], config.types[v.type].color[3], alpha), true)
            dxDrawRectangle(38+5, radary-(posy[i] or (89 + 8 * i)), 308, v.height, tocolor(31, 31, 31, 200), true)
            dxDrawImage(38+5+13, radary-(posy[i] or (89 + 8 * i))+21, 47, 47, 'assets/images/type.png', 0, 0, 0, tocolor(config.types[v.type].color[1], config.types[v.type].color[2], config.types[v.type].color[3], alpha), true)
            dxDrawText(v.type, 38+5+77, radary-(posy[i] or (89 + 8 * i))+20, 0, 0, tocolor(255, 255, 255, alpha), 1, font[1], 'left', 'top', false, false, true)
            dxDrawText(v.text, 38+5+77, radary-(posy[i] or (89 + 8 * i))+40, 349, 838, tocolor(255, 255, 255, alpha), 1.00, font[2], "left", "top", false, true, true)
            dxDrawImage(38+5+28, radary-(posy[i] or (89 + 8 * i))+36, 18, 18, config.types[v.type].image, 0, 0, 0, tocolor(255, 255, 255, alpha), true)
        end
    end
end)

function returnPosY ()
    posy = {}
    for i, v in ipairs(infobox) do
        posy[i] = (posy[i-1] or 0) + (v.height+8)
    end
end

function addBox (message, type)
    for i, v in ipairs({ {'Sucesso', 'success'}, {'Aviso', 'warning'}, {'Erro', 'error'}, {'Admin', 'admin'}, {'Ajuda', 'help'}, {'BOT', 'bot'}, {'Informação', 'info'}, {'Policia', 'pm'}, {'Hospital', 'hp'}, {'Mecanica', 'mec'} }) do
        if type == v[2] then
            type = v[1]
        end
    end
    local tabela = {
        text = message,
        type = type,
        tick = getTickCount(),
        height = 89, 
        state = 'iniciando',
        porcentage = 0
    }
    if string.len(message) > 50 then
        tabela.height = 89+20
    end
    posy[#infobox+1] = (posy[#infobox] or 0) + (tabela.height+8)
    table.insert(infobox, tabela)
    playSound(config.types[type].sound)
end
addEvent('addBox', true)
addEventHandler('addBox', root, addBox)