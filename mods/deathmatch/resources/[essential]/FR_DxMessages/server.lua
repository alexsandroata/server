function addBox (player, message, type)
    triggerClientEvent(player, 'addBox', player, message, type)
end

addCommandHandler('a', function (player, _, ...)
    if getPlayerGroup(player, config.groups_anunciar) then
        local aviso = table.concat({...}, ' ')
        if aviso and string.len(aviso) > 0 then
            addBox(root, aviso, 'admin')
        else
            addBox(player, 'Digite um anúncio para enviar.', 'warning')
        end
    end
end)

function getPlayerGroup (player, group)
    for i, v in ipairs(group) do 
        if isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(player)), aclGetGroup(v)) then
            return true
        end
    end
    return false
end

-- Web Site : https://sparrow-mta.blogspot.com/

-- Facebook : https://facebook.com/sparrowgta/
-- İnstagram : https://instagram.com/sparrowmta/
-- YouTube : https://youtube.com/c/SparroWMTA/

-- Discord : https://discord.gg/DzgEcvy