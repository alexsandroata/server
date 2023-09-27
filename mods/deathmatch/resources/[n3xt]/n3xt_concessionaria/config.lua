IP = "181.215.254.166:22003" -- Coloque o IP que aparece no /debugscript 3

-- Anuncio de Pollo MTA = Depois de ter colocado o ip e a porta do seu servidor escreva o comando /debugscript 3
-- Depois de refresh no F8, abrá o painel P da um refresh list depois da um restart nos mods do N3xT.
-- Ops: coloque no admin = resource.* para dar permissões pros scripts.

config = {
    conce = { -- Concessionária.
        lojas = { -- Lojas - Pos X, Pos Y, Pos Z.
            {1769.54, -1703.584, 13.541},
        },

        aclestoque = "Console", -- ACL que Pode Setar Estoque de Veículos.
        setestoque = "setestoque", -- ( /setestoque Valor Categoria NomeVeículo ) Comando Setar Estoque Veículo na Concessionária.
        --[[ Categorias: Quatro, Duas, Aereos, Aquaticos ]]

        verdoc = "verdoc", -- Comando para ver Documento dentro do Veículo.

        acldoc = "Policial", -- ACL que pode puxar Documento do Veículo pela Placa.
        verdoc2 = "puxardoc", -- Comando que pode puxar Documento do Veículo pela Placa.

        lojas_blip = 55, -- ID Blip das Lojas.

--                             ==================================================
--                             ============ EDITE OS CARROS AQUI ================
--                             ==================================================
        shop = {
            [5] = { -- Quatro Rodas | nome, valor, id, estoque inicial (pela primeira vez), foto (carregar também no meta.xml).
                {nome="Nissan GTR", valor=990000, id=480, estoque=1000, foto="veiculos/NissanGTR.jpg"},
                {nome="Stallion", valor=100000, id=438, estoque=1000, foto="veiculos/stallion.png"},
                {nome="lamborghini essenza", valor=1200000, id=411, estoque=1000, foto="veiculos/411.jpg"},
            },

            [4] = { -- Duas Rodas | nome, valor, id, estoque inicial (pela primeira vez), foto (carregar também no meta.xml).
            },

            [3] = { -- Aéreos | nome, valor, id, estoque inicial (pela primeira vez), foto (carregar também no meta.xml).
            },

            [2] = { -- Aquáticos | nome, valor, id, estoque inicial (pela primeira vez), foto (carregar também no meta.xml).
            }
        }
    },

    garagem = { -- Garagem.
        pos = { -- Garagens - Pos X, Pos Y, Pos Z.
            {1806.415, -1715.877, 13.541},
            {1648.331, -1135.639, 23.906},
            {352.514, -1811.668, 6.555},
            {892.645, -1667.951, 13.547},
			{2727.811, -1874.173, 9.571},
			{1419.503, -1804.235, 13.608},
        },

        aclveh = "Console", -- ACL que Pode Setar/Retirar Veículos.
        giveveh = "giveveh", -- ( /giveveh IDPlayer Categoria NomeVeículo ) Comando Setar Veículo na Garagem do Player.
        takeveh = "takeveh", -- ( /takeveh IDPlayer Categoria NomeVeículo ) Comando Retirar Veículo da Garagem do Player.
        --[[ Categorias: Quatro, Duas, Aereos, Aquaticos ]]

        trancar = "l", -- Tecla para trancar o Veículo.

        garagem_blip = 35 -- ID Blip das Garagens.
    },

    desmanche = { -- Desmanche.
        zones = { -- Desmanches - Pos X, Pos Y, Pos Z.
            {1797.797, -1739.629, 13.547},
			{2566.6, -972.048, 82.285},
        },

        model = { -- ID Veículos que podem ser Desmanchados.
            480, 411,
        },

        acl = "Bandido", -- ACL que pode Desmanchar Veículos.

        valor = {1000, 20000} -- Valor entre 1000 e 20000 ganho no Desmanche do Veículo.
    },

    detran = { -- Detran.
        pos = { -- Detrans - Pos X, Pos Y, pos Z.
            {1782.04, -1689.337, 13.541},
        },

        sigla = "BR", -- Sigla do seu Servidor antes da Placa. 

        valorseguro = 10000, -- Preço Seguro.
        valorplaca = 5000, -- Preço Placa.

        blip = 24, -- ID Blip dos Detrans.

        apreender = { -- Apreender Veículos.
            {1828.262, -1682.746, 13.547},
        },

        aclapreender = "Policial", -- ACL que pode Apreender Veículos.

        apreender2 = { -- Liberar Veículos Apreendidos.
            {1814.822, -1654.962, 13.547},
        },

        valorapreender = 15000 -- Valor para Retirar o Veículo Apreendido.
    }
}