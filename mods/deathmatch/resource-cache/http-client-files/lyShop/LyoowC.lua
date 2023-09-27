local screenW, screenH = guiGetScreenSize()
local resW, resH = 1360,768
local x, y = (screenW/resW), (screenH/resH)

shopPainelDx = false

function lyoowImage(posX, posY, width, height, image, rotation, rotationX, rotationY, color, postGUI)
    dxDrawImage(x*posX, y*posY, x*width, y*height, image, rotation, rotationX, rotationY, color, postGUI)
end

function lyoowText(text, posX, posY, width, height, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning)
    dxDrawText(text, x*posX, y*posY, x*width, y*height, color, x*scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning)
end

function lyoowRectangle(posX, posY, width, height, color, postGUI)
    dxDrawRectangle(x*posX, y*posY, x*width, y*height, color, postGUI)
end

AllKeys = {"arrow_u", "arrow_d", "enter"}

addEventHandler("onClientKey", root, 
    function(button, press)
        for index, keys in pairs(AllKeys) do
            if shopPainelDx then
                if button == keys then
                    cancelEvent()
                end
            end
        end
    end
)

xtudoBack = 2
pizzaBack = 1
hotdogBack = 1
cocaBack = 1
sucoBack = 1
aguaBack = 1

function shopPainel()
    shopPainelDx = true
    lyoowImage(483, 159, 400, 450, "utils/back.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	lyoowImage(489, 212, 388, 49, "utils/backitem"..xtudoBack..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	lyoowImage(489, 271, 388, 49, "utils/backitem"..pizzaBack..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	lyoowImage(489, 331, 388, 49, "utils/backitem"..hotdogBack..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	lyoowImage(489, 390, 388, 49, "utils/backitem"..cocaBack..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	lyoowImage(489, 450, 388, 49, "utils/backitem"..sucoBack..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	lyoowImage(489, 510, 388, 49, "utils/backitem"..aguaBack..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	lyoowImage(483, 159, 400, 450, "utils/itens.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
end

function pressKey(key, press)
    if press then
        if shopPainelDx then
            if key == "arrow_d" then
	    	    if xtudoBack == 2 then
				    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 1, 2, 1, 1, 1, 1
					playSound("utils/hit.wav")
	    	    elseif pizzaBack == 2 then
				    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 1, 1, 2, 1, 1, 1
					playSound("utils/hit.wav")
	    	    elseif hotdogBack == 2 then
				    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 1, 1, 1, 2, 1, 1
					playSound("utils/hit.wav")
	    	    elseif cocaBack == 2 then
				    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 1, 1, 1, 1, 2, 1
					playSound("utils/hit.wav")
	    	    elseif sucoBack == 2 then
				    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 1, 1, 1, 1, 1, 2
					playSound("utils/hit.wav")
	    	    elseif aguaBack == 2 then
				    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 2, 1, 1, 1, 1, 1
					playSound("utils/hit.wav")
				end
			elseif key == "arrow_u" then
	    	    if xtudoBack == 2 then
				    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 1, 1, 1, 1, 1, 2
					playSound("utils/hit.wav")
	    	    elseif pizzaBack == 2 then
				    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 2, 1, 1, 1, 1, 1
					playSound("utils/hit.wav")
	    	    elseif hotdogBack == 2 then
				    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 1, 2, 1, 1, 1, 1
					playSound("utils/hit.wav")
	    	    elseif cocaBack == 2 then
				    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 1, 1, 2, 1, 1, 1
					playSound("utils/hit.wav")
	    	    elseif sucoBack == 2 then
				    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 1, 1, 1, 2, 1, 1
					playSound("utils/hit.wav")
	    	    elseif aguaBack == 2 then
				    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 1, 1, 1, 1, 2, 1
					playSound("utils/hit.wav")
				end
			elseif key == "enter" then
			    local money = getPlayerMoney(localPlayer)
	    	    if xtudoBack == 2 then
				    if getElementData(localPlayer, "xtudo") and tonumber(getElementData(localPlayer, "xtudo")) < 20 then
    			        if money >= 15 then
				            triggerServerEvent("comXtudo", localPlayer)
    			        else
				    	    triggerServerEvent("lyMoneyi", localPlayer)
					    end
					else
					    triggerServerEvent("insuSpace", localPlayer)
					end
	    	    elseif pizzaBack == 2 then
				    if getElementData(localPlayer, "pizza") and tonumber(getElementData(localPlayer, "pizza")) < 20 then
    			        if money >= 18 then
				            triggerServerEvent("comPizza", localPlayer)
    			        else
				    	    triggerServerEvent("lyMoneyi", localPlayer)
					    end
					else
					    triggerServerEvent("insuSpace", localPlayer)
					end
	    	    elseif hotdogBack == 2 then
				    if getElementData(localPlayer, "hotdog") and tonumber(getElementData(localPlayer, "hotdog")) < 20 then
    			        if money >= 13 then
				            triggerServerEvent("comHotdog", localPlayer)
    			        else
				    	    triggerServerEvent("lyMoneyi", localPlayer)
					    end
					else
					    triggerServerEvent("insuSpace", localPlayer)
					end
	    	    elseif cocaBack == 2 then
				    if getElementData(localPlayer, "coca") and tonumber(getElementData(localPlayer, "coca")) < 20 then
    			        if money >= 5 then
				            triggerServerEvent("comCoca", localPlayer)
    			        else
				    	    triggerServerEvent("lyMoneyi", localPlayer)
					    end
					else
					    triggerServerEvent("insuSpace", localPlayer)
					end
	    	    elseif sucoBack == 2 then
				    if getElementData(localPlayer, "suco") and tonumber(getElementData(localPlayer, "suco")) < 20 then
    			        if money >= 4 then
				            triggerServerEvent("comSuco", localPlayer)
    			        else
				    	    triggerServerEvent("lyMoneyi", localPlayer)
					    end
					else
					    triggerServerEvent("insuSpace", localPlayer)
					end
	    	    elseif aguaBack == 2 then
				    if getElementData(localPlayer, "agua") and tonumber(getElementData(localPlayer, "agua")) < 20 then
    			        if money >= 3 then
				            triggerServerEvent("comAgua", localPlayer)
    			        else
				    	    triggerServerEvent("lyMoneyi", localPlayer)
					    end
					else
					    triggerServerEvent("insuSpace", localPlayer)
					end
				end
			elseif key == "backspace" then
			    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 2, 1, 1, 1, 1, 1
			    removeEventHandler("onClientRender", root, shopPainel)
				showChat(true)
				shopPainelDx = false
			end
		end
	end
end
addEventHandler("onClientKey", root, pressKey)


function openShop()
    if not shopPainelDx then
	    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 2, 1, 1, 1, 1, 1
        addEventHandler("onClientRender", root, shopPainel)
	    shopPainelDx = true
        showChat(false)
        playSound("utils/hitm.wav")
	end
end
addEvent("openShop", true)
addEventHandler("openShop", root, openShop)

function closeShop()
    if shopPainelDx then
	    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 2, 1, 1, 1, 1, 1
        removeEventHandler("onClientRender", root, shopPainel)
	    shopPainelDx = false
        showChat(true)
	end
end
addEvent("closeShop", true)
addEventHandler("closeShop", root, closeShop)



