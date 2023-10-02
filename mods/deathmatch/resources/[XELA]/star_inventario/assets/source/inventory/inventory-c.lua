local Global = {
    ['Inv'] = {
        visible = false;
        chest = false;
        page = 'Personal';
    };
    ['Trade'] = {
        trade = false,
        type = false,
        attributes = {},
        progress = {
            active = true;
            level = 0;
        }
    },
    ['Tables'] = {
        items_server = {};
        items_slots = {};
        peso = {0, 0};
    };
    ['Move'] = {
        select = 0;
        select_use = 0;
    };
    ['Progress'] = {
        active = false;
        level = 0;
    };
    ['Animations'] = {
        alpha = {
            radius = {0, 1};
            tick = 0;
        };
        line = {
            radius = {259, 259};
            tick = 0;
        };
    };
    ['Clicks'] = {
        {position = {499, 281, 36, 36}, next_page = 'Personal', pos_line = 263};
        {position = {499, 372, 36, 36}, next_page = 'Foods', pos_line = 352};
        {position = {499, 458, 36, 36}, next_page = 'Ilegais', pos_line = 440};
        {position = {499, 544, 36, 36}, next_page = 'Utils', pos_line = 527};
    };
}

local assets = ':star_assets'
local PosSlot = {
    {552, 254};
    {552 + (617 - 552), 254};
    {552 + (617 - 552) * 2, 254};
    {552 + (617 - 552) * 3, 254};
    {552 + (617 - 552) * 4, 254};

    {552, 319};
    {552 + (617 - 552), 319};
    {552 + (617 - 552) * 2, 319};
    {552 + (617 - 552) * 3, 319};
    {552 + (617 - 552) * 4, 319};

    {552, 384};
    {552 + (617 - 552), 384};
    {552 + (617 - 552) * 2, 384};
    {552 + (617 - 552) * 3, 384};
    {552 + (617 - 552) * 4, 384};

    {552, 449};
    {552 + (617 - 552), 449};
    {552 + (617 - 552) * 2, 449};
    {552 + (617 - 552) * 3, 449};
    {552 + (617 - 552) * 4, 449};

    {552, 514};
    {552 + (617 - 552), 514};
    {552 + (617 - 552) * 2, 514};
    {552 + (617 - 552) * 3, 514};
    {552 + (617 - 552) * 4, 514};
}

