function Bz ()
Bz2 = engineLoadTXD ( "3095.txd" )
engineImportTXD ( Bz2, 3095 )

end
addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()), Bz )