function checkItem()
    local xtudo = tonumber(getElementData(localPlayer, "xtudo"))
    if xtudo and xtudo > 20 then
        setElementData(localPlayer, "xtudo", 20)
    end
end
setTimer(checkItem, 50, 0) 