groupMembers = {}
tableGroup = {}
tableGroupTwo = {}

addEventHandler("onResourceStart", resourceRoot,
function()
    db = dbConnect("sqlite", "dados.db")
    dbExec(db, "CREATE TABLE IF NOT EXISTS Groups(NameGroup, TagGroup, accountOwner, dataGroup, membersGroup, logsGroup, TypeGroup)")
    dbExec(db, "CREATE TABLE IF NOT EXISTS Convites(account, TagGroup, NameGroup, TypeGroup)")
    if config["Mensagem Start"] then
        outputDebugString("["..getResourceName(getThisResource()).."] Startado com sucesso!")
    end
    setTimer(function()
        local result = dbPoll(dbQuery(db, "SELECT * FROM Groups"), -1)
        for i, v in ipairs(result) do
            local dataGroup = fromJSON(result[i]["dataGroup"])
            local membersGroup = fromJSON(result[i]["membersGroup"])
            if dataGroup.timestampMes <= getRealTime().timestamp then
                groupMembers[v.TagGroup] = {}
                if v.TypeGroup == "Corporação" then
                    for k, b in ipairs(membersGroup) do
                        table.insert(groupMembers[v.TagGroup], {account = b.account, idPlayer = b.idPlayer, cargo = b.cargo, renda = 0, tempOn = b.tempOn, drogaApreendida = 0, jogadoresPresos = 0, salario = b.salario})
                    end
                else
                    for k, b in ipairs(membersGroup) do
                        table.insert(groupMembers[v.TagGroup], {account = b.account, idPlayer = b.idPlayer, cargo = b.cargo, renda = 0, tempOn = b.tempOn, armasFabricadas = 0, municoesFabricadas = 0})
                    end
                end
                tableGroup[v.TagGroup] = {membersCapacity = dataGroup.membersCapacity, accountLider = dataGroup.accountLider, saldo = dataGroup.saldo, rendat = dataGroup.rendat, rendam = 0, timestampMes = (getRealTime().timestamp+2678400), timestampSem = dataGroup.timestampSem}
                dbExec(db, "UPDATE Groups SET dataGroup = ?, membersGroup = ? WHERE TagGroup = ?", toJSON(tableGroup[v.TagGroup]), toJSON(groupMembers[v.TagGroup]), v.TagGroup)
            end
            if dataGroup.timestampSem <= getRealTime().timestamp then
                groupMembers[v.TagGroup] = {}
                if v.TypeGroup == "Corporação" then
                    for k, b in ipairs(membersGroup) do
                        iprint(config["Salario"][v.TypeGroup][v.TagGroup][b.cargo], b.cargo, v.TagGroup)
                        table.insert(groupMembers[v.TagGroup], {account = b.account, idPlayer = b.idPlayer, cargo = b.cargo, renda = b.renda, tempOn = b.tempOn, drogaApreendida = b.drogaApreendida, jogadoresPresos = b.jogadoresPresos, salario = (b.salario+(config["Salario"][v.TypeGroup][v.TagGroup][b.cargo]))})
                    end
                    tableGroupTwo[v.TagGroup] = {membersCapacity = dataGroup.membersCapacity, accountLider = dataGroup.accountLider, saldo = dataGroup.saldo, rendat = dataGroup.rendat, rendam = dataGroup.rendam, timestampMes = dataGroup.timestampMes, timestampSem = (getRealTime().timestamp+604800)}
                    dbExec(db, "UPDATE Groups SET membersGroup = ?, dataGroup = ? WHERE TagGroup = ?", toJSON(groupMembers[v.TagGroup]), toJSON(tableGroupTwo[v.TagGroup]), v.TagGroup)
                end
            end
        end
    end, 5*60000, 0)
end)

timerCalc = {}
dataCalc = {}

