----------------/ logs dc \----------------
function msg(mensagem)
    local data = {
        content = "",
        username = Config.Discord["UserName"],
        avatar_url = Config.Discord["AvatarUrl"],
        embeds = {
            {
                title = Config.Discord["TituloEmbed"],
                color = Config.Discord["ColorEmbed"],
                description = ""..mensagem.."",
                footer = {
                    text = Config.Discord["MsgDireitos"],
                    icon_url = Config.Discord["IconUrl"],
                },
                    image = {
                      url = Config.Discord["ImageUrl"],
                    },
                    thumbnail = { 
                      url = Config.Discord["ThumbnailUrl"],
                    },
            }
        }
    }
  
    local jsonData = toJSON(data)
          jsonData = string.sub(jsonData, 3, #jsonData - 2)
  
    local sendOptions = {
        headers = {
            ["Content-Type"] = "application/json"
        },
        postData = jsonData,
    }
  
    fetchRemote ( Config.Url["UrlDiscord"], sendOptions, WebhookCallback )
  end
  
  function  WebhookCallback()
  end
  ----------------/ logs dc \----------------

local bankTable = {
    PENALLY = 0,
    AMOUNT = Config["AMOUNT"],
}



--[[
    ><><><><><><><><><><><><><><><><><><><><
    ><             SaveData               ><
    ><><><><><><><><><><><><><><><><><><><><
--]]

local database = dbConnect("sqlite", "database.db")


function dxMsg(element, msg, typeinfo) -- Nao renomear a função
exports["infoBox"]:addBox(element, msg, typeinfo)
end

addEventHandler("onPlayerLogin", root, function(_, acc)
    setTimer(carregarConta, 50, 1, acc )
end)


function getPlayerID(id)
    v = false
    for i, player in ipairs (getElementsByType("player")) do
        if getElementData(player, "ID") == id then
            v = player
            break
        end
    end
    return v
end


function carregarConta(conta)
    if not isGuestAccount(conta) then
        if conta then    
            local source = getAccountPlayer(conta)
            local query = dbPoll(dbQuery(database, "SELECT * FROM bank_system WHERE account = ?", getAccountName(conta)), -1)
            if query and type(query) == "table" and #query > 0 then
                query = query[1]
                for k, v in pairs(query) do
                    if k == "data" then
                        local dados = v
                        if dados then
                            dados = fromJSON(dados)
                            setElementData(source, "bankDados", dados)
                        end
                    end
                end
            else
                dbExec(database, "INSERT INTO bank_system (account) VALUES (?)", getAccountName(conta))
                setElementData(source, "bankDados", bankTable)
            end
        end
    end    
end

function iniciar(res)
	if res == getThisResource() then
        dbExec(database, "CREATE TABLE IF NOT EXISTS bank_system (id INTEGER PRIMARY KEY AUTOINCREMENT, account TEXT, data TEXT)")
        for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount(player)
            if not isGuestAccount(acc) then
				carregarConta(acc)
			end
		end
	end
end
addEventHandler("onResourceStart", root, iniciar)

function salvarConta(conta)
	if conta then
        local source = getAccountPlayer(conta)
        local dados = getElementData(source, "bankDados")
        if dados then
            dados = toJSON(dados)
            dbExec(database, "UPDATE bank_system SET data = ? WHERE account = ?", dados, getAccountName(conta))
        end
	end
end

function desligar(res, conta)
    if res == getThisResource() then
        for i, player in ipairs(getElementsByType("player")) do
            local acc = getPlayerAccount(player)
            if not isGuestAccount(acc) then
                salvarConta(acc)
            end
		end
	end
end 
addEventHandler("onResourceStop", root, desligar)

function sairJogo(quitType)
	local acc = getPlayerAccount(source)
	if not isGuestAccount(acc) then
		if acc then
			salvarConta(acc)
		end
	end
end
addEventHandler("onPlayerQuit", root, sairJogo)
addEventHandler("onPlayerLogout", root, sairJogo)

--[[
    ><><><><><><><><><><><><><><><><><><><><
    ><              Códigos               ><
    ><><><><><><><><><><><><><><><><><><><><
--]]

function abrirBanco(source)
    if getElementType(source) == "player" then
        if not isPedInVehicle(source) then
            if not isGuestAccount(getPlayerAccount(source)) then
                triggerClientEvent(source, "openBankSystem", source)
            end
        else
            dxMsg(source, "Você não pode utilizar um veículo para abrir o sistema bancário.", "warning")
        end
    end
end

function addBankExtract(source, message)
    if getElementType(source) == "player" then
        if message then
            -- Marcar (horario) do extrato 
            local time = getRealTime()
            local hours = time.hour
            local minutes = time.minute
            local seconds = time.second
            -- Final marcar (horario) do extrato

            -- Marcar mes, dia e ano do extrato
            local meses = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"}
            local dias = {"Domingo", "Segunda Feira", "Terça Feira", "Quarta Feira", "Quinta Feira", "Sexita Feira", "Sabado"}
            local dia = ("%02d"):format(time.monthday)
            local ano = ("%02d"):format(time.year + 1900)
            local diaa = dias[time.weekday + 1]
            local mes = meses[time.month + 1]
            -- Final marcar mes, dia e ano do extrato

            if (hours < 10) then
            hours = "0"..hours
            end
            if (minutes < 10) then
            minutes = "0"..minutes
            end
            if (seconds < 10) then
            seconds = "0"..seconds
            end

            local bank = {}
            local fD = (""..dia.."/"..mes.."/"..ano.."-"..hours..":"..minutes )
            table.insert(bank, {d = ""..fD.."", m = message})
            triggerClientEvent(source, "passExtractToClient", source, bank)
        end
    end 
end



function showtime ()
    local time = getRealTime()
    local hours = time.hour
    local minutes = time.minute
    local seconds = time.second
    if (hours < 10) then
        hours = "0"..hours
    end
    if (minutes < 10) then
        minutes = "0"..minutes
    end
    if (seconds < 10) then
        seconds = "0"..seconds
    end
    outputChatBox ("Local Time: "..hours..":"..minutes..":"..seconds )
end
addCommandHandler("tempo", showtime)



function getBankMoney(source, type)
    if source then
        if getElementType(source) == "player" then
            local dados = getElementData(source, "bankDados")
            if dados and type then
                if type == "dinheiro" then
                    return tonumber(dados["AMOUNT"] or 0)

                elseif type == "multa" then
                    return tonumber(dados["PENALLY"] or 0)
                end
            end
        end
    end
end

function addBankMoney(source, type, value)
    if source then
        if getElementType(source) == "player" then
            local dados = getElementData(source, "bankDados")
            if dados and type and value then
                if type == "dinheiro" then
                    dados["AMOUNT"] = dados["AMOUNT"] + value
                    setElementData(source, "bankDados", dados)

                elseif type == "multa" then
                    dados["PENALLY"] = dados["PENALLY"] + value
                    setElementData(source, "bankDados", dados)
                end
            end
        end
    end
end

function removeBankMoney(source, type, value)
    if source then
        if getElementType(source) == "player" then
            local dados = getElementData(source, "bankDados")
            if dados and type and value then
                if type == "dinheiro" then
                    dados["AMOUNT"] = dados["AMOUNT"] - value
                    setElementData(source, "bankDados", dados)

                elseif type == "multa" then
                    dados["PENALLY"] = dados["PENALLY"] - value
                    setElementData(source, "bankDados", dados)
                end
            end
        end
    end
end

local cooldown = {}

function depositarDinheiro(source, valor)
    if getElementType(source) == "player" then
        if not isTimer(cooldown[source]) then
            if valor ~= "" then
                if tonumber(valor) >= 49 then
                    local pMoney = getPlayerMoney(source)
                    if tonumber(pMoney) >= tonumber(valor) then
                        takePlayerMoney(source, tonumber(valor))
                        addBankMoney(source, "dinheiro", tonumber(valor))
                        addBankExtract(source, "Deposito no valor de R$ "..tostring(formatNumber(valor))..",00.")
                        msg("O(A) `"..removeHex(getPlayerName(source)).." ("..(getElementData(source, "ID") or 0)..")`\nAcabou de efetuar um deposito no valor de `R$ "..tostring(formatNumber(valor)).."`.")
                        dxMsg(source, "Você acabou de efetuar um deposito no valor de R$ "..tostring(formatNumber(valor)).."", "success")

                        cooldown[source] = setTimer(
                            function()
                                cooldown[source] = nil
                            end
                        , Config["TEMPO"] * 1000, 1)
                    else
                        dxMsg(source, "Você não possui esse dinheiro em sua carteira!", "warning")
                    end
                else
                    dxMsg(source, "Você não pode depositar um valor inferior à R$ 50,00.", "warning")
                end
            else
                dxMsg(source, "Você não inseriu o valor para ser depositado.", "warning")
            end
        else
            local restante = math.ceil(getTimerDetails(cooldown[source])/1000)
            dxMsg(source, "Você está em cooldown, aguarde "..restante.." segundo(s)!", "warning")
        end
    end
end

function sacarDinheiro(source, valor)
    if getElementType(source) == "player" then
        if not isTimer(cooldown[source]) then
            if valor ~= "" then
                if tonumber(valor) >= 49 then
                    local pMoney = getPlayerMoney(source)
                    if tonumber(valor) <= getBankMoney(source, "dinheiro") then
                        givePlayerMoney(source, tonumber(valor))
                        removeBankMoney(source, "dinheiro", tonumber(valor))
                        addBankExtract(source, "Saque no valor de R$ "..tostring(formatNumber(valor))..",00.")
                        msg("O(A) `"..removeHex(getPlayerName(source)).." ("..(getElementData(source, "ID") or 0)..")`\nAcabou de efetuar um saque no valor de `R$ "..tostring(formatNumber(valor)).."`.")
                        dxMsg(source, "Você acabou de efetuar um saque no valor de R$ "..tostring(formatNumber(valor))..",00.", "success")
                    
                        cooldown[source] = setTimer(
                            function()
                                cooldown[source] = nil
                            end
                        , Config["TEMPO"] * 1000, 1)
                    else
                        dxMsg(source, "Você não possui esse dinheiro em sua conta bancária!", "warning")
                    end
                else
                    dxMsg(source, "Você não pode sacar um valor inferior à R$ 50,00.", "warning")
                end
            else
                dxMsg(source, "Você não inseriu o valor para ser sacado.", "warning")
            end
        else
            local restante = math.ceil(getTimerDetails(cooldown[source])/1000)
            dxMsg(source, "Você está em cooldown, aguarde "..restante.." segundo(s)!", "warning")
        end
    end
end

function transferirDinheiro(source, conta, valor)
    if getElementType(source) == "player" then
        if not isTimer(cooldown[source]) then
            if conta ~= "" then
                local playerID = getPlayerID(tonumber(conta))
                if playerID then
                    if playerID ~= getElementData(source, "ID") then
                        if valor ~= "" then
                            if tonumber(valor) >= 49 then
                                if tonumber(valor) <= getBankMoney(source, "dinheiro") then
                                    addBankMoney(playerID, "dinheiro", tonumber(valor))
                                    removeBankMoney(source, "dinheiro", tonumber(valor))
                                    addBankExtract(playerID, "Recebimento R$ "..tostring(formatNumber(valor))..",00 do(a) "..removeHex(getPlayerName(source))..".")
                                    addBankExtract(source, "Transferencia R$ "..tostring(formatNumber(valor))..",00 para o(a) "..removeHex(getPlayerName(playerID))..".")
                                    msg("O(A) `"..removeHex(getPlayerName(source)).." ("..(getElementData(source, "ID") or 0)..")`\nAcabou de efetuar uma transferência para o(a) `"..removeHex(getPlayerName(playerID)).." ("..tostring(conta)..")` no valor de `R$ "..tostring(formatNumber(valor)).."`.")
                                    dxMsg(playerID, "Você acabou de receber uma transferência no valor de R$ "..tostring(formatNumber(valor))..",00 do(a) "..removeHex(getPlayerName(source))..".", "info")
                                    dxMsg(source, "Você acabou de efetuar uma transferência no valor de R$ "..tostring(formatNumber(valor))..",00 para o(a) "..removeHex(getPlayerName(playerID))..".", "success")
                                
                                    cooldown[source] = setTimer(
                                        function()
                                            cooldown[source] = nil
                                        end
                                    , Config["TEMPO"] * 1000, 1)
                                else
                                    dxMsg(source, "Você não possui esse dinheiro em sua conta bancária!", "warning")
                                end
                            else
                                dxMsg(source, "Você não pode transferir um valor inferior à R$ 50,00.", "warning")
                            end
                        else
                            dxMsg(source, "Você não inseriu o valor para ser transferido.", "warning")
                        end
                    else
                        dxMsg(source, "Você não pode transferir para você mesmo!", "warning")
                    end
                else
                    dxMsg(source, "O(A) jogador(a) desejado, não foi encontrado!", "warning")
                end
            else
                dxMsg(source, "Você não inseriu a conta para receber a transferência.", "warning")
            end
        else
            local restante = math.ceil(getTimerDetails(cooldown[source])/1000)
            dxMsg(source, "Você está em cooldown, aguarde "..restante.." segundo(s)!", "warning")
        end
    end
end

function pagarMulta(source, valor)
    if getElementType(source) == "player" then
        if not isTimer(cooldown[source]) then
            if getBankMoney(source, "multa") >= 1 then
                if valor ~= "" then
                    if tonumber(valor) <= getBankMoney(source, "dinheiro") then
                        if tonumber(valor) <= getBankMoney(source, "multa") then
                            removeBankMoney(source, "multa", tonumber(valor))
                            removeBankMoney(source, "dinheiro", tonumber(valor))
                            addBankExtract(source, "Multa no valor de R$ "..tostring(formatNumber(valor))..",00.")
                            msg("O(A) `"..removeHex(getPlayerName(source)).." ("..(getElementData(source, "ID") or 0)..")`\nAcabou de efetuar o pagamento de uma multa no valor de `R$ "..tostring(formatNumber(valor)).."`")
                            dxMsg(source, "Pagamento no valor de R$ "..tostring(formatNumber(valor))..",00.", "success")
                        
                            cooldown[source] = setTimer(
                                function()
                                    cooldown[source] = nil
                                end
                            , Config["TEMPO"] * 1000, 1)
                        else
                            dxMsg(source, "Você está tentando pagar um valor superior ao que você deve.", "warning")
                        end
                    else
                        dxMsg(source, "Você não possui esse valor em sua conta bancária!", "warning")
                    end
                else
                    dxMsg(source, "Você não inseriu o valor para ser pago.", "warning")
                end
            else
                dxMsg(source, "Você não possui nenhuma multa para ser paga.", "warning")
            end
        else
            local restante = math.ceil(getTimerDetails(cooldown[source])/1000)
            dxMsg(source, "Você está em cooldown, aguarde "..restante.." segundo(s)!", "warning")
        end
    end
end

addCommandHandler(Config["MULTAR"]["COMANDO"],
    function(source, _, conta, valor)
        if getElementType(source) == "player" then
            if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup(Config["MULTAR"]["ACL"])) then
                if conta then
                    if valor then
                        local playerID = getPlayerID(tonumber(conta))
                        if playerID then
                            if tonumber(conta) ~= getElementData(source, "ID") then
                                addBankMoney(playerID, "multa", tonumber(valor))
                                addBankExtract(playerID, "Multa no valor de R$ "..tostring(formatNumber(valor))..",00.")
                                dxMsg(playerID, "Recebimento de multa do(a) "..removeHex(getPlayerName(source)).." no valor de R$ "..tostring(formatNumber(valor))..",00.", "info")
                                dxMsg(source, "Você aplicou uma multa no(a) "..removeHex(getPlayerName(playerID)).." no valor de R$ "..tostring(formatNumber(valor))..",00.", "success")
                                msg("O(A) policia de nome: `"..removeHex(getPlayerName(source)).." ("..(getElementData(source, "ID") or 0)..")`\nAcabou de efetuar uma multa ao cidadão: "..removeHex(getPlayerName(playerID)).."\nNo valor de: "..tostring(formatNumber(valor)).."`")
                            else
                                dxMsg(source, "Você não pode multar você mesmo!", "warning")
                            end
                        else
                            dxMsg(source, "O(A) jogador(a) não existe!", "warning")
                        end
                    else
                        dxMsg(source, "Você não inseriu o valor da multa.", "warning")
                    end
                else
                    dxMsg(source, "Você não inseriu a conta do(a) jogador(a) para ser multado(a).", "warning")
                end
            else
                dxMsg(source, "Você não possui permissão suficiente para executar esse comando.", "warning")
            end
        end
    end
)

