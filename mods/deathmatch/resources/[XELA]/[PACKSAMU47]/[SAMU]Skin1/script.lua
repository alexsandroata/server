-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'SAMU_250.txd' ) 
engineImportTXD( txd, 250 ) 
dff = engineLoadDFF('SAMU_250.dff', 250) 
engineReplaceModel( dff, 250 )
end)
