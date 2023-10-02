-------------------------------Marker plantar----------------------------------- 

local MARKER_PLANTAR = createMarker (-1428.374, -1541.425, 100.758, "cylinder", 1.5, 59, 191, 75, 100)

-----------------------------------------------

-------------------------------------------------
function mensagemPre (playerSource)
	exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "info", "Para plantar, digite /plantar")   
   --outputChatBox("#0000ff[INFO] #ffffffPara pegar o pé da maconha digite /pmaconha", playerSource, 255, 255, 255, true) --Mensagem ao passar no marker para pegar o pé de maconha
end
addEventHandler("onMarkerHit", MARKER_PLANTAR, mensagemPre)

local TimerM1 = {}

function plantarM(playerSource)
    if isElementWithinMarker(playerSource, MARKER_PLANTAR) then
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)),aclGetGroup("Gang")) then
			if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "fertilizante", 0, 1, nil) then
				if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "sementemaconha", 0, 1, nil) then
					if not isTimer(TimerM1[playerSource]) then
						setPedFrozen(playerSource, true)
						Broto = createObject(3409, -1428.374, -1541.425, 100.758)
						setPedAnimation(playerSource, "BOMBER", "BOM_Plant", 2600, true, false, false, false) --Animação que acontecerá ao digitar /plantar
						setTimer(setPedAnimation, 2600, 1, playerSource)
						setObjectScale(Broto, 0.03)
						destroyElement(MARKER_PLANTAR)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "fertilizante", 1)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "sementemaconha", 1)
						------------------------------------------    
						setTimer(function()
						setPedFrozen(playerSource, false)
						outputChatBox("#0000ff[INFO] #ffffffVocê plantou a maconha, aguarde ela crescer para colher", playerSource, 255, 255, 255, true) --Mensagem ao dar /plantar
						end, 2600, 1)

						setTimer(function()
						destroyElement(Broto)
						Maconha = createObject(3409, -1428.374, -1541.425, 100.758) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha, 0.06)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 5000, 1)
						--------------------------------------------
						setTimer(function()
						destroyElement(Maconha)
						Maconha2 = createObject(3409, -1428.374, -1541.425, 100.758) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha2, 0.15)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 10000, 1)
						--------------------------------------------	

						setTimer(function()
						destroyElement(Maconha2)
						Maconha3 = createObject(3409, -1428.374, -1541.425, 100.758) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha3, 0.25)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 15000, 1)

						setTimer(function()
						destroyElement(Maconha3)
						Maconha4 = createObject(3409, -1428.374, -1541.425, 100.758) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha4, 0.35)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 20000, 1)

						setTimer(function()
						destroyElement(Maconha4)
						Maconha5 = createObject(3409, -1428.374, -1541.425, 100.758) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha5, 0.45)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 25000, 1)


						setTimer(function()
						destroyElement(Maconha5)
						Maconha6 = createObject(3409, -1428.374, -1541.425, 100.758) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha6, 0.55)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 30000, 1)

						setTimer(function()
						destroyElement(Maconha6)
						Maconha7 = createObject(3409, -1428.374, -1541.425, 100.758) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha7, 0.65)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 35000, 1)


						setTimer(function()
						destroyElement(Maconha7)
						Maconha8 = createObject(3409, -1428.374, -1541.425, 100.758) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha8, 0.75)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 40000, 1)


						setTimer(function()
						destroyElement(Maconha8)
						Maconha9 = createObject(3409, -1428.374, -1541.425, 100.758) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha9, 0.85)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 45000, 1)


						setTimer(function()
						destroyElement(Maconha9)
						Maconha10 = createObject(3409, -1428.374, -1541.425, 100.758) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha10, 0.95)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 50000, 1)

						setTimer(function()
						destroyElement(Maconha10)
						Maconha11 = createObject(3409, -1428.374, -1541.425, 100.758) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 55000, 1)

						setTimer(function()
						destroyElement(Maconha11)
						outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						exports["[GlobalDrops]InventarioCompleto"]:sendItem(playerSource, "budmaconha", 0, 1, "none", false)
						triggerEvent("GiveExp", playerSource, playerSource, 3)
						setTimer(GERAR_MARKER_PLANTAR, 1000, 1)
						exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "success", "Você colheu uma bud de maconha.")
						end, 60000, 1)
						TimerM1[playerSource] = setTimer(function()
									--
						end, 10000, 1)
					else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Já tem uma plantação aqui.")
					end
				else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem sementes suficiente.")
				end
			else
				exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem fertilizante suficiente.")
			end
		else
			exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Somente membros de gang pode executar essa ação.")
		end
	end
end
addCommandHandler("plantar", plantarM) --Comando para plantar a maconha

-------------------Função Reaparecer maker --------------------------------

function GERAR_MARKER_PLANTAR ()
    MARKER_PLANTAR = createMarker (-1428.374, -1541.425, 100.758, "cylinder", 1.5, 59, 191, 75, 100)
end







---------------------------------------------------------------------------------------------------------------------------------------



-------------------------------Marker plantar----------------------------------- 

local MARKER_PLANTAR02 = createMarker (-1428.307, -1547.366, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)

-----------------------------------------------

-------------------------------------------------
function mensagemPre (playerSource)
	exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "info", "Para plantar digite /plantar")   
   --outputChatBox("#0000ff[INFO] #ffffffPara pegar o pé da maconha digite /pmaconha", playerSource, 255, 255, 255, true) --Mensagem ao passar no marker para pegar o pé de maconha
