-- Resolution:
screen = Vector2 (guiGetScreenSize ())
screenBase = Vector2 (1360, 768)

function setScreenPosition (x, y, w, h)
    return (
        (x / screenBase.x) * screen.x),
        ((y / screenBase.y) * screen.y),
        ((w / screenBase.x) * screen.x),
        ((h / screenBase.y) * screen.y
    )
end

local textures = {
    image = {},
    font = {}
}

_dxDrawImage = dxDrawImage
_dxDrawRectangle = dxDrawRectangle
_dxDrawImageSection = dxDrawImageSection
_dxDrawText = dxDrawText
_dxCreateFont = dxCreateFont
_getCursorPosition = getCursorPosition

function dxDrawImage (x, y, w, h, path, ...)
    local x, y, w, h = setScreenPosition(x, y, w, h)
    if type(path) == 'string' then
        if not textures.image[path] then
            textures.image[path] = dxCreateTexture(
                path,
                'argb',
                false,
                'clamp'
            )
        end
        path = textures.image[path]
    end
    return _dxDrawImage(x, y, w, h, path, ...)
end

function dxDrawImageSection(x, y, w, h, ...)
    local x, y, w, h = setScreenPosition(x, y, w, h)
    return _dxDrawImageSection (x, y, w, h, ...)
end

function dxDrawRectangle (x, y, w, h, ...)
    local x, y, w, h = setScreenPosition(x, y, w, h)
    return _dxDrawRectangle(x, y, w, h, ...)
end

function dxCreateFont (path, size, ...)
    local _, scale, _, _ = setScreenPosition (0, size, 0, 0)
    if not textures.font[path] then
        textures.font[path] = {}
    end
    if not textures.font[path][size] then
        textures.font[path][size] = _dxCreateFont(
            path,
            scale,
            ...
        )
    end
    return textures.font[path][size]
end

function dxDrawText (text, x, y, w, h, ...)
    local x, y, w, h = setScreenPosition(x, y, w, h)
    return _dxDrawText(tostring(text), x, y, (x + w), (y + h), ...)
end

function isCursorOnElement (x, y, w, h)
    local x, y, w, h = setScreenPosition(x, y, w, h)
    local mouse = Vector2(_getCursorPosition())
    local cx, cy = (mouse.x * screen.x), (mouse.y * screen.y) 
    return (cx > x and cx < x + w and cy > y and cy < y + h)
end

function getCursorPosition ()
    local mouse = Vector2(_getCursorPosition())
    return math.ceil(mouse.x * screenBase.x), math.ceil(mouse.y * screenBase.y)
end

local interpolates = {}

function lerp (a, b, t)
    return (a * (1 - t) + b * t)
end

function interpolate (start, finish, time, index)
    if not (interpolates[index]) then
        interpolates[index] = start
    end
    interpolates[index] = lerp (interpolates[index], finish, time)
    return math.floor (interpolates[index])
end