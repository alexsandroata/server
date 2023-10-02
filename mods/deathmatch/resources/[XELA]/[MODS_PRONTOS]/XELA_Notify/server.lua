----------Função-----------
function addBox (player, message, type)
    triggerClientEvent(player, 'addBox', player, message, type)
end
----------comandos---------
addCommandHandler('avisoadm', function (player, _, ...)
    if getPlayerGroup(player, config.anuncio_adm) then
        local aviso = table.concat({...}, ' ')
        if aviso and string.len(aviso) > 0 then
            addBox(root, aviso, 'admin')
        else
            addBox(player, 'Digite um anúncio para enviar.', 'warning')
        end
    end
end)

addCommandHandler('avisopm', function (player, _, ...)
    if getPlayerGroup(player, config.anuncio_pm) then
        local aviso = table.concat({...}, ' ')
        if aviso and string.len(aviso) > 0 then
            addBox(root, aviso, 'pm')
        else
            addBox(player, 'Digite um anúncio para enviar.', 'warning')
        end
    end
end)

addCommandHandler('avisomec', function (player, _, ...)
    if getPlayerGroup(player, config.anuncio_mec) then
        local aviso = table.concat({...}, ' ')
        if aviso and string.len(aviso) > 0 then
            addBox(root, aviso, 'mec')
        else
            addBox(player, 'Digite um anúncio para enviar.', 'warning')
        end
    end
end)

addCommandHandler('avisohp', function (player, _, ...)
    if getPlayerGroup(player, config.anuncio_hp) then
        local aviso = table.concat({...}, ' ')
        if aviso and string.len(aviso) > 0 then
            addBox(root, aviso, 'hp')
        else
            addBox(player, 'Digite um anúncio para enviar.', 'warning')
        end
    end
end)
-----------em teste proxima atualização------------

-- addCommandHandler('avisoilegal', function (player, _, ...)
--     if getPlayerGroup(player, config.anuncio_ilegal) then
--         local aviso = table.concat({...}, ' ')
--         if aviso and string.len(aviso) > 0 then
--             addBox(root, aviso, 'admin')
--         else
--             addBox(player, 'Digite um anúncio para enviar.', 'warning')
--         end
--     end
-- end)

---------------------------------------------------
function getPlayerGroup (player, group)
    for i, v in ipairs(group) do 
        if isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(player)), aclGetGroup(v)) then
            return true
        end
    end
    return false
end