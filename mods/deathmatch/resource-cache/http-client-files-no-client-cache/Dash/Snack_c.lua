    ------------------------------------------------------
   --               By SnacKMTA 2020                     --
----             Não Retire Os Creditos                   ----
    ------------------------------------------------------

local screenW,screenH = guiGetScreenSize()
local resW, resH = 1366,768
local x, y = (screenW/resW), (screenH/resH)


local font2 = dxCreateFont('files/fonts/font2.ttf', 13, false);
local font = dxCreateFont("files/fonts/font.ttf", 13)

function Snack()
    if (not isPlayerMapVisible()) then
        local money = convertNumber(getPlayerMoney(getLocalPlayer()))
		local bank = getElementData ( localPlayer, "char.bankMoney") or 0
        local job = getElementData (localPlayer,"Emprego") or "Desempregado"
        local cargo = getElementData(localPlayer, "Snack:Cargo") or "Civil"
        local level = getElementData(getLocalPlayer(), "Level") or 0
        local players = getElementsByType( "player" )


------------------------------------------------- [ DASBOARD INTERFACE]

        exports["Snack_Blur"]:dxDrawBluredRectangle(x*0, y*0, x*1366, y*768, tocolor(255, 255, 255, 255))
        dxDrawLine((screenW * 0.4140) - 1, (screenH * 0.2695) - 1, (screenW * 0.4140) - 1, screenH * 0.6979, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5890, (screenH * 0.2695) - 1, (screenW * 0.4140) - 1, (screenH * 0.2695) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.4140) - 1, screenH * 0.6979, screenW * 0.5890, screenH * 0.6979, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5890, screenH * 0.6979, screenW * 0.5890, (screenH * 0.2695) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.4140, screenH * 0.2695, screenW * 0.1750, screenH * 0.4284, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.2287) - 1, (screenH * 0.3047) - 1, (screenW * 0.2287) - 1, screenH * 0.6966, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.4037, (screenH * 0.3047) - 1, (screenW * 0.2287) - 1, (screenH * 0.3047) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.2287) - 1, screenH * 0.6966, screenW * 0.4037, screenH * 0.6966, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.4037, screenH * 0.6966, screenW * 0.4037, (screenH * 0.3047) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.2287, screenH * 0.3047, screenW * 0.1750, screenH * 0.3919, tocolor(4, 4, 7, 255), false)
        dxDrawImage(screenW * 0.4581, screenH * 0.2943, screenW * 0.0853, screenH * 0.1471, "img/name2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawLine((screenW * 0.4382) - 1, (screenH * 0.4896) - 1, (screenW * 0.4382) - 1, screenH * 0.5221, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5640, (screenH * 0.4896) - 1, (screenW * 0.4382) - 1, (screenH * 0.4896) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.4382) - 1, screenH * 0.5221, screenW * 0.5640, screenH * 0.5221, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5640, screenH * 0.5221, screenW * 0.5640, (screenH * 0.4896) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.4382, screenH * 0.4896, screenW * 0.1257, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.4382) - 1, (screenH * 0.5352) - 1, (screenW * 0.4382) - 1, screenH * 0.5677, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5640, (screenH * 0.5352) - 1, (screenW * 0.4382) - 1, (screenH * 0.5352) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.4382) - 1, screenH * 0.5677, screenW * 0.5640, screenH * 0.5677, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5640, screenH * 0.5677, screenW * 0.5640, (screenH * 0.5352) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.4382, screenH * 0.5352, screenW * 0.1257, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.4382) - 1, (screenH * 0.5807) - 1, (screenW * 0.4382) - 1, screenH * 0.6133, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5640, (screenH * 0.5807) - 1, (screenW * 0.4382) - 1, (screenH * 0.5807) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.4382) - 1, screenH * 0.6133, screenW * 0.5640, screenH * 0.6133, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5640, screenH * 0.6133, screenW * 0.5640, (screenH * 0.5807) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.4382, screenH * 0.5807, screenW * 0.1257, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.4382) - 1, (screenH * 0.6263) - 1, (screenW * 0.4382) - 1, screenH * 0.6589, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5640, (screenH * 0.6263) - 1, (screenW * 0.4382) - 1, (screenH * 0.6263) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.4382) - 1, screenH * 0.6589, screenW * 0.5640, screenH * 0.6589, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5640, screenH * 0.6589, screenW * 0.5640, (screenH * 0.6263) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.4382, screenH * 0.6263, screenW * 0.1257, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.4382) - 1, (screenH * 0.4896) - 1, (screenW * 0.4382) - 1, screenH * 0.5221, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.4610, (screenH * 0.4896) - 1, (screenW * 0.4382) - 1, (screenH * 0.4896) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.4382) - 1, screenH * 0.5221, screenW * 0.4610, screenH * 0.5221, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.4610, screenH * 0.5221, screenW * 0.4610, (screenH * 0.4896) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.4382, screenH * 0.4896, screenW * 0.0228, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.4382) - 1, (screenH * 0.5352) - 1, (screenW * 0.4382) - 1, screenH * 0.5677, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.4610, (screenH * 0.5352) - 1, (screenW * 0.4382) - 1, (screenH * 0.5352) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.4382) - 1, screenH * 0.5677, screenW * 0.4610, screenH * 0.5677, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.4610, screenH * 0.5677, screenW * 0.4610, (screenH * 0.5352) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.4382, screenH * 0.5352, screenW * 0.0228, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.4382) - 1, (screenH * 0.5807) - 1, (screenW * 0.4382) - 1, screenH * 0.6133, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.4610, (screenH * 0.5807) - 1, (screenW * 0.4382) - 1, (screenH * 0.5807) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.4382) - 1, screenH * 0.6133, screenW * 0.4610, screenH * 0.6133, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.4610, screenH * 0.6133, screenW * 0.4610, (screenH * 0.5807) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.4382, screenH * 0.5807, screenW * 0.0228, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.4382) - 1, (screenH * 0.6263) - 1, (screenW * 0.4382) - 1, screenH * 0.6589, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.4610, (screenH * 0.6263) - 1, (screenW * 0.4382) - 1, (screenH * 0.6263) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.4382) - 1, screenH * 0.6589, screenW * 0.4610, screenH * 0.6589, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.4610, screenH * 0.6589, screenW * 0.4610, (screenH * 0.6263) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.4382, screenH * 0.6263, screenW * 0.0228, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawImage(screenW * 0.4412, screenH * 0.4922, screenW * 0.0162, screenH * 0.0260, "img/icon_heart.png", 0, 0, 0, tocolor(254, 254, 254, 255), false)
        dxDrawImage(screenW * 0.4426, screenH * 0.6302, screenW * 0.0140, screenH * 0.0234, "img/water.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.4426, screenH * 0.5391, screenW * 0.0140, screenH * 0.0247, "img/vest.png", 0, 0, 0, tocolor(254, 254, 254, 255), false)
        dxDrawImage(screenW * 0.4419, screenH * 0.5846, screenW * 0.0154, screenH * 0.0260, "img/icon_hunger.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.2801, screenH * 0.3424, screenW * 0.0691, screenH * 0.1146, "img/statistics.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawLine((screenW * 0.2522) - 1, (screenH * 0.4896) - 1, (screenW * 0.2522) - 1, screenH * 0.5221, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.3779, (screenH * 0.4896) - 1, (screenW * 0.2522) - 1, (screenH * 0.4896) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.2522) - 1, screenH * 0.5221, screenW * 0.3779, screenH * 0.5221, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.3779, screenH * 0.5221, screenW * 0.3779, (screenH * 0.4896) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.2522, screenH * 0.4896, screenW * 0.1257, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.2522) - 1, (screenH * 0.5352) - 1, (screenW * 0.2522) - 1, screenH * 0.5677, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.3779, (screenH * 0.5352) - 1, (screenW * 0.2522) - 1, (screenH * 0.5352) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.2522) - 1, screenH * 0.5677, screenW * 0.3779, screenH * 0.5677, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.3779, screenH * 0.5677, screenW * 0.3779, (screenH * 0.5352) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.2522, screenH * 0.5352, screenW * 0.1257, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.2522) - 1, (screenH * 0.5807) - 1, (screenW * 0.2522) - 1, screenH * 0.6133, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.3779, (screenH * 0.5807) - 1, (screenW * 0.2522) - 1, (screenH * 0.5807) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.2522) - 1, screenH * 0.6133, screenW * 0.3779, screenH * 0.6133, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.3779, screenH * 0.6133, screenW * 0.3779, (screenH * 0.5807) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.2522, screenH * 0.5807, screenW * 0.1257, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.2522) - 1, (screenH * 0.4896) - 1, (screenW * 0.2522) - 1, screenH * 0.5221, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.2750, (screenH * 0.4896) - 1, (screenW * 0.2522) - 1, (screenH * 0.4896) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.2522) - 1, screenH * 0.5221, screenW * 0.2750, screenH * 0.5221, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.2750, screenH * 0.5221, screenW * 0.2750, (screenH * 0.4896) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.2522, screenH * 0.4896, screenW * 0.0228, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.2522) - 1, (screenH * 0.5352) - 1, (screenW * 0.2522) - 1, screenH * 0.5677, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.2750, (screenH * 0.5352) - 1, (screenW * 0.2522) - 1, (screenH * 0.5352) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.2522) - 1, screenH * 0.5677, screenW * 0.2750, screenH * 0.5677, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.2750, screenH * 0.5677, screenW * 0.2750, (screenH * 0.5352) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.2522, screenH * 0.5352, screenW * 0.0228, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.2522) - 1, (screenH * 0.5807) - 1, (screenW * 0.2522) - 1, screenH * 0.6133, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.2750, (screenH * 0.5807) - 1, (screenW * 0.2522) - 1, (screenH * 0.5807) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.2522) - 1, screenH * 0.6133, screenW * 0.2750, screenH * 0.6133, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.2750, screenH * 0.6133, screenW * 0.2750, (screenH * 0.5807) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.2522, screenH * 0.5807, screenW * 0.0228, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawImage(screenW * 0.2574, screenH * 0.4935, screenW * 0.0125, screenH * 0.0234, "img/coin.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.2559, screenH * 0.5378, screenW * 0.0154, screenH * 0.0286, "img/sujo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawLine((screenW * 0.5993) - 1, (screenH * 0.3060) - 1, (screenW * 0.5993) - 1, screenH * 0.6979, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7743, (screenH * 0.3060) - 1, (screenW * 0.5993) - 1, (screenH * 0.3060) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.5993) - 1, screenH * 0.6979, screenW * 0.7743, screenH * 0.6979, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7743, screenH * 0.6979, screenW * 0.7743, (screenH * 0.3060) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.5993, screenH * 0.3060, screenW * 0.1750, screenH * 0.3919, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.2522) - 1, (screenH * 0.6263) - 1, (screenW * 0.2522) - 1, screenH * 0.6589, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.3779, (screenH * 0.6263) - 1, (screenW * 0.2522) - 1, (screenH * 0.6263) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.2522) - 1, screenH * 0.6589, screenW * 0.3779, screenH * 0.6589, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.3779, screenH * 0.6589, screenW * 0.3779, (screenH * 0.6263) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.2522, screenH * 0.6263, screenW * 0.1257, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.2522) - 1, (screenH * 0.6263) - 1, (screenW * 0.2522) - 1, screenH * 0.6589, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.2750, (screenH * 0.6263) - 1, (screenW * 0.2522) - 1, (screenH * 0.6263) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.2522) - 1, screenH * 0.6589, screenW * 0.2750, screenH * 0.6589, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.2750, screenH * 0.6589, screenW * 0.2750, (screenH * 0.6263) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.2522, screenH * 0.6263, screenW * 0.0228, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawImage(screenW * 0.2559, screenH * 0.5846, screenW * 0.0154, screenH * 0.0247, "img/bank2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.2551, screenH * 0.6289, screenW * 0.0162, screenH * 0.0260, "img/--pocket-watch.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.6485, screenH * 0.3333, screenW * 0.0728, screenH * 0.1211, "img/name.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawLine((screenW * 0.6243) - 1, (screenH * 0.4896) - 1, (screenW * 0.6243) - 1, screenH * 0.5221, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7500, (screenH * 0.4896) - 1, (screenW * 0.6243) - 1, (screenH * 0.4896) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.6243) - 1, screenH * 0.5221, screenW * 0.7500, screenH * 0.5221, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7500, screenH * 0.5221, screenW * 0.7500, (screenH * 0.4896) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.6243, screenH * 0.4896, screenW * 0.1257, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.6243) - 1, (screenH * 0.5352) - 1, (screenW * 0.6243) - 1, screenH * 0.5677, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7500, (screenH * 0.5352) - 1, (screenW * 0.6243) - 1, (screenH * 0.5352) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.6243) - 1, screenH * 0.5677, screenW * 0.7500, screenH * 0.5677, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7500, screenH * 0.5677, screenW * 0.7500, (screenH * 0.5352) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.6243, screenH * 0.5352, screenW * 0.1257, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.6243) - 1, (screenH * 0.5807) - 1, (screenW * 0.6243) - 1, screenH * 0.6133, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7500, (screenH * 0.5807) - 1, (screenW * 0.6243) - 1, (screenH * 0.5807) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.6243) - 1, screenH * 0.6133, screenW * 0.7500, screenH * 0.6133, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7500, screenH * 0.6133, screenW * 0.7500, (screenH * 0.5807) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.6243, screenH * 0.5807, screenW * 0.1257, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.6243) - 1, (screenH * 0.6263) - 1, (screenW * 0.6243) - 1, screenH * 0.6589, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7500, (screenH * 0.6263) - 1, (screenW * 0.6243) - 1, (screenH * 0.6263) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.6243) - 1, screenH * 0.6589, screenW * 0.7500, screenH * 0.6589, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7500, screenH * 0.6589, screenW * 0.7500, (screenH * 0.6263) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.6243, screenH * 0.6263, screenW * 0.1257, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.7287) - 1, (screenH * 0.5807) - 1, (screenW * 0.7287) - 1, screenH * 0.6133, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7515, (screenH * 0.5807) - 1, (screenW * 0.7287) - 1, (screenH * 0.5807) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.7287) - 1, screenH * 0.6133, screenW * 0.7515, screenH * 0.6133, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7515, screenH * 0.6133, screenW * 0.7515, (screenH * 0.5807) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.7287, screenH * 0.5807, screenW * 0.0228, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.7287) - 1, (screenH * 0.6263) - 1, (screenW * 0.7287) - 1, screenH * 0.6589, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7515, (screenH * 0.6263) - 1, (screenW * 0.7287) - 1, (screenH * 0.6263) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.7287) - 1, screenH * 0.6589, screenW * 0.7515, screenH * 0.6589, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7515, screenH * 0.6589, screenW * 0.7515, (screenH * 0.6263) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.7287, screenH * 0.6263, screenW * 0.0228, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.7287) - 1, (screenH * 0.5352) - 1, (screenW * 0.7287) - 1, screenH * 0.5677, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7515, (screenH * 0.5352) - 1, (screenW * 0.7287) - 1, (screenH * 0.5352) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.7287) - 1, screenH * 0.5677, screenW * 0.7515, screenH * 0.5677, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7515, screenH * 0.5677, screenW * 0.7515, (screenH * 0.5352) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.7287, screenH * 0.5352, screenW * 0.0228, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.7287) - 1, (screenH * 0.4896) - 1, (screenW * 0.7287) - 1, screenH * 0.5221, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7515, (screenH * 0.4896) - 1, (screenW * 0.7287) - 1, (screenH * 0.4896) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.7287) - 1, screenH * 0.5221, screenW * 0.7515, screenH * 0.5221, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.7515, screenH * 0.5221, screenW * 0.7515, (screenH * 0.4896) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.7287, screenH * 0.4896, screenW * 0.0228, screenH * 0.0326, tocolor(4, 4, 7, 255), false)
        dxDrawImage(screenW * 0.7316, screenH * 0.4909, screenW * 0.0176, screenH * 0.0299, "img/identity-theft.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.7331, screenH * 0.5378, screenW * 0.0147, screenH * 0.0260, "img/ID.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.7316, screenH * 0.5833, screenW * 0.0162, screenH * 0.0260, "img/weapons.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.7316, screenH * 0.6289, screenW * 0.0169, screenH * 0.0273, "img/level.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawLine((screenW * 0.4618) - 1, (screenH * 0.5000) - 1, (screenW * 0.4618) - 1, screenH * 0.5117, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5596, (screenH * 0.5000) - 1, (screenW * 0.4618) - 1, (screenH * 0.5000) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.4618) - 1, screenH * 0.5117, screenW * 0.5596, screenH * 0.5117, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5596, screenH * 0.5117, screenW * 0.5596, (screenH * 0.5000) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.4618, screenH * 0.5000, screenW * 0.0978, screenH * 0.0117, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.4618) - 1, (screenH * 0.5456) - 1, (screenW * 0.4618) - 1, screenH * 0.5573, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5596, (screenH * 0.5456) - 1, (screenW * 0.4618) - 1, (screenH * 0.5456) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.4618) - 1, screenH * 0.5573, screenW * 0.5596, screenH * 0.5573, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5596, screenH * 0.5573, screenW * 0.5596, (screenH * 0.5456) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.4618, screenH * 0.5456, screenW * 0.0978, screenH * 0.0117, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.4618) - 1, (screenH * 0.5911) - 1, (screenW * 0.4618) - 1, screenH * 0.6029, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5596, (screenH * 0.5911) - 1, (screenW * 0.4618) - 1, (screenH * 0.5911) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.4618) - 1, screenH * 0.6029, screenW * 0.5596, screenH * 0.6029, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5596, screenH * 0.6029, screenW * 0.5596, (screenH * 0.5911) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.4618, screenH * 0.5911, screenW * 0.0978, screenH * 0.0117, tocolor(4, 4, 7, 255), false)
        dxDrawLine((screenW * 0.4618) - 1, (screenH * 0.6367) - 1, (screenW * 0.4618) - 1, screenH * 0.6484, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5596, (screenH * 0.6367) - 1, (screenW * 0.4618) - 1, (screenH * 0.6367) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.4618) - 1, screenH * 0.6484, screenW * 0.5596, screenH * 0.6484, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.5596, screenH * 0.6484, screenW * 0.5596, (screenH * 0.6367) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.4618, screenH * 0.6367, screenW * 0.0978, screenH * 0.0117, tocolor(4, 4, 7, 255), false)
        dxDrawText("#1981CDD A S H B O A R D", screenW * 0.4132, screenH * 0.2266, screenW * 0.5890, screenH * 0.2695, tocolor(255, 255, 255, 255), 1.00, font, "center", "center", false, false, false, true, false)
        dxDrawText("#1981CDINFO", screenW * 0.2279, screenH * 0.2617, screenW * 0.4037, screenH * 0.3047, tocolor(255, 255, 255, 255), 1.00, font, "center", "center", false, false, false, true, false)
        dxDrawText("#1981CDSTATUS", screenW * 0.5985, screenH * 0.2630, screenW * 0.7743, screenH * 0.3060, tocolor(255, 255, 255, 255), 1.00, font, "center", "center", false, false, false, true, false)


