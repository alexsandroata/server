local Interface = {
    Visible = false,
    Radius = {0, 0}
}

local Scroll = {
    List = {},
    Pag = 0,
    Select = 0,
    Max = 9
}

function Shop ()
    alpha = interpolate (Interface.Radius[1], Interface.Radius[2], 0.09, 'alpha')
    dxDrawRectangle (513, 189, 339, 381, tocolor (21, 21, 21, alpha))
    dxDrawText ('Loja', 543, 189, 101, 35, tocolor (255, 255, 255, alpha), 1.00, dxCreateFont ('assets/fonts/Roboto-Regular.ttf', 9), 'left', 'center')
    dxDrawText ('x', 817, 189, 35, 35, tocolor (255, 255, 255, alpha), 1.00, dxCreateFont ('assets/fonts/Roboto-Regular.ttf', 9), 'center', 'center')
    dxDrawRectangle (523, 224, 320, 29, tocolor (32, 32, 32, alpha))
    dxDrawText ('Produto', 523, 224, 105, 29, tocolor (255, 255, 255, alpha), 1.00, dxCreateFont ('assets/fonts/Roboto-Regular.ttf', 9), 'center', 'center')
    dxDrawText ('Estoque', 630, 224, 105, 29, tocolor (255, 255, 255, alpha), 1.00, dxCreateFont ('assets/fonts/Roboto-Regular.ttf', 9), 'center', 'center')
    dxDrawText ('Valor', 738, 224, 105, 29, tocolor (255, 255, 255, alpha), 1.00, dxCreateFont ('assets/fonts/Roboto-Regular.ttf', 9), 'center', 'center')
    for key = 1, Scroll.Max do
        local response = Scroll.List[key + Scroll.Pag]
        if response then
            local y = (253 + (282 - 253) * key - (282 - 253))
            dxDrawRectangle (523, y, 320, 29, (Scroll.Select == (key + Scroll.Pag) and tocolor (58, 134, 225, alpha) or isCursorOnElement (523, y, 319, 29) and tocolor (58, 134, 225, alpha) or tocolor (0, 0, 0, 0)))
            dxDrawText (response.name_item, 523, y, 105, 29, tocolor (222, 222, 222, alpha), 1.00, dxCreateFont ('assets/fonts/Roboto-Regular.ttf', 9), 'center', 'center')
            dxDrawText ('INF', 630, y, 105, 29, tocolor (222, 222, 222, alpha), 1.00, dxCreateFont ('assets/fonts/Roboto-Regular.ttf', 9), 'center', 'center')
            dxDrawText ('R$ '..convertNumber (response.price)..',00', 738, y, 105, 29, tocolor (222, 222, 222, alpha), 1.00, dxCreateFont ('assets/fonts/Roboto-Regular.ttf', 9), 'center', 'center')
        end
    end
    dxDrawRectangle (523, 519, 319, 41, (isCursorOnElement (523, 519, 319, 41) and tocolor (58, 134, 225, alpha) or tocolor (32, 32, 32, alpha)))
    dxDrawText ('Comprar', 523, 519, 319, 41, tocolor (255, 255, 255, alpha), 1.00, dxCreateFont ('assets/fonts/Roboto-Regular.ttf', 11), 'center', 'center')
end

function ToggleShop (method, ...)
    local response = {...}
    if method then
        if Interface.Visible then
            return false
        end
        Interface.Visible = true
        Interface.Radius = {Interface.Radius[2], 255}
        Scroll = {List = response[1], Pag = 0, Max = 10}
        showCursor (true)
        addEventHandler ('onClientRender', getRootElement (), Shop, true, 'low-5')
    end
    if not method then
        if not Interface.Visible then
            return
        end
        Interface.Visible = false
        Interface.Radius = {Interface.Radius[2], 0}
        showCursor (false)
        setTimer (function ()
            removeEventHandler ('onClientRender', getRootElement (), Shop, true, 'low-5')
        end, 1000, 1)
    end
end

createEventHandler ('toggle', localPlayer, function (tbl)
    if #tbl == 0 then
        return false
    end
    return ToggleShop (not Interface.Visible, tbl)
end)

local function Clicks (button, state)
    if not Interface.Visible then
        return
    end
    if button == 'left' and state == 'down' then
        if isCursorOnElement (523, 519, 319, 41) then
            if Scroll.Select == 0 then
                sendMessage (localPlayer, 'client', 'Selecione o item que deseja comprar!', 'info')
                return false
            end
            triggerServerEvent ('buy', localPlayer, Scroll.List[Scroll.Select])
            return true
        end
        if isCursorOnElement (817, 189, 35, 35) then
            return ToggleShop (false)
        end
        for key = 1, Scroll.Max do
            local response = Scroll.List[key + Scroll.Pag]
            if response then
                local y = (253 + (282 - 253) * key - (282 - 253))
                if isCursorOnElement (523, y, 320, 29) then
                    Scroll.Select = key + Scroll.Pag
                    break
                else
                    Scroll.Select = 0
                end
            end
        end
    end
end
addEventHandler ('onClientClick', getRootElement (), Clicks, true, 'low-5')

function convertNumber (number, sep)
	local money = number
	for i = 1, tostring(money):len()/3 do
		money = string.gsub(money, '^(-?%d+)(%d%d%d)', '%1'..(sep and sep or '.')..'%2')
	end
	return money
end