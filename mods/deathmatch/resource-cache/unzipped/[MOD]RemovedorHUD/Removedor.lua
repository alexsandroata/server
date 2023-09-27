function showCustomHud(x)
    if x == true then
            setPlayerHudComponentVisible ( "all", false)
        setPlayerHudComponentVisible ( "crosshair", true )  
    else
        setPlayerHudComponentVisible ( "all", false)
    end
    active = x
end

function isShowCustomHud()
return active
end


bindKey( "U", "down", function()
if isShowCustomHud() == false then
    showCustomHud(true)
    showChat(true)
else
    showCustomHud(false)
    showChat(false)
end
end)

bindKey( "F11", "down", function()
if isShowCustomHud() == false then
    showCustomHud(true)
else
    showCustomHud(false)
end
end)
addEventHandler("onClientResourceStart", root, function() 
showCustomHud(true)
end)
function getPointFromDistanceRotation(x, y, dist, angle)
 
    local a = math.rad(90 - angle);
    local dx = math.cos(a) * dist;
    local dy = math.sin(a) * dist; 
    return x+dx, y+dy;
 
end
function findRotation(x1,y1,x2,y2)
 
  local t = -math.deg(math.atan2(x2-x1,y2-y1))
  if t < 0 then t = t + 360 end;
  return t;
end
