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
addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD ( "super.txd" ) --Coloque o nome do TXD
engineImportTXD ( txd, 1279 ) --Coloque o ID do objeto que você quer modificar
col = engineLoadCOL ( "super.col" ) --Coloque o nome do arquivo COL
engineReplaceCOL ( col, 1279 ) --Coloque o ID do objeto que você quer modificar
dff = engineLoadDFF ( "super.dff", 0 ) --Coloque o nome do DFF e não mexa nesse 0
engineReplaceModel ( dff, 1279 ) --Coloque o ID do objeto que você quer modificar
engineSetModelLODDistance(1279, 500) --ID do objeto e a distância que ele irá carregar - distancia está como 500
end)
