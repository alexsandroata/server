config = {

    tecla = {'f1', 'down'}, -- // Tecla and State.
    wallpapers = 8, -- // Quantidade máxima de wallpapers.

    notify_server = function (player, type, message)
        exports.infobox:addBox(player, type, message)
    end, 

    notify_client = function (type, message)
		exports.infobox:addBox(type, message)
    end, 

    blipLocID = 41, -- // Id do blip de localização.
    tempoLoc = 60000, -- // Tempo que a localização ficara no mapa.
    maxContatos = 10, -- // Máximo de contatos permitido por conta.

    planos = {
        [1] = {50, 100}, -- // crédito que iria receber, preço 
        [2] = {100, 150}, 
        [3] = {200, 250 }
    },

    convertNumber = function (number)
        local money = number
        for i = 1, tostring(money):len()/3 do
            money = string.gsub(money, "^(-?%d+)(%d%d%d)", "%1.%2")
        end
        return money
    end
}

function getPlayerFromID (id)
	for _, player in ipairs(getElementsByType('player')) do
		if getElementData(player, 'ID') and (getElementData(player, 'ID') == id) then
			return player
		end
	end
	return false
end