addEventHandler("onPlayerLogin", root,
function(_, account)
    local conta = getAccountName(account)
    local playerK = source
    if isTimer(timerCalc[playerK]) then killTimer(timerCalc[playerK]) end
    timerCalc[playerK] = setTimer(function()
        local inGroup = verifyPlayerGroup(conta)
        if inGroup then
            local result = dbPoll(dbQuery(db, "SELECT * FROM Groups WHERE TagGroup = ?", inGroup), -1)
            if #result > 0 then
                local membersGrupo = {}
                dataCalc[playerK] = {}
                local dataGroup = fromJSON(result[1]["dataGroup"])
                local membersCalc = fromJSON(result[1]["membersGroup"])
                for i, v in ipairs(membersCalc) do
                    if v.account == conta then
                        dataCalc[playerK] = v
                    else
                        table.insert(membersGrupo, v)
                    end
                end
                if dataCalc[playerK] then
                    if result[1]["TypeGroup"] == "Corporação" then
                        table.insert(membersGrupo, {account = dataCalc[playerK].account, idPlayer = dataCalc[playerK].idPlayer, cargo = dataCalc[playerK].cargo, renda = dataCalc[playerK].renda, tempOn = (dataCalc[playerK].tempOn+1), drogaApreendida = dataCalc[playerK].drogaApreendida, jogadoresPresos = dataCalc[playerK].jogadoresPresos, salario = dataCalc[playerK].salario})
                    else
                        table.insert(membersGrupo, {account = dataCalc[playerK].account, idPlayer = dataCalc[playerK].idPlayer, cargo = dataCalc[playerK].cargo, renda = dataCalc[playerK].renda, tempOn = (dataCalc[playerK].tempOn+1), armasFabricadas = (dataCalc[playerK].armasFabricadas), municoesFabricadas = (dataCalc[playerK].municoesFabricadas)})
                    end
                    dbExec(db, "UPDATE Groups SET membersGroup = ? WHERE TagGroup = ?", toJSON(membersGrupo), inGroup)
                end
            end
        end
    end, 60*60000, 0)
end)

addEvent("JOAO.manageIndexGROUPSA", true)
addEventHandler("JOAO.manageIndexGROUPSA", root,
function(player, typeManage, dataGroup)
    if typeManage and dataGroup then
        if typeManage == "sair" then
            if removeMemberGroup(player, puxarConta(player), dataGroup.TypeGroup, dataGroup.TagGroup) then
                if dataGroup.TypeGroup == "Corporação" then
                    aclGroupRemoveObject(aclGetGroup("Policial"), "user."..puxarConta(player))
                else
                    aclGroupRemoveObject(aclGetGroup("Gang"), "user."..puxarConta(player))
                end
                aclGroupRemoveObject(aclGetGroup(dataGroup.TagGroup), "user."..puxarConta(player))
                notifyS(player, "Você saiu do grupo com sucesso!", "info")
                addLogs(dataGroup.TagGroup, "O jogador(a) "..(puxarConta(player)).." #"..(puxarID(player)).." saiu do grupo!")
                sendData(player, dataGroup.TagGroup)
                triggerClientEvent(player, "JOAO.closeMenuGroup", player)
            end
        elseif typeManage == "desfazer" then
            local result = dbPoll(dbQuery(db, "SELECT * FROM Groups WHERE TagGroup = ?", dataGroup.TagGroup), -1)
            if #result > 0 then
                local membersGroup = fromJSON(result[1]["membersGroup"])
                for i, v in ipairs(membersGroup) do
                    if dataGroup.TypeGroup == "Corporação" then
                        aclGroupRemoveObject(aclGetGroup("Policial"), "user."..(v.account))
                    else
                        aclGroupRemoveObject(aclGetGroup("Gang"), "user."..(v.account))
                    end
                end
                if aclGetGroup(dataGroup.TagGroup) then aclDestroyGroup(aclGetGroup(dataGroup.TagGroup)) end
                dbExec(db, "DELETE FROM Groups WHERE TagGroup = ?", dataGroup.TagGroup)
                dbExec(db, "DELETE FROM Convites WHERE TagGroup = ?", dataGroup.TagGroup)
                triggerClientEvent(player, "JOAO.closeMenuGroup", player)
            end
        end
    end
end)

groupMembers = {}

addEvent("JOAO.coletarSalarioGroup", true)
addEventHandler("JOAO.coletarSalarioGroup", root,
function(player, dataManage, dataMember)
    if dataManage and dataMember then
        local result = dbPoll(dbQuery(db, "SELECT * FROM Groups WHERE TagGroup = ?", dataManage[1].TagGroup), -1)
        if #result > 0 then
            if dataMember.salario ~= 0 then
                local membersGroup = fromJSON(result[1]["membersGroup"])
                groupMembers[player] = {}
                for i, v in ipairs(membersGroup) do
                    if v.account ~= dataMember.account then
                        table.insert(groupMembers[player], v)
                    end
                end
                if dataManage[1].TypeGroup == "Corporação" then
                    table.insert(groupMembers[player], {account = dataMember.account, idPlayer = dataMember.idPlayer, cargo = dataMember.cargo, renda = dataMember.renda, tempOn = dataMember.tempOn, drogaApreendida = dataMember.drogaApreendida, jogadoresPresos = dataMember.jogadoresPresos, salario = 0})
                end
                dbExec(db, "UPDATE Groups SET membersGroup = ? WHERE TagGroup = ?", toJSON(groupMembers[player]), dataManage[1].TagGroup)
                givePlayerMoney(player, dataMember.salario)
                sendData(player, dataManage[1].TagGroup)
                notifyS(player, "Você coletou seu salário com sucesso!", "success")
            else
                notifyS(player, "Você não tem salário para coletar!", "error")
            end
        else
            notifyS(player, "Não foi possível coletar!", "error")
        end
    end
end)

