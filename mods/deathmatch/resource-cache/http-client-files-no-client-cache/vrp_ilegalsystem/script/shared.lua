--- ░█████╗░░█████╗░███╗░░██╗████████╗██╗░░░██╗ ░░██╗░░░░██╗██╗░░
--- ██╔══██╗██╔══██╗████╗░██║╚══██╔══╝██║░░░██║  ░██╔╝░░░██╔╝╚██╗░
--- ██║░░╚═╝███████║██╔██╗██║░░░██║░░░██║░░░██║  ██╔╝░░░██╔╝░░╚██╗
--- ██║░░██╗██╔══██║██║╚████║░░░██║░░░██║░░░██║  ╚██╗░░██╔╝░░░██╔╝
--- ╚█████╔╝██║░░██║██║░╚███║░░░██║░░░╚██████╔╝  ░╚██╗██╔╝░░░██╔╝░
--- ░╚════╝░╚═╝░░╚═╝╚═╝░░╚══╝░░░╚═╝░░░░╚═════╝░  ░░╚═╝╚═╝░░░░╚═╝░░

--- Qualquer duvida: Cantu#5945
--- Qualquer duvida: Cantu#0764
--- Qualquer duvida: Cantu#0007
--- Qualquer duvida: @cantuzinho

Config = {
    Sigla = "Gueto Acadmy",
    ConfigRotas = {
        ["Tecla Iniciar Rota"] = "F7",
        ["ID Dinheiro Sujo"] = 14,
        ["Tempo Fabricar"] = 25000,
        ["Dinheiro Fabricar"] = 150,
        ["DelayDroga"] = 600000,
        ["AclsPolicial"] = {"Police"},
        ["Policiais Receber Valor Total"] = 25,
    },

    PosicoesIniciarRota = {
        [1] = {Pos = {2338.24438, -2022.29248, 13.77137}, Acls = {"Crips"}, Itens = {"capsula","polvora"}, Quantidade = {De = 3, Ate = 5}, DinheiroSujoReceber = 250},
        [2] = {Pos = {2060.13, -1562.505, 13.521}, Acls = {"Bloods"}, Itens = {"capsula","polvora"}, Quantidade = {De = 3, Ate = 5}, DinheiroSujoReceber = 250},
        [3] = {Pos = {2516.77930, -1694.84729, 14.05424}, Acls = {"Groove"}, Itens = {"kevlar","prata","corpoarma"}, Quantidade = {De = 3, Ate = 5}, DinheiroSujoReceber = 250}, ---- Mafia
        [4] = {Pos = {1931.448, -2034.463, 13.573}, Acls = {"Bratva"}, Itens = {"capsula","polvora"}, Quantidade = {De = 3, Ate = 5}, DinheiroSujoReceber = 250},
		 --[1] = {Pos = {2524.708, -1658.641, 15.824}, Acls = {"Groove"}, Itens = {"plastico","budmaconha"}, Quantidade = {De = 3, Ate = 5}, DinheiroSujoReceber = 150},
       -- [2] = {Pos = {2140.976, -1802.026, 16.139}, Acls = {"Ballas"}, Itens = {"plastico","budmaconha"}, Quantidade = {De = 3, Ate = 5}, DinheiroSujoReceber = 150},
       -- [3] = {Pos = {1919.757, -2019.713, 13.547}, Acls = {"Vagos"}, Itens = {"plastico","cocaina"}, Quantidade = {De = 3, Ate = 5}, DinheiroSujoReceber = 150},
       -- [4] = {Pos = {2329.373, -2006.774, 14.85}, Acls = {"Aztecas"}, Itens = {"plastico","cocaina"}, Quantidade = {De = 3, Ate = 5}, DinheiroSujoReceber = 150},
        ---[5] = {Pos = {2484.012, -1413.629, 28.836}, Acls = {"Syndicate"}, Itens = {"corpoarma","aluminio"}, Quantidade = {De = 3, Ate = 5}, DinheiroSujoReceber = 150},
       -- [6] = {Pos = {2066.683, -1553.862, 13.431}, Acls = {"Triads"}, Itens = {"corpoarma","aluminio"}, Quantidade = {De = 3, Ate = 5}, DinheiroSujoReceber = 150},
       -- [7] = {Pos = {1350.164, -627.313, 109.132}, Acls = {"Mafia"}, Itens = {"corpoarma","aluminio"}, Quantidade = {De = 3, Ate = 5}, DinheiroSujoReceber = 150},
       -- [8] = {Pos = {-1432.62, -1535.241, 102.258}, Acls = {"Calvo"}, Itens = {"corpoarma","aluminio"}, Quantidade = {De = 3, Ate = 5}, DinheiroSujoReceber = 150},
       -- [9] = {Pos = {2416.656, 141.277, 27.056}, Acls = {"Brancos"}, Itens = {"corpoarma","aluminio"}, Quantidade = {De = 3, Ate = 5}, DinheiroSujoReceber = 150},
    },

    PosicoesRotas = {
        [1] = {
            {791.345, -1753.405, 13.456},
            {433.48, -1747.75, 9.214},
            {315.831, -1769.958, 4.637},
            {142.611, -1469.763, 25.204},
            {298.805, -1338.536, 53.442},
            {300.404, -1154.626, 81.387},
            {661.78, -651.143, 16.385},
            {312.728, -121.316, 3.535},
            {719.048, 300.667, 20.377},
            {1234.027, 372.112, 19.598}, 
            {1488.588, 360.931, 19.412},
            {2363.822, 187.089, 28.442},
            {2443.902, 92.247, 28.442},
            {2551.222, -5.343, 27.676},
            {2557.342, 69.15, 26.524},
        },
        [2] = {
            {791.345, -1753.405, 13.456},
            {433.48, -1747.75, 9.214},
            {315.831, -1769.958, 4.637},
            {142.611, -1469.763, 25.204},
            {298.805, -1338.536, 53.442},
            {300.404, -1154.626, 81.387},
            {661.78, -651.143, 16.385},
            {312.728, -121.316, 3.535},
            {719.048, 300.667, 20.377},
            {1234.027, 372.112, 19.598}, 
            {1488.588, 360.931, 19.412},
            {2363.822, 187.089, 28.442},
            {2443.902, 92.247, 28.442},
            {2551.222, -5.343, 27.676},
            {2557.342, 69.15, 26.524},
        },
        [3] = {
            {791.345, -1753.405, 13.456},
            {433.48, -1747.75, 9.214},
            {315.831, -1769.958, 4.637},
            {142.611, -1469.763, 25.204},
            {298.805, -1338.536, 53.442},
            {300.404, -1154.626, 81.387},
            {661.78, -651.143, 16.385},
            {312.728, -121.316, 3.535},
            {719.048, 300.667, 20.377},
            {1234.027, 372.112, 19.598}, 
            {1488.588, 360.931, 19.412},
            {2363.822, 187.089, 28.442},
            {2443.902, 92.247, 28.442},
            {2551.222, -5.343, 27.676},
            {2557.342, 69.15, 26.524},
        },
        [4] = {
            {791.345, -1753.405, 13.456},
            {433.48, -1747.75, 9.214},
            {315.831, -1769.958, 4.637},
            {142.611, -1469.763, 25.204},
            {298.805, -1338.536, 53.442},
            {300.404, -1154.626, 81.387},
            {661.78, -651.143, 16.385},
            {312.728, -121.316, 3.535},
            {719.048, 300.667, 20.377},
            {1234.027, 372.112, 19.598}, 
            {1488.588, 360.931, 19.412},
            {2363.822, 187.089, 28.442},
            {2443.902, 92.247, 28.442},
            {2551.222, -5.343, 27.676},
            {2557.342, 69.15, 26.524},
        },
},

    PocioesFabricar = {
        [1] = {Pos = {2345.25122, -2027.85120, 13.79753}, Acls = {"Crips"}}, 
        [2] = {Pos = {2063.725, -1565.121, 13.523}, Acls = {"Bloods"}},
        [3] = {Pos = {2521.14502, -1690.28711, 14.05424}, Acls = {"Groove"}}, 
        [4] = {Pos = {1932.185, -2030.551, 13.573}, Acls = {"Bratva"}},
    },

    DrogasFabricar = {
        [1] = {
            {Nome = "Municao .338", ID = "9mm", Diretorio = "9mm", QuantidadeReceber = 100,TamanhoImagem = {100,100}, Componentes = {
                {Nome = "Aluminio", ID = "polvora", QuantidadeMinima = 10,Tamanho = {100,100}},
                {Nome = "Pólvora", ID = "capsula", QuantidadeMinima = 5,Tamanho = {100,100}},
            },},
            {Nome = "Municao 762", ID = "762", Diretorio = "762", QuantidadeReceber = 100,TamanhoImagem = {100,100}, Componentes = {
                {Nome = "Aluminio", ID = "polvora", QuantidadeMinima = 15,Tamanho = {100,100}},
                {Nome = "Pólvora", ID = "capsula", QuantidadeMinima = 10,Tamanho = {100,100}},
            },}, 
        },
 
        [2] = {
            {Nome = "Municao .338", ID = "9mm", Diretorio = "9mm", QuantidadeReceber = 100,TamanhoImagem = {100,100}, Componentes = {
                {Nome = "Aluminio", ID = "polvora", QuantidadeMinima = 10,Tamanho = {100,100}},
                {Nome = "Pólvora", ID = "capsula", QuantidadeMinima = 5,Tamanho = {100,100}},
            },},
            {Nome = "Municao 762", ID = "762", Diretorio = "762", QuantidadeReceber = 100,TamanhoImagem = {100,100}, Componentes = {
                {Nome = "Aluminio", ID = "polvora", QuantidadeMinima = 15,Tamanho = {100,100}},
                {Nome = "Pólvora", ID = "capsula", QuantidadeMinima = 10,Tamanho = {100,100}},
            },}, 
        },

        [3] = {
             {Nome = "Five Seven", ID = "five", Diretorio = "five", QuantidadeReceber = 2,TamanhoImagem = {100,100}, Componentes = {
                {Nome = "Aluminio", ID = "kevlar", QuantidadeMinima = 10,Tamanho = {100,100}},
                {Nome = "Prata", ID = "prata", QuantidadeMinima = 5,Tamanho = {100,100}},
                {Nome = "CorpoArma", ID = "corpoarma", QuantidadeMinima = 2,Tamanho = {100,100}},
            },},
            {Nome = "AK-47", ID = "ak47", Diretorio = "ak47", QuantidadeReceber = 2,TamanhoImagem = {100,100}, Componentes = {
                {Nome = "Aluminio", ID = "kevlar", QuantidadeMinima = 20,Tamanho = {100,100}},
                {Nome = "Prata", ID = "prata", QuantidadeMinima = 15,Tamanho = {100,100}},
                {Nome = "CorpoArma", ID = "corpoarma", QuantidadeMinima = 10,Tamanho = {100,100}},
            },}, 
        },
        [4] = {
            {Nome = "Municao .338", ID = "9mm", Diretorio = "9mm", QuantidadeReceber = 100,TamanhoImagem = {100,100}, Componentes = {
                {Nome = "Aluminio", ID = "polvora", QuantidadeMinima = 10,Tamanho = {100,100}},
                {Nome = "Pólvora", ID = "capsula", QuantidadeMinima = 5,Tamanho = {100,100}},
            },},
            {Nome = "Municao 762", ID = "762", Diretorio = "762", QuantidadeReceber = 100,TamanhoImagem = {100,100}, Componentes = {
                {Nome = "Aluminio", ID = "polvora", QuantidadeMinima = 15,Tamanho = {100,100}},
                {Nome = "Pólvora", ID = "capsula", QuantidadeMinima = 10,Tamanho = {100,100}},
            },}, 
        },
},
    ConfigNPCS = {
        ["Drogas"] = {
            {ID = 17, ValorCada = 850},
            {ID = 12, ValorCada = 950},
        },
        ["Posicoes"] = {
           {Posicao = {1397.492, 220.396, 19.557}, Rotacao = {-0, 0, 157.82098388672}, Skin = 230},
           {Posicao = {1343.729, 202.468, 19.555}, Rotacao = {-0, 0, 342.80718994141}, Skin = 220},
           {Posicao = {1352.769, 251.331, 19.555}, Rotacao = {-0, 0, 20.202228546143}, Skin = 221},
           {Posicao = {1429.577, 275.261, 19.555}, Rotacao = {-0, 0, 64.111404418945}, Skin = 209},
           {Posicao = {1324.484, 286.047, 20.045}, Rotacao = {-0, 0, 338.40716552734}, Skin = 205},
           {Posicao = {1342.261, 385.368, 19.555}, Rotacao = {-0, 0, 240.04608154297}, Skin = 200},
           {Posicao = {1373.568, 405.336, 19.956}, Rotacao = {-0, 0, 66.304008483887}, Skin = 201},
           {Posicao = {1247.933, 365.509, 19.555}, Rotacao = {-0, 0, 335.66021728516}, Skin = 197},
           {Posicao = {1428.422, 356.504, 18.875}, Rotacao = {-0, 0, 159.78302001953}, Skin = 168},
           {Posicao = {1310.721, 381.307, 19.562}, Rotacao = {0, 0, 140.976}, Skin = 162},
           {Posicao = {1273.662, 360.656, 19.555}, Rotacao = {0, 0, 250}, Skin = 160},
           {Posicao = {1269.98, 266.546, 19.547}, Rotacao = {-0, 0, 64.498733520508}, Skin = 136},
           {Posicao = {1221.122, 310.39, 19.738}, Rotacao = {-0, 0, 154.59310913086}, Skin = 137},
        },
    },
    Chances = {
        [1] = "Policia",
        [2] = "Aceitar",
        [3] = "Policia",
        [4] = "Aceitar",
        [5] = "Policia",
        [6] = "Aceitar",
        [7] = "Policia",
        [8] = "Aceitar",
        [9] = "Policia",
        [10] = "Aceitar",
    }
}


function message (player, scrtype, message, type)
    if scrtype == "server" then
        triggerClientEvent (player, "Notify", player, message, type)
        print(message)
    elseif scrtype == "client" then
        triggerEvent ("Notify", player, message, type)
       print(message)
    end
end