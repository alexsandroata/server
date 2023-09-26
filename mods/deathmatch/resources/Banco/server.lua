-- ########### VARIÁVEIS ###########


local markerJoin = createMarker(1411.80339, -1699.87390, 13.53949, "cylinder", 1, 16, 102, 231, 0) 
local inutil2 = createMarker(1411.80339, -1699.87390, 12.23949, "cylinder", 1, 16, 102, 231, 50) 
local exitLS1 = createMarker(390.45071, 173.79091, 1008.38281, "cylinder", 1, 16, 102, 231, 0) 
local inutil = createMarker(390.45071, 173.79091, 1007.18281, "cylinder", 1, 16, 102, 231, 50) 
createBlip(1411.80339, -1699.87390, 13.53949, 52)

createBlip(1928.58215, -1768.56689, 13.14688, 52)
createBlip(1815.18152, -1557.53162, 13.08579, 52)
createBlip(1682.24341, -1272.46252, 14.41477, 52)
createBlip(1051.96143, -1131.20642, 23.42813, 52)
createBlip(537.36407, -1740.75659, 11.87771, 52)


-- ########### VARIÁVEIS ###########

setElementInterior(exitLS1, 3)
setElementDimension(exitLS1, 2)
setElementInterior(inutil, 3)
setElementDimension(inutil, 2)

function saveData4(conta)
    if conta then
        local source = getAccountPlayer(conta)
        if isElement(source) then
            local bank = getElementData(source,"Bank:Caixa") or 0
            setAccountData(conta, "Bank:Caixa",tonumber(bank))
        end
    end 
end

function loadData4(conta)
    if not (isGuestAccount (conta)) then
        if (conta) then 
            local source = getAccountPlayer(conta)  
            if isElement(source) then
                local bank = getAccountData(conta,"Bank:Caixa")
                if type(bank) == "boolean" or "Bank:Caixa" == nil then
                    bank = 0
                end
                setElementData(source, "Bank:Caixa", tonumber(bank))            
            end
        end
    end 
end



addEventHandler("onPlayerLogin", root,
  function(_, acc)
    setTimer(loadData4,1000,1,acc)
  end
)

function saveOnStartScript(res)
    if res == getThisResource() then
        for i, player in ipairs(getElementsByType("player")) do
            local acc = getPlayerAccount(player)
            if not isGuestAccount(acc) then
                loadData4(acc)           
            end
        end
    end
end
addEventHandler("onResourceStart", getRootElement(), saveOnStartScript)

function saveOnStopScript(res)
    if res == getThisResource() then
        for i, player in ipairs(getElementsByType("player")) do
            local acc = getPlayerAccount(player)
            if not isGuestAccount(acc) then
                saveData4(acc)   
            end
        end
    end
end 
addEventHandler("onResourceStop", getRootElement(), saveOnStopScript)



function saveOnQuit(quitType)
    local acc = getPlayerAccount(source)
    if not (isGuestAccount(acc)) then
        if acc then
            saveData4(acc)
        end
    end
end
addEventHandler("onPlayerQuit", getRootElement(), saveOnQuit)

function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end

function fadeCameraDelayed(player) 
    if (isElement(player)) then
        fadeCamera(player, true, 0.5)
    end
end


function dxMsg(source, text, type)
	exports.dxmessages:outputDx(source, text, type)
end	



function entrarLS1(thePlayer)
	setElementDimension(thePlayer, 2)
	fadeCamera(thePlayer, false, 1.0, 0, 0, 0)    
	setTimer(fadeCameraDelayed, 1000, 1, thePlayer)
	setTimer(function()
	setElementInterior(thePlayer, 3, 386.85941, 173.74263, 1008.38281)
	end, 1000, 1)
end
addEventHandler("onMarkerHit", markerJoin, entrarLS1)


function sairLS1(thePlayer)
	if getElementDimension(thePlayer) == 2 then
		setElementDimension(thePlayer, 0)
		fadeCamera(thePlayer, false, 1.0, 0, 0, 0)    
		setTimer(fadeCameraDelayed, 1000, 1, thePlayer)
		setTimer(function()
		setElementInterior(thePlayer, 0, 1414.01062, -1700.99475, 13.53949)
		end, 1000, 1)
	end
end
addEventHandler("onMarkerHit", exitLS1, sairLS1)



function onDepositMoney(thePlayer, money)
    takePlayerMoney(thePlayer, money)
end
addEvent("onDepositMoney", true)
addEventHandler("onDepositMoney", root, onDepositMoney)

function saqueBankMoney(thePlayer, money)
    givePlayerMoney(thePlayer, money)
end
addEvent("saqueBankMoney", true)
addEventHandler("saqueBankMoney", root, saqueBankMoney)

function transMoney(money, item)
    if grid == "" then return end
    local bankPlayer = getPlayerFromPartialName(item)
    setElementData(bankPlayer, "Bank:Caixa", getElementData(bankPlayer, "Bank:Caixa") + money)
end
addEvent("transMoney", true)
addEventHandler("transMoney", root, transMoney)


