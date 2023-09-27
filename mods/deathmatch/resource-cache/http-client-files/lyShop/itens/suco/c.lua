function checkItem()
    local suco = tonumber(getElementData(localPlayer, "suco"))
    if suco and suco > 20 then
        setElementData(localPlayer, "suco", 20)
    end
end
setTimer(checkItem, 50, 0) 