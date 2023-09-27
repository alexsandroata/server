-- RESOLUTION's
screenW, screenH = guiGetScreenSize ( )
scale = 1

respc = function (value)
	return value * scale
end

-- UTIL's
tex = { }

addEventHandler ('onClientResourceStart', resourceRoot, function ( )
	for elementType, elementResult in pairs (system.notificationsType) do
		local image = elementResult.image[1]

		if string.find (image, '.png') then
			tex[elementType] = dxCreateTexture ('assets/images/'..image, 'argb', true, 'clamp')
		else
			tex[elementType] = svgCreate (elementResult.image[2][1], elementResult.image[2][2], image, function (element)
				dxSetTextureEdge(element, 'border')
			end)
		end
	end
end)

_dxDrawText = dxDrawText
dxDrawText = function (text, x, y, width, height, ...)
	return _dxDrawText (text, x, y, x + width, y + height, ...)
end