end
addEventHandler("onMarkerHit", MARKER_PLANTAR02, mensagemPre)

local TimerM2 = {}

function plantarM02(playerSource)
    if isElementWithinMarker(playerSource, MARKER_PLANTAR02) then
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)),aclGetGroup("Gang")) then
			if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "fertilizante", 0, 1, nil) then
				if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "sementemaconha", 0, 1, nil) then
					if not isTimer(TimerM2[playerSource]) then
						setPedFrozen(playerSource, true)
						Broto02 = createObject(3409, -1428.307, -1547.366, 101.758 -1)
						setPedAnimation(playerSource, "BOMBER", "BOM_Plant", 2600, true, false, false, false) --Animação que acontecerá ao digitar /plantar
						setTimer(setPedAnimation, 2600, 1, playerSource)
						setObjectScale(Broto02, 0.03)
						destroyElement(MARKER_PLANTAR02)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "fertilizante", 1)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "sementemaconha", 1)
						------------------------------------------    
						setTimer(function()
						setPedFrozen(playerSource, false)
						outputChatBox("#0000ff[INFO] #ffffffVocê plantou a maconha, aguarde ela crescer para colher", playerSource, 255, 255, 255, true) --Mensagem ao dar /plantar
						end, 2600, 1)

						setTimer(function()
						destroyElement(Broto02)
						Maconha12 = createObject(3409, -1428.307, -1547.366, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha12, 0.06)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 5000, 1)
						--------------------------------------------
						setTimer(function()
						destroyElement(Maconha12)
						Maconha13 = createObject(3409, -1428.307, -1547.366, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha13, 0.15)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 10000, 1)
						--------------------------------------------	

						setTimer(function()
						destroyElement(Maconha13)
						Maconha14 = createObject(3409, -1428.307, -1547.366, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha14, 0.25)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 15000, 1)

						setTimer(function()
						destroyElement(Maconha14)
						Maconha15 = createObject(3409, -1428.307, -1547.366, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha15, 0.35)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 20000, 1)

						setTimer(function()
						destroyElement(Maconha15)
						Maconha16 = createObject(3409, -1428.307, -1547.366, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha16, 0.45)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 25000, 1)


						setTimer(function()
						destroyElement(Maconha16)
						Maconha17 = createObject(3409, -1428.307, -1547.366, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha17, 0.55)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 30000, 1)

						setTimer(function()
						destroyElement(Maconha17)
						Maconha18 = createObject(3409, -1428.307, -1547.366, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha18, 0.65)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 35000, 1)


						setTimer(function()
						destroyElement(Maconha18)
						Maconha19 = createObject(3409, -1428.307, -1547.366, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha19, 0.75)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 40000, 1)


						setTimer(function()
						destroyElement(Maconha19)
						Maconha20 = createObject(3409, -1428.307, -1547.366, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha20, 0.85)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 45000, 1)


						setTimer(function()
						destroyElement(Maconha20)
						Maconha21 = createObject(3409, -1428.307, -1547.366, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha21, 0.95)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 50000, 1)

						setTimer(function()
						destroyElement(Maconha21)
						Maconha22 = createObject(3409, -1428.307, -1547.366, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 55000, 1)

						setTimer(function()
						destroyElement(Maconha22)
						outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						exports["[GlobalDrops]InventarioCompleto"]:sendItem(playerSource, "budmaconha", 0, 1, "none", false)
						triggerEvent("GiveExp", playerSource, playerSource, 3)
						exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "success", "Você colheu uma bud de maconha.")
						setTimer(GERAR_MARKER_PLANTAR2, 1000, 1)
						end, 60000, 1)
						TimerM2[playerSource] = setTimer(function()
									--
						end, 10000, 1)
					else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Já tem uma plantação aqui.")
					end
				else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem sementes suficiente.")
				end
			else
				exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem fertilizante suficiente.")
			end
		else
			exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Somente membros de gang pode executar essa ação.")
		end
	end
end
addCommandHandler("plantar", plantarM02) --Comando para plantar a maconha

-------------------Função Reaparecer maker --------------------------------

function GERAR_MARKER_PLANTAR2 ()
    MARKER_PLANTAR02 = createMarker (-1428.307, -1547.366, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)
end




---------------------------------------------------------------------------------------------------------------------------------------



-------------------------------Marker plantar----------------------------------- 

local MARKER_PLANTAR03 = createMarker (-1428.273, -1553.377, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)

-----------------------------------------------

-------------------------------------------------
function mensagemPre (playerSource)
	exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "info", "Para plantar digite /plantar")   
   --outputChatBox("#0000ff[INFO] #ffffffPara pegar o pé da maconha digite /pmaconha", playerSource, 255, 255, 255, true) --Mensagem ao passar no marker para pegar o pé de maconha
end
addEventHandler("onMarkerHit", MARKER_PLANTAR03, mensagemPre)

local TimerM3 = {}

