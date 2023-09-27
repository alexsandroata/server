config = {

    ["Connection"] = {	
        ["connectionType"] = "SQLite"; --MySQL ou SQLite
        ["directorySQLite"] = "database/";
        ["hostMySQL"] = "";
        ["dbName"] = "";
        ["dbUser"] = "";
        ["dbPassword"] = "";
    };

    ["Definitions"] = {
        ["changeID"] = "setid";
        ["startID"] = 100;
        ["elementID"] = "ID";
    };
};

message = function (element, msg, type)
    exports['FR_DxMessages']:addBox(element, msg, type)
end

_getPlayerName = getPlayerName
function getPlayerName (player)
    if (not isElement (player)) then
        return false
    end
    return string.gsub (_getPlayerName (player), '#%x%x%x%x%x%x', '');
end

getPlayerID = function(id)
    if ( tonumber(id) ) then
        player = false
        for i, v in ipairs(getElementsByType("player")) do
            if ( getElementData(v, config["Definitions"]["elementID"]) == id ) then
                player = v
                break
            end
        end
        return player
    end
end