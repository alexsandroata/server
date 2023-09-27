function checkItem()
    local pizza = tonumber(getElementData(localPlayer, "pizza"))
    if pizza and pizza > 20 then
        setElementData(localPlayer, "pizza", 20)
    end
end
setTimer(checkItem, 50, 0) 