function plantarM03(playerSource)
    if isElementWithinMarker(playerSource, MARKER_PLANTAR03) then
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)),aclGetGroup("Gang")) then
			if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "fertilizante", 0, 1, nil) then
				if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "sementemaconha", 0, 1, nil) then
					if not isTimer(TimerM3[playerSource]) then
						setPedFrozen(playerSource, true)
						Broto03 = createObject(3409, -1428.273, -1553.377, 101.758 -1)
						setPedAnimation(playerSource, "BOMBER", "BOM_Plant", 2600, true, false, false, false) --Animação que acontecerá ao digitar /plantar
						setTimer(setPedAnimation, 2600, 1, playerSource)
						setObjectScale(Broto03, 0.03)
						destroyElement(MARKER_PLANTAR03)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "fertilizante", 1)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "sementemaconha", 1)
						------------------------------------------    
						setTimer(function()
						setPedFrozen(playerSource, false)
						outputChatBox("#0000ff[INFO] #ffffffVocê plantou a maconha, aguarde ela crescer para colher", playerSource, 255, 255, 255, true) --Mensagem ao dar /plantar
						end, 2600, 1)

						setTimer(function()
						destroyElement(Broto03)
						Maconha23 = createObject(3409, -1428.273, -1553.377, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha23, 0.06)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 5000, 1)
						--------------------------------------------
						setTimer(function()
						destroyElement(Maconha23)
						Maconha24 = createObject(3409, -1428.273, -1553.377, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha24, 0.15)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 10000, 1)
						--------------------------------------------	

						setTimer(function()
						destroyElement(Maconha24)
						Maconha25 = createObject(3409, -1428.273, -1553.377, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha25, 0.25)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 15000, 1)

						setTimer(function()
						destroyElement(Maconha25)
						Maconha26 = createObject(3409, -1428.273, -1553.377, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha26, 0.35)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 20000, 1)

						setTimer(function()
						destroyElement(Maconha26)
						Maconha27 = createObject(3409, -1428.273, -1553.377, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha27, 0.45)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 25000, 1)


						setTimer(function()
						destroyElement(Maconha27)
						Maconha28 = createObject(3409, -1428.273, -1553.377, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha28, 0.55)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 30000, 1)

						setTimer(function()
						destroyElement(Maconha28)
						Maconha29 = createObject(3409, -1428.273, -1553.377, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha29, 0.65)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 35000, 1)


						setTimer(function()
						destroyElement(Maconha29)
						Maconha30 = createObject(3409, -1428.273, -1553.377, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha30, 0.75)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 40000, 1)


						setTimer(function()
						destroyElement(Maconha30)
						Maconha31 = createObject(3409, -1428.273, -1553.377, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha31, 0.85)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 45000, 1)


						setTimer(function()
						destroyElement(Maconha31)
						Maconha32 = createObject(3409, -1428.273, -1553.377, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha32, 0.95)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 50000, 1)

						setTimer(function()
						destroyElement(Maconha32)
						Maconha33 = createObject(3409, -1428.273, -1553.377, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 55000, 1)

						setTimer(function()
						destroyElement(Maconha33)
						outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						exports["[GlobalDrops]InventarioCompleto"]:sendItem(playerSource, "budmaconha", 0, 1, "none", false)
						triggerEvent("GiveExp", playerSource, playerSource, 3)
						exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "success", "Você colheu uma bud de maconha.")
						setTimer(GERAR_MARKER_PLANTAR3, 1000, 1)
						end, 60000, 1)
						TimerM3[playerSource] = setTimer(function()
									--
						end, 10000, 1)
					else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Já tem uma plantação aqui.")
					end
				else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem sementes suficiente.")
				end
			else
				exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem fertilizante suficiente.")
			end
		else
			exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Somente membros de gang pode executar essa ação.")
		end
	end
end
addCommandHandler("plantar", plantarM03) --Comando para plantar a maconha

-------------------Função Reaparecer maker --------------------------------

function GERAR_MARKER_PLANTAR3 ()
    MARKER_PLANTAR03 = createMarker (-1428.273, -1553.377, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)
end


---------------------------------------------------------------------------------------------------------------------------------------



-------------------------------Marker plantar----------------------------------- 

local MARKER_PLANTAR04 = createMarker (-1435.153, -1553.822, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)

-----------------------------------------------

-------------------------------------------------
function mensagemPre (playerSource)
	exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "info", "Para plantar digite /plantar")   
   --outputChatBox("#0000ff[INFO] #ffffffPara pegar o pé da maconha digite /pmaconha", playerSource, 255, 255, 255, true) --Mensagem ao passar no marker para pegar o pé de maconha
end
addEventHandler("onMarkerHit", MARKER_PLANTAR04, mensagemPre)

local TimerM4 = {}

