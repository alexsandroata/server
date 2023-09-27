local infobox = { }
local positions = { }

local backgroundType = svgCreate (40, 40, [[<svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"><rect width="40" height="40" rx="10" fill="white"/></svg>]], function (element) dxSetTextureEdge(element, 'border') end)
local progress = svgCreate (225, 3, [[<svg width="225" height="3" viewBox="0 0 225 3" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M0 3H225V3C225 1.34315 223.657 0 222 0H3C1.34314 0 0 1.34315 0 3V3Z" fill="white"/></svg>]], function (element) dxSetTextureEdge(element, 'border') end)

local fonts = {
	['regular'] = dxCreateFont ('assets/fonts/RobotoCondensed-Regular.ttf', 10, false, 'proof');
	['regular-9'] = dxCreateFont ('assets/fonts/RobotoCondensed-Regular.ttf', 9, false, 'proof')
}

local isDrawing = nil

local infoboxRender = function ( )
	for key, value in pairs (infobox) do
		local elementPosition = (key == 1 and respc (220) or (positions[key - 1][1] + positions[key - 1][2] + respc (10)))
		local elementAnimation = interpolateBetween (value.animation.initial, 0, 0, value.animation.finish, 0, 0, (getTickCount ( ) - value.animation.tick) / value.animation.time, value.animation.easing)
		local elementWidth = interpolateBetween (0, 0, 0, respc (255), 0, 0, (getTickCount ( ) - value.animation.tickProgress) / (value.elementSeconds * 1000), 'Linear')

		if key > system.notificationSettings.limit then
			positions[1] = nil
			table.remove (infobox, 1)
		end
		if not value.elementFinished and (elementWidth >= respc (250)) then
			value.elementFinished = true
			value.animation.initial = value.animation.finish
			value.animation.finish = -respc (255)
			value.animation.easing = 'InQuad'
			value.animation.tick = getTickCount ( )
		elseif value.elementFinished and elementAnimation == value.animation.finish then
			positions[key] = nil
			table.remove (infobox, key)
		end
		if value.elementSVG and isElement (value.elementSVG) then
			local positionX, positionY = ((elementAnimation + respc (15)) + (respc (40) / 2)) - (respc (value.elementType.image[2][1]) / 2), ((elementPosition + ((value.elementHeight - respc (40)) / 2)) + (respc (40) / 2)) - (respc (value.elementType.image[2][2]) / 2)

			dxSetBlendMode ('add')
				dxDrawImage (elementAnimation, elementPosition, respc (255), value.elementHeight, value.elementSVG)
				dxDrawImage ((elementAnimation + respc ((255 - 225) / 2)), (elementPosition + value.elementHeight - respc (3)), respc (225), respc (3), progress, 0, 0, 0, tocolor (61, 65, 68, 50))
				dxDrawImage ((elementAnimation + respc (15)), elementPosition + ((value.elementHeight - respc (40)) / 2), respc (40), respc (40), backgroundType, 0, 0, 0, tocolor (unpack (value.elementType.color)))
				dxDrawImage (positionX, positionY, respc (value.elementType.image[2][1]), respc (value.elementType.image[2][2]), tex[value.elementRealType], 0, 0, 0, tocolor (255, 255, 255, 255))
				dxDrawImageSection ((elementAnimation + respc ((255 - 225) / 2)), (elementPosition + value.elementHeight - respc (3)), elementWidth, respc (3), 0, 0, elementWidth, respc (3), progress, 0, 0, 0, tocolor (unpack (value.elementType.color)))
			dxSetBlendMode ('blend')
		end

		dxDrawText (value.elementMessage, (elementAnimation + respc (65)), elementPosition, respc (168), value.elementHeight, tocolor (235, 235, 235), 1, fonts['regular'], 'left', 'center', false, true)
		
		if value.elementRepeat ~= 0 then
			dxDrawText ('x'..value.elementRepeat, (elementAnimation + respc (223)), (elementPosition + respc (10)), respc (22), respc (13), tocolor (unpack (value.elementType.color)), 1, fonts['regular-9'], 'right', 'center')
		end

		positions[key] = {elementPosition, value.elementHeight}
	end
end

local getNotification = function (elementMessage, elementType)
	for key, value in pairs (infobox) do
		if value.elementMessage == elementMessage and value.elementType == elementType then
			return key
		end
	end
	return false
end

addNotification = function (elementMessage, elementType, elementSeconds)
	local elementMessage = (elementMessage and elementMessage:gsub ('#%x%x%x%x%x%x', '') or 'undefined')
	local elementRealType = (elementType and system.notificationsType[elementType] and elementType or system.notificationSettings.defaultType);
	local elementType = (elementType and system.notificationsType[elementType] or system.notificationsType[system.notificationSettings.defaultType])
	local elementSeconds = (tonumber (elementSeconds) and elementSeconds or system.notificationSettings.defaultSeconds)

	local elementIndex = getNotification (elementMessage, elementType)

	if infobox[elementIndex] then
		infobox[elementIndex].elementRepeat = infobox[elementIndex].elementRepeat + 1
	else
		if elementType.sound then
			local notificationSFX = playSound ('assets/sfx/'..elementType.sound)
			setSoundVolume (notificationSFX, 0.5)
		end

		local _, _height = dxGetTextSize (elementMessage, respc (170), 1, fonts['regular'], true)
		height = (_height <= 51 and respc (70) or respc (70 + (_height / 2)))

		local svgDocument = [[
			<svg width="255" height="]]..height..[[">
				<rect width="255" height="]]..height..[[" rx="12" fill="#2A2E31" opacity="0.50"/>
			</svg>
		]]

		local elementValues = {
			elementMessage = elementMessage;
			elementType = elementType;
			elementRealType = elementRealType;
			elementSeconds = elementSeconds;
			elementRepeat = 1;
			elementHeight = height;
			elementFinished = false;

			elementSVG = svgCreate (respc (255), height, svgDocument, function (element) dxSetTextureEdge (element, 'border') end);
			animation = {
				initial = -respc (290);
				finish = respc (20);
				tick = getTickCount ( );
				tickProgress = getTickCount ( );
				easing = 'OutQuad';
				time = 800;
			}
		}

		table.insert (infobox, elementValues)

		if not isDrawing then
			isDrawing = true
			addEventHandler ('onClientRender', root, infoboxRender)
		end
	end
end
createEventHandler (system.notificationEvent, root, addNotification)