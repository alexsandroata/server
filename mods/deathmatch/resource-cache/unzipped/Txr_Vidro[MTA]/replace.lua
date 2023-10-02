function Vidro1 ()
Lojatxd = engineLoadTXD ( "3095.txd" )
engineImportTXD ( Lojatxd, 1649 )

end
addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()), Vidro1 )

function Vidro2 ()
Loja1txd = engineLoadTXD ( "carshowglass_sfsx3.txd" )
engineImportTXD ( Loja1txd, 3851 )

end
addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()), Vidro2 )

function Vidro3 ()
Loja2txd = engineLoadTXD ( "carshowglass_sfsx.txd" )
engineImportTXD ( Loja2txd, 3850 )

end
addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()), Vidro3 )