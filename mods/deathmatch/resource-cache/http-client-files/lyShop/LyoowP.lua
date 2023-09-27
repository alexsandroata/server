local ped1 = createPed (155, 374.928, -116.987, 1001.492, 180)
setElementInterior(ped1, 5)
setElementDimension(ped1, 0)
setElementFrozen(ped1, true)

local ped2 = createPed (205, 377.14, -65.623, 1001.508, 180)
setElementInterior(ped2, 10)
setElementDimension(ped2, 0)
setElementFrozen(ped2, true)

local ped3 = createPed (167, 368.786, -4.397, 1001.852, 180)
setElementInterior(ped3, 9)
setElementDimension(ped3, 0)
setElementFrozen(ped3, true)


function cancelPedDamage()
	cancelEvent()
end
addEventHandler("onClientPedDamage", ped1, cancelPedDamage)

function cancelPedDamage()
	cancelEvent()
end
addEventHandler("onClientPedDamage", ped2, cancelPedDamage)

function cancelPedDamage()
	cancelEvent()
end
addEventHandler("onClientPedDamage", ped3, cancelPedDamage)




local rootElement = getRootElement() 
local screenWidth, screenHeight = guiGetScreenSize() 
local maxrange = 15 

function dxDrawTextOnElement(TheElement,text,height,distance,R,G,B,alpha,size,font, ...)
    local x, y, z = getElementPosition(TheElement)
    local x2, y2, z2 = getCameraMatrix()
    local distance = distance or 20
    local height = height or 1
    local value1 = 2
    local value2 = 2

    if (isLineOfSightClear(x, y, z+2, x2, y2, z2, ...)) then
        local sx, sy = getScreenFromWorldPosition(x, y, z+height)
        if(sx) and (sy) then
            local distanceBetweenPoints = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
            if(distanceBetweenPoints < distance) then
                dxDrawText(text, sx+value1, sy+value2, sx, sy, tocolor(R or 255, G or 255, B or 255, alpha or 255), (size or 1)-(distanceBetweenPoints / distance), font or "arial", "center", "center", false, false, false, true, false)
            end
        end
    end
end

function wolrdTexts()
    dxDrawTextOnElement(ped1 ,"Atendente", 1, 20, 249, 137, 71, 255, 1.5, "default")
end
addEventHandler("onClientRender", rootElement, wolrdTexts)

function wolrdTexts()
    dxDrawTextOnElement(ped2 ,"Atendente", 1, 20, 249, 137, 71, 255, 1.5, "default")
end
addEventHandler("onClientRender", rootElement, wolrdTexts)

function wolrdTexts()
    dxDrawTextOnElement(ped3 ,"Atendente", 1, 20, 249, 137, 71, 255, 1.5, "default")
end
addEventHandler("onClientRender", rootElement, wolrdTexts)