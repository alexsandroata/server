--== Script feito por:
--== ● Caio ●
--== Discord: Caio#8888
--===================================================
--== Qualquer problema procure pelo meu discord.
--===================================================

config = {

    colorRGB = {159, 67, 251}, -- R, G, B

    abas = {
        ['Carros'] = {
            image = 'assets/images/carros.png',
            mods = {
                {modelo = 504, name = 'Carro 1'},
                {modelo = 400, name = 'Carro 2'},
                {modelo = 411, name = 'Carro 3'},
            },
        },

        ['Motocicletas'] = {
            image = 'assets/images/motos.png',
            mods = {
                {modelo = 522, name = 'Moto 1'},
                {modelo = 436, name = 'Moto 2'},
            },
        },
    },

    panel = {
        vehicle = false, -- true: pode abrir dentro de veículos, false: bloqueia abrir de dentro de algum veículo
        type = 'Command'; -- Bind or Command
        key = 'mods' -- Bind: Tecla que vai abrir o painel, Command: Comando que vai abrir o painel
    },

    notify = function (src, arg1, arg2, arg3)

        -- CLIENT: arg1 message, arg2 type
        -- SERVER: arg1 element, arg2 message, arg3 type

        if src == 'client' then
            exports['XELA_Notify']:addBox(arg1, arg2)
        elseif src == 'server' then
            exports['XELA_Notify']:addBox(arg1, arg2, arg3)
        end
    end

}

function formatNumber(number)
	local money = number
	for i = 1, tostring(money):len()/3 do
		money = string.gsub(money, "^(-?%d+)(%d%d%d)", "%1.%2")
	end
	return money
end