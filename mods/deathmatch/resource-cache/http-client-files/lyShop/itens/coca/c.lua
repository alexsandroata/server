function checkItem()
    local coca = tonumber(getElementData(localPlayer, "coca"))
    if coca and coca > 20 then
        setElementData(localPlayer, "coca", 20)
    end
end
setTimer(checkItem, 50, 0) 