function addBox(sourceElement, type, msg)
	triggerClientEvent(sourceElement, "addBox", sourceElement, type, msg)
end
addEvent("addBox", true)
addEventHandler("addBox", root, addBox)

addCommandHandler("b", function(source)
	exports["infobox"]:addBox(source, "info", "Teste infobox")
end)