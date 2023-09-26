-- Configurações para quando um jogador morrer
	-- XYZ coördinates
	local spawnX = 2027.2111816406
	local spawnY = -1421.4295654297
	local spawnZ = 16.78125
	-- Armas e tiros
	local spawnWeapon = 0
	local spawnAmmo = 0
	-- Pele do jogador
	local spawnSkin = 0

-- Definições para as quantidades de dinheiro
	-- Dinheiro por matar um jogador
	local killerMoney = 0
	-- O dinheiro retirado do jogador quando morrem
	local deadPlayerMoney = 50

-- Functions
-- This function spawns players when they join
function spawnOnJoin()
	spawnPlayer(source, joinX, joinY, joinZ, 0 , joinSkin)
	fadeCamera(source, true)
	setCameraTarget(source, source)
	outputChatBox(joinMessage, source)
	giveWeapon(source, joinWeapon, joinAmmo)
	givePlayerMoney(source, joinMoney)
end

-- This function spawns players after they died
function spawnOnDead(ammo, killer, weapon, bodypart)
	takePlayerMoney(source, deadPlayerMoney)
	if (killer) and (killer ~= source) then
		givePlayerMoney(killer, killerMoney)
	end
	setTimer(spawnPlayer, 3000, 1, source, spawnX, spawnY, spawnZ, 0, spawnSkin)
	setCameraTarget(source, source)
	setTimer(giveWeapon, 3000, 1, source, spawnWeapon, spawnAmmo)
end

-- Event handlers
addEventHandler("onPlayerJoin", getRootElement(), spawnOnJoin)
addEventHandler("onPlayerWasted", getRootElement(), spawnOnDead)