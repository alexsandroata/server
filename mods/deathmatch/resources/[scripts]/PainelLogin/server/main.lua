--[[----------------------------------------------------
-- server script main
-- @author Banex
-- @update 25/03/2016 
----------------------------------------------------]]-- 

function PlayerLogin(username,password)
	if username == "" then
		return triggerClientEvent(source,"login_text",source,"error","Coloque seu nome de usuario!")
	end
	if password == "" then
		return triggerClientEvent(source,"login_text",source,"error","Coloque sua senha!")
	end
	local account = getAccount ( username, password )
	if account == false then
		return triggerClientEvent(source,"login_text",source,"error","Nome de usuario ou senha incorretos!")
	end
	logIn(source, account, password)
	triggerClientEvent(source,"onLogin",source)
	triggerClientEvent(source,"saveLoginToXML",source,username)
	triggerClientEvent(source,"login_text",source,"sucess","Logado com sucesso!")
end
addEvent("onRequestLogin",true)
addEventHandler("onRequestLogin",getRootElement(),PlayerLogin)

function registerPlayer(username,password)
	if username == "" then
		return triggerClientEvent(source,"login_text",source,"error","Coloque seu nome de usuario!")
	end
	if password == "" then
		return triggerClientEvent(source,"login_text",source,"error","Coloque sua senha!")
	end
	local account = getAccount (username,password)
	if account then
		return triggerClientEvent(source,"login_text",source,"error","Este nome de usuario já esta sendo usado!")
	end
	local accountAdded = addAccount(tostring(username),tostring(password))
	if not accountAdded then
		return triggerClientEvent(source,"login_text",source,"error","Erro! Tente novamente com um novo nome de usuario ou senha!")
	end
	outputChatBox ("[Usuario: #FFFFFF" .. username .. " #00FF00| Senha: #FFFFFF" .. password .. "#00FF00 ]",source,255,255,255,true)
	triggerClientEvent(source,"onRegister",source)
	triggerClientEvent(source,"login_text",source,"sucess","Conta criada com sucesso!")
end
addEvent("onRequestRegister",true)
addEventHandler("onRequestRegister",getRootElement(),registerPlayer)