function plantarM04(playerSource)
    if isElementWithinMarker(playerSource, MARKER_PLANTAR04) then
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)),aclGetGroup("Gang")) then
			if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "fertilizante", 0, 1, nil) then
				if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "sementemaconha", 0, 1, nil) then
					if not isTimer(TimerM4[playerSource]) then
						setPedFrozen(playerSource, true)
						Broto04 = createObject(3409, -1435.153, -1553.822, 101.758 -1)
						setPedAnimation(playerSource, "BOMBER", "BOM_Plant", 2600, true, false, false, false) --Animação que acontecerá ao digitar /plantar
						setTimer(setPedAnimation, 2600, 1, playerSource)
						setObjectScale(Broto04, 0.03)
						destroyElement(MARKER_PLANTAR04)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "fertilizante", 1)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "sementemaconha", 1)
						------------------------------------------    
						setTimer(function()
						setPedFrozen(playerSource, false)
						outputChatBox("#0000ff[INFO] #ffffffVocê plantou a maconha, aguarde ela crescer para colher", playerSource, 255, 255, 255, true) --Mensagem ao dar /plantar
						end, 2600, 1)

						setTimer(function()
						destroyElement(Broto04)
						Maconha33 = createObject(3409, -1435.153, -1553.822, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha33, 0.06)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 5000, 1)
						--------------------------------------------
						setTimer(function()
						destroyElement(Maconha33)
						Maconha34 = createObject(3409, -1435.153, -1553.822, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha34, 0.15)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 10000, 1)
						--------------------------------------------	

						setTimer(function()
						destroyElement(Maconha34)
						Maconha35 = createObject(3409, -1435.153, -1553.822, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha35, 0.25)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 15000, 1)

						setTimer(function()
						destroyElement(Maconha35)
						Maconha36 = createObject(3409, -1435.153, -1553.822, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha36, 0.35)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 20000, 1)

						setTimer(function()
						destroyElement(Maconha36)
						Maconha37 = createObject(3409, -1435.153, -1553.822, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha37, 0.45)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 25000, 1)


						setTimer(function()
						destroyElement(Maconha37)
						Maconha37 = createObject(3409, -1435.153, -1553.822, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha37, 0.55)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 30000, 1)

						setTimer(function()
						destroyElement(Maconha37)
						Maconha38 = createObject(3409, -1435.153, -1553.822, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha38, 0.65)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 35000, 1)


						setTimer(function()
						destroyElement(Maconha38)
						Maconha39 = createObject(3409, -1435.153, -1553.822, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha39, 0.75)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 40000, 1)


						setTimer(function()
						destroyElement(Maconha39)
						Maconha40 = createObject(3409, -1435.153, -1553.822, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha40, 0.85)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 45000, 1)


						setTimer(function()
						destroyElement(Maconha40)
						Maconha41 = createObject(3409, -1435.153, -1553.822, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha41, 0.95)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 50000, 1)

						setTimer(function()
						destroyElement(Maconha41)
						Maconha42 = createObject(3409, -1435.153, -1553.822, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 55000, 1)

						setTimer(function()
						destroyElement(Maconha42)
						outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						exports["[GlobalDrops]InventarioCompleto"]:sendItem(playerSource, "budmaconha", 0, 1, "none", false)
						triggerEvent("GiveExp", playerSource, playerSource, 3)
						exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "success", "Você colheu uma bud de maconha.")
						setTimer(GERAR_MARKER_PLANTAR4, 1000, 1)
						end, 60000, 1)
						TimerM4[playerSource] = setTimer(function()
									--
						end, 10000, 1)
					else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Já tem uma plantação aqui.")
					end
				else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem sementes suficiente.")
				end
			else
				exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem fertilizante suficiente.")
			end
		else
			exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Somente membros de gang pode executar essa ação.")
		end
	end
end
addCommandHandler("plantar", plantarM04) --Comando para plantar a maconha

-------------------Função Reaparecer maker --------------------------------

function GERAR_MARKER_PLANTAR4 ()
    MARKER_PLANTAR04 = createMarker (-1435.153, -1553.822, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)
end



---------------------------------------------------------------------------------------------------------------------------------------



-------------------------------Marker plantar----------------------------------- 

local MARKER_PLANTAR05 = createMarker (-1435.162, -1547.837, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)

-----------------------------------------------

-------------------------------------------------
function mensagemPre (playerSource)
	exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "info", "Para plantar digite /plantar")   
   --outputChatBox("#0000ff[INFO] #ffffffPara pegar o pé da maconha digite /pmaconha", playerSource, 255, 255, 255, true) --Mensagem ao passar no marker para pegar o pé de maconha
end
addEventHandler("onMarkerHit", MARKER_PLANTAR05, mensagemPre)

local TimerM5 = {}

function plantarM05(playerSource)
    if isElementWithinMarker(playerSource, MARKER_PLANTAR05) then
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)),aclGetGroup("Gang")) then
			if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "fertilizante", 0, 1, nil) then
				if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "sementemaconha", 0, 1, nil) then
					if not isTimer(TimerM5[playerSource]) then
						setPedFrozen(playerSource, true)
						Broto05 = createObject(3409, -1435.162, -1547.837, 101.758 -1)
						setPedAnimation(playerSource, "BOMBER", "BOM_Plant", 2600, true, false, false, false) --Animação que acontecerá ao digitar /plantar
						setTimer(setPedAnimation, 2600, 1, playerSource)
						setObjectScale(Broto05, 0.03)
						destroyElement(MARKER_PLANTAR05)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "fertilizante", 1)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "sementemaconha", 1)
						------------------------------------------    
						setTimer(function()
						setPedFrozen(playerSource, false)
						outputChatBox("#0000ff[INFO] #ffffffVocê plantou a maconha, aguarde ela crescer para colher", playerSource, 255, 255, 255, true) --Mensagem ao dar /plantar
						end, 2600, 1)

						setTimer(function()
						destroyElement(Broto05)
						Maconha43 = createObject(3409, -1435.162, -1547.837, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha43, 0.06)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 5000, 1)
						--------------------------------------------
						setTimer(function()
						destroyElement(Maconha43)
						Maconha44 = createObject(3409, -1435.162, -1547.837, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha44, 0.15)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 10000, 1)
						--------------------------------------------	

						setTimer(function()
						destroyElement(Maconha44)
						Maconha45 = createObject(3409, -1435.162, -1547.837, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha45, 0.25)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 15000, 1)

						setTimer(function()
						destroyElement(Maconha45)
						Maconha46 = createObject(3409, -1435.162, -1547.837, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha46, 0.35)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 20000, 1)

						setTimer(function()
						destroyElement(Maconha46)
						Maconha47 = createObject(3409, -1435.162, -1547.837, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha47, 0.45)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 25000, 1)


						setTimer(function()
						destroyElement(Maconha47)
						Maconha48 = createObject(3409, -1435.162, -1547.837, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha48, 0.55)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 30000, 1)

						setTimer(function()
						destroyElement(Maconha48)
						Maconha49 = createObject(3409, -1435.162, -1547.837, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha49, 0.65)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 35000, 1)


						setTimer(function()
						destroyElement(Maconha49)
						Maconha50 = createObject(3409, -1435.162, -1547.837, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha50, 0.75)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 40000, 1)


						setTimer(function()
						destroyElement(Maconha50)
						Maconha51 = createObject(3409, -1435.162, -1547.837, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha51, 0.85)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 45000, 1)


						setTimer(function()
						destroyElement(Maconha51)
						Maconha52 = createObject(3409, -1435.162, -1547.837, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha52, 0.95)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 50000, 1)

						setTimer(function()
						destroyElement(Maconha52)
						Maconha53 = createObject(3409, -1435.162, -1547.837, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 55000, 1)

						setTimer(function()
						destroyElement(Maconha53)
						outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						exports["[GlobalDrops]InventarioCompleto"]:sendItem(playerSource, "budmaconha", 0, 1, "none", false)
						triggerEvent("GiveExp", playerSource, playerSource, 3)
						exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "success", "Você colheu uma bud de maconha.")
						setTimer(GERAR_MARKER_PLANTAR5, 1000, 1)
						end, 60000, 1)
						TimerM5[playerSource] = setTimer(function()
									--
						end, 10000, 1)
					else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Já tem uma plantação aqui.")
					end
				else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem sementes suficiente.")
				end
			else
				exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem fertilizante suficiente.")
			end
		else
			exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Somente membros de gang pode executar essa ação.")
		end
	end