local alpha, line = 0, 259, {0, 0};
function Inventory()
    alpha = interpolateBetween(Global.Animations.alpha.radius[1], 0, 0, Global.Animations.alpha.radius[2], 0, 0, (getTickCount() - Global.Animations.alpha.tick)/300, 'Linear');
    line = interpolateBetween(Global.Animations.line.radius[1], 0, 0, Global.Animations.line.radius[2], 0, 0, (getTickCount() - Global.Animations.line.tick)/300, 'OutQuad');

    dxDrawImage(482, 252, 395, 365, 'assets/images/bg_inventory.png', 0, 0, 0, tocolor(21, 21, 21, alpha * 255));
    dxDrawImage(552, 579, 323, 36, 'assets/images/bg_peso.png', 0, 0, 0, tocolor(32, 32, 32, alpha * 255));
    dxDrawImageSection(552, 579, 323 * Global.Tables.peso[1] / Global.Tables.peso[2], 36, 0, 0, 323 * Global.Tables.peso[1] / Global.Tables.peso[2], 36, 'assets/images/bg_peso.png', 0, 0, 0, tocolor (58, 134, 225, alpha * 255))
    dxDrawText(math.round(Global.Tables.peso[1], 2, 'Ceil')..'/'..math.round(Global.Tables.peso[2], 2, 'Ceil')..' kilos', 552, 579, 323, 36, tocolor(255, 255, 255, alpha * 255), 1.00, dxCreateFont('assets/fonts/Roboto-Regular.ttf', 10), 'center', 'center');
    dxDrawImage(552, 254, 323, 323, 'assets/images/slots.png', 0, 0, 0, tocolor(32, 32, 32, alpha * 255));
    dxDrawImage(484, 254, 66, 361, 'assets/images/bg_pages.png', 0, 0, 0, tocolor(32, 32, 32, alpha * 255));
    dxDrawImage(497, 277, 36, 299, 'assets/images/categorys.png', 0, 0, 0, tocolor(255, 255, 255, alpha * 255));
    dxDrawRectangle(547, line, 3, 72, tocolor(58, 134, 225, alpha * 255));
    local x, y = getCursorPosition ()
    if Global.Move.selectUse ~= 0 then
        for i, v in ipairs(Global.Tables.items_server[Global.Inv.page]) do
            local Index = returnIndexFromTable(Global.Move.selectUse);
            if v.Slot == Index then
                local Item = config['Items'][v.Item];
                dxDrawImage(482, 110, 395, 130, 'assets/images/bg_interaction.png', 0, 0, 0, tocolor(21, 21, 21, alpha * 255));
                if not Global.Inv.chest then
                    dxDrawImage(490 - 3, 209, 187, 26, 'assets/images/button.png', 0, 0, 0, (isCursorOnElement(490, 209, 187, 26) and tocolor(58, 134, 225, alpha * 255) or tocolor(32, 32, 32, alpha * 255)));
                    dxDrawText('Usar item', 490 - 3, 209, 187, 26, tocolor(244, 244, 244, alpha * 255), 1.00, dxCreateFont(assets..'/assets/font/SF/SF-Pro-Text-Regular.ttf', 10), 'center', 'center');
                    dxDrawImage(687 - 3, 209, 187, 26, 'assets/images/button.png', 0, 0, 0, (isCursorOnElement(687, 209, 187, 26) and tocolor(58, 134, 225, alpha * 255) or tocolor(32, 32, 32, alpha * 255)));
                    dxDrawText('Dropar item', 687 - 3, 209, 187, 26, tocolor(244, 244, 244, alpha * 255), 1.00, dxCreateFont(assets..'/assets/font/SF/SF-Pro-Text-Regular.ttf', 10), 'center', 'center');
                
                else
                    dxDrawImage(490 - 3, 209, ((187 + 5) * 2), 26, 'assets/images/chest_button.png', 0, 0, 0, (isCursorOnElement(490 - 3, 209, ((187 + 5) * 2), 26) and Global.Move.select ~= 0 and tocolor(58, 134, 225, alpha * 255) or tocolor(32, 32, 32, alpha * 255)));
                    dxDrawText('Retirar', 490 - 3, 209, ((187 + 5) * 2), 26, tocolor(244, 244, 244, alpha * 255), 1.00, dxCreateFont(assets..'/assets/font/SF/SF-Pro-Text-Regular.ttf', 10), 'center', 'center');
                end
                dxDrawText((Item.name_item and Item.name_item or 'undefined'), 491, 120, 389, 11, tocolor(255, 255, 255, alpha * 255), 1.00, dxCreateFont(assets..'/assets/font/SF/SF-Pro-Text-Regular.ttf', 11), 'left', 'center');
                dxDrawText((Item.description and Item.description or 'undefined'), 491, 137, 389, 11, tocolor(255, 255, 255, alpha * 255), 1.00, dxCreateFont(assets..'/assets/font/SF/SF-Pro-Text-Regular.ttf', 9), 'left', 'center', true);
                if Global.Progress.active then
                    progress = math.min(math.max(x - 487, 0), 385);
                end
                Global.Progress.level = math.floor(progress / 385 * v.Amount)
                dxDrawImage(490 - 3, 159, 385, 44, 'assets/images/progress.png', 0, 0, 0, tocolor(32, 32, 32, alpha * 255));
                dxDrawImageSection(490 - 3, 159, progress, 44, 0, 0, progress, 44, 'assets/images/progress.png', 0, 0, 0, tocolor(58, 134, 225, alpha * 255));
                dxDrawText((Global.Progress.level and Global.Progress.level..'x' or 'undefined'), 490 - 3, 159, 385, 44, tocolor(255, 255, 255, alpha * 255), 1.00, dxCreateFont('assets/fonts/Roboto-Regular.ttf', 10), 'center', 'center', true);
            end
        end
    end
    for i, v in ipairs(Global.Tables.items_server[Global.Inv.page]) do
        local Item = config['Items'][v.Item]
        local Slot = v.Slot
        local Index = returnIndexFromTable(Slot)
        if Index then
            local posX, posY = PosSlot[Index][1], PosSlot[Index][2]
            local posX2, posY2 = ((posX) + (63/2)) - (Item['image'].w/2), ((posY) + (63/2)) - (Item['image'].h/2)
            dxDrawImage(posX2, posY2, Item['image'].w, Item['image'].h, Item['image'].dir, 0, 0, 0, tocolor(255, 255, 255, alpha * 255));
            dxDrawText('x'..v.Amount, posX + 2, posY + (63-16), 20, 11, tocolor(255, 255, 255, alpha * 222), 1.00, dxCreateFont('assets/fonts/Roboto-Regular.ttf', 9), 'left', 'top')
            if Global.Move.select == Index then
                dxDrawImage (x - (Item['image'].w / 2), y - (Item['image'].h / 2), Item['image'].w, Item['image'].h, Item['image'].dir, 0, 0, 0, tocolor (255, 255, 255, alpha * 255))
            end
        end
    end
    if Global.Trade.trade then
        local theItemSettings = config['Items'][Global.Trade.attributes.item.Item]
        dxDrawImage (482, 252, 395, 365, 'assets/images/trade.png', 0, 0, 0, tocolor (255, 255, 255, alpha * 150))
        dxDrawRectangle (608, 364, 144, 141, tocolor (21, 21, 21, alpha * 255))
        dxDrawText ('X', 608 + (144 - 40), 364, 40, 40, tocolor (222, 222, 222, alpha * 255), 1, dxCreateFont('assets/fonts/Roboto-Regular.ttf', 8), 'center', 'center')
        dxDrawText ('Enviar item', 608 + 10, 364, 144, 40, tocolor (222, 222, 222, alpha * 255), 1, dxCreateFont('assets/fonts/Roboto-Regular.ttf', 8), 'left', 'center')
        dxDrawText ('ID: '.. Global.Trade.attributes.pdata.id, 608, 364 + 35, 144, 20, tocolor (222, 222, 222, alpha * 255), 1, dxCreateFont('assets/fonts/OpenSans-Semibold.ttf', 9), 'center', 'center')
        dxDrawImage(608 + 15, 364 + 68, 20, 20, theItemSettings['image'].dir, 0, 0, 0, tocolor(255, 255, 255, alpha * 255));
        if Global.Trade.progress.active then
            progress = math.min(math.max(x - 653, 0), 87);
        end
        Global.Trade.progress.level = math.floor(progress / 87 * Global.Trade.attributes.item.Amount)
        dxDrawRectangle (608 + 45, 364 + 63, 87, 30, tocolor (33, 33, 33, alpha * 255))
        dxDrawRectangle (608 + 45, 364 + 63, progress, 30, tocolor (58, 134, 225, alpha * 255))
        dxDrawText (Global.Trade.progress.level, 608 + 45, 364 + 63, 87, 30, tocolor (244, 244, 244, alpha * 255), 1, dxCreateFont('assets/fonts/Roboto-Regular.ttf', 8), 'center', 'center')
        dxDrawRectangle (608 + 10, 364 + 100, 122, 30, (isCursorOnElement (608 + 10, 364 + 100, 122, 30) and tocolor(58, 134, 225, alpha * 255) or tocolor (33, 33, 33, alpha * 255)))
        dxDrawText ('Confirmar', 608 + 10, 364 + 100, 122, 30, tocolor (244, 244, 244, alpha * 255), 1, dxCreateFont('assets/fonts/Roboto-Regular.ttf', 9), 'center', 'center')
    end
