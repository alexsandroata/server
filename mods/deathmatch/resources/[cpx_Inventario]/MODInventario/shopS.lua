--  ____    ______   _____  
-- |  _ \  |  ____| |  __ \ 
-- | |_) | | |__    | |__) |
-- |  _ <  |  __|   |  _  / 
-- | |_) | | |____  | | \ \ 
-- |____/  |______| |_|  \_\
-----------------------------------------------------------------------------------------------------------------------------------------
function Buy(playerSource, selecionado, shop, quantidade)
	local item = nil
	local valor = 0
	if shop == "food" then
		item = FoodShopItems[selecionado][1]
		valor = (FoodShopItems[selecionado][2] * quantidade)
	elseif shop == "guns" then
		item = GunShopItems[selecionado][1]
		valor = (GunShopItems[selecionado][2] * quantidade)
	elseif shop == "utility" then
		item = UtilityShopItems[selecionado][1]
		valor = (UtilityShopItems[selecionado][2] * quantidade)
	elseif shop == "bar" then
		item = BarShopItems[selecionado][1]
		valor = (BarShopItems[selecionado][2] * quantidade)
	elseif shop == "ilegal" then
		item = IlegalShopItems[selecionado][1]
		valor = (IlegalShopItems[selecionado][2] * quantidade)
	elseif shop == "ferramentas" then
		item = FerramentasShopItems[selecionado][1]
		valor = (FerramentasShopItems[selecionado][2] * quantidade)
	elseif shop == "bone" then
		item = boneShopItems[selecionado][1]
		valor = (boneShopItems[selecionado][2] * quantidade)
	elseif shop == "gb" then
		item = GBShopItems[selecionado][1]
		valor = (GBShopItems[selecionado][2] * quantidade)
	end
	if shop == "guns" then
		if GunShopItems[selecionado][3] then
			if GiveAndTakeAndGetItem("get", playerSource, "porte") >= 0 then
				if getPlayerMoney(playerSource) >= valor then
					if GiveAndTakeAndGetItem("give", playerSource, item, quantidade) then
						takePlayerMoney(playerSource, valor)
						triggerClientEvent(playerSource, "Notify", playerSource, "sucesso", "Você comprou "..quantidade.."x "..realName[item][1].." por $"..valor, "money")
					else
						triggerClientEvent(playerSource, "Notify", playerSource, "negado", "Você não possui espaço suficiente em sua mochila")
					end
				else
					riggerClientEvent(playerSource, "Notify", playerSource, "negado", "Você não possui dinheiro suficiente")
				end
			else
				if getElementData(playerSource, "VIP") then
					if getPlayerMoney(playerSource) >= valor then
						if GiveAndTakeAndGetItem("give", playerSource, item, quantidade) then
							takePlayerMoney(playerSource, valor)
							addBox(playerSource, "Você comprou "..quantidade.."x "..realName[item][1].." por $"..valor, "sucesso")
						else
							addBox(playerSource, "Você não possui espaço suficiente em sua mochila", "erro")
						end
					else
						addBox(playerSource, "Você não possui dinheiro suficiente", "erro")
					end
				else
					addBox(playerSource, "Você não possui '"..realName["porte"][1].."'", "erro")
				end
			end
		else
			if getPlayerMoney(playerSource) >= valor then
				if GiveAndTakeAndGetItem("give", playerSource, item, quantidade) then
					takePlayerMoney(playerSource, valor)
					triggerClientEvent(playerSource, "Notify", playerSource, "sucesso", "Você comprou "..quantidade.."x "..realName[item][1].." por $"..valor, "money")
				else
					triggerClientEvent(playerSource, "Notify", playerSource, "negado", "Você não possui espaço suficiente em sua mochila")
				end
			else
				triggerClientEvent(playerSource, "Notify", playerSource, "negado", "Você não possui dinheiro suficiente")
			end
		end
	elseif shop == "ilegal" then
		if IlegalShopItems[selecionado][3] then
			if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)), aclGetGroup(ACL_PM)) then
				if getPlayerMoney(playerSource) >= valor then
					if GiveAndTakeAndGetItem("give", playerSource, item, quantidade) then
						takePlayerMoney(playerSource, valor)
						triggerClientEvent(playerSource, "Notify", playerSource, "sucesso", "Você comprou "..quantidade.."x "..realName[item][1].." por $"..valor, "money")
					else
						triggerClientEvent(playerSource, "Notify", playerSource, "negado", "Você não espaço")
					end
				else
					triggerClientEvent(playerSource, "Notify", playerSource, "negado", "Você não possui dinheiro suficiente")
				end
			else
				addBox(playerSource, "Você não faz parte de nenhuma corporação", "erro")
			end
		else
			if getPlayerMoney(playerSource) >= valor then
				if GiveAndTakeAndGetItem("give", playerSource, item, quantidade) then
					takePlayerMoney(playerSource, valor)
					triggerClientEvent(playerSource, "Notify", playerSource, "sucesso", "Você comprou "..quantidade.."x "..realName[item][1].." por $"..valor, "money")
				else
					triggerClientEvent(playerSource, "Notify", playerSource, "negado", "Você não possui espaço suficiente em sua mochila")
				end
			else
				triggerClientEvent(playerSource, "Notify", playerSource, "negado", "Você não possui dinheiro suficiente")
			end
		end
	else
		if getPlayerMoney(playerSource) >= valor then
			if GiveAndTakeAndGetItem("give", playerSource, item, quantidade) then
				takePlayerMoney(playerSource, valor)
				triggerClientEvent(playerSource, "Notify", playerSource, "sucesso", "Você comprou "..quantidade.."x "..realName[item][1].." por $"..valor, "money")
			else
				triggerClientEvent(playerSource, "Notify", playerSource, "negado", "Você não possui espaço suficiente em sua mochila")
			end
		else
			triggerClientEvent(playerSource, "Notify", playerSource, "negado", "Você não possui dinheiro suficiente")
		end
	end
end
addEvent("BuyItem", true)
addEventHandler("BuyItem", resourceRoot, Buy)
-----------------------------------------------------------------------------------------------------------------------------------------

function addBox(player, text, type)
	if isElement(player) then
		if type then 
		triggerClientEvent(player, "addBox", player, text, type)
		end
	end
end