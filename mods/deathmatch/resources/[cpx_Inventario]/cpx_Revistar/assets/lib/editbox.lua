
local screenW, screenH = guiGetScreenSize ()
local resW, resH = 1920,1080
local x, y = (screenW/resW), (screenH/resH)


Edit = {}
EditBox = {}


function EditBox.Create(IDENTIFY,X,Y,W,H,MASKED,MAX,COLOR,FONT,TEXT2)
    if IDENTIFY and X and Y and W and H then
        local TableAdd = {
            Identify = IDENTIFY,
            PosX = X,
            PosY = Y,
            PosW = W,
            PosH = H,
            Masked = MASKED or false,
            Max = MAX or 10,
            Visible = false,
            Text = "",
            Color = COLOR or tocolor(0,0,0,100),
            Select = false,
            Font = FONT or "default-bold",
            Text2 = TEXT2 or "",
        }
        table.insert(Edit, TableAdd)
    else
        error("Coloque os Parâmetros Necessários.")
    end
end


function EditBox.GetVisible(identify)
    local Index = returnIndexFromIdentify(identify)
    if Index then
        return Edit[Index].Visible
    end
end

function EditBox.SetVisible(identify,bool)
    local Index = returnIndexFromIdentify(identify)
    if Index then
        Edit[Index].Visible = bool
    end
end

function EditBox.SetText(identify,text)
    local Index = returnIndexFromIdentify(identify)
    if Index then
        Edit[Index].Text = text
    end
end

function EditBox.GetText(identify)
    local Index = returnIndexFromIdentify(identify)
    if Index then
        return Edit[Index].Text
    end
end

function EditBox.SetMasked(identify,bool)
    local Index = returnIndexFromIdentify(identify)
    if Index then
        Edit[Index].Masked = bool
    end
end


function EditBox.VerifyIndentify(indentify)
    if #Edit ~= 0 then
        for _,v in ipairs(Edit) do
            if v.Identify == indentify then
                return true
            end
        end
    end
    return false
end

function EditBox.DestroyEdit(identify)
    local Index = returnIndexFromIdentify(identify)
    if Index then
        table.remove(Edit, Index)
    end
end


addEventHandler("onClientClick",root,function(b,s)
    if b == "left" and s == "down" then
        if #Edit ~= 0 then
            for i,v in ipairs(Edit) do
                if v.Visible then
                    local Index = returnIndexFromIdentify(v.Identify)
                    if Index then
                        if isCursorOnElement(v.PosX, v.PosY, v.PosW, v.PosH) then
                            Edit[Index].Select = true
                            guiSetInputMode("no_binds")
                        else
                            if Edit[Index].Select then
                                Edit[Index].Select = false
                                guiSetInputMode("allow_binds")
                            end
                        end
                    end
                end
            end
        end
    end
end)

addEventHandler("onClientKey",root,function(button,press)
    if button == "backspace" and not press then
        local Identify = returnEditSelect()
        if Identify then
            local Index = returnIndexFromIdentify(Identify)
            if Index then
                if #Edit[Index].Text ~= 0 then
                    Edit[Index].Text = string.sub(Edit[Index].Text, 1, #Edit[Index].Text -1)
                end
            end
        end
    end
end)

addEventHandler("onClientCharacter",root,function(carac)
    local Identify = returnEditSelect()
    if Identify then
        local Index = returnIndexFromIdentify(Identify)
        if Index then
            if #Edit[Index].Text < Edit[Index].Max then
                if tonumber(carac) then
                    Edit[Index].Text =  Edit[Index].Text..""..carac
                end
            end
        end
    end
end)




addEventHandler("onClientRender",root,function()
    if #Edit ~= 0  then
        for i,v in ipairs(Edit) do
            if v.Visible then
                local width = dxGetTextWidth(v.Text2, 1, v.Font)
                local height = dxGetFontHeight(1, v.Font)
                local posX2 = (v.PosX + (v.PosW/2)) - (width/2)
                local posY2 = (v.PosY + (v.PosH/2)) - (height/2)

                dxDrawRectangle(v.PosX, v.PosY, v.PosW, v.PosH, v.Color, true)
                if #v.Text == 0 and not v.Select then
                    dxDrawText(v.Text2, posX2, posY2, x*1611, y*753, tocolor(255, 255, 255, 255), 1.00,v.Font, "left", "top", false, false, true, false, false)
                else
                    if #v.Text >= 14 then
                        dxDrawText(string.sub(v.Text, (#v.Text - 13), #v.Text), v.PosX + x*(5), posY, x*1611, y*753, tocolor(255, 255, 255, 255), 1.00,v.Font, "left", "top", false, false, true, false, false)
                    elseif v.Text == "" then
                        dxDrawText("Digite", v.PosX + x*(83), posY2, x*1611, y*753, tocolor(255, 255, 255, 255), 1.00,v.Font, "left", "top", false, false, true, false, false)
                    else
                        dxDrawText(v.Text, v.PosX + x*(5), posY2, x*1611, y*753, tocolor(255, 255, 255, 255), 1.00,v.Font, "left", "top", false, false, true, false, false)
                    end
                end
            end
        end
    end
end)


--UTILITARIOS

function returnEditSelect()
    if #Edit ~= 0 then
        for i, v in ipairs(Edit) do
            if v.Select then
                return v.Identify
            end
        end
    end
    return false
end


function returnIndexFromIdentify(identify)
    if #Edit ~= 0 then
        for i, v in ipairs(Edit) do
            if v.Identify == identify then
                return i
            end
        end
    end
    return false
end


function verifyNotIdentify(identify)
    if #EditBox ~= 0 then
        for _,v in ipairs(EditBox) do
            if v.Identify == identify then
                return false
            end
        end
    end
    return true
end

function isCursorOnElement(x, y, w, h)
	if (not isCursorShowing()) then
		return false
	end
	local mx, my = getCursorPosition()
	local fullx, fully = guiGetScreenSize()
	cursorx, cursory = mx*fullx, my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end