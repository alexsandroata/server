-- https://globaldrops.blogspot.com
-- https://discord.gg/EjXJUdspWb

weapons = {
    --Site para pegar id da arma (https://wiki.multitheftauto.com/wiki/Weapons)
    --["item"]       = { id, munição, capacidade },

    --Arma branca
    ["brassknuckle"] = { 1, nil,  0 };
    ["picareta"]     = { 2, nil,  0 };
    ["nightstick"]   = { 3, nil,  0 };
    ["knife"]        = { 4, nil,  0 };
    ["bat"]          = { 5, nil,  0 };
    ["shovel"]       = { 6, nil,  0 };
    ["poolstick"]    = { 7, nil,  0 };
    ["katana"]       = { 8, nil,  0 };
    ["chainsaw"]     = { 9, nil,  0 };
    ["dildo"]        = { 10, nil, 0 };
    ["cutelo"]        = { 15, nil, 0 };
    ["teser"]        = { 23, nil, 0 };

    --Arma de fogo
    ["pistol.m92"]      = { 22, "ammo.pistol", 14 };
    ["pistol.python"]   = { 24, "ammo.pistol", 9 };
    ["glock"]   = { 28, "ammo.pistol", 28 };
    ["shotgun.m1887"]   = { 25, "ammo.shotgun", 12 };
    ["shotgun.tec01"]   = { 27, "ammo.shotgun", 16 };
    ["smg.mp5"]         = { 29, "ammo.pistol", 60 };
    ["rifle.ak47"]      = { 30, "ammo.rifle", 60 };
    ["rifle.m4"]        = { 31, "ammo.rifle", 60 };
    ["rifle.hunter"]    = { 33, "ammo.rifle", 8 };
    ["rifle.svd"]       = { 34, "ammo.rifle", 20 };
    ["rocket.launcher"] = { 36, "ammo.rocket", 1 };
    ["M4A1"] = { 31, "ammo.rocket", 1 };

    --Granadas
    ["grenade"] = { 16, nil, 0 };
    ["teargas"] = { 17, nil, 0 };
    ["molotov"] = { 18, nil, 0 };
};

trunk = {
    --Exports
    -- exports.CzInventory:insertTrunk(id do veículo) --registrar o porta-malas no banco de dados do inventário
    -- exports.CzInventory:loadTrunk(id, vehicle) ------carregar os itens do porta-malas do veículo
    -- exports.CzInventory:saveTrunk(id, vehicle) ------salvar o porta-malas do veículo
    -- exports.CzInventory:deleteTrunk(id) -------------deletar o porta-malas do banco de dados

    ["getElementData"] = { -- Element data da concessionária ou algo que salva o veículo.
        ["vehicleID"] = "MST.onVehicleID";       --ID do carro
        ["vehicleOwner"] = "MST.onVehicleOwner"; --ID do dono do carro
    };
    --Tipo de porta-malas, 0 (capô), 1 (porta-malas)
    --[id do carro] = { peso, tipo de porta-malas, Sound Effect }
    --[541] = { weight = 500, trunk = 1, sound = true };
   -- [533] = { weight = 500, trunk = 1, sound = true };
    --[451] = { weight = 100, trunk = 0, sound = true };
    --[562] = { weight = 100, trunk = 1, sound = true };
    --[470] = { weight = 999, trunk = 1, sound = true };
    --[522] = { weight = 999, trunk = nil, sound = true };
    --[506] = { weight = 999, trunk = 0, sound = true };
	
	--[[Fortal city
	[462] = { weight = 12, trunk = 1, sound = true };          --Biz
	[581] = { weight = 9, trunk = 1, sound = true };          --CG 160
	[468] = { weight = 6, trunk = 1, sound = true };          --Tiger R1200
	[521] = { weight = 3, trunk = 1, sound = true };          --MT09
	[522] = { weight = 3, trunk = 1, sound = true };          --S1000
	[461] = { weight = 3, trunk = 1, sound = true };          --Z1000
	[517] = { weight = 15, trunk = 1, sound = true };          --Chevette
	[527] = { weight = 20, trunk = 1, sound = true };          --GOL
	[565] = { weight = 25, trunk = 1, sound = true };          --GOL Quadrado Turbo
	[401] = { weight = 25, trunk = 1, sound = true };          --Golf GTI
	[529] = { weight = 25, trunk = 1, sound = true };          --Sonata
	[603] = { weight = 80, trunk = 1, sound = true };          --Saveiro Cross
	[566] = { weight = 120, trunk = 1, sound = true };          --S10
	[479] = { weight = 135, trunk = 1, sound = true };          --Fiat Toro
	[551] = { weight = 35, trunk = 1, sound = true };          --Audi Rs7
	[400] = { weight = 45, trunk = 1, sound = true };          --Hummer H2
	[415] = { weight = 45, trunk = 1, sound = true };          --Corvette
	[576] = { weight = 50, trunk = 1, sound = true };          --Dodge Challenger
	[506] = { weight = 50, trunk = 1, sound = true };          --AMG GTR
	[602] = { weight = 50, trunk = 1, sound = true };          --Camaro
	[587] = { weight = 80, trunk = 1, sound = true };          --Ranger Rover Velar
	[585] = { weight = 80, trunk = 1, sound = true };          --Audi Q7
	[494] = { weight = 130, trunk = 0, sound = true };          --Lamborghini Huracan
	[429] = { weight = 130, trunk = 0, sound = true };          --Ferrari F8
	[503] = { weight = 150, trunk = 0, sound = true };          --Lamborghini Venon
	[541] = { weight = 150, trunk = 1, sound = true };          --Nissan GTR
	[541] = { weight = 150, trunk = 1, sound = true };          --Nissan GTR
	]]
};

infobox = {
    ["width"] = { 10, 300 }; ----Posição X
    ["height"] = { 530, 700 }; --Posição Y, 530 com gps, 753 sem gps
    ["list"] = {
        --As notificações padrão não modifique o nome, (info, success, error, warn, chernaruz). Você pode criar novas notificações
        { name = "info", colors = { rectangle = { 71, 149, 205, 255 }, progress = { 0, 0, 0, 30 }, text = { 247, 247, 247, 255 }}},
        { name = "success", colors = { rectangle = { 132, 174, 58, 255 }, progress = { 0, 0, 0, 30 }, text = { 247, 247, 247, 255 }}},
        { name = "error", colors = { rectangle = { 217, 83, 79, 255 }, progress = { 0, 0, 0, 30 }, text = { 247, 247, 247, 255 }}},
        { name = "warn", colors = { rectangle = { 202, 108, 47, 255 }, progress = { 0, 0, 0, 30 }, text = { 247, 247, 247, 255 }}},
        { name = "chernaruz", colors = { rectangle = { 241, 15, 173, 255 }, progress = { 0, 0, 0, 30 }, text = { 247, 247, 247, 255 }}},
        --
    };
};

hand = { --Necessário ter o script bone_attach
--  [Item]      = { ID do objeto, BONE, X, Y, Z, X, Y, Z, SIZE }
    ["pizza"]   = { 2702, 12, -3.4694469519536e-18, 0.08, 0.05, -6, 251.5, 10, 0.7 };
    ["jerrycan"]    = { 1650, 12, -0.05, 0, 0.12, 0, 160, 30, 1.0 };
    ["toolbox"] = { 2969, 12, 0, 0, 0.20, 6, 160, 360, 0.5 };
    ["box"] = { 2332, 12, -0.12, 0, 0.28, -16, 160, 270, 0.4 };
};

Config = {
    --Banco de dados
    ["storage"] = {
        ["type"] = "sqlite"; -- types [ mysql, sqlite]

        --Só preencha se você escolheu o tipo mysql
        ["host"] = "127.0.0.1";
        ["port"] = "3306";
        ["user"] = "root";
        ["password"] = "";
        ["database"] = "chernaruz";
    };

    ["getElementData"] = { ----------Element data sobre o usuário
        ["id"] = "ID"; --------------ID
        ["username"] = "Username"; --Nome do usuário (nome que está na identidade)
    };

    ["serial"] = "none"; -- serial padrão do item

    ["interact"] = {
        ["distance"] = 5; ----------Distância para interagir com o porta-malas, baú e loja
        ["bindKey"] = "b"; ---------Botão que abre inventário
        ["command"] = "abririnv"; --Comando para abrir o inventário
        ["health"] = 30; -----------Deste valor para baixo, o jogador não será capaz de abrir, ver ou interagir com o inventário
    };

    --ACL
    ["alertPolice"] = { "Admin", "Policial" }; --Ver nofiticação, blip e infobox
    ["search"] = { ----------------------------Revistar o jogador
        ["view"] = { "Admin", "Policial", "Gang" }; -----Ver o inventário do jogador
        ["take"] = { "Admin", "Policial", "Gang" }; -----Remover o item do inventário do jogador
    };

    ["style"] = {
        ["blur"] = { enabled = false, color = { 174, 174, 174, 255 } };
      
        ["edge"] = 1; --Tamanho da borda
      
        ["viewMaxAmount"] = 99999; --Valor máximo do item exibido no slot
                
        ["header"] = {
            ["tabs"] = { "Usuário" --[[ 1 ]], "Alimentos" --[[ 2 ]], "Armas" --[[ 3 ]], "Outros" --[[ 4 ]] };
            ["downsize"] = 12; --Reduza o tamanho dos ícones.
            ["margin"] = 23; ----Distância de um ícone para outro
        };

        ["slot"] = { --Essa parte é muito importante porque é a configuração principal do inventário.
            ["icon_downsize"] = 0; --Reduzir o tamanho do ícone
            ["size"] = 46; ----------Tamanho do slot
            ["margin"] = 1; ---------Distância de um slot para outro
            ["columns"] = 6; --------Qauntidade de slot vertical
            ["rows"] = 6; -----------Qauntidade de slot horizontal
        };

        ["actionBar"] = { -----Barra de ação
            ["show"] = true; --Exibir a barra de ação?
            ["rows"] = 6; -----Qauntidade de slot por fila
        };

        ["weight"] = { -----------Peso
            ["size"] = 32; -------Tamanho da barra de peso
            ["inventory"] = 50; --Peso do inventário
            ["box"] = 999; -------Peso do baú
        };

        ["progressBar"] = { ---A barra de progresso está de acordo com a barra de ação
            ["height"] = 70; --Altura do background
            ["colors"] = { background = { 35, 36, 41, 255 }, bar = { 26, 27, 31, 200 }, emphasis = { 100,127,201, 255 }, text = { 186, 187, 190, 200 } };
            ["margin"] = 6;
        };

        ["booleanTrade"] = { --O booleanTrade é uma barra de configuração exibida na parte inferior do inventário.
            ["enabled"] = true; --Estado
            ["size"] = 22; -------O tamanho da barra
            ["margin"] = 4; ------A distância da barra ao inventário e à barra de ação
            ["symbol"] = "✕"; ----O símbolo para indicar que está ativado
        };

        ["menu"] = { --Este menu é exibido quando o jogador clica com o botão direito do mouse no item.
            ["downsize"] = 0; --Reduza o tamanho das interações do menu, ícone, botão e divisão de itens.
        };

        ["colors"] = { --Cor RGB
            [1] = { 100,127,201, 255 }; --Cor em destaque
            [2] = { 26, 27, 31, 255 }; -----Cor do background
            [3] = { 35, 36, 41, 255 }; -----Cor do slot e botão
            [4] = { 255, 255, 255, 255 }; --Cor do tab
            [5] = { 186, 187, 190, 255 }; --Cor do texto
            [6] = { 100,127,201, 100 }; --Select action bar
        };

        ["options"] = { --Opções do baú
            ["size"] = 46;
            ["margin"] = 6;
            ["colors"] = { background = { 102, 127, 201, 255 }, select = { 255, 0, 48, 255 } };
            ["blur"] = { enabled = true, color = { 174, 174, 174, 255 } };
        };
    };

	["items"] = { --Tabela de itens
        --[[ Arma branca ]]
        ["dildo"] = {
            tab = 3,
            name = "Dildo",
            lore = "Este item realmente precisa de uma descrição?",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 10, ----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["katana"] = {
            tab = 3,
            name = "Katana",
            lore = "Katana era uma das espadas japonesas de fabricação tradicional usada pelos samurais do Japão antigo e feudal.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 10, ----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["brassknuckle"] = {
            tab = 3,
            name = "Soco ingles",
            lore = "Socos-ingleses são armas usadas no combate corpo a corpo.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 10, ----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["knife"] = {
            tab = 3,
            name = "Faca",
            lore = "melhor faca de combate :)",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 1, -----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["nightstick"] = {
            tab = 3,
            name = "Cassetete",
            lore = "O Cassetete é um taco aproximadamente cilíndrico feito de madeira, borracha, plástico ou metal.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 1, -----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["bat"] = {
            tab = 3,
            name = "Taco de beisebol",
            lore = "Um taco de beisebol é um taco liso de madeira ou metal usado no esporte do beisebol.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 1, -----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["shovel"] = {
            tab = 3,
            name = "Pá",
            lore = "Uma pá é uma ferramenta para cavar.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 1, -----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["poolstick"] = {
            tab = 3,
            name = "Taco de sinuca",
            lore = "Taco de sinuca profissional",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 1, -----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["chainsaw"] = {
            tab = 3,
            name = "Motosserra",
            lore = "Sem descrição.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 1, -----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
		["picareta"] = {
            tab = 3,
            name = "Picareta",
            lore = "Instrumento composto por uma peça de ferro com duas pontas bem afiadas.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 1,
            button = nil, --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["cutelo"] = {
            tab = 3,
            name = "Cutelo",
            lore = "O cutelo é uma ferramenta usada atualmente na cozinha e na indústria de abate de animais.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 1,
            button = nil, --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },

        --[[ Granadas ]]
        ["grenade"] = {
            tab = 3,
            name = "F1 Grenade",
            lore = "Uma granada é uma pequena bomba normalmente lançada à mão. Geralmente, uma granada consiste em uma carga explosiva, um mecanismo de detonação e um pino de disparo para acionar o mecanismo de detonação.",
            durability = 0,
            stackSize = 5, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 10, ----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["teargas"] = {
            tab = 3,
            name = "Gás lacrimogêneo",
            lore = "Sem lore",
            durability = 0,
            stackSize = 5, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 10, ----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["molotov"] = {
            tab = 3,
            name = "Molotov",
            lore = "Sem lore",
            durability = 0,
            stackSize = 5, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 10, ----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },

		--[[ Arma de fogo ]]
        ["rifle.svd"] = {
            tab = 3,
            name = "SVD",
            lore = "O rifle de precisão SVD é um rifle de atirador.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 2.7, ---Peso do item
            button = "Descarregar a munição", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["rifle.ak47"] = {
            tab = 3,
            name = "AK-47",
            lore = "A AK-47 é um rifle preciso, poderoso e totalmente automático.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 2.3, ---Peso do item
            button = "Descarregar a munição", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["rifle.m4"] = {
            tab = 3,
            name = "M4",
            lore = "A M4 é um rifle de assalto de nível militar raro.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 2.7, ---Peso do item
            button = "Descarregar a munição", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["rifle.hunter"] = {
            tab = 3,
            name = "Hunter 85",
            lore = "O Hunter 85 é um rifle de ação de ferrolho de pequeno calibre usado principalmente para pequenos jogos de caça.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 2.5, ---Peso do item
            button = "Descarregar a munição", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["smg.mp5"] = {
            tab = 3,
            name = "MP5A4",
            lore = "A MP5A4 é uma submetralhadora de 30 tiros de nível militar.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 1.5, ---Peso do item
            button = "Descarregar a munição", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["rocket.launcher"] = {
            tab = 3,
            name = "Rocket Launcher",
            lore = "Sem descrição.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 5.0, ---Peso do item
            button = "Descarregar a munição", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["pistol.m92"] = {
            tab = 3,
            name = "M92 Pistol",
            lore = "A pistola M92 é uma arma poderosa com baixo recuo e alta taxa de tiro e danos.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 1, -----Peso do item
            button = "Descarregar a munição", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["pistol.python"] = {
            tab = 3,
            name = "Python Revolver",
            lore = "Como uma pistola, a Python tem a maior precisão e dano por tiro de toda a linha.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 1.3, ---Peso do item
            button = "Descarregar a munição", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
		["glock"] = {
            tab = 3,
            name = "Glock Automática",
            lore = "É uma série de pistolas automáticas com armação de polímero, com sistema de funcionamento por curto recuo basculante do cano.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 1.3, ---Peso do item
            button = "Descarregar a munição", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
		["teser"] = {
            tab = 3,
            name = "Taser",
            lore = "Arma de choque.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 1.3, ---Peso do item
            button = nil, --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["shotgun.m1887"] = {
            tab = 3,
            name = "M1887",
            lore = "A M1887 é uma espingarda de ação de alavanca produzida no final do século XIX.",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 2.0, ---Peso do item
            button = "Descarregar a munição", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["shotgun.tec01"] = {
            tab = 3,
            name = "TEC01 490",
            lore = "A TEC01 490 é uma espingarda de ação de bomba feita por um fabricante desconhecido e é usada principalmente pelo pessoal do TEC01 em situações críticas..",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 2.3, ---Peso do item
            button = "Descarregar a munição", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },


        --[[ Munições ]]
        ["ammo.rifle"] = {
            tab = 3,
            name = "5.56 Rifle Ammo",
            lore = "Munição padrão de alta potência, usada por qualquer rifle no jogo atualmente.",
            durability = 0,
            stackSize = 128, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 0.05, ----Peso do item
            button = nil, --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["ammo.pistol"] = {
            tab = 3,
            name = "Pistol Bullet",
            lore = "Munição padrão para pistolas e metralhadoras.",
            durability = 0,
            stackSize = 128, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 0.01, ----Peso do item
            button = nil, -----Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["ammo.shotgun"] = {
            tab = 3,
            name = "12 Gauge Buckshot",
            lore = "12 Gauge Buckshot é um tipo de munição de espingarda que dispara uma ampla variedade de 14 projéteis de baixo dano.",
            durability = 0,
            stackSize = 64, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 0.03, ---Peso do item
            button = nil, ----Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["ammo.rocket"] = {
            tab = 3,
            name = "Rocket",
            lore = "Sem descrição :(",
            durability = 0,
            stackSize = 3, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 1, -----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },

        --[[ Equipamentos ]]
        ["vest"] = {
            tab = 1,
            name = "Colete",
            lore = "Colete balístico",
            durability = 100,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 5, -----Peso do item
            button = "Equipar", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },

        --[[ Bebidas ]]
        ["bottle.vodka"] = {
            tab = 2,
            name = "Garrafa de vodka",
            lore = "Uma garrafa de Vodka Russa.",
            durability = 0,
            stackSize = 10, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 0.5, ----Peso do item
            button = "Beber conteúdo", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },

        --[[ Alimentos ]]
        ["pizza"] = {
            tab = 2,
            name = "Pizza",
            lore = "Pizza saborosa.",
            durability = 0,
            stackSize = 10, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 0.05, ---Peso do item
            button = "Comer", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },

        --[[ Medicamentos ]]
        ["medkit"] = {
            tab = 4,
            name = "Estojo Médico",
            lore = "Um grande estojo médico.",
            durability = 0,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 2, -----Peso do item
            button = "Usar kit médico", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["bandage"] = {
            tab = 4,
            name = "Bandagem",
            lore = "As bandagens são suprimentos médicos feitos para parar o sangramento e curar um pouco da saúde.",
            durability = 0,
            stackSize = 3, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 0.8, ---Peso do item
            button = "Usar curativo", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },

        --[[ Outros ]]
        ["jerrycan"] = {
            tab = 1,
            name = "Galão de gasolina",
            lore = "O galão é um equipamento utilizado para abastecer veículos a partir do combustível obtido em um Posto de Gasolina.",
            durability = 0,
            stackSize = 0, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 0, -----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = nil, ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["dirtymoney"] = {
            tab = 1,
            name = "Dinheiro sujo",
            lore = "Dinheiro ilegal.",
            durability = 0,
            stackSize = 50000, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 0, -----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["maconha"] = {
            tab = 1,
            name = "Maconha",
            lore = "A maconha, também conhecida por marijuana, é obtida de uma planta com o nome científico Cannabis sativa.",
            durability = 0,
            stackSize = 5, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 0.1, ---Peso do item
            button = "Enrolar Baseado", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["key"] = {
            tab = 4,
            name = "Chave",
            lore = "As chaves são usadas em conjunto com uma fechadura para permitir que outras pessoas acessem o seu baú.",
            durability = 0,
            stackSize = 100, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 0.5, -----Peso do item
            button = nil, -----Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = nil, ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = false, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["keylock"] = {
            tab = 4,
            name = "Fechadura",
            lore = "As fechaduras com chave são usadas para trancar caixas de armazenamento. Para outros jogadores que não aquele que o colocou para desbloqueá-lo, eles devem ter uma chave criada pelo jogador de origem.",
            durability = 0,
            stackSize = 100, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 0.5, -----Peso do item
            button = "Colocar", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = nil, ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = false, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["toolbox"] = {
            tab = 4,
            name = "Caixa de ferramentas",
            lore = "Um kit de ferramentas usado para consertar e manter veículos.",
            durability = 0,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 1, ----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["repairkit"] = {
            tab = 4,
            name = "Kit de limpeza",
            lore = "Arraste este item sobre um danificado.",
            durability = 0,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 5, -----Peso do item
            button = nil, ---Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["box"] = {
            tab = 4,
            name = "Baú",
            lore = "Uma espaçosa caixa de armazenamento.",
            durability = 0,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 5, -----Peso do item
            button = "Colocar", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
        ["radio"] = {
            tab = 4,
            name = "Radinho",
            lore = "Rádio pessoal bidirecional de médio alcance com interruptor de frequência.",
            durability = 0,
            stackSize = 1, --Se você for usar um número muito grande, recomendo usar o valor 0
            weight = 5, -----Peso do item
            button = "Colocar / Retirar", --Se o item não precisa de um botão, coloque nil sem as aspas
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                drop = true,  --------O jogador poderá dropar este item?
                trade = true, --------O jogador poderá enviar este item?
            },
        },
		--[[ Custom BFC ]]
		["farinhatrigo"] = {
            tab = 4,
            name = "Farinha de Trigo.",
            lore = "Farinha feita a base de trigo.",
            durability = 0,
            stackSize = 10,
            weight = 1,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = false, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["agua"] = {
            tab = 2,
            name = "Garrafa de Água",
            lore = "Garrafa de água refrescante.",
            durability = 0,
            stackSize = 10,
            weight = 0.1,
            button = "Beber conteúdo",
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = false, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["massapizza"] = {
            tab = 4,
            name = "Massa Pronta",
            lore = "Massa de pizza pronta pra ser recheiada.",
            durability = 0,
            stackSize = 10,
            weight = 0.1,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = false, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["igrepizza"] = {
            tab = 4,
            name = "Igredientes Caseiro",
            lore = "Igredientes para vários tipos de comida.",
            durability = 0,
            stackSize = 10,
            weight = 0.1,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = false, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["caixapizza"] = {
            tab = 4,
            name = "Caixa de Pizza",
            lore = "Caixa com uma deliciosa Pizza dentro.",
            durability = 0,
            stackSize = 10,
            weight = 0.1,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = false, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["leite1"] = {
            tab = 4,
            name = "Garrafa Vazia",
            lore = "Uma garrafa vazia.",
            durability = 0,
            stackSize = 20,
            weight = 0.1,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = false, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["leite2"] = {
            tab = 2,
            name = "Garrafa de Leite",
            lore = "Uma garrafa cheia de leite.",
            durability = 0,
            stackSize = 10,
            weight = 0.3,
            button = "Beber conteúdo",
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = false, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		--[[ Minerios ]]
		["niobio"] = {
            tab = 4,
            name = "Minério de Nióbio",
            lore = "O Nióbio é capaz de transformar materiais em soluções mais eficientes e inteligentes.",
            durability = 0,
            stackSize = 10,
            weight = 0.3,
            button = "usar",
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = false, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["bronze"] = {
            tab = 4,
            name = "Minério de Bronze",
            lore = "A mistura de cobre e estanho para produzir o bronze é da ordem de 90% de cobre e 10% de estanho, formando o chamado bronze simples.",
            durability = 0,
            stackSize = 10,
            weight = 0.3,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = false, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["prata"] = {
            tab = 4,
            name = "Minério de Prata",
            lore = "A prata é um elemento químico de símbolo Ag e de número atómico igual a 47 (47 prótons e 47 elétrons).",
            durability = 0,
            stackSize = 10,
            weight = 0.3,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = false, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["ouro"] = {
            tab = 4,
            name = "Minério de Ouro",
            lore = "O ouro é um elemento químico classificado como metal de transição, identificado pelo símbolo Au e número atômico (Z) 79.",
            durability = 0,
            stackSize = 10,
            weight = 0.3,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = false, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["diamante"] = {
            tab = 4,
            name = "Minério de Diamante",
            lore = "O diamante é um tipo de cristal que faz parte da categoria de minerais nativos. Ele é considerado uma pedra preciosa.",
            durability = 0,
            stackSize = 10,
            weight = 0.3,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = false, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["rubi"] = {
            tab = 4,
            name = "Minério de Rubi",
            lore = "Um rubi é uma pedra preciosa rosa a vermelho-sangue, uma variedade de corindo mineral (óxido de alumínio).",
            durability = 0,
            stackSize = 10,
            weight = 0.3,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = false, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["ak47boca"] = {
            tab = 3,
            name = "Boca da AK-47",
            lore = "Peça para fabricação de AK-47.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["ak47carregador"] = {
            tab = 3,
            name = "Carregador da AK-47",
            lore = "Peça para fabricação de AK-47.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["ak47coronha"] = {
            tab = 3,
            name = "Coronha da AK-47",
            lore = "Peça para fabricação de AK-47.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["ak47corpo"] = {
            tab = 3,
            name = "Corpo da AK-47",
            lore = "Peça para fabricação da AK-47.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["mp5boca"] = {
            tab = 3,
            name = "Boca da MP5",
            lore = "Peça para fabricação da MP5.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["mp5carregador"] = {
            tab = 3,
            name = "Carregador da MP5",
            lore = "Peça para fabricação da MP5.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["mp5coronha"] = {
            tab = 3,
            name = "Coronha da MP5",
            lore = "Peça para fabricação da MP5.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["mp5gatilho"] = {
            tab = 3,
            name = "Gatilho da MP5",
            lore = "Peça para fabricação da MP5.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["huntercano"] = {
            tab = 3,
            name = "Cano da Hunter",
            lore = "Peça para fabricação da Hunter.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["huntercomponentes"] = {
            tab = 3,
            name = "Componentes da Hunter",
            lore = "Peça para fabricação da Hunter.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["huntercoronha"] = {
            tab = 3,
            name = "Coronha da Hunter",
            lore = "Peça para fabricação da Hunter.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["escopetacabo"] = {
            tab = 3,
            name = "Cabo da Escopeta M1887",
            lore = "Peça para fabricação da Escopeta M1887.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["escopetacano"] = {
            tab = 3,
            name = "Cano da Escopeta M1887",
            lore = "Peça para fabricação da Escopeta M1887.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["escopetacorpo"] = {
            tab = 3,
            name = "Corpo da Escopeta M1887",
            lore = "Peça para fabricação da Escopeta M1887.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["38cabo"] = {
            tab = 3,
            name = "Cabo do 38",
            lore = "Peça para fabricação do 38.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["38componentes"] = {
            tab = 3,
            name = "Componentes do 38",
            lore = "Peça para fabricação do 38.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["38tambor"] = {
            tab = 3,
            name = "Tambor do 38",
            lore = "Peça para fabricação do 38.",
            durability = 0,
            stackSize = 1,
            weight = 0.5,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["polvora"] = {
            tab = 3,
            name = "Polvora",
            lore = "Item para fabricação de munição e outros.",
            durability = 0,
            stackSize = 100,
            weight = 0.01,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["capsula"] = {
            tab = 3,
            name = "Capsula",
            lore = "Item para fabricação de munição.",
            durability = 0,
            stackSize = 100,
            weight = 0.01,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["agulha"] = {
            tab = 4,
            name = "Agulha",
            lore = "Item para fabricação de colete balistico.",
            durability = 0,
            stackSize = 10,
            weight = 0.01,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["linha"] = {
            tab = 4,
            name = "Linha",
            lore = "Item para fabricação de colete balistico.",
            durability = 0,
            stackSize = 10,
            weight = 0.1,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["kevlar"] = {
            tab = 4,
            name = "Kevlar",
            lore = "Item para fabricação de colete balistico.",
            durability = 0,
            stackSize = 10,
            weight = 0.1,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["lubrificante"] = {
            tab = 4,
            name = "Lubrificante",
            lore = "Item para fabricação de kit de limpeza.",
            durability = 0,
            stackSize = 10,
            weight = 0.1,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["kitescovas"] = {
            tab = 4,
            name = "Kit de Escovas",
            lore = "Item para fabricação de kit de limpeza.",
            durability = 0,
            stackSize = 10,
            weight = 0.1,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["sementemaconha"] = {
            tab = 3,
            name = "Sementes de Maconha",
            lore = "Plante e nascerá um lindo pé.",
            durability = 0,
            stackSize = 10,
            weight = 0.1,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["budmaconha"] = {
            tab = 3,
            name = "Bud de Maconha",
            lore = "Recolhida recentemente.",
            durability = 0,
            stackSize = 10,
            weight = 0.3,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["plastico"] = {
            tab = 4,
            name = "Embalagem de Plástico",
            lore = "Usado bara embalar coisas.",
            durability = 0,
            stackSize = 10,
            weight = 0.1,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["fertilizante"] = {
            tab = 4,
            name = "Fertilizante",
            lore = "Sua planta crescerá saudavel como nunca.",
            durability = 0,
            stackSize = 10,
            weight = 2,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["seda"] = {
            tab = 4,
            name = "Seda",
            lore = "Papel para enrrolar baseado.",
            durability = 0,
            stackSize = 10,
            weight = 0.02,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["isqueiro"] = {
            tab = 4,
            name = "Isqueiro",
            lore = "É um dispositivo portátil usado para gerar fogo.",
            durability = 0,
            stackSize = 1,
            weight = 0.02,
            button = nil,
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["baseado"] = {
            tab = 3,
            name = "Baseado",
            lore = "Cigarrim do capeta.",
            durability = 0,
            stackSize = 1,
            weight = 0.02,
            button = "Fumar",
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["jbl"] = {
            tab = 1,
            name = "BOMBOX JBL",
            lore = "Solta o som DJ.",
            durability = 0,
            stackSize = 1,
            weight = 3,
            button = "Usar",
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["M4A1"] = {
            tab = 1,
            name = "Fuzil M4A1",
            lore = "A M4 é um rifle de assalto de nível militar raro.",
            durability = 0,
            stackSize = 1,
            weight = 3,
            button = "Equipar",
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["spraitinta"] = {
            tab = 3,
            name = "Spray de Tinta",
            lore = "Usado para pixar.",
            durability = 0,
            stackSize = 1,
            weight = 0.07,
            button = "Abrir",
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["capacete"] = {
            tab = 4,
            name = "Capacete",
            lore = "Use capacete ao andar de moto.",
            durability = 0,
            stackSize = 1,
            weight = 0.3,
            button = "Colocar Capacete",
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["cavalo"] = {
            tab = 4,
            name = "Mascara Cavalo",
            lore = "Mascara de uma cabeça de cavalo.",
            durability = 0,
            stackSize = 1,
            weight = 0.3,
            button = "Colocar Mascara",
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
		["mochila"] = {
            tab = 1,
            name = "Mochila Básica",
            lore = "Mochila para mais espaço para itens.",
            durability = 0,
            stackSize = 1,
            weight = 0.3,
            button = "Colocar Mochila",
            remove = { 
                death = "remove", ----Opções "remove", "drop" ou nil sem as aspas
                confiscable = true, --O jogador que estiver revistando poderá remover este item?
                trade = true, --------O jogador poderá enviar este item para outro jogador?
                drop = true,  --------O jogador poderá dropar este item?
            },
        },
	};
};

Shop = {
    --Loja 1
   --[[ {
        ["location"] = { position = { -2250.5275878906,-1717.9722900391,480.08984375 }, rotation = { -0, 0, 95.532119750977 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 258, title = { text = "#647fc9Ammunition", distance = 10 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { --------------Produtos
            { item = "rifle.svd", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "ammo.rifle", durability = 0, serial = "none", temporary = false, price = 1000 },
        };
    };
	]]

    --Loja 2
   --[[ {
        ["location"] = { position = { 1348.936, -1760.791, 13.55 }, rotation = { -0, 0, 183.55 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 141, title = { text = "#647fc9Conveniência", distance = 50 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { --------------Produtos
            { item = "bottle.vodka", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "bandage", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "key", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "toolbox", durability = 100, serial = "none", temporary = false, price = 10000 },
            { item = "farinhatrigo", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "agua", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "pizza", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "igrepizza", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "agulha", durability = 100, serial = "none", temporary = false, price = 350 },
            { item = "linha", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "kevlar", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "kitescovas", durability = 100, serial = "none", temporary = false, price = 400 },
            { item = "lubrificante", durability = 100, serial = "none", temporary = false, price = 300 },
            { item = "plastico", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "fertilizante", durability = 100, serial = "none", temporary = false, price = 150 },
            { item = "medkit", durability = 100, serial = "none", temporary = false, price = 1000 },
        };
    };]]
	
	{
        ["location"] = { position = { -711.806, 965.484, 12.348 }, rotation = { -0, 0, 278.488 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 141, title = { text = "#647fc9Conveniência", distance = 50 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { --------------Produtos
            { item = "bottle.vodka", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "bandage", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "key", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "toolbox", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "farinhatrigo", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "agua", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "pizza", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "igrepizza", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "agulha", durability = 100, serial = "none", temporary = false, price = 350 },
            { item = "linha", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "kevlar", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "kitescovas", durability = 100, serial = "none", temporary = false, price = 400 },
            { item = "lubrificante", durability = 100, serial = "none", temporary = false, price = 300 },
            { item = "plastico", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "fertilizante", durability = 100, serial = "none", temporary = false, price = 150 },
            { item = "medkit", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "seda", durability = 100, serial = "none", temporary = false, price = 200 },
            { item = "isqueiro", durability = 100, serial = "none", temporary = false, price = 150 },
            { item = "spraitinta", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "shovel", durability = 100, serial = "none", temporary = false, price = 2500 },
            { item = "picareta", durability = 100, serial = "none", temporary = false, price = 5000 },
            { item = "box", durability = 100, serial = "none", temporary = false, price = 500000 },
            { item = "jbl", durability = 100, serial = "none", temporary = false, price = 100000 },
        };
    };
	
	{
        ["location"] = { position = { 1000.089, -919.929, 42.328 }, rotation = { -0, 0, 88.507 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 141, title = { text = "#647fc9Conveniência", distance = 50 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { --------------Produtos
            { item = "bottle.vodka", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "bandage", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "key", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "toolbox", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "farinhatrigo", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "agua", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "pizza", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "igrepizza", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "agulha", durability = 100, serial = "none", temporary = false, price = 350 },
            { item = "linha", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "kevlar", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "kitescovas", durability = 100, serial = "none", temporary = false, price = 400 },
            { item = "lubrificante", durability = 100, serial = "none", temporary = false, price = 300 },
            { item = "plastico", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "fertilizante", durability = 100, serial = "none", temporary = false, price = 150 },
            { item = "medkit", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "seda", durability = 100, serial = "none", temporary = false, price = 200 },
            { item = "isqueiro", durability = 100, serial = "none", temporary = false, price = 150 },
            { item = "spraitinta", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "shovel", durability = 100, serial = "none", temporary = false, price = 2500 },
            { item = "picareta", durability = 100, serial = "none", temporary = false, price = 5000 },
            { item = "box", durability = 100, serial = "none", temporary = false, price = 500000 },
            { item = "jbl", durability = 100, serial = "none", temporary = false, price = 100000 },
        };
    };
	
	{
        ["location"] = { position = { 293.64, -1551.804, 36.033 }, rotation = { -0, 0, 332.73977661133 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 141, title = { text = "#647fc9Conveniência", distance = 50 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { --------------Produtos
            { item = "bottle.vodka", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "bandage", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "key", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "toolbox", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "farinhatrigo", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "agua", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "pizza", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "igrepizza", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "agulha", durability = 100, serial = "none", temporary = false, price = 350 },
            { item = "linha", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "kevlar", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "kitescovas", durability = 100, serial = "none", temporary = false, price = 400 },
            { item = "lubrificante", durability = 100, serial = "none", temporary = false, price = 300 },
            { item = "plastico", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "fertilizante", durability = 100, serial = "none", temporary = false, price = 150 },
            { item = "medkit", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "seda", durability = 100, serial = "none", temporary = false, price = 200 },
            { item = "isqueiro", durability = 100, serial = "none", temporary = false, price = 150 },
            { item = "spraitinta", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "shovel", durability = 100, serial = "none", temporary = false, price = 2500 },
            { item = "picareta", durability = 100, serial = "none", temporary = false, price = 5000 },
            { item = "box", durability = 100, serial = "none", temporary = false, price = 500000 },
            { item = "jbl", durability = 100, serial = "none", temporary = false, price = 100000 },
        };
    };
	
	{
        ["location"] = { position = { 2104.467, -1806.508, 13.555 }, rotation = { -0, 0, 88.362 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 141, title = { text = "#647fc9Conveniência", distance = 50 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { --------------Produtos
            { item = "bottle.vodka", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "bandage", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "key", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "toolbox", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "farinhatrigo", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "agua", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "pizza", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "igrepizza", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "agulha", durability = 100, serial = "none", temporary = false, price = 350 },
            { item = "linha", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "kevlar", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "kitescovas", durability = 100, serial = "none", temporary = false, price = 400 },
            { item = "lubrificante", durability = 100, serial = "none", temporary = false, price = 300 },
            { item = "caixapizza", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "plastico", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "fertilizante", durability = 100, serial = "none", temporary = false, price = 150 },
            { item = "medkit", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "seda", durability = 100, serial = "none", temporary = false, price = 200 },
            { item = "isqueiro", durability = 100, serial = "none", temporary = false, price = 150 },
            { item = "spraitinta", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "shovel", durability = 100, serial = "none", temporary = false, price = 2500 },
            { item = "picareta", durability = 100, serial = "none", temporary = false, price = 5000 },
            { item = "box", durability = 100, serial = "none", temporary = false, price = 500000 },
            { item = "jbl", durability = 100, serial = "none", temporary = false, price = 100000 },
        };
    };
	
	
	{
        ["location"] = { position = { -2235.553, -1726.659, 480.865 }, rotation = { -0, 0, 21.598 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 141, title = { text = "#647fc9Conveniência", distance = 50 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { --------------Produtos
            { item = "bottle.vodka", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "bandage", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "key", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "toolbox", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "farinhatrigo", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "agua", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "pizza", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "igrepizza", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "agulha", durability = 100, serial = "none", temporary = false, price = 350 },
            { item = "linha", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "kevlar", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "kitescovas", durability = 100, serial = "none", temporary = false, price = 400 },
            { item = "lubrificante", durability = 100, serial = "none", temporary = false, price = 300 },
            { item = "caixapizza", durability = 100, serial = "none", temporary = false, price = 250 },
            { item = "plastico", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "fertilizante", durability = 100, serial = "none", temporary = false, price = 150 },
            { item = "medkit", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "seda", durability = 100, serial = "none", temporary = false, price = 200 },
            { item = "isqueiro", durability = 100, serial = "none", temporary = false, price = 150 },
            { item = "spraitinta", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "shovel", durability = 100, serial = "none", temporary = false, price = 2500 },
            { item = "picareta", durability = 100, serial = "none", temporary = false, price = 5000 },
            { item = "box", durability = 100, serial = "none", temporary = false, price = 500000 },
            { item = "jbl", durability = 100, serial = "none", temporary = false, price = 100000 },
        };
    };

    --Loja 3
    {
        ["location"] = { position = { -1320.59900, -191.69107, 14.14844 }, rotation = { -0, 0, 93.54613494873 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 270, title = { text = "#647fc9Arsenal da PRF", distance = 10 } };
        ["acl"] = { "PRF" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
          --  { item = "rifle.svd", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "rifle.m4", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "smg.mp5", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "shotgun.m1887", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "glock", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "pistol.m92", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "nightstick", durability = 100, serial = "none", temporary = false, price = 0 },
            --{ item = "teargas", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "ammo.rifle", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "ammo.shotgun", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "ammo.pistol", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "vest", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "teser", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "repairkit", durability = 100, serial = "none", temporary = false, price = 5000 },
        };
    };
	--Bope
	{
        ["location"] = { position = { -711.806, 970.484, 12.348 }, rotation = { -0, 0, 278.488 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 280, title = { text = "#647fc9Arsenal do BOPE", distance = 10 } };
        ["acl"] = { "Policial" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
           -- { item = "rifle.svd", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "rifle.m4", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "glock", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "smg.mp5", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "shotgun.m1887", durability = 100, serial = "none", temporary = false, price = 0 },
            --{ item = "pistol.python", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "pistol.m92", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "nightstick", durability = 100, serial = "none", temporary = false, price = 0 },
           -- { item = "teargas", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "ammo.rifle", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "ammo.shotgun", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "ammo.pistol", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "vest", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "teser", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "repairkit", durability = 100, serial = "none", temporary = false, price = 5000 },
            { item = "radio", durability = 100, serial = "none", temporary = false, price = 50 },
        };
    };
	
	-- PMSP
	
	{
        ["location"] = { position = { 1677.643, -2412.286, 20.555 }, rotation = { -0, 0, 89.667625427246 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 301, title = { text = "#647fc9Arsenal do PC", distance = 10 } };
        ["acl"] = { "PC" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
           -- { item = "rifle.svd", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "rifle.m4", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "glock", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "smg.mp5", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "shotgun.m1887", durability = 100, serial = "none", temporary = false, price = 0 },
            --{ item = "pistol.python", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "pistol.m92", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "nightstick", durability = 100, serial = "none", temporary = false, price = 0 },
           -- { item = "teargas", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "ammo.rifle", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "ammo.shotgun", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "ammo.pistol", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "vest", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "teser", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "repairkit", durability = 100, serial = "none", temporary = false, price = 5000 },
        };
    };


	-- ROTA
	
	{
        ["location"] = { position = { 1623.542, -2412.356, 20.755 }, rotation = { -0, 0, 91.139 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 242, title = { text = "#647fc9Arsenal do ROTA", distance = 50 } };
        ["acl"] = { "ROTA" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
           -- { item = "rifle.svd", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "rifle.m4", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "glock", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "smg.mp5", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "shotgun.m1887", durability = 100, serial = "none", temporary = false, price = 0 },
            --{ item = "pistol.python", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "pistol.m92", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "nightstick", durability = 100, serial = "none", temporary = false, price = 0 },
           -- { item = "teargas", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "ammo.rifle", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "ammo.shotgun", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "ammo.pistol", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "vest", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "teser", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "repairkit", durability = 100, serial = "none", temporary = false, price = 5000 },
        };
    };
	
	
	
	--BAEP
	
	{
        ["location"] = { position = { 1570.051, -2412.693, 20.755 }, rotation = { -0, 0, 92.613 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 58, title = { text = "#647fc9Arsenal da BAEP", distance = 50 } };
        ["acl"] = { "BAEP" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
           -- { item = "rifle.svd", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "rifle.m4", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "glock", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "smg.mp5", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "shotgun.m1887", durability = 100, serial = "none", temporary = false, price = 0 },
            --{ item = "pistol.python", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "pistol.m92", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "nightstick", durability = 100, serial = "none", temporary = false, price = 0 },
           -- { item = "teargas", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "ammo.rifle", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "ammo.shotgun", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "ammo.pistol", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "vest", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "teser", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "repairkit", durability = 100, serial = "none", temporary = false, price = 5000 },
        };
    };
	
	--Choque
	
	{
        ["location"] = { position = { -2235.368, -1729.837, 480.85 }, rotation = { -0, 0, 88.799 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 302, title = { text = "#647fc9Arsenal da EB", distance = 50 } };
        ["acl"] = { "EB" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
           -- { item = "rifle.svd", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "rifle.m4", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "glock", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "smg.mp5", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "shotgun.m1887", durability = 100, serial = "none", temporary = false, price = 0 },
            --{ item = "pistol.python", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "pistol.m92", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "nightstick", durability = 100, serial = "none", temporary = false, price = 0 },
           -- { item = "teargas", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "ammo.rifle", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "ammo.shotgun", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "ammo.pistol", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "vest", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "teser", durability = 100, serial = "none", temporary = false, price = 0 },
            { item = "repairkit", durability = 100, serial = "none", temporary = false, price = 5000 },
        };
    };
	
	--[[mafia
	
	{
        ["location"] = { position = { 2142.856, 1619.953, 1000.969 }, rotation = { -0, 0, 180.29 }, dimension = 0, interior = 1 };
        ["style"] = { skin = 30, title = { text = "#647fc9Arsenal MAFIA", distance = 50 } };
        ["acl"] = { "MAFIA" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
           -- { item = "rifle.svd", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "rifle.m4", durability = 100, serial = "none", temporary = false, price = 25000 },
            { item = "glock", durability = 100, serial = "none", temporary = false, price = 7000 },
        };
    };
	
	--tdt
	
	{
        ["location"] = { position = { 2650.126, -416.155, 59.748 }, rotation = { -0, 0, 339.224 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 49, title = { text = "#647fc9Arsenal TDT", distance = 50 } };
        ["acl"] = { "TDT" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
           -- { item = "rifle.svd", durability = 100, serial = "none", temporary = true, price = 0 },
            { item = "rifle.m4", durability = 100, serial = "none", temporary = false, price = 25000 },
            { item = "glock", durability = 100, serial = "none", temporary = false, price = 7000 },
        };
    };
	]]
	
	{
        ["location"] = { position = { -1323.81519, -182.07977, 14.14844 }, rotation = { -0, 0, 18.811 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 242, title = { text = "#647fc9Alimentos", distance = 80 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
            { item = "agua", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "pizza", durability = 100, serial = "none", temporary = false, price = 100 },
        };
    };
	
	
	{
        ["location"] = { position = { 1508.854, -2416.647, 20.755 }, rotation = { -0, 0, 45.1 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 302, title = { text = "#647fc9Alimentos", distance = 80 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
            { item = "agua", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "pizza", durability = 100, serial = "none", temporary = false, price = 100 },
        };
    };
	
	
	{
        ["location"] = { position = { 1616.652, -2416.848, 20.755 }, rotation = { -0, 0, 23.94 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 242, title = { text = "#647fc9Alimentos", distance = 80 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
            { item = "agua", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "pizza", durability = 100, serial = "none", temporary = false, price = 100 },
        };
    };
	
	
	
	{
        ["location"] = { position = { 1672.666, -2416.664, 20.555 }, rotation = { -0, 0, 3.9818475246429 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 242, title = { text = "#647fc9Alimentos", distance = 30 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
            { item = "agua", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "pizza", durability = 100, serial = "none", temporary = false, price = 100 },
        };
    };
	
	
	{
        ["location"] = { position = { -892.433, 1990.99, 60.488 }, rotation = { -0, 0, 247.19914245605 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 22, title = { text = "#647fc9Alimentos", distance = 30 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
            { item = "agua", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "pizza", durability = 100, serial = "none", temporary = false, price = 100 },
        };
    };
	
	----------------------------
	
	{
        ["location"] = { position = { 1779.898, -2416.761, 20.855 }, rotation = { -0, 0, 6.416 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 280, title = { text = "#647fc9Alimentos", distance = 30 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
            { item = "agua", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "pizza", durability = 100, serial = "none", temporary = false, price = 100 },
        };
    };
	
	{
        ["location"] = { position = { 1726.2818603516,-2416.5737304688,20.455364227295 }, rotation = { -0, 0, 352.092 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 280, title = { text = "#647fc9Alimentos", distance = 50 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
            { item = "agua", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "pizza", durability = 100, serial = "none", temporary = false, price = 100 },
        };
    };
	
	{
        ["location"] = { position = { 1199.107, -918.528, 43.121 }, rotation = { -0, 0, 184.99008178711 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 280, title = { text = "#647fc9Alimentos", distance = 30 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
            { item = "agua", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "pizza", durability = 100, serial = "none", temporary = false, price = 100 },
        };
    };
	
	{
        ["location"] = { position = { -2234.741, -1732.402, 480.851 }, rotation = { -0, 0, 200.97 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 280, title = { text = "#647fc9Alimentos", distance = 30 } };
        ["acl"] = { "Everyone" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
            { item = "agua", durability = 100, serial = "none", temporary = false, price = 100 },
            { item = "pizza", durability = 100, serial = "none", temporary = false, price = 100 },
        };
    };
	
	--inlegal
	{
        ["location"] = { position = { -2235.463, -1735.954, 480.801 }, rotation = { -0, 0, 312.577 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 179, title = { text = "#647fc9Itens ilícitos", distance = 35 } };
        ["acl"] = { "Gang" }; --Lista de acl's que têm acesso a esta loja
        ["items"] = { ------------Produtos
            { item = "polvora", durability = 100, serial = "none", temporary = false, price = 5 },
            { item = "capsula", durability = 100, serial = "none", temporary = false, price = 5 },
            { item = "38tambor", durability = 100, serial = "none", temporary = false, price = 500 },
            { item = "38cabo", durability = 100, serial = "none", temporary = false, price = 500 },
            { item = "38componentes", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "escopetacano", durability = 100, serial = "none", temporary = false, price = 1000 },
            { item = "escopetacabo", durability = 100, serial = "none", temporary = false, price = 2000 },
            { item = "escopetacorpo", durability = 100, serial = "none", temporary = false, price = 2000 },
            { item = "huntercano", durability = 100, serial = "none", temporary = false, price = 2000 },
            { item = "huntercoronha", durability = 100, serial = "none", temporary = false, price = 3000 },
            { item = "huntercomponentes", durability = 100, serial = "none", temporary = false, price = 3000 },
            { item = "mp5boca", durability = 100, serial = "none", temporary = false, price = 3000 },
            { item = "mp5carregador", durability = 100, serial = "none", temporary = false, price = 2000 },
            { item = "mp5gatilho", durability = 100, serial = "none", temporary = false, price = 4000 },
            { item = "mp5coronha", durability = 100, serial = "none", temporary = false, price = 4000 },
            { item = "ak47boca", durability = 100, serial = "none", temporary = false, price = 4000 },
            { item = "ak47carregador", durability = 100, serial = "none", temporary = false, price = 3000 },
            { item = "ak47coronha", durability = 100, serial = "none", temporary = false, price = 6000 },
            { item = "ak47corpo", durability = 100, serial = "none", temporary = false, price = 7000 },
            { item = "sementemaconha", durability = 100, serial = "none", temporary = false, price = 250 },
        };
    };
};

NPC = {
    --NPC que compra drogas
    {
        ["location"] = { position = { 1230.74, 361.196, 19.555 }, rotation = { -0, 0, 153.34315490723 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 230, title = { text = "NOIA DO ORTHUS", distance = 10 }, animation = { "SMOKING", "m_smk_drag" } };
        ["action"] = "drogado";
    };
    {
        ["location"] = { position = { 1269.636, 357.506, 19.561 }, rotation = { -0, 0, 357.63842773438 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 200, title = { text = "NOIA DO ORTHUS", distance = 10 }, animation = { "SMOKING", "m_smk_drag" } };
        ["action"] = "drogado";
    };
	
	{
        ["location"] = { position = { 1264.621, 363.487, 19.555 }, rotation = { -0, 0, 167.12997436523 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 200, title = { text = "NOIA DO ORTHUS", distance = 10 }, animation = { "SMOKING", "m_smk_drag" } };
        ["action"] = "drogado";
    };
	
	{
        ["location"] = { position = { 1311.719, 358.676, 19.555 }, rotation = { -0, 0, 337.56158447266 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 200, title = { text = "NOIA DO ORTHUS", distance = 10 }, animation = { "SMOKING", "m_smk_drag" } };
        ["action"] = "drogado";
    };
	
	{
        ["location"] = { position = { 1374.497, 300.81, 19.739 }, rotation = { -0, 0, 157.10339355469 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 230, title = { text = "NOIA DO ORTHUS", distance = 10 }, animation = { "SMOKING", "m_smk_drag" } };
        ["action"] = "drogado";
    };
	
	-- CRACO 01
	{
        ["location"] = { position = { 1293.545, 268.396, 19.411 }, rotation = { -0, 0, 246.80422973633 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 230, title = { text = "NOIA DO ORTHUS", distance = 10 }, animation = { "SMOKING", "m_smk_drag" } };
        ["action"] = "drogado";
    };
	
	{
        ["location"] = { position = { 1347.491, 315.906, 20.555 }, rotation = { -0, 0, 150.94680786133 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 230, title = { text = "NOIA DO ORTHUS", distance = 10 }, animation = { "SMOKING", "m_smk_drag" } };
        ["action"] = "drogado";
    };
	
	{
        ["location"] = { position = { 1309.473, 349.061, 19.555 }, rotation = { -0, 0, 337.81683349609 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 200, title = { text = "NOIA DO ORTHUS", distance = 10 }, animation = { "SMOKING", "m_smk_drag" } };
        ["action"] = "drogado";
    };
	
	
	{
        ["location"] = { position = { 1244.848, 325.247, 19.756 }, rotation = { -0, 0, 342.08203125 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 230, title = { text = "NOIA DO ORTHUS", distance = 10 }, animation = { "SMOKING", "m_smk_drag" } };
        ["action"] = "drogado";
    };
	
	{
        ["location"] = { position = { 1339.43, 286.33, 19.555 }, rotation = { -0, 0, 252.13119506836 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 200, title = { text = "NOIA DO ORTHUS", distance = 10 }, animation = { "SMOKING", "m_smk_drag" } };
        ["action"] = "drogado";
    };
	
	
	{
        ["location"] = { position = { 1352.57, 199.915, 19.555 }, rotation = { -0, 0, 28.722337722778 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 200, title = { text = "NOIA DO ORTHUS", distance = 10 }, animation = { "SMOKING", "m_smk_drag" } };
        ["action"] = "drogado";
    };
	
	{
        ["location"] = { position = { 1291.919, 225.389, 19.555 }, rotation = { -0, 0, 148.99678039551 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 200, title = { text = "NOIA DO ORTHUS", distance = 10 }, animation = { "SMOKING", "m_smk_drag" } };
        ["action"] = "drogado";
    };
	
	{
        ["location"] = { position = { -2235.475, -1740.392, 480.827 }, rotation = { -0, 0, 59.092720031738 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 230, title = { text = "NOIA DO ORTHUS", distance = 10 }, animation = { "SMOKING", "m_smk_drag" } };
        ["action"] = "drogado";
    };
	
	
	
    --NPC que lava o dinheiro
    {
        ["location"] = { position = { -2236.515, -1743.362, 480.845 }, rotation = { -0, 0, 87.229194641113 }, dimension = 0, interior = 0 };
        ["style"] = { skin = 295, title = { text = "McLOVIN FELIZ", distance = 10 }, animation = { "DEALER", "DEALER_IDLE_03" } };
        ["action"] = "dirtymoney";
    };
};

TrashLocation = { --Localizações das lixeiras
    { -1333.35034, -175.13654, 14.14844 },
    { 1355.422, -1758.948, 13.508 },
    { 1768.788, -2417.286, 20.855 },
    { -939.529, 2025.377, 60.914 },
    { 1661.074, -2417.131, 20.555 },
    { 1716.198, -2417.125, 20.455 },
    { 1607.542, -2417.11, 20.755 },
    { 1553.275, -2417.121, 20.755 },
    { 1499.695, -2417.055, 20.755 },
};