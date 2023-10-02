addEventHandler('onClientResourceStart', resourceRoot,
function()
local txd = engineLoadTXD('obj_skin_intra.txd',true)
engineImportTXD(txd, 1990)
local dff = engineLoadDFF('obj_skin_intra.dff', 0)
engineReplaceModel(dff, 1990)
local col = engineLoadCOL('obj_skin_intra.col')
engineReplaceCOL(col, 1990)
engineSetModelLODDistance(1990, 500)
end)


