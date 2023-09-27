function checkItem()
    local agua = tonumber(getElementData(localPlayer, "agua"))
    if agua and agua > 20 then
        setElementData(localPlayer, "agua", 20)
    end
end
setTimer(checkItem, 50, 0) 