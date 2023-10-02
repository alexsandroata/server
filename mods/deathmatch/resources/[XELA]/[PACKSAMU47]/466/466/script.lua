-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '466.txd' ) 
engineImportTXD( txd, 466 ) 
dff = engineLoadDFF('466.dff', 466) 
engineReplaceModel( dff, 466 )
end)
