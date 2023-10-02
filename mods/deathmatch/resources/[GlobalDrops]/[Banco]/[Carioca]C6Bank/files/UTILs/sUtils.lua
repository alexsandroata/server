function isElementPlayer(element)
    if (element and isElement(element) and getElementType(element) == "player") then
        return true
    end
    return false
end

function removeHex(text, digits)
    assert(type(text) == "string", "Bad argument 1 @ removeHex [String expected, got " .. tostring(text) .. "]")
    assert(digits == nil or (type(digits) == "number" and digits > 0), "Bad argument 2 @ removeHex [Number greater than zero expected, got " .. tostring(digits) .. "]")
    return string.gsub(text, "#" .. (digits and string.rep("%x", digits) or "%x+"), "")
end

function formatNumber(number) 
    while true do      
        number, k = string.gsub(number, "^(-?%d+)(%d%d%d)", '%1.%2')    
        if (k == 0) then      
            break   
        end  
    end  
    return number
end

function getPlayerByID(id)
    if (id and type(id) == "number") then
        for k, player in ipairs(getElementsByType("player")) do
            if ((getElementData(player, "ID") or "N/A") == id) then
                return player
            end
        end
    end
    return false
end