end

createEventHandler('Inventory:Execute>Client', localPlayer, function(action, ...)
    local args = {...}
    if Global.Inv.chest then
        return false;
    end
    if action == 'ShowInventory' then
        if not Global.Inv.visible and alpha == 0 then
            Global.Inv.visible = true;
            Global.Inv.page = 'Personal';
            Global.Animations.alpha = {radius = {0, 1}, tick = getTickCount()};
            Global.Animations.line = {radius = {Global.Animations.line.radius[2], 259}, tick = getTickCount()};
            Global.Progress = {active = false, level = 0};
            showCursor(true);
            triggerServerEvent('Chest>ResetID', localPlayer, localPlayer);
            addEventHandler('onClientRender', getRootElement(), Inventory, true, 'low-5');
        elseif Global.Inv.visible and alpha == 1 then
            Global.Inv.visible = false;
            Global.Animations.alpha = {radius = {1, 0}, tick = getTickCount()};
            Global.Progress = {active = false, level = 0};
            setTimer(function()
                alpha = 0;
                showCursor(false);
                Global.Move = {select = false, select_use = false};
                removeEventHandler('onClientRender', getRootElement(), Inventory);
            end, 290, 1)
        end
    elseif action == 'Load' then
        if args[1] == 'Items' then 
            Global.Tables.items_server = {Personal = {}, Foods = {}, Ilegais = {}, Utils = {}};
            Global.Tables.items_slots = {};
            Global.Progress = {active = false, level = 0};
            Global.Move = {select = false, select_use = false};
            for i, v in ipairs(args[2]) do
                table.insert(Global.Tables.items_server[v.Type], v);
            end
            for i = 1, 25 do
                Global.Tables.items_slots[i] = i;
            end
        elseif args[1] == 'Peso' then
            Global.Tables.peso = {};
            Global.Tables.peso = {args[2].used, args[2].current};
        end
    end
end)
  
