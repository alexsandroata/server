function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if method == "ceil" or method == "floor" then 
        return math[method](number * factor) / factor
    else 
        return tonumber(("%."..decimals.."f"):format(number)) 
    end
end

function removeHex(text, digits)
    assert(type(text) == "string", "Bad argument 1 @ removeHex [String expected, got " .. tostring(text) .. "]")
    assert(digits == nil or (type(digits) == "number" and digits > 0), "Bad argument 2 @ removeHex [Number greater than zero expected, got " .. tostring(digits) .. "]")
    return string.gsub(text, "#" .. (digits and string.rep("%x", digits) or "%x+"), "")
end

function formatNumber(number) 
    while true do      
        number, k = string.gsub(number, "^(-?%d+)(%d%d%d)", '%1.%2')    
        if k==0 then      
            break   
        end  
    end  
    return number
end

function isCursorOnElement(posX, posY, width, height)
    if isCursorShowing() then
        local MouseX, MouseY = getCursorPosition()
        local clientW, clientH = guiGetScreenSize()
        local MouseX, MouseY = MouseX * clientW, MouseY * clientH
        if (MouseX > posX and MouseX < (posX + width) and MouseY > posY and MouseY < (posY + height)) then
            return true
        end
    end
    return false
end