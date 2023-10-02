--##################################
--## Script feito por zJoaoFtw_   ##
--## Design feito por Golf        ##
--##################################

config = {
    ["Mensagem Start"] = true, --Caso esteja false ele não irá aparecer a mensagem!
    ["Adicionais"] = {
        {"Mira", "select", "image", "mira", ":vanish_setlags/files/imgs/mira/1.png", 1}, --1
        {"Limite FPS", "select", "text", "limitfps", "65", 3}, --2
        {"Chuva", "active", "", "chuva", true, ""}, --3
        {"Hud", "active", "", "hud", true, ""}, --4
        {"Radar", "active", "", "radar", true, ""}, --5
        {"Chat", "active", "", "chat", true, ""}, --6
        {"Vegetação", "active", "", "vegetation", true, ""}, --7
        {"Nuvens", "active", "", "nuvens", true, ""}, --8
    },
    ["Renderizações"] = {
        ["Mapa"] = 5000,
        ["Personagens"] = 500,
        ["Veículos"] = 500,
        ["Objetos"] = 5000,
    },
    ["Predefinições"] = {
        ["fraco"] = {
            {"Adicionais", 2, 45},
            {"Adicionais", 3, false},
            {"Adicionais", 4, false},
            {"Adicionais", 5, false},
            {"Adicionais", 6, false},
            {"Adicionais", 7, false},
            {"Adicionais", 8, false},
            {"Renderizações", "Mapa", 100},
            {"Renderizações", "Personagens", 10},
            {"Renderizações", "Veículos", 10},
            {"Renderizações", "Objetos", 50},
        },
        ["médio"] = {
            {"Adicionais", 2, 55},
            {"Adicionais", 3, false},
            {"Adicionais", 4, true},
            {"Adicionais", 5, false},
            {"Adicionais", 6, true},
            {"Adicionais", 7, false},
            {"Adicionais", 8, false},
            {"Renderizações", "Mapa", 2500},
            {"Renderizações", "Personagens", 250},
            {"Renderizações", "Veículos", 250},
            {"Renderizações", "Objetos", 2500},
        },
        ["forte"] = {
            {"Adicionais", 2, 65},
            {"Adicionais", 3, true},
            {"Adicionais", 4, true},
            {"Adicionais", 5, true},
            {"Adicionais", 6, true},
            {"Adicionais", 7, true},
            {"Adicionais", 8, true},
            {"Renderizações", "Mapa", 5000},
            {"Renderizações", "Personagens", 500},
            {"Renderizações", "Veículos", 500},
            {"Renderizações", "Objetos", 5000},
        },
    },
    ["select's"] = {
        ["mira"] = {
            {1, ":vanish_setlags/files/imgs/mira/1.png", ":vanish_setlags/files/imgs/miraSelect/1.png"},
            {2, ":vanish_setlags/files/imgs/mira/2.png", ":vanish_setlags/files/imgs/miraSelect/2.png"},
            {2, ":vanish_setlags/files/imgs/mira/3.png", ":vanish_setlags/files/imgs/miraSelect/3.png"},
            {2, ":vanish_setlags/files/imgs/mira/4.png", ":vanish_setlags/files/imgs/miraSelect/4.png"},
            {2, ":vanish_setlags/files/imgs/mira/5.png", ":vanish_setlags/files/imgs/miraSelect/5.png"},
            {2, ":vanish_setlags/files/imgs/mira/6.png", ":vanish_setlags/files/imgs/miraSelect/6.png"},
            {2, ":vanish_setlags/files/imgs/mira/7.png", ":vanish_setlags/files/imgs/miraSelect/7.png"},
            {2, ":vanish_setlags/files/imgs/mira/8.png", ":vanish_setlags/files/imgs/miraSelect/8.png"},
            {2, ":vanish_setlags/files/imgs/mira/9.png", ":vanish_setlags/files/imgs/miraSelect/9.png"},
            {2, ":vanish_setlags/files/imgs/mira/10.png", ":vanish_setlags/files/imgs/miraSelect/10.png"},
            {2, ":vanish_setlags/files/imgs/mira/11.png", ":vanish_setlags/files/imgs/miraSelect/11.png"},
            {2, ":vanish_setlags/files/imgs/mira/12.png", ":vanish_setlags/files/imgs/miraSelect/12.png"},
            {2, ":vanish_setlags/files/imgs/mira/13.png", ":vanish_setlags/files/imgs/miraSelect/13.png"},
            {2, ":vanish_setlags/files/imgs/mira/14.png", ":vanish_setlags/files/imgs/miraSelect/14.png"},
            {2, ":vanish_setlags/files/imgs/mira/15.png", ":vanish_setlags/files/imgs/miraSelect/15.png"},
            {2, ":vanish_setlags/files/imgs/mira/16.png", ":vanish_setlags/files/imgs/miraSelect/16.png"},
            {2, ":vanish_setlags/files/imgs/mira/17.png", ":vanish_setlags/files/imgs/miraSelect/17.png"},
            {2, ":vanish_setlags/files/imgs/mira/18.png", ":vanish_setlags/files/imgs/miraSelect/18.png"},
            {2, ":vanish_setlags/files/imgs/mira/19.png", ":vanish_setlags/files/imgs/miraSelect/19.png"},
            {2, ":vanish_setlags/files/imgs/mira/20.png", ":vanish_setlags/files/imgs/miraSelect/20.png"},
            {2, ":vanish_setlags/files/imgs/mira/21.png", ":vanish_setlags/files/imgs/miraSelect/21.png"},
            {2, ":vanish_setlags/files/imgs/mira/22.png", ":vanish_setlags/files/imgs/miraSelect/22.png"},
            {2, ":vanish_setlags/files/imgs/mira/23.png", ":vanish_setlags/files/imgs/miraSelect/23.png"},
            {2, ":vanish_setlags/files/imgs/mira/24.png", ":vanish_setlags/files/imgs/miraSelect/24.png"},
            {2, ":vanish_setlags/files/imgs/mira/25.png", ":vanish_setlags/files/imgs/miraSelect/25.png"},
            {2, ":vanish_setlags/files/imgs/mira/26.png", ":vanish_setlags/files/imgs/miraSelect/26.png"},
            {2, ":vanish_setlags/files/imgs/mira/27.png", ":vanish_setlags/files/imgs/miraSelect/27.png"},
            {2, ":vanish_setlags/files/imgs/mira/28.png", ":vanish_setlags/files/imgs/miraSelect/28.png"},
            {2, ":vanish_setlags/files/imgs/mira/29.png", ":vanish_setlags/files/imgs/miraSelect/29.png"},
            {2, ":vanish_setlags/files/imgs/mira/30.png", ":vanish_setlags/files/imgs/miraSelect/30.png"},
        },
        ["limitfps"] = {
            {_, 15, _},
            {_, 30, _}, 
            {_, 65, _},
            {_, 100, _},
        },
    },
}