end
addCommandHandler("plantar", plantarM05) --Comando para plantar a maconha

-------------------Função Reaparecer maker --------------------------------

function GERAR_MARKER_PLANTAR5 ()
    MARKER_PLANTAR05 = createMarker (-1435.162, -1547.837, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)
end



---------------------------------------------------------------------------------------------------------------------------------------



-------------------------------Marker plantar----------------------------------- 

local MARKER_PLANTAR06 = createMarker (-1435.176, -1541.445, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)

-----------------------------------------------

-------------------------------------------------
function mensagemPre (playerSource)
	exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "info", "Para plantar digite /plantar")   
   --outputChatBox("#0000ff[INFO] #ffffffPara pegar o pé da maconha digite /pmaconha", playerSource, 255, 255, 255, true) --Mensagem ao passar no marker para pegar o pé de maconha
end
addEventHandler("onMarkerHit", MARKER_PLANTAR06, mensagemPre)

local TimerM6 = {}

function plantarM06(playerSource)
    if isElementWithinMarker(playerSource, MARKER_PLANTAR06) then
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)),aclGetGroup("Gang")) then
			if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "fertilizante", 0, 1, nil) then
				if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "sementemaconha", 0, 1, nil) then
					if not isTimer(TimerM6[playerSource]) then
						setPedFrozen(playerSource, true)
						Broto06 = createObject(3409, -1435.176, -1541.445, 101.758 -1)
						setPedAnimation(playerSource, "BOMBER", "BOM_Plant", 2600, true, false, false, false) --Animação que acontecerá ao digitar /plantar
						setTimer(setPedAnimation, 2600, 1, playerSource)
						setObjectScale(Broto06, 0.03)
						destroyElement(MARKER_PLANTAR06)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "fertilizante", 1)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "sementemaconha", 1)
						------------------------------------------    
						setTimer(function()
						setPedFrozen(playerSource, false)
						outputChatBox("#0000ff[INFO] #ffffffVocê plantou a maconha, aguarde ela crescer para colher", playerSource, 255, 255, 255, true) --Mensagem ao dar /plantar
						end, 2600, 1)

						setTimer(function()
						destroyElement(Broto06)
						Maconha54 = createObject(3409, -1435.176, -1541.445, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha54, 0.06)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 5000, 1)
						--------------------------------------------
						setTimer(function()
						destroyElement(Maconha54)
						Maconha55 = createObject(3409, -1435.176, -1541.445, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha55, 0.15)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 10000, 1)
						--------------------------------------------	

						setTimer(function()
						destroyElement(Maconha55)
						Maconha56 = createObject(3409, -1435.176, -1541.445, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha56, 0.25)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 15000, 1)

						setTimer(function()
						destroyElement(Maconha56)
						Maconha57 = createObject(3409, -1435.176, -1541.445, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha57, 0.35)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 20000, 1)

						setTimer(function()
						destroyElement(Maconha57)
						Maconha58 = createObject(3409, -1435.176, -1541.445, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha58, 0.45)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 25000, 1)


						setTimer(function()
						destroyElement(Maconha58)
						Maconha59 = createObject(3409, -1435.176, -1541.445, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha59, 0.55)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 30000, 1)

						setTimer(function()
						destroyElement(Maconha59)
						Maconha60 = createObject(3409, -1435.176, -1541.445, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha60, 0.65)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 35000, 1)


						setTimer(function()
						destroyElement(Maconha60)
						Maconha61 = createObject(3409, -1435.176, -1541.445, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha61, 0.75)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 40000, 1)


						setTimer(function()
						destroyElement(Maconha61)
						Maconha62 = createObject(3409, -1435.176, -1541.445, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha62, 0.85)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 45000, 1)


						setTimer(function()
						destroyElement(Maconha62)
						Maconha63 = createObject(3409, -1435.176, -1541.445, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha63, 0.95)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 50000, 1)

						setTimer(function()
						destroyElement(Maconha63)
						Maconha64 = createObject(3409, -1435.176, -1541.445, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 55000, 1)

						setTimer(function()
						destroyElement(Maconha64)
						outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						exports["[GlobalDrops]InventarioCompleto"]:sendItem(playerSource, "budmaconha", 0, 1, "none", false)
						triggerEvent("GiveExp", playerSource, playerSource, 3)
						exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "success", "Você colheu uma bud de maconha.")
						setTimer(GERAR_MARKER_PLANTAR6, 1000, 1)
						end, 60000, 1)
						TimerM6[playerSource] = setTimer(function()
									--
						end, 10000, 1)
					else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Já tem uma plantação aqui.")
					end
				else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem sementes suficiente.")
				end
			else
				exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem fertilizante suficiente.")
			end
		else
			exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Somente membros de gang pode executar essa ação.")
		end
	end
