IP = "192.168.1.100:22003" -- IP do servidor

config = {
    ----------------------
    ----- INVENTARIO -----
    ----------------------

    bind = "b", -- Tecla que abre o inventário
    fomesede = {"fome", "sede"}, -- Elementdata do seu sistema de fome/sede

    give = "giveitem", -- Comando para setar item
    take = "takeitem", -- Comando para retirar item
    aclstaff = {"Console"}, -- Grupo que pode usar o comando

    itens = {
        -- Alimentos |
        [1] = {nome="Absinto", peso=1.0, tipo="alimentos", enche={"sede", 20}, valor=45, maxitem=10, image="files/gfx/foods/absinto.png"},
        [2] = {nome="Agua", peso=0.2, tipo="alimentos", enche={"sede", 10}, valor=5, maxitem=10, image="files/gfx/foods/agua.png"},
        [3] = {nome="Café", peso=0.1, tipo="alimentos", enche={"sede", 10}, valor=3, maxitem=10, image="files/gfx/foods/cafe.png"},
        [4] = {nome="Cerveja", peso=1.0, tipo="alimentos", enche={"sede", 15}, valor=10, maxitem=10, image="files/gfx/foods/cerveja.png"},
        [5] = {nome="Chocolate", peso=0.2, tipo="alimentos", enche={"fome", 10}, valor=4, maxitem=10, image="files/gfx/foods/chocolate.png"},
        [6] = {nome="Conhaque", peso=1.0, tipo="alimentos", enche={"sede", 15}, valor=35, maxitem=10, image="files/gfx/foods/conhaque.png"},
        [7] = {nome="Energético", peso=0.7, tipo="alimentos", enche={"sede", 15}, valor=10, maxitem=10, image="files/gfx/foods/energetico.png"},
        [8] = {nome="Pizza", peso=0.2, tipo="alimentos", enche={"fome", 10}, valor=7, maxitem=10, image="files/gfx/foods/pizza.png"},
        [9] = {nome="Salgadinho", peso=0.2, tipo="alimentos", enche={"fome", 5}, valor=2, maxitem=10, image="files/gfx/foods/salgadinho.png"},
        [10] = {nome="Tequila", peso=1.0, tipo="alimentos", enche={"sede", 30}, valor=65, maxitem=10, image="files/gfx/foods/tequila.png"},
        [11] = {nome="Vodka", peso=1.0, tipo="alimentos", enche={"sede", 20}, valor=45, maxitem=10, image="files/gfx/foods/vodka.png"},
        [12] = {nome="Whisky", peso=1.0, tipo="alimentos", enche={"sede", 30}, valor=65, maxitem=10, image="files/gfx/foods/whisky.png"},
        [13] = {nome="Limonada", peso=0.4, tipo="alimentos", enche={"sede", 10}, valor=7, maxitem=10, image="files/gfx/foods/limonada.png"},
        -- Utilitários |
        [14] = {nome="Bandagem", peso=0.1, tipo="utilitarios", desc="Cura 20% da vida.", valor=5, maxitem=10, image="files/gfx/utilities/bandagem.png"},
        [15] = {nome="Colete", peso=2.5, tipo="utilitarios", desc="Colete de combate.", valor=1000, maxitem=10, image="files/gfx/utilities/colete.png"},
        [16] = {nome="Furadeira", peso=1.1, tipo="utilitarios", desc="Usa-se em certas ocasiões.", valor=60, maxitem=10, image="files/gfx/utilities/furadeira.png"},
        [17] = {nome="Gasolina", peso=1.3, tipo="utilitarios", desc="Enche o tanque.", valor=15, maxitem=10, image="files/gfx/utilities/gasolina.png"},
        [18] = {nome="Medkit", peso=0.3, tipo="utilitarios", desc="Cura 80% da vida.", valor=50, maxitem=10, image="files/gfx/utilities/medkit.png"},
        [19] = {nome="Militec", peso=0.6, tipo="utilitarios", desc="Arruma 50% do seu veículo.", valor=2000, maxitem=10, image="files/gfx/utilities/militec.png"},
        [20] = {nome="Mira", peso=0.5, tipo="utilitarios", desc="Mira para armas.", valor=300, maxitem=10, image="files/gfx/utilities/mira.png"},
        [21] = {nome="Pendrive", peso=0.2, tipo="utilitarios", desc="Usa-se em certas ocasiões.", valor=30, maxitem=5, image="files/gfx/utilities/pendrive.png"},
        [22] = {nome="Kit Reparo", peso=0.7, tipo="utilitarios", desc="Arruma 100% do seu veículo.", valor=150, maxitem=10, image="files/gfx/utilities/repairkit.png"},
        [23] = {nome="Serra", peso=0.9, tipo="utilitarios", desc="Usa-se em certas ocasiões.", valor=150, maxitem=5, image="files/gfx/utilities/serra.png"},
        [24] = {nome="Pá", peso=1.5, tipo="utilitarios", desc="Usa-se em certas ocasiões.", valor=70, maxitem=5, image="files/gfx/utilities/pa.png"},
        -- Máscaras |
        [25] = {nome="Diabo", peso=0.5, tipo="mascaras",valor=700, maxitem=1, image="files/gfx/masks/diabo.png"},
        [26] = {nome="Chapeu", peso=0.5, tipo="mascaras", valor=700, maxitem=1, image="files/gfx/masks/chapeu.png"},
        [27] = {nome="Anonymous", peso=0.5, tipo="mascaras", valor=700, maxitem=1, image="files/gfx/masks/anonymous.png"},
        [28] = {nome="Saco", peso=0.5, tipo="mascaras", valor=700, maxitem=1, image="files/gfx/masks/saco.png"},
        [29] = {nome="Jedi", peso=0.5, tipo="mascaras", valor=700, maxitem=1, image="files/gfx/masks/jedi.png"},
        [30] = {nome="Cachorro", peso=0.5, tipo="mascaras", valor=500, maxitem=1, image="files/gfx/masks/cachorro.png"},
        [31] = {nome="Macaco", peso=0.5, tipo="mascaras", valor=700, maxitem=1, image="files/gfx/masks/macaco.png"},
        [32] = {nome="Terror", peso=0.5, tipo="mascaras", valor=700, maxitem=1, image="files/gfx/masks/terror.png"},
        [33] = {nome="Gas", peso=0.5, tipo="mascaras", valor=700, maxitem=1, image="files/gfx/masks/gas.png"},
        -- Negro |
        [34] = {nome="Algemas", peso=0.3, tipo="negro", desc="Usado para algemar jogadores.\n(O item necessita permissão para usar)", valor=50, maxitem=5, image="files/gfx/black/algemas.png"},
        [35] = {nome="C4", peso=2.0, tipo="negro", desc="Usa-se em certas ocasiões.", valor=900, maxitem=5, image="files/gfx/black/c4.png"},
        [36] = {nome="Capuz", peso=0.3, tipo="negro", desc="Usado para encapuzar jogadores.\n(O item necessita permissão para usar)", valor=100, maxitem=5, image="files/gfx/black/capuz.png"},
        [37] = {nome="Keys Invasão", peso=0.1, tipo="negro", desc="Usa-se em certas ocasiões.", valor=150, maxitem=10, image="files/gfx/black/keysinvasao.png"},
        [38] = {nome="Logs Invasão", peso=0.1, tipo="negro", desc="Usa-se em certas ocasiões.", valor=200, maxitem=10, image="files/gfx/black/logsinvasao.png"},
        -- Drogas |
        [39] = {nome="Fertilizante", peso=0.9, tipo="drogas", valor=100, maxitem=10, image="files/gfx/drugs/fertilizante.png"},
        [40] = {nome="Semente Maconha", peso=0.1, tipo="drogas", valor=50, maxitem=50, image="files/gfx/drugs/smaconha.png"},
        [41] = {nome="Cocaína", peso=0.2, tipo="drogas", valor=70, maxitem=30, image="files/gfx/drugs/cocaina.png"},
        [42] = {nome="Maconha", peso=0.3, tipo="drogas", maxitem=30, image="files/gfx/drugs/fmaconha.png"},
        -- Armas |
        [43] = {nome="Glock", peso=1.0, tipo="armas", desc="Arma de baixo porte.", valor=150000, maxitem=1, image="files/gfx/weapons/WEAPON_GLOCK.png"},
        [44] = {nome="38", peso=1.2, tipo="armas", desc="Arma de baixo porte.", valor=150000, maxitem=1, image="files/gfx/weapons/WEAPON_38.png"},
        [45] = {nome="MP5", peso=1.4, tipo="armas", desc="Arma de médio porte.", valor=250000, maxitem=1, image="files/gfx/weapons/WEAPON_MP5.png"},
        [46] = {nome="AK47", peso=3.0, tipo="armas", desc="Arma de alto porte.", valor=650000, maxitem=1, image="files/gfx/weapons/WEAPON_AK47.png"},
        [47] = {nome="AR15", peso=2.0, tipo="armas", desc="Arma de alto porte.", valor=650000, maxitem=1, image="files/gfx/weapons/WEAPON_AR15.png"},
        [48] = {nome="DOZE", peso=2.3, tipo="armas", desc="Arma de alto porte.", valor=450000, maxitem=1, image="files/gfx/weapons/WEAPON_DOZE.png"},
        [49] = {nome="AR10", peso=2.5, tipo="armas", desc="Arma de alto porte.", valor=450000, maxitem=1, image="files/gfx/weapons/WEAPON_AR10.png"},
        [55] = {nome="Taser", peso=1.0, tipo="armas", maxitem=1, image="files/gfx/weapons/WEAPON_TASER.png"},
        -- Munição |
        [50] = {nome="Munição 9mm", peso=0.1, tipo="municao", desc="Munição para armas de\nbaixo porte. (Glock, 38, Taser)", valor=5, maxitem=500, image="files/gfx/weapons/municao9mm.png"},
        [51] = {nome="Munição 556", peso=0.1, tipo="municao", desc="Munição para armas de\nmédio porte. (MP5)", valor=250, maxitem=1500, image="files/gfx/weapons/municao556.png"},
        [52] = {nome="Munição 762", peso=0.1, tipo="municao", desc="Munição para armas de\nalto porte. (AK47, AR15)", valor=250, maxitem=1500, image="files/gfx/weapons/municao762.png"},
        [53] = {nome="Munição Sniper", peso=0.1, tipo="municao", desc="Munição para armas de\nalto porte. (Sniper)", valor=250, maxitem=1500, image="files/gfx/weapons/municaosnip.png"},
        [54] = {nome="Cartucho 12", peso=0.2, tipo="municao", desc="Munição para armas de\nalto porte. (DOZE)", valor=250, maxitem=1500, image="files/gfx/weapons/cartucho12.png"},
        -- Outros |
        [56] = {nome="Dinheiro Sujo", peso=0, tipo="outros", maxitem=999999999, image="files/gfx/others/dinheirosujo.png"},
    },

    mochila = {nome="Mochila", peso="N/A", desc="Cabe até 10 KG.", valor=300, image="files/gfx/utilities/mochila.png"},

    deleteitem = 5, -- Tempo (minutos) para deletar itens dropados no chão

    perderitem = true, -- Caso queira que perda os itens ao morrer coloque 'true' caso contrário deixe como 'false'

    -----------------------------
    ----- LOJA DE ALIMENTOS -----
    -----------------------------

    markeralimentos = { -- Para adicionar mais lojas adicione mais uma linha com as posições x, y, z
        {1878.527, -1473.352, 13.547},
		{1461.521, -1799.433, 15.952},

    },

    -------------------------------
    ----- LOJA DE UTILITARIOS -----
    -------------------------------

    markerutilitarios = { -- Para adicionar mais lojas adicione mais uma linha com as posições x, y, z
        {1689.022, -1250.023, 15.029},
		{1463.498, -1791.64, 22.952},	-- ls
	
    },

    ------------------------------
    ----- LOJA MERCADO NEGRO -----
    ------------------------------

    markernegro = { -- Para adicionar mais lojas adicione mais uma linha com as posições x, y, z
        
        {2626.21, -1112.642, 67.854}, --ls
    },

    -------------------------
    ----- LOJA DE ARMAS -----
    -------------------------

    armasperm = false, -- Caso queira que a loja de armas seja por grupos coloque 'true' caso contrário deixe como 'false'
    armasacl = {"Bandido"}, -- Caso seja por grupos coloque os mesmos que pode comprar

    markerarmas = { -- Para adicionar mais lojas adicione mais uma linha com as posições x, y, z
        {2391.261, -1949.598, 14.155},
		{1498.183, -1809.685, 15.952},
    },

    ----------------------------
    ----- ASSALTO A BANCO ------
    ----------------------------

    moneyhacker = 500, -- Valor que o hacker cobra para hackear o banco
    moneyroubo = 50000, -- Valor ganho pelo roubo
    assaltarnovamente = 30, -- Minutos para poder assaltar o banco novamente
    grupospolicia = {"Policial"}, -- Grupos policiais que irá ser chamado

    ------------------
    ----- DROGAS -----
    ------------------

    dg = {1544.9565429688,17.085779190063,24.140625}, -- Marker do pontos de drogas
    efeitotime = 3, -- Tempo (minutos) que dura o efeito das drogas

    -------------------------
    ----- DINHEIRO SUJO -----
    -------------------------

    ds = {2518.1657714844,-1705.0213623047,13.401216506958}, -- Marker para limpar dinheiro sujo

    -----------------------
    ----- PORTA MALAS -----
    -----------------------

    portamalasbind = "K", -- Tecla que abre o porta malas dos veículos
    portamalasveh = { -- Carros que tem porta malas
        429,
    },

    --------------------
    ----- REVISTAR -----
    --------------------

    comandorevistar = "revistarinv", -- Comando para revistar inventário
    gruposrevistar = {"Policial", "Bandido"}, -- Grupos que podem usar o comando

    ------------------------
    ----- RETIRAR ITEM -----
    ------------------------

    comandoretirar = "retiraritem", -- Comando para retirar itens do inventário
    gruposretirar = {"Policial"}, -- Grupos que podem usar o comando

    ---------------------------
    ----- ALGEMAR & CAPUZ -----
    ---------------------------

    gruposalgemar = {"Policial"}, -- Grupos que podem usar algemas
    gruposcapuz = {"Bandido"}, -- Grupos que podem usar capuz

    ---------------
    ----- BAU -----
    ---------------

    baubind = "K", -- Tecla que abre o baú
    bau = { -- Para adicionar mais baú's adicione mais uma linha com as posições x, y, z
        {0, 0, -500},
    },
}