------------------------------------------------- [ DASBOARD INTERFACE]

-------------------------------------------------------------[ HORARIO E DATA ]---------------	

        local time = getRealTime()
        local hours = time.hour
        local minutes = time.minute
        local seconds = time.second
        if (hours >= 0 and hours < 10) then
            hours = "0"..time.hour
        end
        if (minutes >= 0 and minutes < 10) then
        	minutes = "0"..time.minute        end
        if (seconds >= 0 and seconds < 10) then
        	seconds = "0"..time.second
        end
			
		dxDrawText("#1981CDH : #ffffff"..hours..":"..minutes..":"..seconds, screenW * 0.2743, screenH * 0.6250, screenW * 0.3779, screenH * 0.6589, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, true, false)

-------------------------------------------------------------[ HORARIO E DATA ]---------

-------------------------------------------------------------[ Vida/Colete e Fome/Sede ]--------------- 

local Vida = math.floor ( getElementHealth ( localPlayer ) )
local Colete = math.floor ( getPedArmor ( localPlayer ) )
local fome = getElementData(getLocalPlayer(), "lyFome") or 0   ---{Função da FOME}
local sede = getElementData(getLocalPlayer(), "lySede") or 0   ---{Função da SEDE}  

if fome > 0 then
    fome = math.floor ( fome )
