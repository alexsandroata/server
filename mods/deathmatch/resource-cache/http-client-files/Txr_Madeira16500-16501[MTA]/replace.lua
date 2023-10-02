function Loja ()
Lojatxd = engineLoadTXD ( "1.txd" )
engineImportTXD ( Lojatxd, 16501)

Lojatxd2 = engineLoadTXD ( "1.txd" )
engineImportTXD ( Lojatxd2, 16500)

end
addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()), Loja )