function carregarSistema()
    for _, v in ipairs(Config["ATMs"]) do
        local bankMarker = createMarker(v.x, v.y, v.z -1, "cylinder", 2.5, 255, 255, 255, 0)
        local bankBlip = createBlipAttachedTo(bankMarker, v.blip, 4, 255, 255, 255, 255)
        local bankObj = createObject(v.obj, v.x, v.y, v.z -0.3, v.rx, v.ry, v.rz)
        createBlipAttachedTo()
        setElementInterior(bankObj, v.i)
        setElementDimension(bankObj, v.d)
        
        setElementInterior(bankBlip, v.i)
        setElementDimension(bankBlip, v.d)

        setElementInterior(bankMarker, v.i)
        setElementDimension(bankMarker, v.d)

        addEventHandler("onMarkerHit", bankMarker, abrirBanco)
    end
end

--[[
    ><><><><><><><><><><><><><><><><><><><><
    ><            RegisterEvents          ><
    ><><><><><><><><><><><><><><><><><><><><
--]]

addEvent("efetuarSaque", true)
addEvent("efetuarDeposito", true)
addEvent("efetuarPagamento", true)
addEvent("efetuarTransferencia", true)

addEventHandler("efetuarSaque", root, sacarDinheiro)
addEventHandler("efetuarPagamento", root, pagarMulta)
addEventHandler("onResourceStart", resourceRoot, carregarSistema)
addEventHandler("efetuarDeposito", root, depositarDinheiro)
addEventHandler("efetuarTransferencia", root, transferirDinheiro)

