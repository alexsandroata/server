--[[
+-----------------------------------------------------------------------------
 Effect switching on and off

	To switch on:
			triggerEvent( "switchCarPaintRefLite", root, true )
	To switch off:
			triggerEvent( "switchCarPaintRefLite", root, false )
	By default, players can hit F12 to switch off/on, the above is for your custom export integrations.
+-----------------------------------------------------------------------------
]]--


local theTikGap = 0.5
local theHitKey = "F12" -- Change key for player to toggle the effect (opt-out)
local getLastTick = getTickCount()
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),
	function()
		outputChatBox("ENB reflection: Hit " .. theHitKey .. " to turn on/off the carshine reflection shader!", 80, 255, 0)
		triggerEvent("switchCarPaintRefLite", resourceRoot, true)
		bindKey(theHitKey, "down", function(key, keyState)
				if (getTickCount() - getLastTick < theTikGap * 1000) then
					outputChatBox("Shader-switch: Wait " .. theTikGap .. " sec.", 255, 0, 0)
					return
				end
				triggerEvent("switchCarPaintRefLite", resourceRoot, not cpRLEffectEnabled)
				getLastTick = getTickCount()
			end
		)
	end
)

-- Switch effect on or off
function switchCarPaintRefLite(isCPRefOn)
	outputDebugString("switchCarPaintRefLite: " .. tostring(isCPRefOn))
	if isCPRefOn then
		startCarPaintRefLite()
	else
		stopCarPaintRefLite()
	end
end
addEvent("switchCarPaintRefLite", true)
addEventHandler("switchCarPaintRefLite", resourceRoot, switchCarPaintRefLite)