end
addCommandHandler("plantar", plantarM06) --Comando para plantar a maconha

-------------------Função Reaparecer maker --------------------------------

function GERAR_MARKER_PLANTAR6 ()
    MARKER_PLANTAR06 = createMarker (-1435.176, -1541.445, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)
end


---------------------------------------------------------------------------------------------------------------------------------------



-------------------------------Marker plantar----------------------------------- 

local MARKER_PLANTAR07 = createMarker (-1442.836, -1553.511, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)

-----------------------------------------------

-------------------------------------------------
function mensagemPre (playerSource)
	exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "info", "Para plantar digite /plantar")   
   --outputChatBox("#0000ff[INFO] #ffffffPara pegar o pé da maconha digite /pmaconha", playerSource, 255, 255, 255, true) --Mensagem ao passar no marker para pegar o pé de maconha
end
addEventHandler("onMarkerHit", MARKER_PLANTAR07, mensagemPre)

local TimerM7 = {}

function plantarM07(playerSource)
    if isElementWithinMarker(playerSource, MARKER_PLANTAR07) then
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)),aclGetGroup("Gang")) then
			if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "fertilizante", 0, 1, nil) then
				if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "sementemaconha", 0, 1, nil) then
					if not isTimer(TimerM7[playerSource]) then
						setPedFrozen(playerSource, true)
						Broto07 = createObject(3409, -1435.176, -1541.445, 101.758 -1)
						setPedAnimation(playerSource, "BOMBER", "BOM_Plant", 2600, true, false, false, false) --Animação que acontecerá ao digitar /plantar
						setTimer(setPedAnimation, 2600, 1, playerSource)
						setObjectScale(Broto07, 0.03)
						destroyElement(MARKER_PLANTAR07)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "fertilizante", 1)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "sementemaconha", 1)
						------------------------------------------    
						setTimer(function()
						setPedFrozen(playerSource, false)
						outputChatBox("#0000ff[INFO] #ffffffVocê plantou a maconha, aguarde ela crescer para colher", playerSource, 255, 255, 255, true) --Mensagem ao dar /plantar
						end, 2600, 1)

						setTimer(function()
						destroyElement(Broto07)
						Maconha65 = createObject(3409, -1442.836, -1553.511, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha65, 0.06)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 5000, 1)
						--------------------------------------------
						setTimer(function()
						destroyElement(Maconha65)
						Maconha66 = createObject(3409, -1442.836, -1553.511, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha66, 0.15)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 10000, 1)
						--------------------------------------------	

						setTimer(function()
						destroyElement(Maconha66)
						Maconha67 = createObject(3409, -1442.836, -1553.511, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha67, 0.25)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 15000, 1)

						setTimer(function()
						destroyElement(Maconha67)
						Maconha68 = createObject(3409, -1442.836, -1553.511, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha68, 0.35)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 20000, 1)

						setTimer(function()
						destroyElement(Maconha68)
						Maconha69 = createObject(3409, -1442.836, -1553.511, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha69, 0.45)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 25000, 1)


						setTimer(function()
						destroyElement(Maconha69)
						Maconha70 = createObject(3409, -1442.836, -1553.511, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha70, 0.55)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 30000, 1)

						setTimer(function()
						destroyElement(Maconha70)
						Maconha71 = createObject(3409, -1442.836, -1553.511, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha71, 0.65)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 35000, 1)


						setTimer(function()
						destroyElement(Maconha71)
						Maconha72 = createObject(3409, -1442.836, -1553.511, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha72, 0.75)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 40000, 1)


						setTimer(function()
						destroyElement(Maconha72)
						Maconha73 = createObject(3409, -1442.836, -1553.511, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha73, 0.85)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 45000, 1)


						setTimer(function()
						destroyElement(Maconha73)
						Maconha74 = createObject(3409, -1442.836, -1553.511, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha74, 0.95)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 50000, 1)

						setTimer(function()
						destroyElement(Maconha74)
						Maconha75 = createObject(3409, -1442.836, -1553.511, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 55000, 1)

						setTimer(function()
						destroyElement(Maconha75)
						outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						exports["[GlobalDrops]InventarioCompleto"]:sendItem(playerSource, "budmaconha", 0, 1, "none", false)
						triggerEvent("GiveExp", playerSource, playerSource, 3)
						exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "success", "Você colheu uma bud de maconha.")
						setTimer(GERAR_MARKER_PLANTAR7, 1000, 1)
						end, 60000, 1)
						TimerM7[playerSource] = setTimer(function()
									--
						end, 10000, 1)
					else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Já tem uma plantação aqui.")
					end
				else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem sementes suficiente.")
				end
			else
				exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem fertilizante suficiente.")
			end
		else
			exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Somente membros de gang pode executar essa ação.")
		end
	end