else
    fome = 0
end
    if sede > 0 then
    sede = math.floor ( sede )
else
    sede = 0
end 

dxDrawRectangle(screenW * 0.4618, screenH * 0.5000, screenW * 0.0978/100*Vida, screenH * 0.0117, tocolor ( 83, 0, 0, 255 ) )  
dxDrawRectangle(screenW * 0.4618, screenH * 0.5456, screenW * 0.0978/100*Colete, screenH * 0.0117, tocolor ( 56, 56, 56, 255 ) )
dxDrawRectangle(screenW * 0.4618, screenH * 0.5911, screenW * 0.0978/100*fome, screenH * 0.0117, tocolor ( 131, 61, 0, 255 ) )  
dxDrawRectangle(screenW * 0.4618, screenH * 0.6367, screenW * 0.0978/100*sede, screenH * 0.0117, tocolor ( 0, 34, 243, 255 ) )     

-------------------------------------------------------------[ Vida/Colete e Fome/Sede ]--------------- 

-------------------------------------------------------------[ Dinheiro ]	
	
        local money = convertNumber(getPlayerMoney(getLocalPlayer()))				
        local bank = convertNumber(getElementData(localPlayer, "Bank:Caixa") or "0") ---{Função do Dinheiro do  Banco}	
        local sujo = convertNumber(getElementData(localPlayer, "Dinheiro:Sujo") or "0") ---{Função do Dinheiro do  sujo}        
		
		  
		dxDrawText("#1981CDD : #ffffff"..money, screenW * 0.2743, screenH * 0.4883, screenW * 0.3779, screenH * 0.5221, tocolor(255, 255, 255, 230), 1.00, "default-bold", "center", "center", false, false, false, true, false)

        dxDrawText("#1981CDB : #ffffff"..bank,  screenW * 0.2743, screenH * 0.5794, screenW * 0.3779, screenH * 0.6133, tocolor(255, 255, 255, 230), 1.00, "default-bold", "center", "center", false, false, false, true, false)	

        dxDrawText("#1981CDS : #ffffff"..sujo, screenW * 0.2743, screenH * 0.5339, screenW * 0.3779, screenH * 0.5677, tocolor(255, 255, 255, 230), 1.00, "default-bold", "center", "center", false, false, false, true, false)					
