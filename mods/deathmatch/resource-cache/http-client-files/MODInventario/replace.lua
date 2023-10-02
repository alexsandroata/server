txdReplace = {
	["capacete"] = {1937},
	["cutelo"] = {339},
	["maleta"] = {1939},
	["picareta"] = {333},
	["algema"] = {331},
	["porco"] = {1877},
	["oculos3"] = {1878},
	["colete1"] = {1879},
	["oculos2"] = {1880},
	["mochila2"] = {1881},
	["cavalo"] = {1882},
	["touro"] = {1903},
	["sacola"] = {1904},
	["coldrepeito1"] = {1905},
	["cinturao"] = {1906},
	["bandana"] = {1907},
	["colete2"] = {1908},
	["bag"] = {1909},
	["mec"] = {1911},
	["cordao"] = {1912},
	["chapeu"] = {1913},
	["chapeu1"] = {1914},
	["mochila3"] = {1884},
	["mochila4"] = {1885},
	["asas"] = {1886},
	["iphone"] = {1890},
	["katana"] = {1891},
	["katana2"] = {1892},
	["bagnike"] = {1893},
	["bone3"] = {1894},
	["shoulder1"] = {1887},
	["mochila5"] = {1888},
	["mochila6"] = {1889},
	["bag2"] = {1883},
	["vara"] = {1950},
	["bone"] = {1951},
	["bone2"] = {1910},
	["oculos"] = {1952},
	["mergulho"] = {1953},
	["mochila1"] = {1922},
	["ak"] = {355},
	["hk"] = {356},
	["mtar"] = {353},
	["tec"] = {372},
	["doze"] = {349},
	["m1911"] = {348},
	["glock"] = {347},
	["taser"] = {346},
	["faca"] = {335},
	["taco"] = {336},
	["machado"] = {326},
	["cabra"] = {323},
	["sktbd"] = {509},
}

function onResourceStart()
	for i, v in pairs(txdReplace) do
		local txd = engineLoadTXD("txd/"..i..".txd")
		engineImportTXD(txd, txdReplace[i][1])
		local dff = engineLoadDFF("txd/"..i..".dff", txdReplace[i][1])
		engineReplaceModel(dff, txdReplace[i][1])
		if fileExists("txd/"..i..".col") then
			local col = engineLoadCOL("txd/"..i..".col")
			engineReplaceCOL(col, txdReplace[i][1])
		end
	end
end
addEventHandler("onClientResourceStart", resourceRoot, onResourceStart)