addCommandHandler("criargrupo", 
function(player)
    if aclGetGroup("Console") and isObjectInACLGroup("user."..puxarConta(player), aclGetGroup("Console")) then
        triggerClientEvent(player, "JOAO.openPanelGroupC", player, "criargrupo")
    else
        notifyS(player, "Você não possui permissão.", "error")
    end
end)

addCommandHandler("delgrupo",
function(player, _, tagGroup)
    if tagGroup then
        if aclGetGroup("Console") and isObjectInACLGroup("user."..puxarConta(player), aclGetGroup("Console")) then
            local result = dbPoll(dbQuery(db, "SELECT* FROM Groups WHERE TagGroup = ?", tagGroup), -1)
            if #result > 0 then
                local membersGroup = fromJSON(result[1]["membersGroup"])
                for i, v in ipairs(membersGroup) do
                    if result[1]["TypeGroup"] == "Corporação" then
                        aclGroupRemoveObject(aclGetGroup("Policial"), "user."..(v.account))
                    else
                        aclGroupRemoveObject(aclGetGroup("Gang"), "user."..(v.account))
                    end
                end
                aclDestroyGroup(aclGetGroup(tagGroup))
                dbExec(db, "DELETE FROM Groups WHERE TagGroup = ?", tagGroup)
                dbExec(db, "DELETE FROM Convites WHERE TagGroup = ?", tagGroup)
                notifyS(player, "Você deletou o grupo "..tagGroup.." com sucesso!", "success")
            else
                notifyS(player, "Esse grupo não existe!", "error")
            end
        else
            notifyS(player, "Você não possui permissão.", "error")
        end
    end
end)

