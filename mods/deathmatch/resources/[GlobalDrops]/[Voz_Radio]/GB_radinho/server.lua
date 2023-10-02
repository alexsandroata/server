addCommandHandler('radiof',
	function(source, command, value)
		local value = tonumber(value)
		if (value) then
			if (getElementData(source, 'tr4jado.radinho') == true) or (not getElementData(source, 'tr4jado.radinho')) then
				if (value == 1) then
					if (aclGetGroup('Policial')) and (isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)), aclGetGroup('Policial'))) then
						setElementData(source, 'tr4jado.frequencia', value)
						notify(source, 'Frequência alterada para '..value..'.', 'success')
					else
						notify(source, 'Sem permissão para se conectar nesta frequência '..value..'!', 'error')
					end
				elseif (value == 2) then
					if (aclGetGroup('Gang')) and (isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)), aclGetGroup('Gang'))) then
						setElementData(source, 'tr4jado.frequencia', value)
						notify(source, 'Frequência alterada para '..value..'.', 'success')
					else
						notify(source, 'Sem permissão para se conectar nesta frequência '..value..'!', 'error')
					end
				else
					setElementData(source, 'tr4jado.frequencia', value)
					notify(source, 'Frequência alterada para '..value..'.', 'success')
				end
			else
				notify(source, 'Radio comunicador não equipado!', 'error')
			end
		else
			notify(source, 'Insira um valor numerico!', 'error')
		end
	end
)

addCommandHandler('mutef',
	function(source, command)
		if (getElementData(source, 'tr4jado.radinho')) then
			if (getElementData(source, 'tr4jado.muted') == false) or (not getElementData(source, 'tr4jado.muted')) then
				setElementData(source, 'tr4jado.muted', true)
				notify(source, 'Radio comunicador mutado.', 'success')
			else
				setElementData(source, 'tr4jado.muted', false)
				notify(source, 'Radio comunicador desmutado.', 'success')
			end
		end	
	end
)

addCommandHandler("pegarradio", 
function(player)
	--exports.vanish_inventario:giveItem(player, 22, 1)
	exports["CzInventory"]:hasItemInventory(player, "radio", 0, 1, nil)
end)