end
addCommandHandler("plantar", plantarM07) --Comando para plantar a maconha

-------------------Função Reaparecer maker --------------------------------

function GERAR_MARKER_PLANTAR7 ()
    MARKER_PLANTAR07 = createMarker (-1442.836, -1553.511, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)
end


---------------------------------------------------------------------------------------------------------------------------------------



-------------------------------Marker plantar----------------------------------- 

local MARKER_PLANTAR08 = createMarker (-1442.829, -1547.342, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)

-----------------------------------------------

-------------------------------------------------
function mensagemPre (playerSource)
	exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "info", "Para plantar digite /plantar")   
   --outputChatBox("#0000ff[INFO] #ffffffPara pegar o pé da maconha digite /pmaconha", playerSource, 255, 255, 255, true) --Mensagem ao passar no marker para pegar o pé de maconha
end
addEventHandler("onMarkerHit", MARKER_PLANTAR08, mensagemPre)

local TimerM8 = {}

function plantarM08(playerSource)
    if isElementWithinMarker(playerSource, MARKER_PLANTAR08) then
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)),aclGetGroup("Gang")) then
			if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "fertilizante", 0, 1, nil) then
				if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "sementemaconha", 0, 1, nil) then
					if not isTimer(TimerM8[playerSource]) then
						setPedFrozen(playerSource, true)
						Broto08 = createObject(3409, -1442.829, -1547.342, 101.758 -1)
						setPedAnimation(playerSource, "BOMBER", "BOM_Plant", 2600, true, false, false, false) --Animação que acontecerá ao digitar /plantar
						setTimer(setPedAnimation, 2600, 1, playerSource)
						setObjectScale(Broto08, 0.03)
						destroyElement(MARKER_PLANTAR08)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "fertilizante", 1)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "sementemaconha", 1)
						------------------------------------------    
						setTimer(function()
						setPedFrozen(playerSource, false)
						outputChatBox("#0000ff[INFO] #ffffffVocê plantou a maconha, aguarde ela crescer para colher", playerSource, 255, 255, 255, true) --Mensagem ao dar /plantar
						end, 2600, 1)

						setTimer(function()
						destroyElement(Broto08)
						Maconha76 = createObject(3409, -1442.829, -1547.342, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha76, 0.06)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 5000, 1)
						--------------------------------------------
						setTimer(function()
						destroyElement(Maconha76)
						Maconha77 = createObject(3409, -1442.829, -1547.342, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha77, 0.15)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 10000, 1)
						--------------------------------------------	

						setTimer(function()
						destroyElement(Maconha77)
						Maconha78 = createObject(3409, -1442.829, -1547.342, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha78, 0.25)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 15000, 1)

						setTimer(function()
						destroyElement(Maconha78)
						Maconha79 = createObject(3409, -1442.829, -1547.342, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha79, 0.35)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 20000, 1)

						setTimer(function()
						destroyElement(Maconha79)
						Maconha80 = createObject(3409, -1442.829, -1547.342, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha80, 0.45)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 25000, 1)


						setTimer(function()
						destroyElement(Maconha80)
						Maconha81 = createObject(3409, -1442.829, -1547.342, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha81, 0.55)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 30000, 1)

						setTimer(function()
						destroyElement(Maconha81)
						Maconha82 = createObject(3409, -1442.829, -1547.342, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha82, 0.65)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 35000, 1)


						setTimer(function()
						destroyElement(Maconha82)
						Maconha83 = createObject(3409, -1442.829, -1547.342, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha83, 0.75)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 40000, 1)


						setTimer(function()
						destroyElement(Maconha83)
						Maconha84 = createObject(3409, -1442.829, -1547.342, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha84, 0.85)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 45000, 1)


						setTimer(function()
						destroyElement(Maconha84)
						Maconha85 = createObject(3409, -1442.829, -1547.342, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha85, 0.95)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 50000, 1)

						setTimer(function()
						destroyElement(Maconha85)
						Maconha86 = createObject(3409, -1442.829, -1547.342, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 55000, 1)

						setTimer(function()
						destroyElement(Maconha86)
						outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						exports["[GlobalDrops]InventarioCompleto"]:sendItem(playerSource, "budmaconha", 0, 1, "none", false)
						triggerEvent("GiveExp", playerSource, playerSource, 3)
						exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "success", "Você colheu uma bud de maconha.")
						setTimer(GERAR_MARKER_PLANTAR8, 1000, 1)
						end, 60000, 1)
						TimerM8[playerSource] = setTimer(function()
									--
						end, 10000, 1)
					else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Já tem uma plantação aqui.")
					end
				else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem sementes suficiente.")
				end
			else
				exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem fertilizante suficiente.")
			end
		else
			exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Somente membros de gang pode executar essa ação.")
		end
	end
end
addCommandHandler("plantar", plantarM08) --Comando para plantar a maconha

-------------------Função Reaparecer maker --------------------------------

function GERAR_MARKER_PLANTAR8 ()
    MARKER_PLANTAR08 = createMarker (-1442.829, -1547.342, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)