addEventHandler('onClientClick', getRootElement(), function(button, state, _, _, _, _, _, object)
    if Global.Inv.visible and alpha == 1 and button == 'left' then
        if state == 'down' then
            if Global.Trade.trade then
                if isCursorOnElement (608 + (144 - 40), 364, 40, 40) then
                    Global.Trade.trade = false
                    Global.Trade.attributes = {}
                end
                if isCursorOnElement (608 + 45, 364 + 63, 87, 30) then
                    Global.Trade.progress.active = true
                end
                if isCursorOnElement (608 + 10, 364 + 100, 122, 30) then
                    if Global.Trade.progress.level <= 0 then
                        sendMessage (localPlayer, 'client', 'Arraste a barra indicadora para indicar a quantidade que deseja enviar.', 'info')
                        return false
                    end
                    return triggerServerEvent ('Trade>SendItem', localPlayer, getPlayerID (Global.Trade.attributes.pdata.id), Global.Trade.attributes.item, Global.Trade.progress.level)
                end
            end
            if not Global.Trade.trade then
                if isCursorOnElement(484, 254, 66, 361) then
                    for i, v in ipairs(Global.Clicks) do
                        if isCursorOnElement(v.position[1], v.position[2], v.position[3], v.position[4]) and Global.Inv.page ~= v.next_page then
                            Global.Inv.page = v.next_page;
                            Global.Move.selectUse = 0;
                            Global.Animations.line = {radius = {Global.Animations.line.radius[2], v.pos_line}, tick = getTickCount()};
                            progress = 0;
                            return
                        end
                    end
                elseif isCursorOnElement(552, 254, 323, 323) then
                    for i, v in ipairs(Global.Tables.items_server[Global.Inv.page]) do
                        local item_selected = returnIndexFromTable(v.Slot);
                        if item_selected then
                            if isCursorOnElement(PosSlot[item_selected][1], PosSlot[item_selected][2], 63, 63) then
                                Global.Move.select = item_selected;
                                return
                            end
                        end
                    end
                elseif isCursorOnElement(484, 163, 339, 51) and not Global.Progress.active then
                    Global.Progress.active = true;
                end
            end
        else
            Global.Trade.progress.active = false
            if not Global.Trade.trade then
                if isCursorOnElement(484, 216, 391, 31) and Global.Inv.chest then
                    local item = Global.Tables.items_server[Global.Inv.page][tonumber(getIndexItemFromSlot(Global.Move.select))]
                    if item then
                        if Global.Progress.level > 0 then
                            if item.Amount >= Global.Progress.level then
                                triggerServerEvent('Chest>Give', localPlayer, localPlayer, item, Global.Progress.level);
                            else
                                Global.Move.select = 0;
                                sendMessage(localPlayer, 'client', 'Você não possui esta quantidade do item que deseja retirar.', 'info');
                                return
                            end
                        else
                            Global.Move.select = 0;
                            sendMessage(localPlayer, 'client', 'Arraste a barra para indicar a quantidade do item que deseja retirar.', 'info');
                            return
                        end
                    end
                    Global.Progress.active = false;
                    Global.Move.select = 0;
                elseif isCursorOnElement(484, 216, 195, 31) and not Global.Inv.chest then
                    local item = Global.Tables.items_server[Global.Inv.page][tonumber(getIndexItemFromSlot(Global.Move.selectUse))]
                    if item then
                        if Global.Progress.level > 0 then
                            if item.Amount >= Global.Progress.level then
                                triggerServerEvent('Inventory:onPlayerUseItem', localPlayer, item.Item, Global.Progress.level)
                            else
                                Global.Move.select = 0;
                                sendMessage(localPlayer, 'client', 'Você não possui esta quantidade do item que deseja usar.', 'info');
                                return
                            end
                        else
                            Global.Move.select = 0;
                            sendMessage(localPlayer, 'client', 'Arraste a barra para indicar a quantidade do item que deseja usar.', 'info');
                            return
                        end
                    end
                    Global.Progress.active = false;
                    Global.Move.select = 0;
                elseif isCursorOnElement(681, 216, 195, 31)  then
                    local item = Global.Tables.items_server[Global.Inv.page][tonumber(getIndexItemFromSlot(Global.Move.selectUse))]
                    if item then
                        if Global.Progress.level > 0 then
                            if item.Amount >= Global.Progress.level then
                                triggerServerEvent('Inventory:onPlayerDropItem', localPlayer, item.Item, Global.Progress.level);
                            else
                                Global.Move.select = 0;
                                sendMessage(localPlayer, 'client', 'Você não possui esta quantidade do item que deseja dropar.', 'info');
                                return
                            end
                        else
                            Global.Move.select = 0;
                            sendMessage(localPlayer, 'client', 'Arraste a barra para indicar a quantidade do item que deseja dropar.', 'info');
                            return
                        end
                    end
                    Global.Progress.active = false;
                    Global.Trade.progress.active = false
                    Global.Move.select = 0;
                else
                    for i, v in ipairs(PosSlot) do
                        if isCursorOnElement(v[1], v[2], 63, 63) then
                            local Index, Index2 = getIndexItemFromSlot(Global.Move.select), getIndexItemFromSlot(i);
                            if Global.Move.select == i then
                                if Global.Move.selectUse ~= Global.Move.select then
                                    Global.Move.selectUse = Global.Move.select;
                                    progress = 0;
                                else
                                    Global.Move.selectUse = 0;
                                end
                            else
                                if Global.Move.select ~= i and not Global.Progress.active then
                                    if not Global.Inv.chest then
                                        return triggerServerEvent('Inventory:Execute>Server', localPlayer, localPlayer, 'ChangeSlot', Global.Tables.items_server[Global.Inv.page][Index], i, Global.Tables.items_server[Global.Inv.page][Index2], Global.Inv.page)
                                    else
                                        return triggerServerEvent('Chest:ChangeSlot', localPlayer, localPlayer, Global.Tables.items_server[Global.Inv.page][Index], i, Global.Tables.items_server[Global.Inv.page][Index2], Global.Inv.page)
                                    end
                                end
                            end
                        end
                    end
                    if object and isElement(object) then
                        if getElementType(object) == 'object' and getElementModel(object) == config.Geral.ChestObject and not isCursorOnElement (482, 252, 395, 365) then
                            if getElementDistance(localPlayer, object, 3) then
                                local item = Global.Tables.items_server[Global.Inv.page][tonumber (getIndexItemFromSlot (Global.Move.select))]
                                if item then
                                    if Global.Progress.level > 0 then
                                        if item.Amount >= Global.Progress.level then
                                            triggerServerEvent('Chest>Save', localPlayer, localPlayer, object, item, Global.Progress.level)
                                        else
                                            Global.Move.select = 0;
                                            sendMessage(localPlayer, 'client', 'Você não possui esta quantidade do item que deseja enviar ao bau.', 'info')
                                            return
                                        end
                                    else
                                        Global.Move.select = 0;
                                        sendMessage(localPlayer, 'client', 'Arraste a barra para indicar a quantidade do item que deseja enviar ao bau', 'info')
                                        return
                                    end
                                end
                            end
                        elseif getElementType (object) == 'player' and getElementDistance (localPlayer, object, 2) and not isCursorOnElement (482, 252, 395, 365) and not Global.Inv.chest then
                            if object == localPlayer then
                                Global.Progress.active = false
                                Global.Move.select = 0
                                return
                            end
                            local item = Global.Tables.items_server[Global.Inv.page][tonumber (getIndexItemFromSlot (Global.Move.select))]
                            if item and not Global.Trade.trade then
                                progress = 0
                                Global.Move = {select = false, select_use = false};
                                Global.Trade.trade = true
                                Global.Trade.progress.level = 0
                                Global.Trade.progress.active = false
                                Global.Trade.attributes = {
                                    item = item,
                                    pdata = {id = (getElementData (object, 'ID') or 0)}
                                }
                            end
                        end
                    end
                    Global.Progress.active = false
                    Global.Move.select = 0
                end
            end
        end
    end
end)

