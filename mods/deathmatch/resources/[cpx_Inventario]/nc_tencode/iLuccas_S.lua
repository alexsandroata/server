---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- MSG
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function msgBox(player, text, type)
    triggerClientEvent(player, "AC-MsgBox", root, text, type)
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- MYSQL
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Connection = exports["ac_mysql"]:getConnection()

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- ENVIAR EVENT
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function aceventtencode(ply, tipo)
    if ply and tipo then
        for theKey, player in ipairs (getElementsByType("player")) do
            if isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(source)), aclGetGroup ("Policia")) then  
               -- if getElementData(player, "POLICIA-ComPonto") == true then
                   -- if getElementData(player, "AC-OffCodPm") == false then

                        if tipo == 1 then
                            triggerClientEvent(player, "AC-NotificacaoPm", root, "compdroga", ply)
                        elseif tipo == 2 then
                            triggerClientEvent(player, "AC-NotificacaoPm", root, "oficialf", ply)
                        elseif tipo == 3 then
                            triggerClientEvent(player, "AC-NotificacaoPm", root, "loc", ply)
                        elseif tipo == 4 then
                            triggerClientEvent(player, "AC-NotificacaoPm", root, "HArmado", ply)
                        elseif tipo == 5 then
                            triggerClientEvent(player, "AC-NotificacaoPm", root, "abordagem", ply)
                        elseif tipo == 6 then
                            triggerClientEvent(player, "AC-NotificacaoPm", root, "acidente", ply)
                        elseif tipo == 7 then
                            triggerClientEvent(player, "AC-NotificacaoPm", root, "reforço", ply)
                        elseif tipo == 8 then
                            triggerClientEvent(player, "AC-NotificacaoPm", root, "caixa", ply)
                        end

                 end
                --end
            --end
        end
    end
end
addEvent("AC-EventTenCode", true)
addEventHandler("AC-EventTenCode", root, aceventtencode)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- MARCAR LOC
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function marcarlocply(player, ply, tipoo, xx, yy, zz)
    local x, y, z = getElementPosition(player)
    triggerClientEvent(player, "setmaptora", player, x, y, z, xx, yy, zz)
    triggerClientEvent(player, "AC-CriarBlipLoc", player, ply, xx, yy, zz, tipoo)
end
addEvent("AC-MarcarLocalizaçãoPM", true)
addEventHandler("AC-MarcarLocalizaçãoPM", root, marcarlocply)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- CMD T CODE
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[
function actencode(ply, cmd)
    if getElementData(ply, "AC-Grupo") == "Police" then
        if getElementData(ply, "AC-OffCodPm") == true then
            setElementData(ply, "AC-OffCodPm", false)
            msgBox(ply, "Chamados ativado.", "aviso")
        else
            setElementData(ply, "AC-OffCodPm", true)
            msgBox(ply, "Chamados desativado.", "aviso")
        end
    end
end
addCommandHandler("tencode", actencode)]]--