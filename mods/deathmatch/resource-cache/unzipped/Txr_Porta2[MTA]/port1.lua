

txd = engineLoadTXD ( "objeto/1502.txd" ) --Coloque o nome do TXD
engineImportTXD ( txd, 1502 ) --Coloque o ID do objeto que voc� quer modificar
col = engineLoadCOL ( "objeto/1502.col" ) --Coloque o nome do arquivo COL
engineReplaceCOL ( col, 1502 ) --Coloque o ID do objeto que voc� quer modificar
dff = engineLoadDFF ( "objeto/1502.dff", 0 ) --Coloque o nome do DFF e n�o mexa nesse 0
engineReplaceModel ( dff, 1502, true ) --Coloque o ID do objeto que voc� quer modificar
engineSetModelLODDistance(1502, 500) --ID do objeto e a dist�ncia que ele ir� carregar - distancia est� como 500



setOcclusionsEnabled( false )

