local screenW, screenH = guiGetScreenSize()
local resW, resH = 1360,768
local x, y = (screenW/resW), (screenH/resH)

invPainelDx = false

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

local font = dxCreateFont("utils/font.ttf", 15)

addEventHandler("onClientKey", root, 
    function(button, press)
        for index, keys in pairs(AllKeys) do
            if invPainelDx then
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

function invPainel()
    invPainelDx = true
    lyoowImage(541, 198, 280, 372, "utils/back.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	lyoowImage(545, 240, 271, 44, "utils/backitem"..xtudoBack..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	lyoowImage(545, 295, 271, 44, "utils/backitem"..pizzaBack..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	lyoowImage(545, 350, 271, 49, "utils/backitem"..hotdogBack..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	lyoowImage(545, 405, 271, 49, "utils/backitem"..cocaBack..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	lyoowImage(545, 460, 271, 49, "utils/backitem"..sucoBack..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	lyoowImage(545, 515, 271, 49, "utils/backitem"..aguaBack..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	lyoowText(tonumber(getElementData(localPlayer, "xtudo")).."/20", 733, 253, 796, 269, tocolor(0, 0, 0, 240), 1.00, font, "center", "center", false, false, false, false, false)
	lyoowText(tonumber(getElementData(localPlayer, "pizza")).."/20", 733, 308, 796, 324, tocolor(0, 0, 0, 240), 1.00, font, "center", "center", false, false, false, false, false)
	lyoowText(tonumber(getElementData(localPlayer, "hotdog")).."/20", 733, 362, 796, 380, tocolor(0, 0, 0, 240), 1.00, font, "center", "center", false, false, false, false, false)
	lyoowText(tonumber(getElementData(localPlayer, "coca")).."/20", 733, 414, 796, 436, tocolor(0, 0, 0, 240), 1.00, font, "center", "center", false, false, false, false, false)
	lyoowText(tonumber(getElementData(localPlayer, "suco")).."/20", 733, 470, 796, 492, tocolor(0, 0, 0, 240), 1.00, font, "center", "center", false, false, false, false, false)
	lyoowText(tonumber(getElementData(localPlayer, "agua")).."/20", 733, 525, 796, 548, tocolor(0, 0, 0, 240), 1.00, font, "center", "center", false, false, false, false, false)
	lyoowImage(541, 198, 280, 372, "utils/itens.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
end


function invOpen()
    if invPainelDx then
	    invPainelDx = false
	    removeEventHandler("onClientRender", root, invPainel)
    else
	    invPainelDx = true
        addEventHandler("onClientRender", root, invPainel)
        xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 2, 1, 1, 1, 1, 1
    end
end
bindKey("b", "down", invOpen)


function pressKey(key, press)
    if press then
        if invPainelDx then
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
	    	    if xtudoBack == 2 then
			    	if getElementData(localPlayer, "lyFome") == 100 then
				    	outputChatBox("Você está sem fome.")
					else
				    	if getElementData(localPlayer, "xtudo") and tonumber(getElementData(localPlayer, "xtudo")) > 0 then
			            	setElementData(localPlayer, "xtudo", getElementData(localPlayer, "xtudo") -1)
			            	setElementData(localPlayer, "lyFome", tonumber(getElementData(localPlayer, "lyFome")) +30)
                        	playSoundFrontEnd(40)
				    	else
				        	outputChatBox("Você nao tem xtudo!")
						end
					end
	    	    elseif pizzaBack == 2 then
			    	if getElementData(localPlayer, "lyFome") == 100 then
				    	outputChatBox("Você está sem fome.")
					else
				    	if getElementData(localPlayer, "pizza") and tonumber(getElementData(localPlayer, "pizza")) > 0 then
			            	setElementData(localPlayer, "pizza", getElementData(localPlayer, "pizza") -1)
			            	setElementData(localPlayer, "lyFome", tonumber(getElementData(localPlayer, "lyFome")) +40)
                        	playSoundFrontEnd(40)
				    	else
				        	outputChatBox("Você nao tem pizza!")
						end
					end
	    	    elseif hotdogBack == 2 then
			    	if getElementData(localPlayer, "lyFome") == 100 then
				    	outputChatBox("Você está sem fome.")
					else
				    	if getElementData(localPlayer, "hotdog") and tonumber(getElementData(localPlayer, "hotdog")) > 0 then
			            	setElementData(localPlayer, "hotdog", getElementData(localPlayer, "hotdog") -1)
			            	setElementData(localPlayer, "lyFome", tonumber(getElementData(localPlayer, "lyFome")) +25)
                        	playSoundFrontEnd(40)
				    	else
				        	outputChatBox("Você nao tem hotdog!")
						end
					end
	    	    elseif cocaBack == 2 then
			    	if getElementData(localPlayer, "lySede") == 100 then
				    	outputChatBox("Você está sem sede.")
					else
				    	if getElementData(localPlayer, "coca") and tonumber(getElementData(localPlayer, "coca")) > 0 then
			            	setElementData(localPlayer, "coca", getElementData(localPlayer, "coca") -1)
			            	setElementData(localPlayer, "lySede", tonumber(getElementData(localPlayer, "lySede")) +40)
                        	playSoundFrontEnd(40)
				    	else
				        	outputChatBox("Você nao tem coca!")
						end
					end
	    	    elseif sucoBack == 2 then
			    	if getElementData(localPlayer, "lySede") == 100 then
				    	outputChatBox("Você está sem sede.")
					else
				    	if getElementData(localPlayer, "suco") and tonumber(getElementData(localPlayer, "suco")) > 0 then
			            	setElementData(localPlayer, "suco", getElementData(localPlayer, "suco") -1)
			            	setElementData(localPlayer, "lySede", tonumber(getElementData(localPlayer, "lySede")) +30)
                        	playSoundFrontEnd(40)
				    	else
				        	outputChatBox("Você nao tem suco!")
						end
					end
	    	    elseif aguaBack == 2 then
			    	if getElementData(localPlayer, "lySede") == 100 then
				    	outputChatBox("Você está sem sede.")
					else
				    	if getElementData(localPlayer, "agua") and tonumber(getElementData(localPlayer, "agua")) > 0 then
			            	setElementData(localPlayer, "agua", getElementData(localPlayer, "agua") -1)
			            	setElementData(localPlayer, "lySede", tonumber(getElementData(localPlayer, "lySede")) +25)
                        	playSoundFrontEnd(40)
				    	else
				        	outputChatBox("Você nao tem agua!")
						end
					end
				end
			elseif key == "backspace" then
			    xtudoBack, pizzaBack, hotdogBack, cocaBack, sucoBack, aguaBack = 2, 1, 1, 1, 1, 1
			    removeEventHandler("onClientRender", root, invPainel)
				invPainelDx = false
			end
		end
	end
end
addEventHandler("onClientKey", root, pressKey)