addEvent("JOAO.manageConviteGroup", true)
addEventHandler("JOAO.manageConviteGroup", root,
function(player, groupData, typeData, typeGroup)
    if groupData and typeData then
        if typeData == "aceitar" then
            if verifyPlayerGroup(puxarConta(player)) then
                notifyS(player, "Você já é de um grupo!", "errr")
            else
                if quantityMaxGroup(player, groupData.TagGroup) then
                    local isOwner = verifyOwnerPlayer(puxarConta(player))
                    if addMemberGroup(puxarConta(player), groupData.TagGroup, puxarID(player), isOwner and 1 or (groupData.TypeGroup == "Corporação" and #config["Cargos"][groupData.TypeGroup][groupData.TagGroup] or #config["Cargos"][groupData.TypeGroup]), groupData.TypeGroup) then
                        if groupData.TypeGroup == "Corporação" then
                            aclGroupAddObject(aclGetGroup("Policial"), "user."..puxarConta(player))
                        else
                            aclGroupAddObject(aclGetGroup("Gang"), "user."..puxarConta(player))
                        end
                        aclGroupAddObject(aclGetGroup(groupData.TagGroup), "user."..puxarConta(player))
                        dbExec(db, "DELETE FROM Convites WHERE account = ? AND TagGroup = ?", puxarConta(player), groupData.TagGroup)
                        notifyS(player, "Você entrou no grupo com sucesso!", "success")
                        addLogs(groupData.TagGroup, "O jogador(a) "..puxarNome(player).." #"..puxarID(player).." entrou no grupo!")
                        sendData(player, false)
                        triggerClientEvent(player, "JOAO.closeMenuGroup", player)
                    else
                        notifyS(player, "Error ao você entrar no grupo!", "error")
                    end
                else
                    notifyS(player, "Esse grupo está cheio!", "error")
                end
            end
        elseif typeData == "negar" then
            local isOwner = verifyOwnerPlayer(puxarConta(player))
            if isOwner then
                dbExec(db, "DELETE FROM Groups WHERE TagGroup = ?", groupData.TagGroup)
            else
                dbExec(db, "DELETE FROM Convites WHERE account = ? AND TagGroup = ?", puxarConta(player), groupData.TagGroup)
            end
            sendData(player, false)
        end
    end
end)

addEvent("JOAO.manageCofreGroup", true)
addEventHandler("JOAO.manageCofreGroup", root,
function(player, quantia, dataInfos, type_)
    if tonumber(quantia) and dataInfos and type_ then
        local result = dbPoll(dbQuery(db, "SELECT * FROM Groups WHERE TagGroup = ?", dataInfos[1].TagGroup), -1)
        if #result > 0 then
            local dataGroup = fromJSON(result[1]["dataGroup"])
            if type_ == "deposito" then
                if verifyNumber(quantia) then
                    notifyS(player, "Você precisa digitar um número!", "error")
                else
                    if getPlayerMoney(player) >= quantia then
                        takePlayerMoney(player, quantia)
                        local tableData = {membersCapacity = dataGroup.membersCapacity, accountLider = dataGroup.accountLider, saldo = (dataGroup.saldo+quantia), rendat = (dataGroup.rendat+quantia), rendam = (dataGroup.rendam+quantia), timestampMes = dataGroup.timestampMes, timestampSem = dataGroup.timestampSem}
                        if dbExec(db, "UPDATE Groups SET dataGroup = ? WHERE TagGroup = ?", toJSON(tableData), dataInfos[1].TagGroup) then
                            notifyS(player, "Você depositou R$ "..formatNumber(quantia)..",00 com sucesso!", "success")
                        end
                        addLogs(dataInfos[1].TagGroup, "O jogador(a) "..puxarNome(player).." #"..puxarID(player).." depositou R$ "..formatNumber(quantia)..",00!")
                        sendData(player, dataInfos[1].TagGroup)
                    else
                        notifyS(player, "Você não tem dinheiro suficiente!", "error")
                    end
                end
            elseif type_ == "saque" then
                if verifyNumber(quantia) then
                    notifyS(player, "Você precisa digitar um número!", "error")
                else
                    if dataGroup.saldo >= quantia then
                        local tableData = {membersCapacity = dataGroup.membersCapacity, accountLider = dataGroup.accountLider, saldo = (dataGroup.saldo-quantia), rendat = (dataGroup.rendat-quantia), rendam = (dataGroup.rendam-quantia), timestampMes = dataGroup.timestampMes, timestampSem = dataGroup.timestampSem}
                        if dbExec(db, "UPDATE Groups SET dataGroup = ? WHERE TagGroup = ?", toJSON(tableData), dataInfos[1].TagGroup) then
                            notifyS(player, "Você sacou R$ "..formatNumber(quantia)..",00 com sucesso!", "success")
                        end
                        addLogs(dataInfos[1].TagGroup, "O jogador(a) "..puxarNome(player).." #"..puxarID(player).." sacou R$ "..formatNumber(quantia)..",00!")
                        sendData(player, dataInfos[1].TagGroup)
                        givePlayerMoney(player, quantia)
                    else
                        notifyS(player, "O caixa não tem dinheiro suficiente!", "error")
                    end
                end
            end
        end
    end
end)

addEvent("JOAO.createGroup", true)
addEventHandler("JOAO.createGroup", root,
function(player, nameGroup, tagGroup, membersCapacity_, idLider, typeGroup)
    if nameGroup and tagGroup and membersCapacity_ and idLider and typeGroup then
        if verifyExistsGroup(tagGroup) then
            local _, accountLider_ = exports["TB_id"]:getSerialByID(idLider)
            if accountLider_ then
                if verifyPlayerGroup(accountLider_) then
                    notifyS(player, "Esse lider já está em um grupo!", "error")
                else
                    local tableData = {membersCapacity = membersCapacity_, accountLider = accountLider_, saldo = 0, rendat = 0, rendam = 0, timestampMes = (getRealTime().timestamp+2678400), timestampSem = (getRealTime().timestamp+604800)}
                    if aclGetGroup(tagGroup) then aclDestroyGroup(aclGetGroup(tagGroup)) end
                    aclCreateGroup(tagGroup)
                    dbExec(db, "INSERT INTO Groups(NameGroup, TagGroup, accountOwner, dataGroup, membersGroup, logsGroup, TypeGroup) VALUES(?,?,?,?,?,?,?)", nameGroup, tagGroup, accountLider_, toJSON(tableData), toJSON({}), toJSON({}), typeGroup)
                    dbExec(db, "INSERT INTO Convites(account, TagGroup, NameGroup, TypeGroup) VALUES(?,?,?,?)", accountLider_, tagGroup, nameGroup, typeGroup)
                    addLogs(tagGroup, "O jogador(a) "..puxarNome(player).." #"..puxarID(player).." criou o grupo!")
                    notifyS(player, "Você criou o grupo "..tagGroup.." com sucesso!", "success")
                end
            end
        else
            notifyS(player, "Já existe esse grupo!", "error")
        end
    else
        notifyS(player, "Falta informações! [SERVER]", "error")
    end
end)

addEvent("JOAO.convidarMember", true)
addEventHandler("JOAO.convidarMember", root,
function(player, idMember, groupInfos)
    if idMember and groupInfos then
        local _, accountName = exports["TB_id"]:getSerialByID(idMember)
        if accountName then
            if verifyPlayerGroup(accountName) then
                notifyS(player, "Esse jogador já é de um grupo!", "error")
            else
                if verifyConvitePendente(accountName, groupInfos[1].TagGroup) then
                    dbExec(db, "INSERT INTO Convites(account, TagGroup, NameGroup, TypeGroup) VALUES(?,?,?,?)", accountName, groupInfos[1].TagGroup, groupInfos[1].NameGroup, groupInfos[1].TypeGroup)
                    addLogs(groupInfos[1].TagGroup, "O jogador(a) "..puxarNome(player).." #"..puxarID(player).." convidou o jogador(a) "..accountName.." #"..idMember.."!")
                    notifyS(player, "Você convidou o jogador com sucesso!", "success")
                else
                    notifyS(player, "Esse jogador já tem um convite pendente!", "error")
                end
            end
        end
    else
        notifyS(player, "Falta informações!", "error")
    end
end)

addEvent("JOAO.manageMemberGroupCC", true)
addEventHandler("JOAO.manageMemberGroupCC", root,
function(player, dataMember, typeManage, dataGroup)
    if dataMember and typeManage then
        if puxarConta(player) == dataMember.account then
            notifyS(player, "Você não pode mexer em você mesmo!", "error")
        else
            if typeManage == "rebaixar" then
                local groupName = verifyPlayerGroup(dataMember.account)
                if groupName then
                    if groupName == dataGroup.TagGroup then
                        local isOwner = verifyOwnerPlayer(dataMember.account)
                        if isOwner then
                            notifyS(player, "Esse jogador é o dono!", "error")
                        else
                            if verifyCargo(player, dataMember.account, "menor", dataMember.cargo, dataGroup.TypeGroup, dataGroup.TagGroup) then
                                notifyS(player, "Jogador rebaixado com sucesso!", "success")
                                addLogs(dataGroup.TagGroup, "O jogador(a) "..puxarNome(player).." #"..puxarID(player).." rebaixou o jogador(a) "..(dataMember.account).." #"..(dataMember.idPlayer).."!")
                                sendData(player, dataGroup.TagGroup)
                            end
                        end
                    else
                        notifyS(player, "Esse membro não é do seu grupo!", "error")
                    end
                else
                    notifyS(player, "Esse jogador não está em grupo!", "error")
                end
            elseif typeManage == "promover" then
                local groupName = verifyPlayerGroup(dataMember.account)
                if groupName then
                    if groupName == dataGroup.TagGroup then
                        local isOwner = verifyOwnerPlayer(dataMember.account)
                        if isOwner then
                            notifyS(player, "Esse jogador é o dono!", "error")
                        else
                            if verifyCargo(player, dataMember.account, "maior", dataMember.cargo, dataGroup.TypeGroup, dataGroup.TagGroup) then
                                notifyS(player, "Jogador promovido com sucesso!", "success")
                                addLogs(dataGroup.TagGroup, "O jogador(a) "..puxarNome(player).." #"..puxarID(player).." promoveu o jogador(a) "..(dataMember.account).." #"..(dataMember.idPlayer).."!")
                                sendData(player, dataGroup.TagGroup)
                            end
                        end
                    else
                        notifyS(player, "Esse membro não é do seu grupo!", "error")
                    end
                else
                    notifyS(player, "Esse jogador não está em grupo!", "error")
                end
            elseif typeManage == "remover" then
                local groupName = verifyPlayerGroup(dataMember.account)
                if groupName then
                    if groupName == dataGroup.TagGroup then
                        local isOwner = verifyOwnerPlayer(dataMember.account)
                        if isOwner then
                            notifyS(player, "Esse jogador é o dono!", "error")
                        else
                            if removeMemberGroup(player, dataMember.account, dataGroup.TypeGroup, dataGroup.TagGroup) then
                                if dataGroup.TypeGroup == "Corporação" then
                                    aclGroupRemoveObject(aclGetGroup("Policial"), "user."..dataMember.account)
                                else
                                    aclGroupRemoveObject(aclGetGroup("Gang"), "user."..dataMember.account)
                                end
                                aclGroupRemoveObject(aclGetGroup(dataGroup.TagGroup), "user."..dataMember.account)
                                notifyS(player, "Jogador removido com sucesso!", "success")
                                addLogs(dataGroup.TagGroup, "O jogador(a) "..puxarNome(player).." #"..puxarID(player).." removeu o jogador(a) "..(dataMember.account).." #"..(dataMember.idPlayer).."!")
                                sendData(player, dataGroup.TagGroup)
                            end
                        end
                    else
                        notifyS(player, "Esse membro não é do seu grupo!", "error")
                    end
                else
                    notifyS(player, "Esse jogador não está em grupo!", "error")
                end
            end
        end
    end
end)

dataMembers = {}

function removeMemberGroup(player, accountMember, typeGroup, tagGroup)
    local result = dbPoll(dbQuery(db, "SELECT * FROM Groups WHERE TagGroup = ?", tagGroup), -1)
    if #result > 0 then
        local membersGroup = fromJSON(result[1]["membersGroup"])
        for i, v in ipairs(membersGroup) do
            if v.account == accountMember then
                dataMembers[player] = v
                table.remove(membersGroup, i)
            end
        end
        if dbExec(db, "UPDATE Groups SET membersGroup = ? WHERE TagGroup = ?", toJSON(membersGroup), tagGroup) then
            return true
        end
    end
    return false
end

function verifyCargo(player, accountMember, typeK, cargoAtual, typeGroup, tagGroup)
    local result = dbPoll(dbQuery(db, "SELECT * FROM Groups WHERE TagGroup = ?", tagGroup), -1)
    dataMembers[player] = {}
    if typeGroup and tagGroup and cargoAtual then
        local convertCargosType = (typeGroup == "Corporação" and config["Convert Cargos"][typeGroup][tagGroup][cargoAtual] or config["Convert Cargos"][typeGroup][cargoAtual])
        local cargosType = (typeGroup == "Corporação" and #config["Cargos"][typeGroup][tagGroup] or #config["Cargos"][typeGroup])
        if typeK == "menor" then
            if (convertCargosType == cargosType) then
                notifyS(player, "Não é possível rebaixar esse jogador mais!", "error")
            else
                if #result > 0 then
                    local membersGroup = fromJSON(result[1]["membersGroup"])
                    for i, v in ipairs(membersGroup) do
                        if v.account == accountMember then
                            dataMembers[player] = v
                            table.remove(membersGroup, i)
                        end
                    end
                    if typeGroup == "Corporação" then
                        table.insert(membersGroup, {account = accountMember, idPlayer = dataMembers[player].idPlayer, cargo = (config["Cargos"][typeGroup][tagGroup][(config["Convert Cargos"][typeGroup][tagGroup][cargoAtual]+1)] and config["Cargos"][typeGroup][tagGroup][(config["Convert Cargos"][typeGroup][tagGroup][cargoAtual]+1)] or config["Cargos"][typeGroup][tagGroup][(#config["Convert Cargos"][typeGroup][tagGroup])]), renda = dataMembers[player].renda, tempOn = (dataMembers[player].tempOn and dataMembers[player].tempOn or 0), drogaApreendida = dataMembers[player].drogaApreendida, jogadoresPresos = dataMembers[player].jogadoresPresos, salario = dataMembers[player].salario})
                    else
                        table.insert(membersGroup, {account = accountMember, idPlayer = dataMembers[player].idPlayer, cargo = (config["Cargos"][typeGroup][(config["Convert Cargos"][typeGroup][cargoAtual]+1)] and config["Cargos"][typeGroup][(config["Convert Cargos"][typeGroup][cargoAtual]+1)] or config["Cargos"][typeGroup][(#config["Convert Cargos"][typeGroup][cargoAtual])]), renda = dataMembers[player].renda, tempOn = (dataMembers[player].tempOn and dataMembers[player].tempOn or 0), armasFabricadas = dataMembers[player].armasFabricadas, municoesFabricadas = dataMembers[player].municoesFabricadas})
                    end
                    dbExec(db, "UPDATE Groups SET membersGroup = ? WHERE TagGroup = ?", toJSON(membersGroup), tagGroup)
                    return true
                else
                    notifyS(player, "Não foi possível!", "error")
                end
            end
        elseif typeK == "maior" then
            if (convertCargosType == 2) then
                notifyS(player, "Não é possível promover esse jogador mais!", "error")
            else
                if #result > 0 then
                    local membersGroup = fromJSON(result[1]["membersGroup"])
                    for i, v in ipairs(membersGroup) do
                        if v.account == accountMember then
                            dataMembers[player] = v
                            table.remove(membersGroup, i)
                        end
                    end
                    if dataMembers[player] then
                        if typeGroup == "Corporação" then
                            table.insert(membersGroup, {account = accountMember, idPlayer = dataMembers[player].idPlayer, cargo = config["Cargos"][typeGroup][tagGroup][(config["Convert Cargos"][typeGroup][tagGroup][cargoAtual]-1)], renda = dataMembers[player].renda, tempOn = (dataMembers[player].tempOn and dataMembers[player].tempOn or 0), drogaApreendida = dataMembers[player].drogaApreendida, jogadoresPresos = dataMembers[player].jogadoresPresos, salario = dataMembers[player].salario})
                        else
                            table.insert(membersGroup, {account = accountMember, idPlayer = dataMembers[player].idPlayer, cargo = config["Cargos"][typeGroup][(config["Convert Cargos"][typeGroup][cargoAtual]-1)], renda = dataMembers[player].renda, tempOn = (dataMembers[player].tempOn and dataMembers[player].tempOn or 0), armasFabricadas = dataMembers[player].armasFabricadas, municoesFabricadas = dataMembers[player].municoesFabricadas})
                        end
                    end
                    dbExec(db, "UPDATE Groups SET membersGroup = ? WHERE TagGroup = ?", toJSON(membersGroup), tagGroup)
                    return true
                else
                    notifyS(player, "Não foi possível!", "error")
                end
            end
        end
    end
    return false
end

lacePlayer = {}
membersGroupLace = {}

function addLace(player, type_, qntAdd)
    local group = verifyPlayerGroup(puxarConta(player))
    if group then
        local result = dbPoll(dbQuery(db, "SELECT * FROM Groups WHERE TagGroup = ?", group), -1)
        if #result > 0 then
            lacePlayer[player] = {}
            membersGroupLace[player] = fromJSON(result[1]["membersGroup"])
            for i, v in ipairs(membersGroupLace[player]) do
                if v.account == puxarConta(player) then
                    lacePlayer[player] = v
                    table.remove(membersGroupLace[player], i)
                end
            end
            if membersGroupLace[player] and lacePlayer[player] then
                if result[1]["TypeGroup"] == "Corporação" then
                    table.insert(membersGroupLace[player], {account = lacePlayer[player].account, cargo = lacePlayer[player].cargo, drogaApreendida = (type_ == "droga" and (lacePlayer[player].drogaApreendida+qntAdd) or lacePlayer[player].drogaApreendida), idPlayer = lacePlayer[player].idPlayer, jogadoresPresos = (type_ == "presos" and (lacePlayer[player].jogadoresPresos+qntAdd) or lacePlayer[player].jogadoresPresos), renda = lacePlayer[player].renda, salario = lacePlayer[player].salario, tempOn = lacePlayer[player].tempOn})
                else
                    table.insert(membersGroupLace[player], {account = lacePlayer[player].account, cargo = lacePlayer[player].cargo, armasFabricadas = (type_ == "armas" and (lacePlayer[player].armasFabricadas+qntAdd) or lacePlayer[player].armasFabricadas), idPlayer = lacePlayer[player].idPlayer, municoesFabricadas = (type_ == "municoes" and (lacePlayer[player].municoesFabricadas+qntAdd) or lacePlayer[player].municoesFabricadas), renda = lacePlayer[player].renda, salario = lacePlayer[player].salario, tempOn = lacePlayer[player].tempOn})
                end
                dbExec(db, "UPDATE Groups SET membersGroup = ? WHERE TagGroup = ?", toJSON(membersGroupLace[player]), group)
            end
        end
    end
end
addEvent("JOAO.addLaceGroup", true)
addEventHandler("JOAO.addLaceGroup", root, addLace)

function verifyConvitePendente(accountName, tagGroup)
    local result = dbPoll(dbQuery(db, "SELECT * FROM Convites WHERE account = ? AND TagGroup = ?", accountName, tagGroup), -1)
    if #result > 0 then
        return false
    end
    return true
end

function addLogs(tagGroup, message)
    local result = dbPoll(dbQuery(db, "SELECT * FROM Groups WHERE TagGroup = ?", tagGroup), -1)
    if #result > 0 then
        local logsResult = fromJSON(result[1]["logsGroup"])
        table.insert(logsResult, {timestamp = getRealTime().timestamp, mensagem = message})
        dbExec(db, "UPDATE Groups SET logsGroup = ? WHERE TagGroup = ?", toJSON(logsResult), tagGroup)
    end
end

function verifyOwnerPlayer(accountName)
    local result = dbPoll(dbQuery(db, "SELECT * FROM Groups WHERE accountOwner = ?", accountName), -1)
    if #result > 0 then
        return true
    end
    return false
end

addEvent("JOAO.openPanelGroupS", true)
addEventHandler("JOAO.openPanelGroupS", root,
function(player)
    if puxarConta(player) then
        local group = verifyPlayerGroup(puxarConta(player))
        if group then
            triggerClientEvent(player, "JOAO.openPanelGroupC", player, "index")
            sendData(player, group)
        else
            triggerClientEvent(player, "JOAO.openPanelGroupC", player, "convites")
            sendData(player, false)
        end 
    end
end)

function sendData(player, group)
    if group then
        local result = dbPoll(dbQuery(db, "SELECT * FROM Groups WHERE TagGroup = ?", group), -1)
        for i, v in ipairs(result) do
            membersGroupJS = fromJSON(v.membersGroup)
            for k, b in ipairs(membersGroupJS) do
                local getIdP = exports["TB_id"]:getIdByConta(b.account)
                membersGroupJS[k].idPlayer = getIdP
            end
            result[i].membersGroup = toJSON(membersGroupJS)
        end
        triggerClientEvent(player, "JOAO.sendInfosGroup", player, _, result, puxarConta(player))
    else
        local result = dbPoll(dbQuery(db, "SELECT * FROM Convites WHERE account = ?", puxarConta(player)), -1)
        triggerClientEvent(player, "JOAO.sendInfosGroup", player, result, _, puxarConta(player))
    end
end

function quantityMaxGroup(player, tagGroup)
    local result = dbPoll(dbQuery(db, "SELECT * FROM Groups WHERE TagGroup = ?", tagGroup), -1)
    if #result > 0 then
        local membersData = fromJSON(result[1]["membersGroup"])
        local jsonData = fromJSON(result[1]["dataGroup"])
        if (#membersData+1) > jsonData.membersCapacity then
            return false
        end
    else
        return false
    end
    return true
end

function addMemberGroup(accountAdd, tagGroup, idPlayer_, cargo_, typeGroup)
    if tagGroup and idPlayer_ and cargo_ and typeGroup then
        if (config["Cargos"][typeGroup] and config["Cargos"][typeGroup][tagGroup] and config["Cargos"][typeGroup][tagGroup][cargo_]) or (config["Cargos"][typeGroup] and config["Cargos"][typeGroup][cargo_]) then
            local result = dbPoll(dbQuery(db, "SELECT * FROM Groups WHERE TagGroup = ?", tagGroup), -1)
            if #result > 0 then
                local convertCargosType = (typeGroup == "Corporação" and config["Cargos"][typeGroup][tagGroup][cargo_] or config["Cargos"][typeGroup][cargo_])
                if convertCargosType then
                    local membersData = fromJSON(result[1]["membersGroup"])
                    if typeGroup == "Corporação" then
                        table.insert(membersData, {account = accountAdd, idPlayer = idPlayer_, cargo = config["Cargos"][typeGroup][tagGroup][cargo_], renda = 0, tempOn = 0, drogaApreendida = 0, jogadoresPresos = 0, salario = 0})
                    else
                        table.insert(membersData, {account = accountAdd, idPlayer = idPlayer_, cargo = config["Cargos"][typeGroup][cargo_], renda = 0, tempOn = 0, armasFabricadas = 0, municoesFabricadas = 0})
                    end
                    if dbExec(db, "UPDATE Groups SET membersGroup = ? WHERE TagGroup = ?", toJSON(membersData), tagGroup) then
                        return true
                    end
                end
            end
        end
    end
    return false
end

function verifyExistsGroup(groupName)
    local result = dbPoll(dbQuery(db, "SELECT * FROM Groups WHERE TagGroup = ?", groupName), -1)
    if #result > 0 then
        return false
    end
    return true
end

function verifyPlayerGroup(accountPlayer)
    local result = dbPoll(dbQuery(db, "SELECT * FROM Groups"), -1)
    if #result > 0 then
        for i, v in ipairs(result) do
            local membersData = fromJSON(v.membersGroup)
            for k, b in ipairs(membersData) do
                if b.account == accountPlayer then
                    return v.TagGroup
                end
            end
        end
    end
    return false
end