end



---------------------------------------------------------------------------------------------------------------------------------------



-------------------------------Marker plantar----------------------------------- 

local MARKER_PLANTAR09 = createMarker (-1442.922, -1541.313, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)

-----------------------------------------------

-------------------------------------------------
function mensagemPre (playerSource)
	exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "info", "Para plantar digite /plantar")   
   --outputChatBox("#0000ff[INFO] #ffffffPara pegar o pé da maconha digite /pmaconha", playerSource, 255, 255, 255, true) --Mensagem ao passar no marker para pegar o pé de maconha
end
addEventHandler("onMarkerHit", MARKER_PLANTAR09, mensagemPre)

local TimerM9 = {}

function plantarM09(playerSource)
    if isElementWithinMarker(playerSource, MARKER_PLANTAR09) then
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)),aclGetGroup("Gang")) then
			if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "fertilizante", 0, 1, nil) then
				if exports["[GlobalDrops]InventarioCompleto"]:hasItemInventory(playerSource, "sementemaconha", 0, 1, nil) then
					if not isTimer(TimerM9[playerSource]) then
						setPedFrozen(playerSource, true)
						Broto09 = createObject(3409, -1442.922, -1541.313, 101.758 -1)
						setPedAnimation(playerSource, "BOMBER", "BOM_Plant", 2600, true, false, false, false) --Animação que acontecerá ao digitar /plantar
						setTimer(setPedAnimation, 2600, 1, playerSource)
						setObjectScale(Broto09, 0.03)
						destroyElement(MARKER_PLANTAR09)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "fertilizante", 1)
						exports["[GlobalDrops]InventarioCompleto"]:takeItem(playerSource, nil, "sementemaconha", 1)
						------------------------------------------    
						setTimer(function()
						setPedFrozen(playerSource, false)
						outputChatBox("#0000ff[INFO] #ffffffVocê plantou a maconha, aguarde ela crescer para colher", playerSource, 255, 255, 255, true) --Mensagem ao dar /plantar
						end, 2600, 1)

						setTimer(function()
						destroyElement(Broto09)
						Maconha87 = createObject(3409, -1442.922, -1541.313, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha87, 0.06)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 5000, 1)
						--------------------------------------------
						setTimer(function()
						destroyElement(Maconha87)
						Maconha88 = createObject(3409, -1442.922, -1541.313, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha88, 0.15)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 10000, 1)
						--------------------------------------------	

						setTimer(function()
						destroyElement(Maconha88)
						Maconha89 = createObject(3409, -1442.922, -1541.313, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha89, 0.25)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 15000, 1)

						setTimer(function()
						destroyElement(Maconha89)
						Maconha90 = createObject(3409, -1442.922, -1541.313, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha90, 0.35)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 20000, 1)

						setTimer(function()
						destroyElement(Maconha90)
						Maconha91 = createObject(3409, -1442.922, -1541.313, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha91, 0.45)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 25000, 1)


						setTimer(function()
						destroyElement(Maconha91)
						Maconha92 = createObject(3409, -1442.922, -1541.313, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha92, 0.55)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 30000, 1)

						setTimer(function()
						destroyElement(Maconha92)
						Maconha93 = createObject(3409, -1442.922, -1541.313, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha93, 0.65)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 35000, 1)


						setTimer(function()
						destroyElement(Maconha93)
						Maconha94 = createObject(3409, -1442.922, -1541.313, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha94, 0.75)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 40000, 1)


						setTimer(function()
						destroyElement(Maconha94)
						Maconha95 = createObject(3409, -1442.922, -1541.313, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha95, 0.85)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 45000, 1)


						setTimer(function()
						destroyElement(Maconha95)
						Maconha96 = createObject(3409, -1442.922, -1541.313, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						setObjectScale(Maconha96, 0.95)
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 50000, 1)

						setTimer(function()
						destroyElement(Maconha96)
						Maconha97 = createObject(3409, -1442.922, -1541.313, 101.758 -1) --ID, X, Y, Z Para mudar a planta troque o 675 por um id de objeto
						--outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						end, 55000, 1)

						setTimer(function()
						destroyElement(Maconha97)
						outputChatBox("#0000ff[INFO] #ffffffSua maconha cresceu.", playerSource, 255, 255, 255, true) --Mensagem dps de dar /plantar
						exports["[GlobalDrops]InventarioCompleto"]:sendItem(playerSource, "budmaconha", 0, 1, "none", false)
						triggerEvent("GiveExp", playerSource, playerSource, 3)
						exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "success", "Você colheu uma bud de maconha.")
						setTimer(GERAR_MARKER_PLANTAR9, 1000, 1)
						end, 60000, 1)
						TimerM9[playerSource] = setTimer(function()
									--
						end, 10000, 1)
					else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Já tem uma plantação aqui.")
					end
				else
					exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem sementes suficiente.")
				end
			else
				exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Você não tem fertilizante suficiente.")
			end
		else
			exports["[GlobalDrops]InventarioCompleto"]:sendNotification(playerSource, "error", "Somente membros de gang pode executar essa ação.")
		end
	end
end
addCommandHandler("plantar", plantarM09) --Comando para plantar a maconha

-------------------Função Reaparecer maker --------------------------------

function GERAR_MARKER_PLANTAR9 ()
    MARKER_PLANTAR09 = createMarker (-1442.922, -1541.313, 101.758 -1, "cylinder", 1.5, 59, 191, 75, 100)
end