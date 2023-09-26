local screenWidth, screenHeight = guiGetScreenSize()
local posX, posY = 10, 150

local EMPREGOFONT = dxCreateFont("fonts/font2.ttf", 12)
local MONEYFONT = dxCreateFont("fonts/font1.ttf", 8, false, "draft")
local ARMORFONT = dxCreateFont("fonts/font1.ttf", 7)

function hudfiveM()
		dxDrawImage((screenWidth-102)-posX, posY, 103, 32, "assets/bg4.png")
		dxDrawImage((screenWidth-200)-posX, posY, 103, 32, "assets/bg2.png")
		dxDrawImage((screenWidth-195)-posX, posY-52, 210, 50, "assets/bg3.png")
		
		local Armor = getPedArmor(localPlayer) or 0
		local vida = math.floor(getElementHealth(getLocalPlayer()))
		local Fome =  getElementData ( localPlayer, "fome" ) or 100
		local Sede =  getElementData ( localPlayer, "sede" ) or 100
		
		dxDrawImage((screenWidth-180)-posX, posY-45, 103, 32, "assets/vida.png")
		dxDrawCircle((screenWidth-128-0.30)-posX, posY-29, 12, vida/100*(math.pi*2) , vida/100*360, tocolor(175, 10, 10, 255))
		dxDrawImage((screenWidth-180)-posX, posY-45, 103, 32, "assets/vida2.png")
		
		dxDrawImage((screenWidth-145)-posX, posY-45, 103, 32, "assets/colete.png")
		dxDrawCircle((screenWidth-93)-posX, posY-29, 12, Armor/100*(math.pi*2) , Armor/100*360, tocolor(45, 47, 47, 255))
		dxDrawImage((screenWidth-145)-posX, posY-45, 103, 32, "assets/colete2.png")
		
		dxDrawImage((screenWidth-110)-posX, posY-45, 103, 32, "assets/fome.png")
		dxDrawCircle((screenWidth-58-0.4)-posX, posY-29, 12, Fome/100*(math.pi*2) , Fome/100*360, tocolor(215, 142, 7, 200))
		dxDrawImage((screenWidth-110)-posX, posY-45, 103, 32, "assets/fome2.png")
		
		dxDrawImage((screenWidth-75)-posX, posY-45, 103, 32, "assets/sede.png")
		dxDrawCircle((screenWidth-23-0.4)-posX, posY-29, 12, Sede/100*(math.pi*2) , Sede/100*360, tocolor(0, 100, 180, 200))
		dxDrawImage((screenWidth-75)-posX, posY-45, 103, 32, "assets/sede2.png")
		
		local Dinheiro = getPlayerMoney(localPlayer)
		local Banco = getElementData(localPlayer, "bank.rus") or "0"
		local Emprego = getElementData(localPlayer, "Emprego") or "DESEMPREGADO"
		
		dxDrawText ((Dinheiro), (screenWidth-72)-95-posX, posY+9, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, MONEYFONT)
		dxDrawText ((Banco), (screenWidth+26)-95-posX, posY+9, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, MONEYFONT)
		--dxDrawText ((Emprego), (screenWidth-90)-95-posX, posY-70, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, EMPREGOFONT, "center", "top", false, false, false, false, false)
end
addEventHandler("onClientRender", root, hudfiveM)

function setHudVisible( bool )
	if type(bool) == "boolean" then
		if bool == hud_rendering then return end
		local addRemove = bool and addEventHandler or removeEventHandler
		
		addRemove( "onClientRender", root, HUD )
		hud_rendering = bool
	end
end
addEvent( "onServerRequestSetHudVisible", true )
addEventHandler( "onServerRequestSetHudVisible", root, setHudVisible )

function OnStop ()
    setPlayerHudComponentVisible("armour", true)
    setPlayerHudComponentVisible("wanted", true)
    setPlayerHudComponentVisible("weapon", true)
    setPlayerHudComponentVisible("money", true)
    setPlayerHudComponentVisible("health", true)
    setPlayerHudComponentVisible("clock", true)
    setPlayerHudComponentVisible("breath", true)
    setPlayerHudComponentVisible("ammo", true)
end
addEventHandler("onClientResourceStop", getResourceRootElement(getThisResource()), OnStop)
function OnStart ()
    setPlayerHudComponentVisible("armour", false)
    setPlayerHudComponentVisible("wanted", false)
    setPlayerHudComponentVisible("weapon", false)
    setPlayerHudComponentVisible("money", false)
    setPlayerHudComponentVisible("health", false)
    setPlayerHudComponentVisible("clock", false)
    setPlayerHudComponentVisible("breath", false)
    setPlayerHudComponentVisible("ammo", false)
end
addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()), OnStart )

local hudTable = 
{
"ammo",
"armour",
"clock",
"health",
"money",
"weapon",
"wanted",
"area_name",
"vehicle_name",
"breath",
"clock"
}
addEventHandler("onClientResourceStart", resourceRoot,
    function()
    for id, hudComponents in ipairs(hudTable) do
        showPlayerHudComponent(hudComponents, false)
    end
    end
)
addEventHandler("onClientResourceStop", resourceRoot,
    function()
    for id, hudComponents in ipairs(hudTable) do
        showPlayerHudComponent(hudComponents, true)
    end
    end
)

function formatNumber(number) 
	while true do      
		number, k = string.gsub(number, "^(-?%d+)(%d%d%d)", '%1,%2')    
		if k==0 then      
			break   
		end  
	end  
	return number
end