-------------------------------------------------------------[ Dinheiro ]

-------------------------------------------------------------[ TRABALHO - ID ]	
		
        local IDPlayer = getElementData(getLocalPlayer(), "ID") or "N/A"		
        local Encaminhado = getElementData ( localPlayer, "Emprego") or "Desempregado"

        dxDrawText("#1981CDE : #ffffff"..Encaminhado, screenW * 0.6243, screenH * 0.4883, screenW * 0.7279, screenH * 0.5221, tocolor(255, 255, 255, 230), 1.00, "default-bold", "center", "center", false, false, false, true, false)	
		
		dxDrawText("#1981CDRG : #ffffff"..IDPlayer, screenW * 0.6243, screenH * 0.5339, screenW * 0.7279, screenH * 0.5677, tocolor(255, 255, 255, 230), 1.00, "default-bold", "center", "center", false, false, false, true, false)	

-------------------------------------------------------------[ TRABALHO - ID]


-------------------------------------------------------------[ Players On]


        dxDrawText("#1981CDCidadãos : #ffffff"..tostring( #players ).."/2021", screenW * 0.4125, screenH * 0.6966, screenW * 0.5890, screenH * 0.7305, tocolor(255, 255, 255, 240), 1.00, "default-bold", "center", "center", false, false, false, true, false)

-------------------------------------------------------------[ Players On]

-------------------------------------------------------------[ ARMAS ]---------------					
	
	local weaponClip = getPedAmmoInClip(getLocalPlayer(), getPedWeaponSlot(getLocalPlayer()))
	local weaponAmmo = getPedTotalAmmo(getLocalPlayer()) - getPedAmmoInClip(getLocalPlayer())
	local noreloadweapons = {}
	noreloadweapons[16] = true
	noreloadweapons[17] = true
	noreloadweapons[18] = true
	noreloadweapons[19] = true
	noreloadweapons[25] = true
	noreloadweapons[33] = true
	noreloadweapons[34] = true
	noreloadweapons[35] = true
	noreloadweapons[36] = true
	noreloadweapons[37] = true
	noreloadweapons[38] = true
	noreloadweapons[39] = true
	noreloadweapons[41] = true
	noreloadweapons[42] = true
	noreloadweapons[43] = true
	local meleespecialweapons = {}
	meleespecialweapons[0] = true
	meleespecialweapons[1] = true
	meleespecialweapons[2] = true
	meleespecialweapons[3] = true
	meleespecialweapons[4] = true
	meleespecialweapons[5] = true
	meleespecialweapons[6] = true
	meleespecialweapons[7] = true
	meleespecialweapons[8] = true
	meleespecialweapons[9] = true
	meleespecialweapons[10] = true
	meleespecialweapons[11] = true
	meleespecialweapons[12] = true
	meleespecialweapons[13] = true
	meleespecialweapons[14] = true
	meleespecialweapons[15] = true
	meleespecialweapons[40] = true
	meleespecialweapons[44] = true
	meleespecialweapons[45] = true
	meleespecialweapons[46] = true	
		
    dxDrawText("#1981CDM : #ffffff"..weaponClip.." #FFFFFF/ #FFFFFF"..weaponAmmo, screenW * 0.6243, screenH * 0.5794, screenW * 0.7279, screenH * 0.6133, tocolor(255, 255, 255, 230), 1.00, "default-bold", "center", "center", false, false, false, true, false)

-------------------------------------------------------------[ LEVEL ]---------------	
        
		local level = getElementData(getLocalPlayer(), "Level") or 0

		dxDrawText("#1981CDL : #ffffff" ..level, screenW * 0.6243, screenH * 0.6250, screenW * 0.7279, screenH * 0.6589, tocolor(255, 255, 255, 230), 1.00, "default-bold", "center", "center", false, false, false, true, false)	         		
-------------------------------------------------------------[ LEVEL ]---------------	



		end
    end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local isDXVisible = false
bindKey ("TAB", "both", function()
    if isDXVisible then
        removeEventHandler( "onClientRender", root, Snack )
    else
        addEventHandler( "onClientRender", root, Snack )
    end
    isDXVisible = not isDXVisible
end)
function convertNumber ( number )   
    local formatted = number   
    while true do       
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')     
        if ( k==0 ) then       
            break   
        end   
    end   
    return formatted 
end