-- Function's Util's
function returnIndexFromTable(slot)
    for i = 1, 25 do
        if Global.Tables.items_slots[i] == slot then
            return i
        end
    end
    return false
end

function getIndexItemFromSlot(slot)
    for i, v in ipairs(Global.Tables.items_server[Global.Inv.page]) do
        if v.Slot == slot then
            return i
        end
    end
    return false
end

function scriptForceCloseInv()
    if Global.Inv.visible and alpha ~= 0 then
        Global.Inv.visible = false
        Global.Animations.alpha = {radius = {1, 0}, tick = getTickCount ()}
        Global.Progress = {active = false, level = 0}
        Global.Move = {select = false, select_use = false}
        Global.Trade.trade = false
        setTimer(function()
            alpha = 0
            showCursor(false)
            removeEventHandler('onClientRender', getRootElement(), Inventory)
        end, 290, 1)
    end
end
createEventHandler('Inventory:Close', localPlayer, scriptForceCloseInv)

function cancelShoot (weapon)
    if weapon ~= 28 then
        if (config['CancelFire'][weapon]) then
            if getPedTotalAmmo(localPlayer, currentWeaponSlot) < 2 then
                toggleControl('action', false)
                toggleControl('fire', false)
                toggleControl('vehicle_fire', false)
            else
                toggleControl('action', true)
                toggleControl('fire', true)
                toggleControl('vehicle_fire', true)
            end
        else
            toggleControl('action', true)
            toggleControl('fire', true)
            toggleControl('vehicle_fire', true)
        end
    end
