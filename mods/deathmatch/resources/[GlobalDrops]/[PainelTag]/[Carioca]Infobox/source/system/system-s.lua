addNotification = function (element, message, type, ...)
	return triggerClientEvent (element, system.notificationEvent, element, message, type, ...)
end