formatNumber = function(number)   
    local formatted = number   
    while true do       
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')     
        if ( k==0 ) then       
            break   
        end   
    end   
    return formatted 
end 

notifyS = function(player, message, type)
    exports["FR_DxMessages"]:addBox(player, message, type)
end

notifyC = function(message, type)
    exports["FR_DxMessages"]:addBox(message, type)
end

function removeHex(message)
	if (type(message) == "string") then
		while (message ~= message:gsub("#%x%x%x%x%x%x", "")) do
			message = message:gsub("#%x%x%x%x%x%x", "")
		end
	end
	return message or false
end

function puxarNome(player)
    return removeHex(getPlayerName(player))
end

function puxarID(player)
    return (getElementData(player, "ID") or 0)
end

function puxarConta(player)
    return getAccountName(getPlayerAccount(player))
end

function dadosMarker()
    return "cylinder", 1.1, 0, 0, 0, 90
end

local tableNumberAccents = { ["{"] = true, ["}"] = true, ["["] = true, ["]"] = true, ["!"] = true, ["@"] = true, ["#"] = true, ["$"] = true, ["%"] = true, ["¨"] = true, ["&"] = true, ["*"] = true, ["("] = true, [")"] = true, ["-"] = true, ["="] = true, ["_"] = true, ["+"] = true, ["/"] = true, ["\\"] = true, ["|"] = true, ["."] = true, [","] = true, ["<"] = true, [">"] = true, [":"] = true, [";"] = true, ["~"] = true, ["^"] = true, ["`"] = true, ["?"] = true, ['"'] = true,  ["'"] = true,  [' '] = true, ["Ç"] = true, ["ü"] = true, ["é"] = true, ["â"] = true, ["ä"] = true, ["à"] = true, ["å"] = true, ["ç"] = true, ["ê"] = true, ["ë"] = true, ["è"] = true, ["ï"] = true, ["î"] = true, ["ì"] = true, ["Ä"] = true, ["Å"] = true, ["É"] = true, ["æ"] = true, ["Æ"] = true, ["ô"] = true, ["ö"] = true, ["ò"] = true, ["û"] = true, ["ù"] = true, ["ÿ"] = true, ["Ö"] = true, ["Ü"] = true, ["¢"] = true, ["£"] = true, ["¥"] = true, ["₧"] = true, ["ƒ"] = true, ["á"] = true, ["í"] = true, ["ó"] = true, ["ú"] = true, ["ñ"] = true, ["Ñ"] = true, ["ª"] = true, ["º"] = true, ["¿"] = true, ["⌐"] = true, ["¬"] = true, ["½"] = true, ["¼"] = true, ["¡"] = true, ["«"] = true, ["»"] = true, ["░"] = true, ["▒"] = true, ["▓"] = true, ["│"] = true, ["┤"] = true, ["╡"] = true, ["╢"] = true, ["╖"] = true, ["╕"] = true, ["╣"] = true, ["║"] = true, ["╗"] = true, ["╝"] = true, ["╜"] = true, ["╛"] = true, ["┐"] = true, ["└"] = true, ["┴"] = true, ["┬"] = true, ["├"] = true, ["─"] = true, ["┼"] = true, ["╞"] = true, ["╟"] = true, ["╚"] = true, ["╔"] = true, ["╩"] = true, ["╦"] = true, ["╠"] = true, ["═"] = true, ["╬"] = true, ["╧"] = true, ["╨"] = true, ["╤"] = true, ["╥"] = true, ["╙"] = true, ["╘"] = true, ["╒"] = true, ["╓"] = true, ["╫"] = true, ["╪"] = true, ["┘"] = true, ["┌"] = true, ["█"] = true, ["▄"] = true, ["▌"] = true, ["▐"] = true, ["▀"] = true, ["α"] = true, ["ß"] = true, ["Γ"] = true, ["π"] = true, ["Σ"] = true, ["σ"] = true, ["µ"] = true, ["τ"] = true, ["Φ"] = true, ["Θ"] = true, ["Ω"] = true, ["δ"] = true, ["∞"] = true, ["φ"] = true, ["ε"] = true, ["∩"] = true, ["≡"] = true, ["±"] = true, ["≥"] = true, ["≤"] = true, ["⌠"] = true, ["⌡"] = true, ["÷"] = true, ["≈"] = true, ["°"] = true, ["∙"] = true, ["·"] = true, ["√"] = true, ["ⁿ"] = true, ["²"] = true, ["■"] = true, ["´"] = true, ["à"] = true, ["á"] = true, ["â"] = true, ["ã"] = true, ["ä"] = true, ["ç"] = true, ["è"] = true, ["é"] = true, ["ê"] = true, ["ë"] = true, ["ì"] = true, ["í"] = true, ["î"] = true, ["ï"] = true, ["ñ"] = true, ["ò"] = true, ["ó"] = true, ["ô"] = true, ["õ"] = true, ["ö"] = true, ["ù"] = true, ["ú"] = true, ["û"] = true, ["ü"] = true, ["ý"] = true, ["ÿ"] = true, ["À"] = true, ["Á"] = true, ["Â"] = true, ["Ã"] = true, ["Ä"] = true, ["Ç"] = true, ["È"] = true, ["É"] = true, ["Ê"] = true, ["Ë"] = true, ["Ì"] = true, ["Í"] = true, ["Î"] = true, ["Ï"] = true, ["Ñ"] = true, ["Ò"] = true, ["Ó"] = true, ["Ô"] = true, ["Õ"] = true, ["Ö"] = true, ["Ù"] = true, ["Ú"] = true, ["Û"] = true, ["Ü"] = true, ["Ý"] = true,}
function verifyNumber(str)
    local noAccentsStr = false
    for strChar in string.gfind(str, "([%z\1-\127\194-\244][\128-\191]*)") do
        if (tableNumberAccents[strChar]) then
            noAccentsStr = tableNumberAccents[strChar]
        end
    end
    return noAccentsStr
end