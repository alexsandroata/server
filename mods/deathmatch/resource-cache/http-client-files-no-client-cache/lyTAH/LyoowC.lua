local screenW, screenH = guiGetScreenSize()
local resW, resH = 1360,768
local x, y = (screenW/resW), (screenH/resH)

function lyoowImage(posX, posY, width, height, image, rotation, rotationX, rotationY, color, postGUI)
    dxDrawImage(x*posX, y*posY, x*width, y*height, image, rotation, rotationX, rotationY, color, postGUI)
end

function lyoowText(text, posX, posY, width, height, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning)
    dxDrawText(text, x*posX, y*posY, x*width, y*height, color, x*scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning)
end

function lyoowRectangle(posX, posY, width, height, color, postGUI)
    dxDrawRectangle(x*posX, y*posY, x*width, y*height, color, postGUI)
end


function HudMostrandoFomeSedeSono ()
    local dataFome = math.floor(getElementData(localPlayer, "lyFome" )) or 0
	local dataSede = math.floor(getElementData(localPlayer, "lySede" )) or 0
    if getElementData(localPlayer, "Fome:Logado") == true then
    end
end
addEventHandler ("onClientRender", getRootElement(), HudMostrandoFomeSedeSono )


timeFome = 108000
timeSede = 72000

function repeatFome()
    if getElementData(localPlayer, "afkdate") == true then return end
    if getElementData(localPlayer, "Fome:Logado") == true then
        dataFome = getElementData(localPlayer, "lyFome") -1
        setFome = setElementData(localPlayer, "lyFome", dataFome)
	if getElementData(localPlayer, "lyFome") <= 0 then
        setElementData(localPlayer, "lyFome", 10)
        setElementHealth(localPlayer, 0)
    end
	end
end
setTimer(repeatFome, timeFome, 0)


function repeatSede()
    if getElementData(localPlayer, "afkdate") == true then return end
    if getElementData(localPlayer, "Sede:Logado") == true then
        Sede = getElementData(localPlayer, "lySede") -1
        SetarSede = setElementData(localPlayer, "lySede", Sede)
    if getElementData(localPlayer, "lySede") <= 0 then
        setElementData(localPlayer, "lySede", 10)
        setElementHealth(localPlayer, 0)
    end
	end
end
setTimer(repeatSede, timeSede, 0)



function VerificarFomeRepeat()
    if getElementData(localPlayer, "Fome:Logado") == true then
        Fome = getElementData(localPlayer, "lyFome")
    if Fome > 100 then
        setElementData(localPlayer, "lyFome", 100)
    end
	end
end
setTimer(VerificarFomeRepeat, 50, 0)


function VerificarSedeRepeat()
    if getElementData(localPlayer, "Sede:Logado") == true then
        Sede = getElementData(localPlayer, "lySede")
    if Sede > 100 then
        setElementData(localPlayer, "lySede", 100)
    end
	end
end
setTimer(VerificarSedeRepeat, 50, 0)