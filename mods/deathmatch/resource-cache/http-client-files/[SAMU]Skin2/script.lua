-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'SAMU_275.txd' ) 
engineImportTXD( txd, 275 ) 
dff = engineLoadDFF('SAMU_275.dff', 275) 
engineReplaceModel( dff, 275 )
end)
