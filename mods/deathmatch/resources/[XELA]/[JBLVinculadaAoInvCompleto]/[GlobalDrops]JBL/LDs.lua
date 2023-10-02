local jbl = {}

function createJbl(player) 
    if isElement(jbl[player]) then destroyElement(jbl[player]) end 
    local pos = {getElementPosition(player)}
    local int, dim = getElementInterior(player), getElementDimension(player)
    jbl[player] = createObject(2226, pos[1] + 2, pos[2], pos[3])
    setElementInterior(jbl[player], int)
    setElementDimension(jbl[player], dim)
    --attachElements(jbl[player], player)
    exports["bone_attach"]:attachElementToBone(jbl[player], player, 12, 0, 0.02, 0.43, 1, 199, -30)
    setElementData(player, 'Schootz.pegouJBL', true)
    setElementCollisionsEnabled(jbl[player], false)
end
addEvent('Schootz.JBL', true)
addEventHandler('Schootz.JBL', root, createJbl)

function getJblPlayer(player)
    if isElement(jbl[player]) then
        local pos, posJ = {getElementPosition(player)}, {getElementPosition(jbl[player])}
        if getDistanceBetweenPoints3D(pos[1], pos[2], pos[3], posJ[1], posJ[2], posJ[3]) <= 4 then 
            return jbl[player]
        end
    end
    return false  
end

addCommandHandler('gjbl', 
    function(player)
        if not getElementData(player, 'Schootz.pegouJBL') then
            --message(player, 'Você não tem uma jbl equipada', 'error')
        else
            triggerClientEvent(player, 'Schootz.stopSound', player, jbl[player])
            if isElement(jbl[player]) then destroyElement(jbl[player]) end 
            --exports['focus_inv']:giveItem(player, 'JBL', 1)
			exports["star_inventario"]:sendItem(player, "jbl", 100, 1, "none", false)
			exports["star_inventario"]:sendNotification(player, "success", "JBL Guardada com sucesso!")
            setElementData(player, 'Schootz.pegouJBL', false)
        end
    end
)


addCommandHandler('pegar', 
    function(player)
        local jbl = getJblPlayer(player)
        if isElement(jbl) then 
            if not exports["bone_attach"]:isElementAttachedToBone(jbl) then
                exports["bone_attach"]:attachElementToBone(jbl, player, 12, 0, 0.02, 0.43, 1, 199, -30)
                message(player, 'Você pegou uma jbl', 'success')
            else 
                message(player, 'JBL não está solta', 'success')
            end
        else 
            message(player, 'Não há algum jbl disponível no momento', 'info')
        end
    end
)

addCommandHandler('soltar', 
    function(player)
        if isElement(jbl[player]) then
            if exports["bone_attach"]:isElementAttachedToBone (jbl[player]) then 
                message(player, 'Você soltou a jbl', 'info')
                exports["bone_attach"]:detachElementFromBone(jbl[player])
                setElementCollisionsEnabled(jbl[player], true)

                local pos = {getElementPosition(player)}
                setElementPosition(jbl[player], pos[1], pos[2], pos[3] - 1)
                setElementRotation(jbl[player], 0, 0, 0)
            else 
                message(player, 'Você não tem uma jbl em mãos', 'info')
            end
        else 
            message(player, 'Não há algum jbl disponível no momento', 'info')
        end
    end
)

addEventHandler('onPlayerQuit', root, 
    function()
        if isElement(jbl[source]) then destroyElement(jbl[source]) end 
    end
)

addEventHandler('onPlayerWasted', root, 
    function()
        if isElement(jbl[source]) then destroyElement(jbl[source]) end 
    end
)


addEventHandler('onElementDimensionChange', root, 
    function()
        if isElement(jbl[source]) then destroyElement(jbl[source]) end 
    end
)

addEventHandler('onPlayerInterior', root,  
    function()
        if isElement(jbl[source]) then destroyElement(jbl[source]) end 
    end
)


function setMusica(player)
    local jbl = getJblPlayer(player)
    if not isElement(jbl) then 
        message(player, 'Você não está perto de uma JBL!', 'error')
    else
        triggerClientEvent(player, 'Pedro.printJBLC', player)
    end
end
addCommandHandler('jbl', setMusica)

function message(player, text, type)
    exports['XELA_Notify']:addBox(player, text, type)
end

addEvent('Pedro.addMusicIndex', true)
addEventHandler('Pedro.addMusicIndex', root, 
    function(player, url)
        if isElement(jbl[player]) then 
            local int = getElementInterior(player)
            local dim = getElementDimension(player)
            local pos = {getElementPosition(player)}
            for _, v in ipairs(getElementsByType('player')) do
                triggerClientEvent(v, 'Pedro.addMusic', v, jbl[player], pos[1], pos[2], pos[3], int, dim, url)
            end
        end
    end
)

addEvent('Pedro.optionsMusicIndex', true)
addEventHandler('Pedro.optionsMusicIndex', root, 
    function(player, type)
        if isElement(jbl[player]) then
            if type then
                for _, v in ipairs(getElementsByType('player')) do
                    triggerClientEvent(v, 'Pedro.optionsMusic', v, type, jbl[player])
                end
            end
        end
    end
)