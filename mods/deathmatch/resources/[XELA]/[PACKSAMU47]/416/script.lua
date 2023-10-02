-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '416.txd' ) 
engineImportTXD( txd, 416 ) 
dff = engineLoadDFF('416.dff', 416) 
engineReplaceModel( dff, 416 )
end)