end
addEventHandler('onClientPlayerWeaponFire', localPlayer, cancelShoot)

function cancelShoot2()
    local weapon = getPedWeapon(localPlayer, current)
    if weapon ~= 28 then
        if (config['CancelFire'][weapon]) then
            if getPedTotalAmmo(localPlayer, currentWeaponSlot) > 1 then
                toggleControl('action', true)
                toggleControl('fire', true)
                toggleControl('vehicle_fire', true)
            else
                toggleControl('action', false)
                toggleControl('fire', false)
                toggleControl('vehicle_fire', false)
            end
        end
    end
end
bindKey('fire', 'down', cancelShoot2)
bindKey('action', 'down', cancelShoot2)

function onlyGuard(_, currentWeaponSlot)
    local weapon = getPedWeapon (localPlayer, currentWeaponSlot)
    if weapon ~= 28 then
        if not (config['CancelFire'][weapon]) then
            toggleControl('action', true)
            toggleControl('fire', true)
            toggleControl('vehicle_fire', true)
        else
            if getPedTotalAmmo(localPlayer, currentWeaponSlot) > 1 then
                toggleControl('action', true)
                toggleControl('fire', true)
                toggleControl('vehicle_fire', true)
            else
                toggleControl('action', false)
                toggleControl('fire', false)
                toggleControl('vehicle_fire', false)
            end
        end
    end
