function Revistar(player,cmd)
    if isObjectInTableACLGroups(player, Config.AclsPoliciais) then
        local Target = getNearestPlayer(player, 5)
        if Target then
            triggerClientEvent(Target, "MST.ProporRevista", Target, player)
        else
            triggerClientEvent(player, "MST.Notify", player, "error", "Nenhum Jogador Próximo.")
        end
    else
        triggerClientEvent(player, "MST.Notify", player, "error", "Sem Permissão")
    end
end
addCommandHandler("revistar",Revistar )


function AceitarRevista(revistando)
    if getDistanceBetweenPoints3D(Vector3(getElementPosition(revistando)), Vector3(getElementPosition(source))) <= 5 then
        local ItensInv = exports["MODInventario"]:getItensPlayer(revistando)
        local ItensTarget = exports["MODInventario"]:getItensPlayer(Target)
        triggerClientEvent(revistando, "MST.OpenPolice",revistando, ItensInv, ItensTarget, source)
    end
end
addEvent("MST.AceitarRevista",true)
addEventHandler("MST.AceitarRevista",root,AceitarRevista)

function getNearestPlayer(player, radius)
    for i,v in ipairs(getElementsByType("player")) do
        -- if v ~= player then
            if getDistanceBetweenPoints3D(Vector3(getElementPosition(v)), Vector3(getElementPosition(player))) <= radius then
                return v
            end
        -- end
    end
    return false
end


function verifyItemQuantidade(player, item, quantidade)
    local ItensInv = exports["MODInventario"]:getItensPlayer(player)
    if #ItensInv ~= 0 then
        for i,v in ipairs(ItensInv) do
            if v[1] == item and v[2] >= quantidade then
                return true
            end
        end
    end
    return false
end



addEvent("MST.PegarItem",true)
addEventHandler("MST.PegarItem",root,function(item, quantidade, target)
    if getDistanceBetweenPoints3D(Vector3(getElementPosition(source)), Vector3(getElementPosition(target))) <= 5 then
        if verifyItemQuantidade(target, item, quantidade) then
            local result = exports["MODInventario"]:GiveAndTakeAndGetItem("give", source, item, quantidade)
            if result then
                exports["MODInventario"]:GiveAndTakeAndGetItem("take",target, item, quantidade)
                local ItensTarget = exports["MODInventario"]:getItensPlayer(target)
                local ItensInv = exports["MODInventario"]:getItensPlayer(source)
                triggerClientEvent(source, "MST.AttPolice", source, ItensInv, ItensTarget)
            end
        else
            local ItensTarget = exports["MODInventario"]:getItensPlayer(target)
            local ItensInv = exports["MODInventario"]:getItensPlayer(source)
            triggerClientEvent(source, "MST.AttPolice", source, ItensInv, ItensTarget)
        end
    else
        triggerClientEvent(source, "MST.Notify", source, "error", "O Jogador Não Está Próximo")
    end
end)

function isObjectInTableACLGroups(player,acls)
    for i,v in ipairs(acls) do
        if aclGetGroup(v) then
            if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup(v)) then
                return true
            end
        end
    end
    return false
end