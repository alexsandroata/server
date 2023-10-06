Hyper_Config = {
    Escolas = {
        {1685.191, -1346.617, 17.431, BlipID = 24, RGB = {244,67,54,100}},
    },

    Pratica = {
        {1685, -1340.072, 17.439,BlipID = 24,RGB = {244,67,54,100}}
    },
    Categorias = {
        {"moto", "CB 1000", "A", 900},
        {"celta", "Celta 2012", "B", 1100},
        {"caminhao", "Caminhão Lixo", "C", 2000},
    },
    Geral = {
        MinAcertos = 7,
        TempoFazerProva = 420, -- em minutos
        PosVoltar = {1684.755, -1343.102, 17.436}, -- Se o player perder por tempo na prova prática voltará para essa posição.
        Bind = "B",
        ColorHex = "#0d00ff",
        Moto = 461,
        Carro = 542,
        Caminhao = 408,
    },
    Rotas = {
        
        [1] = {
            
            {1712.437, -1343.101, 13.383},
            {1697.423, -1439.083, 12.861},
            {1423.039, -1434.63, 12.861},
            {1339.809, -1423.88, 12.861},
            {1295.27, -1586.734, 12.861},
            {1327.435, -1855.275, 12.861},
            {1506.491, -1874.194, 12.861},
            {1691.752, -1835.067, 12.861},
            {1806.783, -1834.344, 12.861},
            {1824.089, -1768.178, 12.861},
            {1925.124, -1754.729, 12.861},
            {2098.986, -1737.363, 12.878},
            {2096.361, -1460.268, 23.299},
            {1865.608, -1459.555, 12.861},
            {1854.216, -1416.998, 12.869},
            {1832.107, -1258.793, 12.947},
            {1728.116, -1298.055, 13.411},
            {1712.437, -1343.101, 13.383},

        },
    },

    Perguntas = { -- Adicione quantas perguntas quiser !
        [1] = {
            Pergunta = "Ocorre um acidente, motorista está preso nas ferregens. Qual serviço de deve ser acionado?", 
            Tempo = 1, -- Em Minutos
            ["Respostas"] = {
                {"Policia Militar", false},
                {"Corpo de Bombeiros", true},
                {"Polcia Rodoviária Federal", false},
                {"Samu", false},
            },
        },
        [2] = {
            Pergunta = "O condutor que deixar de cumprir qualquer determinação da legislação de trânsito estará:", 
            Tempo = 1, -- Em Minutos
            Respostas = {
                {"Comentendo um crime", false},
                {"Correndo risco de ser preso", false},
                {"Cometendo uma infração", true},
                {"Correndo o risco de perder o veiculo", false},
            },
        },
        [3] = {
            Pergunta = "A cor da faixa de travessia de pedestres deve ser:", 
            Tempo = 1, -- Em Minutos
            Respostas = {
                {"Obrigatoriamente Branca", true},
                {"Branca ou Amarela", false},
                {"Obrigatoriamente Amarela", false},
                {"Sem cor predominante", false},
            },
        },
        [4] = {
            Pergunta = "Ocorre um acidente na chuva, em uma via de 60 km/h. A quantos passos deve estar o triângulo?", 
            Tempo = 1, -- Em Minutos
            Respostas = {
                {"120 passos", true},
                {"60 passos", false},
                {"80 passos", false},
                {"150 passos", false},
            },
        },
        [5] = {
            Pergunta = "Para um condutor possuir a categoria (D), ele deverá ter idade superior a:", 
            Tempo = 1, -- Em Minutos
            Respostas = {
                {"21 anos", true},
                {"18 anos ", false},
                {"19 anos", false},
                {"24 anos", false},
            },
        },
        [6] = {
            Pergunta = "Deve-se manter uma distancia segura do carro da frente aplicando a regra dos:", 
            Tempo = 1, -- Em Minutos
            Respostas = {
                {"4 segundos", false},
                {"2 segundos", false},
                {"5 segundos", true},
                {"6 segundos", false},
            },
        },
        [7] = {
            Pergunta = "Quando podemos retirar a vitima do veiculo antes da chegada do socorro especializado?", 
            Tempo = 1, -- Em Minutos
            Respostas = {
                {"Quando a vitíma estiver se sentido bem", false},
                {"Quando o cinto de segurança estiver machucando", false},
                {"Quando o socorro demorar chegar", false},
                {"Quando houver perigo imediato de incêndio", true},
            },
        },
        [8] = {
            Pergunta = "Para manter boa manutenção, os pneus devem ser calibrados:", 
            Tempo = 1, -- Em Minutos
            Respostas = {
                {"semanalmente, com os pneus frios", true},
                {"anualmente, com os pneus frios", false},
                {"mensalmentem, com os pneus frios", false},
                {"semanalmente, com os penus quentes", false},
            },
        },
        [9] = {
            Pergunta = "Em motocicletas é proibido o tranporte de crianças com idade inferior a:", 
            Tempo = 1, -- Em Minutos
            Respostas = {
                {"10 anos", false},
                {"12 anos", true},
                {"8 anos", false},
                {"7 anos", false},
            },
        },
        [10] = {
            Pergunta = "O processo de eliminação do álcool demora de:", 
            Tempo = 1, -- Em Minutos
            Respostas = {
                {"6 a 8 horas", true},
                {"1 a 3 horas", false},
                {"30 a 60 minutos", false},
                {"10 a 12 horas", false},
            },
        },
        --]]
    },
}

function outputMessage(elem, mess, tipo)
    return exports.Infobox:addBox(elem, mess, tipo)
end