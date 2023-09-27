resource_attach = exports['bone_attach'] -- Nome do resource do 'bone attach'.

config = {
    ['Geral'] = {
        Infobox = 'addBox'; -- Evento da Infobox.
        Tecla = 'b'; -- Tecla para abrir o Inventário.
        WeightStandard = 100; -- Peso padrão.
        ChestObject = 964; -- ID do objeto do Baú.
    };
    ['ElementData'] = {
        Hunger = 'fome'; -- Element-Data da fome.
        Thirst = 'sede'; -- Element-Data da sede.
    };
    ['Commands'] = {
        GiveItem = {cmd = 'item', acl = 'Console'}; -- Comando, Grupo que terá permissão para executar este comando.
        TakeItem = {cmd = 'takeitem', acl = 'Console'}; -- Comando, Grupo que terá permissão para executar este comando.
        CreateChest = {cmd = 'addchest', acl = 'Console'}; -- Comand, Grupo que terá permissão para executar este comando.
    };
    ['BlockItems'] = {
        ['ak47'] = {use = true, send = true, drop = true, died = true}; -- ['Nome do Item na Index'] = {use (usar item) true = 'sim' // false = 'não', send (enviar item) true = 'sim' // false = 'não', drop (jogar item fora) true = 'sim'// false = 'não', die (perder ao morrer) true = 'sim' // false = 'não'}.
        ['m4'] = {use = true, send = false, drop = true, died = true}; 
        ['deagle'] = {use = true, send = true, drop = true, died = true};
        ['glock'] = {use = true, send = true, drop = true, died = true};
        ['escopeta'] = {use = true, send = false, drop = true, died = true};
        ['mp5'] = {use = true, send = true, drop = true, died = true};
        ['sniper'] = {use = true, send = true, drop = true, died = true};
        ['taser'] = {use = true, send = false, drop = true, died = true};
        ['ammo_762'] = {use = true, send = true, drop = true, died = true};
        ['ammo_556'] = {use = true, send = false, drop = true, died = true};
        ['ammo_9mm'] = {use = true, send = true, drop = true, died = true};
        ['ammo_12'] = {use = true, send = false, drop = true, died = true};
        ['ammo_.50'] = {use = true, send = true, drop = true, died = true};

        ['batatafrita'] = {use = true, send = true, drop = true, died = true};
        ['cocacola'] = {use = true, send = true, drop = true, died = true};
        ['coxinha'] = {use = true, send = true, drop = true, died = true};
        ['hotdog'] = {use = true, send = true, drop = true, died = true};
        ['lanche'] = {use = true, send = true, drop = true, died = true};
        ['pepsi'] = {use = true, send = true, drop = true, died = true};
        ['rosquinha'] = {use = true, send = true, drop = true, died = true};
        ['sanduiche'] = {use = true, send = true, drop = true, died = true};
        ['garrafaleite'] = {use = true, send = true, drop = true, died = true};

        ['kitreparo'] = {use = true, send = true, drop = true, died = true};
        ['bandagem'] = {use = true, send = true, drop = true, died = true};
        ['jbl'] = {use = true, send = true, drop = true, died = true};
        ['radinho'] = {use = true, send = true, drop = true, died = true};
        ['colete'] = {use = true, send = true, drop = true, died = true};

        ['jblmilitar'] = {use = true, send = false, drop = false, died = false};
        ['jblmaconha'] = {use = true, send = true, drop = false, died = false};

        ['akbotafogo'] = {use = true, send = false, drop = false, died = false};
        ['akatleticopr'] = {use = true, send = false, drop = false, died = false};
        ['akgalo'] = {use = true, send = false, drop = false, died = false};
        ['akbahia'] = {use = true, send = false, drop = false, died = false};
        ['akfortaleza'] = {use = true, send = false, drop = false, died = false};
        ['akinternacional'] = {use = true, send = false, drop = false, died = false};
        ['akpalmeiras'] = {use = true, send = false, drop = false, died = false};
        ['akblue'] = {use = true, send = false, drop = false, died = false};
        ['akgold'] = {use = true, send = false, drop = false, died = false};
        ['akhyper'] = {use = true, send = false, drop = false, died = false};
        ['akflamengo'] = {use = true, send = false, drop = false, died = false};

        ['m4cartoon'] = {use = true, send = false, drop = false, died = false};
        ['m4hyper'] = {use = true, send = false, drop = false, died = false};
        ['m4red'] = {use = true, send = false, drop = false, died = false};
        ['m4barbie'] = {use = true, send = false, drop = false, died = false};
        ['m4blue'] = {use = true, send = false, drop = false, died = false};
        ['m4color'] = {use = true, send = false, drop = false, died = false};
        ['m4gold'] = {use = true, send = false, drop = false, died = false};
        ['m4reddragon'] = {use = true, send = false, drop = false, died = false};

        ['budmaconha'] = {use = false, send = false, drop = true, died = true};
        ['sementemaconha'] = {use = false, send = false, drop = true, died = true};
        ['maconhaembalada'] = {use = true, send = true, drop = false, died = true};
        
        ['cano'] = {use = false, send = false, drop = true, died = true};
        ['capsula'] = {use = false, send = false, drop = true, died = true};
        ['mola'] = {use = false, send = false, drop = true, died = true};
        ['placametal'] = {use = false, send = false, drop = true, died = true};
        ['polvora'] = {use = false, send = false, drop = true, died = true};
        ['gatilho'] = {use = false, send = false, drop = true, died = true};
        ['lockpick'] = {use = true, send = true, drop = true, died = true};
        ['c4'] = {use = false, send = true, drop = true, died = true};

        ['alianca'] = {use = true, send = true, drop = true, died = true};
        ['mochilag'] = {use = true, send = true, drop = true, died = true};
        ['mochilam'] = {use = true, send = true, drop = true, died = true};
        ['mochilap'] = {use = true, send = true, drop = true, died = true};
        ['dsujo'] = {use = false, send = true, drop = true, died = true};
        ['cocaina'] = {use = true, send = true, drop = false, died = true};
    };
    ['Shops'] = {
        {
            position = {1631.885, -1907.108, 12.551}; -- Posição {X, Y, Z}. [ UTILITÁRIOS POSTO CJ ]
            color = {139, 0, 255, 100}; -- Cor {R, G, B}.
            items = { -- Itens.
                {name_item = 'Kit Reparo', item = 'kitreparo', price = 800}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Bandagem', item = 'bandagem', price = 1300}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'JBL', item = 'jbl', price = 5000}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Radinho', item = 'radinho', price = 5000}; -- Nome do Item, Nome do Item (GIVE), Preço.
            };
        };
        {
            position = {1697.524, -1860.61, 12.564}; -- Posição {X, Y, Z}. [ COMIDA PRACA ]
            color = {139, 0, 255, 100}; -- Cor {R, G, B}.
            items = { -- Itens.
                {name_item = 'Batata Frita', item = 'batatafrita', price = 5}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Coca Cola', item = 'cocacola', price = 8}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Coxinha', item = 'coxinha', price = 12}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Hotdog', item = 'hotdog', price = 5}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Lanche', item = 'lanche', price = 8}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Pepsi', item = 'pepsi', price = 8}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Rosquinha', item = 'rosquinha', price = 5}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Sanduiche', item = 'sanduiche', price = 7}; -- Nome do Item, Nome do Item (GIVE), Preço.
            };
        };
        {
            position = {879.383, -1550.347, 13.602 - 1}; -- Posição {X, Y, Z}. [ CONVENIÊNCIA LOJA ATRAS PRAIA ]
            color = {139, 0, 255, 0}; -- Cor {R, G, B}.
            items = { -- Itens.
                {name_item = 'Radinho', item = 'radinho', price = 500}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Kit Reparo', item = 'kitreparo', price = 800}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Bandagem', item = 'bandagem', price = 1300}; -- Nome do Item, Nome do Item (GIVE), Preço.
            };
        }; 
        {
            position = {-551.769, -529.998, 25.523 -1}; -- Posição {X, Y, Z}. [ CONVENIÊNCIA LOJA CADEIA ]
            color = {139, 0, 255, 0}; -- Cor {R, G, B}.
            items = { -- Itens.
                {name_item = 'Batata Frita', item = 'batatafrita', price = 5}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Coca Cola', item = 'cocacola', price = 8}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Coxinha', item = 'coxinha', price = 12}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Hotdog', item = 'hotdog', price = 5}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Lanche', item = 'lanche', price = 8}; -- Nome do Item, Nome do Item (GIVE), Preço.
                {name_item = 'Rosquinha', item = 'rosquinha', price = 5}; -- Nome do Item, Nome do Item (GIVE), Preço.
            };
        };
    };
    ['Items'] = {
        ['colete'] = {
            name_item = 'Colete Bálistio', -- Nome do Item.
            description = 'Utilize esse item para se equipar.', -- Descrição.
            weight = 0, -- Peso.
            image = {dir = 'assets/items/colete.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Utils' -- Tipo do Item.
        };
        ['dsujo'] = {
            name_item = 'Dinheiro Sujo', -- Nome do Item.
            description = 'Dinheiro Sujo.', -- Descrição.
            weight = 0, -- Peso.
            image = {dir = 'assets/items/dinheirosujo.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['budmaconha'] = {
            name_item = 'Bud de Maconha', -- Nome do Item.
            description = 'Utilize esse item para fabricar maconha.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/budmaconha.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['maconhaembalada'] = {
            name_item = 'Maconha Embalada', -- Nome do Item.
            description = 'Utilize esse item para vender em cracolândia.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/maconhaembalada.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['cocaina'] = {
                name_item = 'Cocaina', -- Nome do Item.
                description = 'Utilize esse item para vender em cracolândia.', -- Descrição.
                weight = 0.5, -- Peso.
                image = {dir = 'assets/items/cocaina.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
                type = 'Personal' -- Tipo do Item.
        };
        ['sementemaconha'] = {
            name_item = 'Semente de Maconha', -- Nome do Item.
            description = 'Utilize esse item para fabricar maconha.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/sementemaconha.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['cano'] = {
            name_item = 'Cano', -- Nome do Item.
            description = 'Utilize esse item para fabricar armamento.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/cano.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Utils' -- Tipo do Item.
        };
        ['capsula'] = {
            name_item = 'Capsula', -- Nome do Item.
            description = 'Utilize esse item para fabricar munição.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/capsula.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Utils' -- Tipo do Item.
        };
        ['mola'] = {
            name_item = 'Mola', -- Nome do Item.
            description = 'Utilize esse item para fabricar armamento.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/mola.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Utils' -- Tipo do Item.
        };
        ['placametal'] = {
            name_item = 'Placa de Metal', -- Nome do Item.
            description = 'Utilize esse item para fabricar armamento.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/placametal.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Utils' -- Tipo do Item.
        };
        ['polvora'] = {
            name_item = 'Pólvora', -- Nome do Item.
            description = 'Utilize esse item para fabricar munição.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/polvora.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Utils' -- Tipo do Item.
        };
        ['gatilho'] = {
            name_item = 'Gatilho', -- Nome do Item.
            description = 'Utilize esse item para fabricar armamento.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/gatilho.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Utils' -- Tipo do Item.
        };
        ['lockpick'] = {
            name_item = 'Lockpick', -- Nome do Item.
            description = 'Utilize esse item para destrancar veículos e rouba-los.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/lockpick.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Utils' -- Tipo do Item.
        };
        ['c4'] = {
            name_item = 'C4', -- Nome do Item.
            description = 'Utilize esse item para assalto ao banco.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/c4.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['garrafaleite'] = {
            name_item = 'Garrafa de Leite', -- Nome do Item.
            description = 'Utilize esse item para diminuir sua sede ou vender.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/leite2.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            category = 'Bebidas', -- Categoria do Item.
            object = {1666, {11, 0, 0, 0, 0, 0, 0}}, -- Id do objeto, Posição do Attach.
            regenerate = 15, -- Quantidade que irá regenerar.
            type = 'Foods'-- Tipo do Item.
        };
        ['lanche'] = {
            name_item = 'Hamburguer', -- Nome do Item.
            description = 'Utilize esse item para diminuir sua fome.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/lanche.png', w = 35, h = 35}, -- Diretorio, Largura, Altura.
            category = 'Comida', -- Categoria do Item.
            object = {2880, {12, 0, 0, 0, 0, -90 , 0}}, -- Id do objeto, Posição do Attach.
            regenerate = 15, -- Quantidade que irá regenerar.
            type = 'Foods'-- Tipo do Item.
        };
        ['batatafrita'] = {
            name_item = 'Batata Frita', -- Nome do Item.
            description = 'Utilize esse item para diminuir sua fome.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/batatafrita.png', w = 35, h = 35}, -- Diretorio, Largura, Altura.
            category = 'Comida', -- Categoria do Item.
            object = {2880, {12, 0, 0, 0, 0, -90 , 0}}, -- Id do objeto, Posição do Attach.
            regenerate = 15, -- Quantidade que irá regenerar.
            type = 'Foods'-- Tipo do Item.
        };
        ['coxinha'] = {
            name_item = 'Coxinha', -- Nome do Item.
            description = 'Utilize esse item para diminuir sua fome ou vender.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/coxinha.png', w = 35, h = 35}, -- Diretorio, Largura, Altura.
            category = 'Comida', -- Categoria do Item.
            object = {2880, {12, 0, 0, 0, 0, -90 , 0}}, -- Id do objeto, Posição do Attach.
            regenerate = 15, -- Quantidade que irá regenerar.
            type = 'Foods'-- Tipo do Item.
        };
        ['hotdog'] = {
            name_item = 'Hotdog', -- Nome do Item.
            description = 'Utilize esse item para diminuir sua fome ou vender.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/hotdog.png', w = 35, h = 35}, -- Diretorio, Largura, Altura.
            category = 'Comida', -- Categoria do Item.
            object = {2880, {12, 0, 0, 0, 0, -90 , 0}}, -- Id do objeto, Posição do Attach.
            regenerate = 15, -- Quantidade que irá regenerar.
            type = 'Foods'-- Tipo do Item.
        };
        ['rosquinha'] = {
            name_item = 'Rosquinha', -- Nome do Item.
            description = 'Utilize esse item para diminuir sua fome ou vender.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/rosquinha.png', w = 35, h = 35}, -- Diretorio, Largura, Altura.
            category = 'Comida', -- Categoria do Item.
            object = {2880, {12, 0, 0, 0, 0, -90 , 0}}, -- Id do objeto, Posição do Attach.
            regenerate = 15, -- Quantidade que irá regenerar.
            type = 'Foods'-- Tipo do Item.
        };
        ['sanduiche'] = {
            name_item = 'Sanduiche', -- Nome do Item.
            description = 'Utilize esse item para diminuir sua fome ou vender.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/sanduiche.png', w = 35, h = 35}, -- Diretorio, Largura, Altura.
            category = 'Comida', -- Categoria do Item.
            object = {2880, {12, 0, 0, 0, 0, -90 , 0}}, -- Id do objeto, Posição do Attach.
            regenerate = 15, -- Quantidade que irá regenerar.
            type = 'Foods'-- Tipo do Item.
        };
        ['cocacola'] = {
            name_item = 'Coca cola', -- Nome do Item.
            description = 'Utilize esse item para diminuir sua sede.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/cocacola.png', w = 35, h = 35}, -- Diretorio, Largura, Altura.
            category = 'Bebidas', -- Categoria do Item.
            object = {2601, {12, 0.03, 0.05, -0.02, 0, 180, 0}}, -- Id do objeto, Posição do Attach.
            regenerate = 15, -- Quantidade que irá regenerar.
            type = 'Foods'-- Tipo do Item.
        };
        ['pepsi'] = {
            name_item = 'Pepsi', -- Nome do Item.
            description = 'Utilize esse item para diminuir sua sede.', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/pepsi.png', w = 35, h = 35}, -- Diretorio, Largura, Altura.
            category = 'Bebidas', -- Categoria do Item.
            object = {2601, {12, 0.03, 0.05, -0.02, 0, 180, 0}}, -- Id do objeto, Posição do Attach.
            regenerate = 15, -- Quantidade que irá regenerar.
            type = 'Foods'-- Tipo do Item.
        };
        ['alianca'] = {
            name_item = 'Aliança', -- Nome do Item.
            description = 'Utilize esse item para pedir alguém em casamento ou vender.', -- Descrição.
            weight = 0.1, -- Peso.
            image = {dir = 'assets/items/alianca.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['dinheiro'] = {
            name_item = 'Dinheiro', -- Nome do Item.
            description = 'Utilize esse item para comprar outros itens.', -- Descrição.
            weight = 0, -- Peso.
            image = {dir = 'assets/items/money.png', w = 40, h = 40},
            type = 'Personal' -- Tipo do Item.
        };
        ['kitreparo'] = {
            name_item = 'Kit Reparo', -- Nome do Item.
            description = 'Utilize esse item para consertar algum veiculo.', -- Descrição.
            weight = 4, -- Peso.
            image = {dir = 'assets/items/kit_repair.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Utils' -- Tipo do Item.
        };
        ['bandagem'] = {
            name_item = 'Bandagem', -- Nome do Item.
            description = 'Utilize esse item para curar ferimentos.', -- Descrição.
            weight = 0.1, -- Peso.
            image = {dir = 'assets/items/bandagem.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['radinho'] = {
            name_item = 'Radio Comunicador', -- Nome do Item.
            description = 'Utilize esse item para para se comunicar.', -- Descrição.
            weight = 0.1, -- Peso.
            image = {dir = 'assets/items/radinho.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['jbl'] = {
            name_item = 'JBL', -- Nome do Item.
            description = 'Utilize esse item para comunicação a distância.', -- Descrição.
            weight = 1, -- Peso.
            image = {dir = 'assets/items/jbl.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['jblmilitar'] = {
            name_item = 'Adesivagem JBL Militar', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura de sua JBL', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/jblmilitar.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['jblmaconha'] = {
            name_item = 'Adesivagem JBL Maconha', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura de sua JBL', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/jblmaconha.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['akbotafogo'] = {
            name_item = 'Adesivagem AK-47 Bota Fogo', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua AK-47', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/akbotafogo.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['akatleticopr'] = {
            name_item = 'Adesivagem a AK-47 Athletico PR', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua AK-47', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/akatleticopr.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['akgalo'] = {
            name_item = 'Adesivagem AK-47 Galo', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua AK-47', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/akgalo.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['akbahia'] = {
            name_item = 'Adesivagem a AK-47 Bahia', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua AK-47', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/akbahia.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['akfortaleza'] = {
            name_item = 'Adesivagem a AK-47 Fortaleza', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua AK-47', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/akfortaleza.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['akinternacional'] = {
            name_item = 'Adesivagem a AK-47 Internacional', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua AK-47', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/akinternacional.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['akpalmeiras'] = {
            name_item = 'Adesivagem a AK-47 Palmeiras', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua AK-47', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/akpalmeiras.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['akblue'] = {
            name_item = 'Adesivagem a AK-47 Blue', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua AK-47', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/akblue.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['akgold'] = {
            name_item = 'Adesivagem AK-47 Gold', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua AK-47', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/akgold.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['akhyper'] = {
            name_item = 'Textura AK-47 Hyper', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua AK-47', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/akhyper.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['akflamengo'] = {
            name_item = 'Textura AK-47 Flamengo', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua AK-47', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/akflamengo.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['m4cartoon'] = {
            name_item = 'Textura M4 Cartoon', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua AK-47', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/m4cartoon.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['m4hyper'] = {
            name_item = 'Textura M4 Hyper', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua M4', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/m4hyper.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['m4red'] = {
            name_item = 'Textura M4 Red', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua M4', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/m4red.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['m4barbie'] = {
            name_item = 'Textura M4 Barbie', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua M4', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/m4barbie.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['m4blue'] = {
            name_item = 'Textura M4 Blue', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua M4', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/m4blue.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['m4color'] = {
            name_item = 'Textura M4 Color', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua M4', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/m4color.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['m4gold'] = {
            name_item = 'Textura M4 Gold', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua M4', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/m4gold.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['m4reddragon'] = {
            name_item = 'Textura M4 Reddragon', -- Nome do Item.
            description = 'Utilize esse item para trocar a textura da sua M4', -- Descrição.
            weight = 0.5, -- Peso.
            image = {dir = 'assets/items/m4reddragon.png', w = 40, h = 40}, -- Diretorio, Largura, Altura.
            type = 'Personal' -- Tipo do Item.
        };
        ['mochilag'] = {
            name_item = 'Mochila Grande', -- Nome do Item.
            description = 'Utilize esse item para almentar o peso de sua mochila.', -- Descrição.
            weight = 0.1, -- Peso.
            image = {dir = 'assets/items/mochilag.png', w = 40, h = 40},
            type = 'Personal' -- Tipo do Item.
        };
        ['mochilam'] = {
            name_item = 'Mochila Média', -- Nome do Item.
            description = 'Utilize esse item para almentar o peso de sua mochila.', -- Descrição.
            weight = 0.1, -- Peso.
            image = {dir = 'assets/items/mochilam.png', w = 40, h = 40},
            type = 'Personal' -- Tipo do Item.
        };
        ['mochilap'] = {
            name_item = 'Mochila Pequena', -- Nome do Item.
            description = 'Utilize esse item para almentar o peso de sua mochila.', -- Descrição.
            weight = 0.1, -- Peso.
            image = {dir = 'assets/items/mochilap.png', w = 40, h = 40},
            type = 'Personal' -- Tipo do Item.
        };
        ['m4'] = {
            name_item = 'M4', -- Nome do Item.
            description = 'Utilize esse item para atirar.', -- Descrição.
            weight = 1, -- Peso.
            image = {dir = 'assets/items/m4.png', w = 50, h = 50}, -- Diretorio, Largura, Altura.
            category = 'Weapon', -- Categoria.
            type = 'Ilegais' -- Tipo do Item.
        };
        ['ak47'] = {
            name_item = 'AK-47', -- Nome do Item.
            description = 'Utilize esse item para atirar.', -- Descrição.
            weight = 1, -- Peso.
            image = {dir = 'assets/items/ak47.png', w = 50, h = 50}, -- Diretorio, Largura, Altura.
            category = 'Weapon', -- Categoria.
            type = 'Ilegais' -- Tipo do Item.
        };
        ['glock'] = {
            name_item = 'Glock', -- Nome do Item.
            description = 'Utilize esse item para atirar.', -- Descrição.
            weight = 1, -- Peso.
            image = {dir = 'assets/items/glock.png', w = 35, h = 35}, -- Diretorio, Largura, Altura.
            category = 'Weapon', -- Categoria.
            type = 'Ilegais' -- Tipo do Item.
        };
        ['deagle'] = {
            name_item = 'Deagle', -- Nome do Item.
            description = 'Utilize esse item para atirar.', -- Descrição.
            weight = 1, -- Peso.
            image = {dir = 'assets/items/deagle.png', w = 35, h = 35}, -- Diretorio, Largura, Altura.
            category = 'Weapon', -- Categoria.
            type = 'Ilegais' -- Tipo do Item.
        };
        ['escopeta'] = {
            name_item = 'Escopeta', -- Nome do Item.
            description = 'Utilize esse item para atirar.', -- Descrição.
            weight = 1, -- Peso.
            image = {dir = 'assets/items/escopeta.png', w = 35, h = 35}, -- Diretorio, Largura, Altura.
            category = 'Weapon', -- Categoria.
            type = 'Ilegais' -- Tipo do Item.
        };
        ['mp5'] = {
            name_item = 'MP5', -- Nome do Item.
            description = 'Utilize esse item para atirar.', -- Descrição.
            weight = 1, -- Peso.
            image = {dir = 'assets/items/mp5.png', w = 35, h = 35}, -- Diretorio, Largura, Altura.
            category = 'Weapon', -- Categoria.
            type = 'Ilegais' -- Tipo do Item.
        };
        ['sniper'] = {
            name_item = 'Sniper', -- Nome do Item.
            description = 'Utilize esse item para atirar.', -- Descrição.
            weight = 2, -- Peso.
            image = {dir = 'assets/items/sniper.png', w = 35, h = 35}, -- Diretorio, Largura, Altura.
            category = 'Weapon', -- Categoria.
            type = 'Ilegais' -- Tipo do Item.
        };
        ['taser'] = {
            name_item = 'Taser', -- Nome do Item.
            description = 'Utilize esse item para tranquilizar algum indivíduo.', -- Descrição.
            weight = 1, -- Peso.
            image = {dir = 'assets/items/taser.png', w = 35, h = 35}, -- Diretorio, Largura, Altura.
            category = 'Weapon', -- Categoria.
            type = 'Ilegais' -- Tipo do Item.
        };
        ['ammo_556'] = {
            name_item = 'Munição 556', -- Nome do Item.
            description = 'Utilize esse item para recarregar Fuzis.', -- Descrição.
            weight = 0.2, -- Peso.
            image = {dir = 'assets/items/ammo_556.png', w = 30, h = 30}, -- Diretorio, Largura, Altura.
            category = 'Munition', -- Categoria.
            type = 'Personal' -- Tipo do Item.
        };
        ['ammo_9mm'] = {
            name_item = 'Munição 9mm', -- Nome do Item.
            description = 'Utilize esse item para recarregar pistolas e smg.', -- Descrição.
            weight = 0.2, -- Peso.
            image = {dir = 'assets/items/ammo_9mm.png', w = 30, h = 30}, -- Diretorio, Largura, Altura.
            category = 'Munition', -- Categoria.
            type = 'Personal' -- Tipo do Item.
        };
        ['ammo_762'] = {
            name_item = 'Munição 762', -- Nome do Item.
            description = 'Utilize esse item para recarregar Fuzis.', -- Descrição.
            weight = 0.2, -- Peso.
            image = {dir = 'assets/items/ammo_762.png', w = 30, h = 30}, -- Diretorio, Largura, Altura.
            category = 'Munition', -- Categoria.
            type = 'Personal' -- Tipo do Item.
        };
        ['ammo_12'] = {
            name_item = 'Munição Calibre 12', -- Nome do Item.
            description = 'Utilize esse item para recarregar escopetas.', -- Descrição.
            weight = 0.2, -- Peso.
            image = {dir = 'assets/items/ammo_12.png', w = 30, h = 30}, -- Diretorio, Largura, Altura.
            category = 'Munition', -- Categoria.
            type = 'Personal' -- Tipo do Item.
        };
        ['ammo_.50'] = {
            name_item = 'Munição .50', -- Nome do Item.
            description = 'Utilize esse item para recarregar sniper.', -- Descrição.
            weight = 0.2, -- Peso.
            image = {dir = 'assets/items/ammo_.50.png', w = 30, h = 30}, -- Diretorio, Largura, Altura.
            category = 'Munition', -- Categoria.
            type = 'Personal' -- Tipo do Item.
        };
    };

    --> Configurações Relacionadas ao Armamento.
    ['Weapons'] = { -- Armas.
        ['m4'] = {weapon_id = 31, category = 'Fuzil'}, -- Id do armamento, Categoria.
        ['ak47'] = {weapon_id = 30, category = 'Fuzil'}, -- Id do armamento, Categoria.
        ['deagle'] = {weapon_id = 24, category = 'Pistolas'}, -- Id do armamento, Categoria.
        ['glock'] = {weapon_id = 22, category = 'Pistolas'}, -- Id do armamento, Categoria.
        ['escopeta'] = {weapon_id = 25, category = 'Medium'}, -- Id do armamento, Categoria.
        ['mp5'] = {weapon_id = 29, category = 'Smg'}, -- Id do armamento, Categoria.
        ['sniper'] = {weapon_id = 34, category = 'Grande'}, -- Id do armamento, Categoria.
        ['taser'] = {weapon_id = 23, category = 'Pistolas'}, -- Id do armamento, Categoria.
    },
    ['Munitions'] = { -- Munições
        ['ammo_556'] = {31}, -- Armas
        ['ammo_762'] = {30}, -- Armas
        ['ammo_9mm'] = {22, 24, 29, 23}, -- Armas
        ['ammo_12'] = {25}, -- Armas
        ['ammo_.50'] = {34}, -- Armas
    },
    ['CancelFire'] = {
        [31] = true; -- [ID] = true,
        [30] = true; -- [ID] = true,
        [24] = true; -- [ID] = true,
        [22] = true; -- [ID] = true,
        [25] = true; -- [ID] = true,
        [29] = true; -- [ID] = true,
        [34] = true; -- [ID] = true,
        [23] = true; -- [ID] = true,
    };
}

function sendMessage(element, typesrc, message, type)
    if typesrc == 'server' then return triggerClientEvent(element, config['Geral'].Infobox, element, message, type) end;
    if typesrc == 'client' then return triggerEvent(config['Geral'].Infobox, localPlayer, message, type) end;
end

function isElementPlayer(element)
    return (element and isElement(element) and getElementType(element) == 'player');
end

function createEventHandler(event, ...)
    addEvent(event, true);
    addEventHandler(event, ...);
end

function isPlayerInACL (player, acl)
    if player and isElementPlayer(player) then
        if acl and aclGetGroup(tostring(acl)) then
            local user, acl = 'user.'..getAccountName(getPlayerAccount(player)), aclGetGroup(tostring(acl));
            return (isObjectInACLGroup(user, acl));
        end
    end
    return false;
end

function math.round (number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == 'ceil' or method == 'floor') then
        return math[method](number * factor) / factor
    else
        local result = tonumber(('%.'..decimals..'f'):format(number));
        return (result > -1 and result or 0);
    end
end

function getPlayerID (id)
    local id = tonumber(id)
    if id and type(id) == 'number' then
        for i, v in ipairs(getElementsByType('player')) do
            local player_id = getElementData(v, 'ID') or 0;
            if player_id == id then
                return v;
            end
        end
    end
    return false;
end

function getElementDistance (element, toElement, toDistance)
    if element and isElement(element) then
        if toElement and isElement(toElement) then
            if toDistance and type(toDistance) == 'number' and tostring(toDistance):len() ~= 0 then
                local distance = getDistanceBetweenPoints3D(Vector3(getElementPosition(element)), Vector3(getElementPosition(toElement)));
                if distance <= toDistance then
                    return true;
                end
            end
        end
    end
    return false
end