end
addEventHandler('onClientPlayerWeaponSwitch', localPlayer, onlyGuard)

createEventHandler('Chest>ExecuteClient', localPlayer, function(action, ...)
    local args = {...};
    if action == 'ShowChest' then
        if not Global.Inv.visible and alpha == 0 then
            Global.Inv.visible = true;
            Global.Inv.chest = true;
            Global.Inv.page = 'Personal';
            Global.Animations.alpha = {radius = {0, 1}, tick = getTickCount()};
            Global.Animations.line = {radius = {Global.Animations.line.radius[2], 259}, tick = getTickCount()};
            Global.Progress = {active = false, level = 0};
            showCursor(true);
            addEventHandler('onClientRender', getRootElement(), Inventory, true, 'low-5');
        end
    elseif action == 'Load' then
        if not Global.Inv.chest then
            return false;
        end
        if args[1] == 'Items' then 
            Global.Tables.items_server = {Personal = {}, Foods = {}, Ilegais = {}, Utils = {}};
            Global.Tables.items_slots = {};
            Global.Progress = {active = false, level = 0};
            Global.Move = {select = false, select_use = false};
            for i, v in ipairs(args[2]) do
                table.insert(Global.Tables.items_server[v.Type], v);
            end
            for i = 1, 25 do
                Global.Tables.items_slots[i] = i;
            end
        elseif args[1] == 'Peso' then
            Global.Tables.peso = {};
            Global.Tables.peso = {args[2].used, args[2].current};
        end
    end
end)

bindKey('backspace', 'down', function()
    if alpha < 1 then
        return
    end
    if Global.Inv.visible or Global.Inv.chest then
        Global.Inv.visible = false;
        Global.Animations.alpha = {radius = {1, 0}, tick = getTickCount()};
        Global.Progress = {active = false, level = 0};
        Global.Move = {select = false, select_use = false};
        triggerServerEvent('Chest>ResetID', localPlayer, localPlayer);
        setTimer(function()
            alpha = 0;
            Global.Inv.chest = false;
            showCursor(false);
            removeEventHandler('onClientRender', getRootElement(), Inventory);
        end, 290, 1)
    end
end)

bindKey('m', 'down', function()
    showCursor(not isCursorShowing())
end)