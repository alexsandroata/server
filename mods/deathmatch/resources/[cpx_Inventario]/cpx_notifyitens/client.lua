--- ░█████╗░░█████╗░███╗░░██╗████████╗██╗░░░██╗ ░░██╗░░░░██╗██╗░░
--- ██╔══██╗██╔══██╗████╗░██║╚══██╔══╝██║░░░██║  ░██╔╝░░░██╔╝╚██╗░
--- ██║░░╚═╝███████║██╔██╗██║░░░██║░░░██║░░░██║  ██╔╝░░░██╔╝░░╚██╗
--- ██║░░██╗██╔══██║██║╚████║░░░██║░░░██║░░░██║  ╚██╗░░██╔╝░░░██╔╝
--- ╚█████╔╝██║░░██║██║░╚███║░░░██║░░░╚██████╔╝  ░╚██╗██╔╝░░░██╔╝░
--- ░╚════╝░╚═╝░░╚═╝╚═╝░░╚══╝░░░╚═╝░░░░╚═════╝░  ░░╚═╝╚═╝░░░░╚═╝░░

--- Qualquer duvida: Cantu#5945
--- Qualquer duvida: Cantu#0764
--- Qualquer duvida: Cantu#0007
--- Qualquer duvida: @cantuzinho

--- triggerClientEvent(source, "notifyitens", source, "nomeitem", "foto", "quantidade", "recebeu")

local sx, sy = guiGetScreenSize()
local link = "http://mta/"..getResourceName(getThisResource()).."/web-side/index.html"
local browser = createBrowser(sx, sy, true, true)
local player = {}

setDevelopmentMode(true, true)

function dxNUII()

    dxDrawImage(0, 0, sx, sy, browser)
    
    
end


function SendNUIMessage(browser, table)
    if isElement(browser) and type(table) == "table" then
       return executeBrowserJavascript(browser, 'window.postMessage('..toJSON(table)..'[0])')
    end
 end


function notifyitens(mode, item, amount, name)
    SendNUIMessage(browser, { mode = mode, item = item, amount = amount, name = name})
end
addEvent("notifyitens",true)
addEventHandler("notifyitens", root, notifyitens)



addEventHandler("onClientBrowserCreated", browser, function()
    loadBrowserURL(source, link)
end)




 
 addEventHandler( "onClientBrowserDocumentReady", browser, 
 function (url)

    addEventHandler( "onClientRender", getRootElement(), dxNUII)
 end)