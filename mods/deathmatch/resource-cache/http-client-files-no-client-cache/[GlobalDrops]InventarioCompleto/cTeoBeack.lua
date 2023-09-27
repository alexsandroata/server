-- https://globaldrops.blogspot.com
-- https://discord.gg/EjXJUdspWb

local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1336), (screenH/768)


function dxMaconha()
  exports["Blur"]:dxDrawBluredRectangle(screenW * 0.0000, screenH * 0.0013, screenW * 1.0000, screenH * 0.9987, tocolor(255, 255, 255, 150))	
  dxDrawImage(screenW * 0.0000, screenH * 0.0013, screenW * 1.0000, screenH * 0.9987, "files/efeito.png", 0, 0, 0, tocolor(0, 254, 6, 255), false)
end

function UsarMaconha(player)
    sound = playSound( "files/reggae_music.mp3", true )
    addEventHandler ( "onClientRender", root, dxMaconha )
    setPedControlState(player, "walk", true)
    setWindVelocity(100, 100, 0)
    setCameraShakeLevel(255)
    setGameSpeed(0.5)
    setTimer(function()
        stopSound( sound )
        resetWindVelocity()
        setCameraShakeLevel(1)
        setGameSpeed(1)
        removeEventHandler ( "onClientRender", root, dxMaconha )
    end,player*4000,1)
end
addEvent("TB:UsarMaconha", true)
addEventHandler ("TB:UsarMaconha", root, UsarMaconha )


function onClientResourceStart()
	setPedWalkingStyle(player,0) 
	stopSound( sound )
	resetWindVelocity()
	setCameraShakeLevel(1)
	setGameSpeed(1)
	removeEventHandler ( "onClientRender", root, dxMaconha )
end
addEventHandler("onClientResourceStart",resourceRoot, onClientResourceStart)