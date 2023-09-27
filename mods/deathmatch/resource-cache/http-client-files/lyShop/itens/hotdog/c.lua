function checkItem()
    local hotdog = tonumber(getElementData(localPlayer, "hotdog"))
    if hotdog and hotdog > 20 then
        setElementData(localPlayer, "hotdog", 20)
    end
end
setTimer(checkItem, 50, 0) 