local screen = {guiGetScreenSize()} local x, y = (screen[1]/1366), (screen[2]/768) local tick = {} local wallpaper = 1 local font = {dxCreateFont('Files/font.ttf', 10, false), dxCreateFont('Files/font.ttf', 20, false), dxCreateFont('Files/font.ttf', 8, false), dxCreateFont('Files/font.ttf', 13, false), dxCreateFont('Files/font.ttf', 35, false)} local windowConfig = nil local edits = {} personstinder = {} infostinder = {} local plano = 0 tinder = {}

musicasSearch = {}

proximaPagina2 = 0
maxLinhas2 = 5

proximaPagina2 = 0
maxLinhas2 = 7

local infoswpp = {} 
local personswpp = {} 
local indexapp = {}

icons = {       -- trigger para para triggar event, window para mudar de janela
    {'Appstore', 'Files/Imagens/icons/App.png', 'window'                            , download = false},
    {'Configuração', 'Files/Imagens/icons/config.png', 'window'                     , download = false},
    {'Camera', 'Files/Imagens/icons/camera.png', 'trigger', 'client', 'Pedro.Selfie', download = false},
    {'Informações', 'Files/Imagens/icons/info.png', 'window'                        , download = false},

    {'Contatos', 'Files/Imagens/icons/contatos.png', 'window'                       , download = false},
    {'GPS', 'Files/Imagens/icons/gps.png', 'window'                                 , download = false},
    {'Spotify', 'Files/Imagens/icons/spotify.png', 'window'                         , download = true},
 
    {'Telefone', 'Files/Imagens/icons/chamada.png', 'window'                        , download = false},
    {'Whatsapp', 'Files/Imagens/icons/whatsapp.png', 'window'                       , download = true},
    {'Banco', 'Files/Imagens/icons/banco.png', 'window'                             , download = true},
    {'Recarga', 'Files/Imagens/icons/Recarga.png', 'window'                         , download = true},
    {'Tinder', 'Files/Imagens/icons/Tinder.png', 'window'                           , download = true},
}

wallpapers = {
    {x * 1106, y * 324, x * 55, y * 119, '1'},
    {x * 1183, y * 324, x * 55, y * 119, '2'},
    {x * 1259, y * 324, x * 55, y * 119, '3'},
    {x * 1106, y * 455, x * 55, y * 119, '4'},
    {x * 1183, y * 455, x * 55, y * 119, '5'},
    {x * 1259, y * 455, x * 55, y * 119, '6'},
    {x * 1106, y * 586, x * 55, y * 119, '7'},
    {x * 1183, y * 586, x * 55, y * 119, '8'},

}

ative = {
    {x * 1115, y * 339, x * 31, y * 20, 'Ligação', x * 1149, y * 340, x * 1311, y * 358},
    {x * 1115, y * 370, x * 31, y * 20, 'Ligação de estranhos', x * 1149, y * 372, x * 1311, y * 390},
    {x * 1115, y * 401, x * 31, y * 20, 'Mensagens', x * 1149, y * 400, x * 1311, y * 418},
    {x * 1115, y * 432, x * 31, y * 20, 'Mensagens de estranhos', x * 1149, y * 432, x * 1311, y * 450},
}

slots = {
    {x * 1121, y * 273, x * 40, y * 40},
    {x * 1167, y * 273, x * 40, y * 40},
    {x * 1213, y * 273, x * 40, y * 40},
    {x * 1258, y * 273, x * 40, y * 40},

    {x * 1121, y * 326, x * 40, y * 40},
    {x * 1167, y * 326, x * 40, y * 40},
    {x * 1213, y * 326, x * 40, y * 40},
    {x * 1258, y * 326, x * 40, y * 40},

    {x * 1121, y * 379, x * 40, y * 40},
    {x * 1167, y * 379, x * 40, y * 40},
    {x * 1213, y * 379, x * 40, y * 40},
    {x * 1258, y * 379, x * 40, y * 40},

    {x * 1121, y * 432, x * 40, y * 40},
    {x * 1167, y * 432, x * 40, y * 40},
    {x * 1213, y * 432, x * 40, y * 40},
    {x * 1258, y * 432, x * 40, y * 40},

    {x * 1121, y * 485, x * 40, y * 40},
    {x * 1167, y * 485, x * 40, y * 40},
    {x * 1213, y * 485, x * 40, y * 40},
    {x * 1258, y * 485, x * 40, y * 40},

    {x * 1121, y * 538, x * 40, y * 40},
    {x * 1167, y * 538, x * 40, y * 40},
    {x * 1213, y * 538, x * 40, y * 40},
    {x * 1258, y * 538, x * 40, y * 40},

    {x * 1121, y * 591, x * 40, y * 40},
    {x * 1167, y * 591, x * 40, y * 40},
    {x * 1213, y * 591, x * 40, y * 40},
    {x * 1258, y * 591, x * 40, y * 40},

    {x * 1121, y * 677, x * 40, y * 40},
    {x * 1167, y * 677, x * 40, y * 40},
    {x * 1213, y * 677, x * 40, y * 40},
    {x * 1259, y * 677, x * 40, y * 40},
}
setTimer(function()
    windows = {

        ['Configuração'] = {
            --// x, y, x, y, se é texto, imagem, rectangle ou rectangle-border, se for texto coloque o texto imagem, coloque a imagem, e a cor
            {x * 1095.91, y * 236, x * 228.51, y * 495.11, 'imagem', 'Files/Imagens/interface.png', tocolor(41, 41, 41, alpha)},
            {x * 1102, y * 257, x * 1162, y * 281, 'texto', 'Voltar', 1, 'default-bold', 'center', tocolor(255, 255, 255, alpha)},
            {x * 1096, y * 338, x * 228, y * 76, 'rectangle', tocolor(65, 65, 65, alpha)},
            {x * 1103, y * 463, x * 215, y * 2, 'rectangle', tocolor(65, 65, 65, alpha)},
            {x * 1103, y * 510, x * 215, y * 2, 'rectangle', tocolor(65, 65, 65, alpha)},
            {x * 1115, y * 297, x * 1284, y * 331, 'texto', 'Ajustes', 2, 'default-bold', 'left', tocolor(255, 255, 255, alpha)},
            {x * 1165, y * 355, x * 1305, y * 380, 'texto', '${nome}', 1.5, 'default-bold', 'left', tocolor(255, 255, 255, alpha)},
            {x * 1165, y * 380, x * 1305, y * 405, 'texto', 'Global@icloud.com', 1, 'default-bold', 'left', tocolor(255, 255, 255, alpha)},
            {x * 1103, y * 418, x * 43, y * 43, 'imagem', 'Files/Imagens/icons/notificacao.png', tocolor(255, 255, 255, alpha)},
            {x * 1103, y * 466, x * 43, y * 43, 'imagem', 'Files/Imagens/icons/wallpaper.png', tocolor(255, 255, 255, alpha)},
            {x * 1154, y * 421, x * 1315, y * 458, 'texto', 'Notificações', 1.3, 'default-bold', 'left', tocolor(255, 255, 255, 255)},
            {x * 1154, y * 468, x * 1315, y * 505, 'texto', 'Wallpapers', 1.3, 'default-bold', 'left', tocolor(255, 255, 255, 255)},
        },

        ['Informações'] = {
            {x * 1095.91, y * 236, x * 228.51, y * 495.11, 'imagem', 'Files/Imagens/interface.png', tocolor(41, 41, 41, alpha)},
            {x * 1102, y * 257, x * 1162, y * 281, 'texto', 'Voltar', 1, 'default-bold', 'center', tocolor(255, 255, 255, alpha)},
            {x * 1096, y * 335, x * 228, y * 48, 'rectangle', tocolor(65, 65, 65, alpha)},
            {x * 1096, y * 388, x * 228, y * 48, 'rectangle', tocolor(65, 65, 65, alpha)},
            {x * 1096, y * 441, x * 228, y * 48, 'rectangle', tocolor(65, 65, 65, alpha)},
            {x * 1096, y * 494, x * 228, y * 48, 'rectangle', tocolor(65, 65, 65, alpha)},
            {x * 1096, y * 547, x * 228, y * 48, 'rectangle', tocolor(65, 65, 65, alpha)},
            {x * 1095, y * 277, x * 1324, y * 315, 'texto', 'Informações', 2, 'default-bold', 'center', tocolor(255, 255, 255, alpha)},

            {x * 1094, y * 334, x * 1324, y * 384, 'texto', 'Nome: ${nome}', 1, font[1], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1094, y * 384, x * 1324, y * 434, 'texto', 'Emprego: ${emprego}', 1, font[1], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1094, y * 440, x * 1324, y * 490, 'texto', 'Dinheiro: ${dinheiro}', 1, font[1], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1094, y * 494, x * 1324, y * 544, 'texto', 'Banco: ${banco}', 1, font[1], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1094, y * 548, x * 1324, y * 598, 'texto', 'Passaporte: ${passaporte}', 1, font[1], 'center', tocolor(255, 255, 255, alpha)},
        },

        ['GPS'] = { 
            {x * 1095.91, y * 236, x * 228.51, y * 495.11, 'imagem', 'Files/Imagens/interface.png', tocolor(41, 41, 41, alpha)},
            {x * 1102, y * 257, x * 1162, y * 281, 'texto', 'Voltar', 1, 'default-bold', 'center', tocolor(255, 255, 255, alpha)},
            {x * 1132, y * 396, x * 153, y * 26, 'rectangle-border', tocolor(65, 65, 65, alpha)},
            {x * 1161, y * 474, x * 100, y * 30, 'rectangle-border', tocolor(65, 65, 65, alpha)},
            {x * 1138, y * 396, x * 1285, y * 420, 'texto', 'ID', 1, font[1], 'left', tocolor(255, 255, 255, alpha)},
            {x * 1160, y * 473, x * 1262, y * 505, 'texto', 'Enviar', 1, font[1], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1095, y * 295, x * 1324, y * 347, 'texto', 'GPS', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1130, y * 394, x * 1286, y * 423, 'editbox', 1, 1, font[1], 'right', tocolor(255, 255, 255, alpha)},
        }, 

        ['Banco'] = { 
            {x * 1096, y * 236, x * 228.51, y * 495.11, 'imagem', 'Files/Imagens/interface.png', tocolor(41, 41, 41, alpha)},
            {x * 1102, y * 257, x * 1162, y * 281, 'texto', 'Voltar', 1, 'default-bold', 'center', tocolor(255, 255, 255, alpha)},
            {x * 1132, y * 396, x * 153, y * 26, 'rectangle-border', tocolor(65, 65, 65, alpha)},
            {x * 1132, y * 427, x * 153, y * 26, 'rectangle-border', tocolor(65, 65, 65, alpha)},
            {x * 1161, y * 474, x * 100, y * 30, 'rectangle-border', tocolor(65, 65, 65, alpha)},
            {x * 1138, y * 396, x * 1285, y * 420, 'texto', 'ID', 1, font[1], 'left', tocolor(255, 255, 255, alpha)},
            {x * 1138, y * 427, x * 1285, y * 454, 'texto', 'Valor', 1, font[1], 'left', tocolor(255, 255, 255, alpha)},
            {x * 1160, y * 473, x * 1262, y * 505, 'texto', 'Enviar', 1, font[1], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1095, y * 295, x * 1324, y * 347, 'texto', 'Banco', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1130, y * 394, x * 1286, y * 423, 'editbox', 1, 1, font[1], 'right', tocolor(255, 255, 255, alpha)},
            {x * 1130, y * 427, x * 1286, y * 454, 'editbox', 2, 1, font[1], 'right', tocolor(255, 255, 255, alpha)},
        },

        ['Recarga'] = { 
            {x * 1096, y * 236, x * 228.51, y * 495.11, 'imagem', 'Files/Imagens/interface.png', tocolor(41, 41, 41, alpha)},
            {x * 1102, y * 257, x * 1162, y * 281, 'texto', 'Voltar', 1, 'default-bold', 'center', tocolor(255, 255, 255, alpha)},
            {x * 1132, y * 365, x * 153, y * 26, 'rectangle-border', tocolor(65, 65, 65, alpha)},
            {x * 1132, y * 396, x * 153, y * 26, 'rectangle-border', tocolor(65, 65, 65, alpha)},
            {x * 1132, y * 427, x * 153, y * 26, 'rectangle-border', tocolor(65, 65, 65, alpha)},
            {x * 1161, y * 474, x * 100, y * 30, 'rectangle-border', tocolor(65, 65, 65, alpha)},
            {x * 1093, y * 594, x * 1326, y * 622, 'texto', 'Créditos: ${créditos}', 1, font[1], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1131, y * 363, x * 1287, y * 391, 'texto', config.planos[1][1]..' - R$'..config.planos[1][2], 1, font[1], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1138, y * 396, x * 1285, y * 420, 'texto', config.planos[2][1]..' - R$'..config.planos[2][2], 1, font[1], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1138, y * 427, x * 1285, y * 454, 'texto', config.planos[3][1]..' - R$'..config.planos[3][2], 1, font[1], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1160, y * 473, x * 1262, y * 505, 'texto', 'Comprar', 1, font[1], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1095, y * 295, x * 1324, y * 347, 'texto', 'Recarga', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
        },

        ['Telefone'] = {
            {x * 1096, y * 236, x * 228.51, y * 495.11, 'imagem', 'Files/Imagens/interface.png', tocolor(41, 41, 41, alpha)},
            {x * 1102, y * 257, x * 1162, y * 281, 'texto', 'Voltar', 1, 'default-bold', 'center', tocolor(255, 255, 255, alpha)},
            {x * 1107, y * 381, x * 50, y * 50, 'circle', tocolor(65, 65, 65, alpha), 1},
            {x * 1186, y * 381, x * 50, y * 50, 'circle', tocolor(65, 65, 65, alpha), 2},
            {x * 1263, y * 381, x * 50, y * 50, 'circle', tocolor(65, 65, 65, alpha), 3},
            {x * 1107, y * 456, x * 50, y * 50, 'circle', tocolor(65, 65, 65, alpha), 4},
            {x * 1186, y * 456, x * 50, y * 50, 'circle', tocolor(65, 65, 65, alpha), 5},
            {x * 1263, y * 456, x * 50, y * 50, 'circle', tocolor(65, 65, 65, alpha), 6},
            {x * 1107, y * 531, x * 50, y * 50, 'circle', tocolor(65, 65, 65, alpha), 7},
            {x * 1186, y * 531, x * 50, y * 50, 'circle', tocolor(65, 65, 65, alpha), 8},
            {x * 1263, y * 531, x * 50, y * 50, 'circle', tocolor(65, 65, 65, alpha), 9},
            {x * 1107, y * 606, x * 50, y * 50, 'circle', tocolor(65, 65, 65, alpha), '*'},
            {x * 1186, y * 606, x * 50, y * 50, 'circle', tocolor(65, 65, 65, alpha), 0},
            {x * 1263, y * 606, x * 50, y * 50, 'circle', tocolor(65, 65, 65, alpha), '#'},
            {x * 1186, y * 674, x * 50, y * 50, 'circle', tocolor(107, 215, 111, alpha), false},
            {x * 1095, y * 295, x * 1324, y * 347, 'number', 1, 1, font[2], 'center', tocolor(255, 255, 255, alpha)},

            {x * 1108, y * 379, x * 1157, y * 432, 'texto', '1', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1186, y * 379, x * 1235, y * 432, 'texto', '2', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1263, y * 379, x * 1312, y * 432, 'texto', '3', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1108, y * 452, x * 1157, y * 505, 'texto', '4', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1186, y * 452, x * 1235, y * 505, 'texto', '5', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1263, y * 452, x * 1312, y * 505, 'texto', '6', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1108, y * 528, x * 1157, y * 581, 'texto', '7', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1186, y * 531, x * 1235, y * 581, 'texto', '8', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1263, y * 528, x * 1312, y * 581, 'texto', '9', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1108, y * 605, x * 1157, y * 658, 'texto', '*', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1186, y * 605, x * 1235, y * 658, 'texto', '0', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1263, y * 605, x * 1312, y * 658, 'texto', '#', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1198, y * 688, x * 25, y * 25, 'imagem', 'Files/Imagens/Icons/telefone2.png', tocolor(255, 255, 255, alpha)},
        },

        ['Chamando'] = {
            {x * 1096, y * 236, x * 228.51, y * 495.11, 'imagem', 'Files/Imagens/interface.png', tocolor(41, 41, 41, alpha)},
            {x * 1190, y * 638, x * 50, y * 50, 'circle', tocolor(252, 61, 61, alpha), false},
            {x * 1094, y * 476, x * 1326, y * 509, 'texto', 'Chamando...', 1, font[1], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1202, y * 650, x * 25, y * 25, 'imagem', 'Files/Imagens/Icons/telefone2.png', tocolor(255, 255, 255, alpha)},
        }, 

        ['Recebendo'] = {
            {x * 1096, y * 236, x * 228.51, y * 495.11, 'imagem', 'Files/Imagens/interface.png', tocolor(41, 41, 41, alpha)},
            {x * 1131, y * 638, x * 50, y * 50, 'circle', tocolor(107, 215, 111, alpha), false},
            {x * 1245, y * 638, x * 50, y * 50, 'circle', tocolor(252, 61, 61, alpha), false},

            {x * 1094, y * 476, x * 1326, y * 509, 'texto', 'Recebendo...', 1, font[1], 'center', tocolor(255, 255, 255, alpha)},

            {x * 1143, y * 650, x * 25, y * 25, 'imagem', 'Files/Imagens/Icons/telefone2.png', tocolor(255, 255, 255, alpha)},
            {x * 1258, y * 650, x * 25, y * 25, 'imagem', 'Files/Imagens/Icons/telefone2.png', tocolor(255, 255, 255, alpha)},
        },

        ['Ligação'] = {
            {x * 1096, y * 236, x * 228.51, y * 495.11, 'imagem', 'Files/Imagens/interface.png', tocolor(41, 41, 41, alpha)},
            {x * 1190, y * 638, x * 50, y * 50, 'circle', tocolor(252, 61, 61, alpha), false},
            {x * 1091, y * 435, x * 1325, y * 522, 'timer', 'a', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1202, y * 650, x * 25, y * 25, 'imagem', 'Files/Imagens/Icons/telefone2.png', tocolor(255, 255, 255, alpha)},
            {x * 1095, y * 551, x * 1324, y * 593, 'texto', 'Pressione \'Z\' para falar', 1, font[1], 'center', tocolor(255, 255, 255, alpha)},
        },

        ['Whatsapp'] = {
            {x * 1095.91, y * 236, x * 228.51, y * 495.11, 'imagem', 'Files/Imagens/interface.png', tocolor(41, 41, 41, alpha)},
            {x * 1102, y * 257, x * 1162, y * 281, 'texto', 'Voltar', 1, 'default-bold', 'center', tocolor(255, 255, 255, alpha)},
            {x * 1095, y * 295, x * 1324, y * 347, 'texto', 'Whatsapp', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1096, y * 342, x * 230, y * 16, 'rectangle', tocolor(65, 65, 65, alpha)},
            {x * 1103, y * 341, x * 1284, y * 359, 'texto', 'Conversas', 1.00, 'default-bold', 'left', tocolor(130, 130, 130, alpha)},
        },

        ['Adicionar contato'] = {
            {x * 1096, y * 236, x * 228.51, y * 495.11, 'imagem', 'Files/Imagens/interface.png', tocolor(41, 41, 41, alpha)},
            {x * 1102, y * 257, x * 1162, y * 281, 'texto', 'Voltar', 1, 'default-bold', 'center', tocolor(255, 255, 255, alpha)},
            {x * 1132, y * 396, x * 153, y * 26, 'rectangle-border', tocolor(65, 65, 65, alpha)},
            {x * 1132, y * 427, x * 153, y * 26, 'rectangle-border', tocolor(65, 65, 65, alpha)},
            {x * 1161, y * 474, x * 100, y * 30, 'rectangle-border', tocolor(65, 65, 65, alpha)},
            {x * 1138, y * 396, x * 1285, y * 420, 'texto', 'ID', 1, font[1], 'left', tocolor(255, 255, 255, alpha)},
            {x * 1138, y * 427, x * 1285, y * 454, 'texto', 'Contato', 1, font[1], 'left', tocolor(255, 255, 255, alpha)},
            {x * 1160, y * 473, x * 1262, y * 505, 'texto', 'Adicionar', 1, font[1], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1095, y * 295, x * 1324, y * 347, 'texto', 'Contatos', 1, font[2], 'center', tocolor(255, 255, 255, alpha)},
            {x * 1130, y * 394, x * 1286, y * 423, 'editbox', 1, 1, font[1], 'right', tocolor(255, 255, 255, alpha)},
            {x * 1130, y * 427, x * 1286, y * 454, 'editbox', 2, 1, font[1], 'right', tocolor(255, 255, 255, alpha)},
        },

        ['Tinder'] = {
            {x * 1096, y * 236, x * 228.51, y * 495.11, 'imagem', 'Files/Imagens/interface.png', tocolor(255, 255, 255, alpha)},
            {x * 1095, y * 454, x * 231, y * 167, 'imagem', 'Files/Imagens/Tinder/Apresentacao_tinder.png', tocolor(255, 255, 255, alpha)},
            {x * 1125, y * 287, x * 172, y * 97, 'imagem', 'Files/Imagens/Tinder/Logo_tinder.png', tocolor(255, 255, 255, alpha)},
            {x * 1102, y * 257, x * 1162, y * 281, 'texto', 'Voltar', 1, 'default-bold', 'center', tocolor(33, 33, 33, alpha)},
        },
    }
end, 500, 1)

posTextContato = {
    {x * 1102, y * 455, x * 1288, y * 477},
    {x * 1102, y * 477, x * 1288, y * 499},
    {x * 1102, y * 499, x * 1288, y * 521},
    {x * 1102, y * 521, x * 1288, y * 543},
    {x * 1102, y * 543, x * 1288, y * 565},
    {x * 1102, y * 565, x * 1288, y * 587},
    {x * 1102, y * 587, x * 1288, y * 609},
    {x * 1102, y * 609, x * 1288, y * 631},
}

posBarraEmergencia = {
    {x * 1096, y * 359, x * 230, y * 16, 'Staff'},
    {x * 1096, y * 378, x * 230, y * 16, 'Policial'},
    {x * 1096, y * 396, x * 230, y * 16, 'Mec'},
    {x * 1096, y * 414, x * 230, y * 16, 'SAMU'},
}

posBarraContato = {
    {x * 1096, y * 457, x * 230, y * 16, x * 1286, y * 460, x * 11, y * 9, x * 1300, y * 460, x * 9, y * 9, x * 1315, y * 460, x * 8, y * 9},
    {x * 1096, y * 480, x * 230, y * 16, x * 1286, y * 483, x * 11, y * 9, x * 1300, y * 483, x * 9, y * 9, x * 1315, y * 483, x * 8, y * 9},
    {x * 1096, y * 501, x * 230, y * 16, x * 1286, y * 505, x * 11, y * 9, x * 1300, y * 505, x * 9, y * 9, x * 1315, y * 505, x * 8, y * 9},
    {x * 1096, y * 523, x * 230, y * 16, x * 1286, y * 526, x * 11, y * 9, x * 1300, y * 526, x * 9, y * 9, x * 1315, y * 526, x * 8, y * 9},
    {x * 1096, y * 545, x * 230, y * 16, x * 1286, y * 548, x * 11, y * 9, x * 1300, y * 548, x * 9, y * 9, x * 1315, y * 548, x * 8, y * 9},
    {x * 1096, y * 569, x * 230, y * 16, x * 1286, y * 572, x * 11, y * 9, x * 1300, y * 572, x * 9, y * 9, x * 1315, y * 572, x * 8, y * 9},
    {x * 1096, y * 590, x * 230, y * 16, x * 1286, y * 593, x * 11, y * 9, x * 1300, y * 593, x * 9, y * 9, x * 1315, y * 593, x * 8, y * 9},
    {x * 1096, y * 611, x * 230, y * 16, x * 1286, y * 614, x * 11, y * 9, x * 1300, y * 614, x * 9, y * 9, x * 1315, y * 614, x * 8, y * 9},
}

posMsgsEnviadas = {
    {x * 1157, y * 369, x * 163, y * 56, y * 368, x * 1322, y * 427},
    {x * 1157, y * 433, x * 163, y * 56, y * 432, x * 1322, y * 491},
    {x * 1157, y * 497, x * 163, y * 56, y * 496, x * 1322, y * 555},
    {x * 1157, y * 561, x * 163, y * 56, y * 561, x * 1322, y * 620},
    {x * 1157, y * 625, x * 163, y * 56, y * 624, x * 1322, y * 683},
}

posMsgsRecebidas = {
    {x * 1102, y * 369, x * 163, y * 56, y * 368, x * 1266, y * 427},
    {x * 1102, y * 433, x * 163, y * 56, y * 432, x * 1266, y * 491},
    {x * 1102, y * 497, x * 163, y * 56, y * 496, x * 1266, y * 555},
    {x * 1102, y * 561, x * 163, y * 56, y * 561, x * 1266, y * 620},
    {x * 1102, y * 625, x * 163, y * 56, y * 624, x * 1266, y * 683},
}

posBarrasConversas = {
    {x * 1096, y * 358 + 5, x * 229, y * 40},
    {x * 1096, y * 408 + 5, x * 229, y * 40},
    {x * 1096, y * 458 + 5, x * 229, y * 40},
    {x * 1096, y * 508 + 5, x * 229, y * 40},
    {x * 1096, y * 558 + 5, x * 229, y * 40},
    {x * 1096, y * 608 + 5, x * 229, y * 40},
    {x * 1096, y * 658 + 5, x * 229, y * 40},
}

posTextConversas = {
    {x * 1141, y * 358 + 5, x * 1325, y * 398},
    {x * 1141, y * 408 + 5, x * 1325, y * 448},
    {x * 1141, y * 458 + 5, x * 1325, y * 498},
    {x * 1141, y * 508 + 5, x * 1325, y * 548},
    {x * 1141, y * 558 + 5, x * 1325, y * 598},
    {x * 1141, y * 608 + 5, x * 1325, y * 648},
    {x * 1141, y * 658 + 5, x * 1325, y * 698},
}

posAvatarConversas = {
    {y * 365 + 5}, 
    {y * 415 + 5}, 
    {y * 465 + 5},
    {y * 515 + 5},
    {y * 565 + 5}, 
    {y * 615 + 5},
    {y * 665 + 5},
}

proximaPagina = 0
maxLinhas = #posBarraContato

spotifyPosition = {
    {x * 1103, y * 357, x * 213, y * 58, x * 1110, y * 356, x * 1309, y * 416},
    {x * 1103, y * 417, x * 213, y * 58, x * 1110, y * 416, x * 1309, y * 476},
    {x * 1103, y * 477, x * 213, y * 58, x * 1110, y * 476, x * 1309, y * 536},
    {x * 1103, y * 537, x * 213, y * 58, x * 1110, y * 536, x * 1309, y * 596},
    {x * 1103, y * 597, x * 213, y * 58, x * 1110, y * 596, x * 1309, y * 656},
}

baixado = {}
appsdownload = {
    {x * 1099, y * 295, x * 50, y * 50},
    {x * 1099, y * 355, x * 50, y * 50},
    {x * 1099, y * 415, x * 50, y * 50},
    {x * 1099, y * 475, x * 50, y * 50},
    {x * 1099, y * 535, x * 50, y * 50},
    {x * 1099, y * 595, x * 50, y * 50},
} 

posTextDownload = {
    {x * 1154, y * 298, x * 1287, y * 340}, 
    {x * 1154, y * 356, x * 1287, y * 398}, 
    {x * 1154, y * 418, x * 1287, y * 460}, 
    {x * 1154, y * 478, x * 1287, y * 520}, 
    {x * 1154, y * 538, x * 1287, y * 580}, 
    {x * 1154, y * 600, x * 1287, y * 642}, 
}

posIconDownload = {
    {x * 1296, y * 312, x * 27, y * 28}, 
    {x * 1296, y * 370, x * 27, y * 28}, 
    {x * 1296, y * 428, x * 27, y * 28}, 
    {x * 1296, y * 486, x * 27, y * 28}, 
    {x * 1296, y * 544, x * 27, y * 28}, 
    {x * 1296, y * 602, x * 27, y * 28}, 
}   

downloads = {
    {'Whatsapp', 'Files/Imagens/icons/whatsapp.png'}, 
    {'Spotify', 'Files/Imagens/icons/spotify.png'}, 
    {'Banco', 'Files/Imagens/icons/banco.png'},
    {'Recarga', 'Files/Imagens/icons/Recarga.png'},
    {'Tinder', 'Files/Imagens/icons/Tinder.png'},
}

proximaPagina3 = 0
maxLinhas3 = 7

indexPag = 0

-- tinder 
local posBarrasConversasTinder = {
    {y * 378}, 
    {y * 424},
    {y * 470},
    {y * 516},
    {y * 562},
    {y * 608},
    {y * 654},
}

local posTextosConversasTinder = {
    {x * 1095, y * 380, x * 1325, y * 417},
    {x * 1095, y * 427, x * 1325, y * 464},
    {x * 1095, y * 470, x * 1325, y * 507},
    {x * 1095, y * 517, x * 1325, y * 554},
    {x * 1095, y * 564, x * 1325, y * 601},
    {x * 1095, y * 607, x * 1325, y * 644},
    {x * 1095, y * 654, x * 1325, y * 691},
}

local posAvataresConversasTinder = {
    {y * 381}, 
    {y * 427},
    {y * 473},
    {y * 519},
    {y * 562},
    {y * 608},
    {y * 654},
}


posMsgsEnviadasTinder = {
    {x * 1177, y * 452, x * 150, y * 35, y * 453, x * 1329, y * 485},
    {x * 1177, y * 497, x * 150, y * 35, y * 499, x * 1329, y * 531},
    {x * 1177, y * 545, x * 150, y * 35, y * 546, x * 1329, y * 578},
    {x * 1177, y * 593, x * 150, y * 35, y * 595, x * 1329, y * 627},
    {x * 1177, y * 641, x * 150, y * 35, y * 643, x * 1329, y * 675},
}

posMsgsRecebidasTinder = {
    {x * 1094, y * 452, x * 150, y * 35, y * 453, x * 1329, y * 485},
    {x * 1094, y * 497, x * 150, y * 35, y * 499, x * 1329, y * 531},
    {x * 1094, y * 545, x * 150, y * 35, y * 546, x * 1329, y * 578},
    {x * 1094, y * 593, x * 150, y * 35, y * 595, x * 1329, y * 627},
    {x * 1094, y * 641, x * 150, y * 35, y * 643, x * 1329, y * 675},
}

function dxDraw()

    if (painel == true) then 
        alpha = interpolateBetween(0, 0, 0, 255, 0, 0, ((getTickCount() - tick[1]) / 1000), 'Linear')
    else 
        alpha = interpolateBetween(255, 0, 0, 0, 0, 0, ((getTickCount() - tick[1]) / 1000), 'Linear')
    end

    dxDrawImage(x * 1083, y * 226, x * 254.98, y * 518.35, 'Files/Imagens/Base.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
    
    if (window == 'Bloqueio') then 
        dxDrawImage(x * 1094.5, y * 236, x * 230, y * 496, 'Files/Imagens/'..wallpaper..'.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
        dxDrawImage(x * 1194, y * 669, x * 29.22, y * 33.03, 'Files/Imagens/Icons/Digital.png', 0, 0, 0, (isMouseInPosition(x * 1194, y * 669, x * 29.22, y * 33.03) and tocolor(30, 144, 255, alpha) or tocolor(255, 255, 255, alpha)), false)
    elseif (window == 'inicio') then
        dxDrawImage(x * 1094.5, y * 236, x * 230, y * 496, 'Files/Imagens/'..wallpaper..'.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
        dxDrawImage(x * 1110, y * 671, x * 200, y * 53, 'Files/Imagens/rodape.png', 0, 0, 0, tocolor(255, 255, 255, (alpha < 180 and alpha or 180)), false)
        for i, v in ipairs(icons) do
            if selectapp ~= v[1] then 
                if v.download == true then 
                    if baixado[v[1]] == true then
                        if indexapp[v[1]] then 
                            if not isMouseInPosition(slots[indexapp[v[1]]][1], slots[indexapp[v[1]]][2], slots[indexapp[v[1]]][3], slots[indexapp[v[1]]][4]) then
                                dxDrawImage(slots[indexapp[v[1]]][1], slots[indexapp[v[1]]][2], slots[indexapp[v[1]]][3], slots[indexapp[v[1]]][4], v[2], 0, 0, 0, tocolor(255, 255, 255, alpha), false) 
                            else
                                dxDrawImage(slots[indexapp[v[1]]][1] - 1, slots[indexapp[v[1]]][2] - 1, slots[indexapp[v[1]]][3] + 2, slots[indexapp[v[1]]][4] + 2, v[2], 0, 0, 0, tocolor(255, 255, 255, alpha), false)
                                if isCursorShowing() then
                                    local cx, cy = getCursorPosition()
                                    local mx, my = cx * screen[1], cy * screen[2]
                                    dxDrawText(v[1], mx - x*30, my + y*10, x*240, y*30, tocolor(255, 255, 255, 255), 1.00, font[1], 'left', 'top', false, false, false, true, false)
                                end
                            end
                        else 
                            if not isMouseInPosition(slots[i][1], slots[i][2], slots[i][3], slots[i][4]) then
                                dxDrawImage(slots[i][1], slots[i][2], slots[i][3], slots[i][4], v[2], 0, 0, 0, tocolor(255, 255, 255, alpha), false) 
                            else
                                dxDrawImage(slots[i][1] - 1, slots[i][2] - 1, slots[i][3] + 2, slots[i][4] + 2, v[2], 0, 0, 0, tocolor(255, 255, 255, alpha), false)
                                if isCursorShowing() then
                                    local cx, cy = getCursorPosition()
                                    local mx, my = cx * screen[1], cy * screen[2]
                                    dxDrawText(v[1], mx - x*30, my + y*10, x*240, y*30, tocolor(255, 255, 255, 255), 1.00, font[1], 'left', 'top', false, false, false, true, false)
                                end
                            end
                        end 
                    end 
                else 
                    if indexapp[v[1]] then 
                        if not isMouseInPosition(slots[indexapp[v[1]]][1], slots[indexapp[v[1]]][2], slots[indexapp[v[1]]][3], slots[indexapp[v[1]]][4]) then
                            dxDrawImage(slots[indexapp[v[1]]][1], slots[indexapp[v[1]]][2], slots[indexapp[v[1]]][3], slots[indexapp[v[1]]][4], v[2], 0, 0, 0, tocolor(255, 255, 255, alpha), false) 
                        else
                            dxDrawImage(slots[indexapp[v[1]]][1] - 1, slots[indexapp[v[1]]][2] - 1, slots[indexapp[v[1]]][3] + 2, slots[indexapp[v[1]]][4] + 2, v[2], 0, 0, 0, tocolor(255, 255, 255, alpha), false)
                            if isCursorShowing() then
                                local cx, cy = getCursorPosition()
                                local mx, my = cx * screen[1], cy * screen[2]
                                dxDrawText(v[1], mx - x*30, my + y*10, x*240, y*30, tocolor(255, 255, 255, 255), 1.00, font[1], 'left', 'top', false, false, false, true, false)
                            end
                        end
                    else 
                        if not isMouseInPosition(slots[i][1], slots[i][2], slots[i][3], slots[i][4]) then
                            dxDrawImage(slots[i][1], slots[i][2], slots[i][3], slots[i][4], v[2], 0, 0, 0, tocolor(255, 255, 255, alpha), false) 
                        else
                            dxDrawImage(slots[i][1] - 1, slots[i][2] - 1, slots[i][3] + 2, slots[i][4] + 2, v[2], 0, 0, 0, tocolor(255, 255, 255, alpha), false)
                            if isCursorShowing() then
                                local cx, cy = getCursorPosition()
                                local mx, my = cx * screen[1], cy * screen[2]
                                dxDrawText(v[1], mx - x*30, my + y*10, x*240, y*30, tocolor(255, 255, 255, 255), 1.00, font[1], 'left', 'top', false, false, false, true, false)
                            end
                        end
                    end 
                end
            else
                local cx, cy = getCursorPosition()
                local mx, my = cx * screen[1], cy * screen[2]
                dxDrawImage(mx, my, x * 40, y * 40, v[2], 0, 0, 0, tocolor(255, 255, 255, alpha), false) 
            end
        end
    elseif (window == 'Spotify') then
        dxDrawImage(x * 1096, y * 236, x * 228.51, y * 495.11, 'Files/Imagens/interface.png', 0, 0, 0, tocolor(18, 18, 18, alpha))
        dxDrawImage(x * 1096, y * 283, x * 229, y * 447, 'Files/Imagens/icons/spotify_fundo.png', 0, 0, 0, tocolor(255, 255, 255, alpha))
        if editSpotify[1] == false and isElement(editSpotify[2]) and guiGetText(editSpotify[2]) == '' then
            dxDrawImage(x * 1102, y * 315, x * 214, y * 31, 'Files/Imagens/icons/spotify_edit.png', 0, 0, 0, tocolor(255, 255, 255, alpha))
        else
            dxDrawText((isElement(editSpotify[2]) and (editSpotify[1] and guiGetText(editSpotify[2])..'|' or guiGetText(editSpotify[2])) or ''), x * 1109, y * 318, x * 1302, y * 342, tocolor(112, 112, 112, alpha), 1.00, font[4], 'left', 'center', false, false, false, false, false)
            dxDrawImage(x * 1296, y * 324, x * 13, y * 13, 'files/Imagens/icons/search.png', 0, 0, 0, tocolor(255, 255, 255, (isMouseInPosition(x * 1296, y * 324, x * 13, y * 13) and alpha - 80 or alpha)), false)
        end

        dxDrawText('Voltar', x * 1102, y * 257, x * 1162, y * 281, tocolor(255, 255, 255, alpha), 1, 'default-bold', 'center', 'center', false, false, false, false, false) 

        linha = 0
        for i, v in ipairs(musicasSearch) do
            if (i > indexPag and linha < #spotifyPosition) then
                linha = linha + 1
                dxDrawImage(spotifyPosition[linha][1], spotifyPosition[linha][2], spotifyPosition[linha][3], spotifyPosition[linha][4], 'Files/barrac.png', 0, 0, 0, (isMouseInPosition(spotifyPosition[linha][1], spotifyPosition[linha][2], spotifyPosition[linha][3], spotifyPosition[linha][4]) and tocolor(70, 70, 70, alpha) or tocolor(112, 112, 112, alpha)), false)
                dxDrawText(v[1]..'\n'..v[2], spotifyPosition[linha][5], spotifyPosition[linha][6], spotifyPosition[linha][7], spotifyPosition[linha][8], tocolor(255, 255, 255, alpha), 0.80, font[1], 'center', 'center', false, true, false, false, false)
            end
        end

        if #musicasSearch > 0 then
            dxDrawImage(x * 1188, y * 646, x * 43, y * 43, 'files/'..(isElement(soundSpotify) and (isSoundPaused(soundSpotify) and 'play' or 'pause') or 'play')..'.png', 0, 0, 0, (isMouseInPosition(x * 1188, y * 646, x * 43, y * 43) and tocolor(255, 255, 255, alpha) or tocolor(39, 146, 245, alpha)), false)
        end

    elseif (window == 'Conversa Zap') then
        if isElement(conversando) then
            dxDrawImage(x * 1096, y * 236, x * 228.51, y * 495.11, 'Files/Imagens/interface.png', 0, 0, 0, tocolor(41, 41, 41, alpha), false)
            dxDrawText('Voltar', x * 1102, y * 257, x * 1162, y * 281, tocolor(255, 255, 255, alpha), 1, 'default-bold', 'center', 'center', false, false, false, false, false) 
            dxDrawRectangle(x * 1096, y * 342, x * 230, y * 16, tocolor(65, 65, 65, alpha), false)
            dxDrawText('Mensagens', x * 1103, y * 341, x * 1284, y * 359, tocolor(130, 130, 130, alpha), 1.00, 'default-bold', 'left', 'center', false, false, false, false, false)  
            dxDrawText(getPlayerName(conversando), x * 1112, y * 285, x * 1261, y * 310, tocolor(255, 255, 255, alpha), 1.00, font[1], 'right', 'bottom', false, false, true, false, false)
            dxDrawText('Online', x * 1112, y * 310, x * 1261, y * 335, tocolor(255, 255, 255, alpha), 1.00, font[1], 'right', 'top', false, false, true, false, false)
            
            dxDrawRectangle(x * 1122, y * 694, x * 178, y * 26, tocolor(60, 60, 60, alpha), false)
            dxDrawRectangle(x * 1122, y * 720, x * 178, y * 1, (edits[3][2] and tocolor(186, 38, 255, alpha) or tocolor(80, 80, 80, alpha)), false)
            dxDrawText((edits[3][2] and guiGetText(edits[3][1])..'|' or (guiGetText(edits[3][1]) == '' and 'Mensagem' or guiGetText(edits[3][1]))), x * 1126, y * 694, x * 1295, y * 721, (guiGetText(edits[3][1]) == '' and tocolor(180, 180, 180, alpha) or tocolor(255, 255, 255, alpha)), 1.00, font[3], 'left', 'center', false, true, true, false, false)

            linha = 0
            for i, v in ipairs(infoswpp) do
                if v[1] == getPlayerName(conversando)..getPlayerName(localPlayer) then
                    if (i > proximaPagina2 and linha < maxLinhas2) then
                        linha = linha + 1
                        if v[3] == 'enviado' then
                            drawBorde(posMsgsEnviadas[linha][1], posMsgsEnviadas[linha][2], posMsgsEnviadas[linha][3], posMsgsEnviadas[linha][4], tocolor(89, 116, 95, alpha))
                            dxDrawText(' '..v[2], posMsgsEnviadas[linha][1], posMsgsEnviadas[linha][5], posMsgsEnviadas[linha][6], posMsgsEnviadas[linha][7], tocolor(255, 255, 255, alpha), 1.00, font[3], 'left', 'top', false, true, true, false, false)
                        else
                            drawBorde(posMsgsRecebidas[linha][1], posMsgsRecebidas[linha][2], posMsgsRecebidas[linha][3], posMsgsRecebidas[linha][4], tocolor(139, 139, 139, alpha))
                            dxDrawText(' '..v[2], posMsgsRecebidas[linha][1], posMsgsRecebidas[linha][5], posMsgsRecebidas[linha][6], posMsgsRecebidas[linha][7], tocolor(255, 255, 255, alpha), 1.00, font[3], 'left', 'top', false, true, true, false, false)
                        end
                    end
                end
            end

        else
            window = 'Whatsapp'
        end
    elseif (window == 'Appstore') then
        dxDrawImage(x * 1096, y * 236, x * 228.51, y * 495.11, 'Files/Imagens/interface.png', 0, 0, 0, tocolor(41, 41, 41, alpha), false)
        dxDrawText('Voltar', x * 1102, y * 257, x * 1162, y * 281, tocolor(255, 255, 255, alpha), 1, 'default-bold', 'center', 'center', false, false, false, false, false) 
        dxDrawImage(x * 1095, y * 290, x * 229, y * 1, 'Files/Imagens/Linha.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
        dxDrawImage(x * 1095, y * 350, x * 229, y * 1, 'Files/Imagens/Linha.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
        dxDrawImage(x * 1095, y * 410, x * 229, y * 1, 'Files/Imagens/Linha.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
        dxDrawImage(x * 1095, y * 470, x * 229, y * 1, 'Files/Imagens/Linha.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
        dxDrawImage(x * 1095, y * 530, x * 229, y * 1, 'Files/Imagens/Linha.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
        dxDrawImage(x * 1095, y * 590, x * 229, y * 1, 'Files/Imagens/Linha.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
        dxDrawImage(x * 1095, y * 650, x * 229, y * 1, 'Files/Imagens/Linha.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)

        local linha = 0
        for i, v in ipairs(downloads) do 
            if (i > proximaPagina3 and linha < maxLinhas3) then
                linha = linha + 1 
                dxDrawImage(appsdownload[linha][1], appsdownload[linha][2], appsdownload[linha][3], appsdownload[linha][4], v[2], 0, 0, 0, tocolor(255, 255, 255, (baixado[v[1]] == true and alpha - 120 or alpha)), false)
                dxDrawImage(posIconDownload[linha][1], posIconDownload[linha][2], posIconDownload[linha][3], posIconDownload[linha][4], 'Files/Imagens/download.png', 0, 0, 0, isMouseInPosition(posIconDownload[linha][1], posIconDownload[linha][2], posIconDownload[linha][3], posIconDownload[linha][4]) and tocolor(39, 146, 245, (baixado[v[1]] and alpha - 120 or alpha)) or tocolor(255, 255, 255, (baixado[v[1]] and alpha - 120 or alpha)), false)
                dxDrawText(v[1], posTextDownload[linha][1], posTextDownload[linha][2], posTextDownload[linha][3], posTextDownload[linha][4], tocolor(255, 255, 255, alpha), 1, font[4], 'center', 'center', false, false, false, false, false) 
                
            end 
        end
    elseif (window == 'Whatsapp') then
        for i, v in ipairs(windows[window]) do
            if (v[5] == 'imagem') then
                if string.find(v[6], '${avatar}') then
                elseif string.find(v[6], '${avatarfdp}') then
                else
                    dxDrawImage(v[1], v[2], v[3], v[4], v[6], 0, 0, 0, v[7], false)
                end
            elseif (v[5] == 'texto') then
                if string.find(v[6], '${nome}') then
                    dxDrawText(string.gsub(v[6], '${nome}', '')..''..string.gsub(string.gsub(getPlayerName(localPlayer), '#%x%x%x%x%x%x', ''), '_', ' '), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                elseif string.find(v[6], '${emprego}') then
                    dxDrawText(string.gsub(v[6], '${emprego}', '')..''..(getElementData(localPlayer, 'Emprego') or 'Desempregado'), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                elseif string.find(v[6], '${dinheiro}') then
                    dxDrawText(string.gsub(v[6], '${dinheiro}', '')..''..getPlayerMoney(localPlayer), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                elseif string.find(v[6], '${banco}') then
                    dxDrawText(string.gsub(v[6], '${banco}', '')..'R$ '..config.convertNumber((getElementData(localPlayer, 'TS:Bancobb') or 0)), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                elseif string.find(v[6], '${passaporte}') then
                    dxDrawText(string.gsub(v[6], '${passaporte}', '')..''..(getElementData(localPlayer, 'ID') or 'N/A'), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                elseif string.find(v[6], '${créditos}') then 
                    dxDrawText(string.gsub(v[6], '${créditos}', '')..''..(getElementData(localPlayer, 'Mbs') or 0), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                else
                    dxDrawText(v[6], v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                end
            elseif (v[5] == 'rectangle') then
                dxDrawRectangle(v[1], v[2], v[3], v[4], v[6], false)
            elseif (v[5] == 'rectangle-border') then
                drawBorde(v[1], v[2], v[3], v[4], isMouseInPosition(v[1], v[2], v[3], v[4]) and tocolor(39, 146, 245, alpha) or v[6], isMouseInPosition(v[1], v[2], v[3], v[4]) and tocolor(39, 146, 245, alpha) or v[6], true)
            elseif (v[5] == 'editbox') then
                dxDrawText((edits[v[6]][2] and guiGetText(edits[v[6]][1])..'|' or guiGetText(edits[v[6]][1])), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
            elseif (v[5] == 'circle') then
                if (v[7] ~= false) then 
                    dxDrawImage(v[1], v[2], v[3], v[4], 'Files/Imagens/Icons/Bola.png', 0, 0, 0, isMouseInPosition(v[1], v[2], v[3], v[4]) and tocolor(39, 146, 245, alpha) or v[6])
                else 
                    dxDrawImage(v[1], v[2], v[3], v[4], 'Files/Imagens/Icons/Bola.png', 0, 0, 0, v[6]) 
                end
            elseif (v[5] == 'number') then 
                dxDrawText((number or ''), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
            elseif (v[5] == 'timer') then 
                dxDrawText((min or 0)..':'..(sec or 0), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
            end
        end

        linha = 0
        for i, v in ipairs(personswpp) do
            if (i > proximaPagina2 and linha < maxLinhas2) then
                linha = linha + 1
                dxDrawRectangle(posBarrasConversas[linha][1], posBarrasConversas[linha][2], posBarrasConversas[linha][3], posBarrasConversas[linha][4], isMouseInPosition(posBarrasConversas[linha][1], posBarrasConversas[linha][2], posBarrasConversas[linha][3], posBarrasConversas[linha][4]) and tocolor(186, 38, 255, alpha) or tocolor(60, 60, 60, alpha))
                dxDrawImage(x * 1282, y * 373, x * 20, y * 20, 'Files/Imagens/Icons/Bola.png', 0, 0, 0, tocolor(107, 215, 111, alpha))
                dxDrawText(v[2], posTextConversas[linha][1], posTextConversas[linha][2], posTextConversas[linha][3], posTextConversas[linha][4], tocolor(255, 255, 255, alpha), 1.00, font[4], 'left', 'center', false, true, true, false, false)
            end
        end
    elseif (window == 'Tinder Select') then 
        dxDrawImage(x * 1096, y * 236, x * 228.51, y * 495.11, 'Files/Imagens/interface.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
        dxDrawText('Voltar', x * 1102, y * 257, x * 1162, y * 281, tocolor(33, 33, 33, alpha), 1, 'default-bold', 'center', 'center', false, false, false, false, false) 
        dxDrawImage(x * 1096, y * 702, x * 231, y * 27, 'Files/Imagens/Tinder/BarInteraction.png', 0, 0, 0, tocolor(255, 255, 255, alpha)) 
        dxDrawImage(x * 1104, y * 372, x * 222, y * 307, 'Files/Imagens/Tinder/Tinder.png', 0, 0, 0, tocolor(255, 255, 255, alpha)) 
        dxDrawImage(x * 1125, y * 287, x * 172, y * 97, 'Files/Imagens/Tinder/Logo_tinder.png', 0, 0, 0, tocolor(255, 255, 255, alpha)) 

        if #tinder > 0 then 
            dxDrawText('#FF4071'..tinder[1][2], x * 1127, y * 524, x * 1313, y * 544, tocolor(255, 255, 255, alpha), 1.00, font[1], 'left', 'center', false, false, false, true, false)
            dxDrawText(tinder[1][3], x * 1113, y * 554, x * 1313, y * 590, tocolor(0, 0, 0, alpha), 1.00, font[1], "center", "top", false, true, false, false, false)
        else 
            dxDrawText('Nenhuma pessoa disponivel, sentimos muito!!', x * 1133, y * 462, x * 1296, y * 506, tocolor(0, 0, 0, 255), 1.00, font[1], 'center', 'center', false, true, false, false, false)
        end
    elseif (window == 'Tinder Perfil') then 
        dxDrawImage(x * 1096, y * 236, x * 228.51, y * 495.11, 'Files/Imagens/interface.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
        dxDrawText('Voltar', x * 1102, y * 257, x * 1162, y * 281, tocolor(33, 33, 33, alpha), 1, 'default-bold', 'center', 'center', false, false, false, false, false) 
        dxDrawImage(x * 1096, y * 702, x * 231, y * 27, 'Files/Imagens/Tinder/BarInteraction.png', 0, 0, 0, tocolor(255, 255, 255, alpha)) 
        dxDrawImage(x * 1125, y * 287, x * 172, y * 97, 'Files/Imagens/Tinder/Logo_tinder.png', 0, 0, 0, tocolor(255, 255, 255, alpha)) 
        dxDrawImage(x * 1118, y * 396, x * 197, y * 275, 'Files/Imagens/Tinder/Perfil.png', 0, 0, 0, tocolor(255, 255, 255, alpha)) 
        dxDrawText(bio == true and guiGetText(biografia)..'|' or guiGetText(biografia), x * 1137, y * 552, x * 1296, y * 621, tocolor(33, 33, 33, alpha), 1.00, font[1], 'left', 'center', false, true, false, false, false)
    elseif (window == 'Tinder Conversas') then
        dxDrawImage(x * 1096, y * 236, x * 228.51, y * 495.11, 'Files/Imagens/interface.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
        dxDrawText('Voltar', x * 1102, y * 257, x * 1162, y * 281, tocolor(33, 33, 33, alpha), 1, 'default-bold', 'center', 'center', false, false, false, false, false) 
        dxDrawImage(x * 1096, y * 702, x * 231, y * 27, 'Files/Imagens/Tinder/BarInteraction.png', 0, 0, 0, tocolor(255, 255, 255, alpha)) 
        dxDrawImage(x * 1125, y * 287, x * 172, y * 97, 'Files/Imagens/Tinder/Logo_tinder.png', 0, 0, 0, tocolor(255, 255, 255, alpha)) 
        linha = 0
        for i, v in ipairs(personstinder) do
            if (i > proximaPagina2 and linha < maxLinhas3) then
                linha = linha + 1
                dxDrawRectangle(x * 1094 + 2, posBarrasConversasTinder[linha][1], x * 230, y * 40, isMouseInPosition(x * 1094 + 2, posBarrasConversasTinder[linha][1], x * 230, y * 40) and tocolor(212, 212, 212, alpha) or tocolor(212, 212, 212, alpha - 80))
                dxDrawText('                  '..v[2], posTextosConversasTinder[linha][1], posTextosConversasTinder[linha][2], posTextosConversasTinder[linha][3], posTextosConversasTinder[linha][4], tocolor(33, 33, 33, alpha), 1.00, font[4], 'left', 'center', false, true, true, false, false)
            end
        end
    elseif (window == 'Conversa Tinder') then 
        if isElement(conversando) then
            dxDrawImage(x * 1096, y * 236, x * 228.51, y * 495.11, 'Files/Imagens/interface.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
            dxDrawText('Voltar', x * 1102, y * 257, x * 1162, y * 281, tocolor(33, 33, 33, alpha), 1, 'default-bold', 'center', 'center', false, false, false, false, false) 
            dxDrawImage(x * 1096, y * 702, x * 231, y * 27, 'Files/Imagens/Tinder/BarInteraction.png', 0, 0, 0, tocolor(255, 255, 255, alpha)) 
            dxDrawImage(x * 1125, y * 287, x * 172, y * 97, 'Files/Imagens/Tinder/Logo_tinder.png', 0, 0, 0, tocolor(255, 255, 255, alpha)) 
            dxDrawRectangle(x * 1094 + 2, y * 678, x * 228, y * 25, tocolor(212, 212, 212, alpha))
            dxDrawText('#FF4071'..getPlayerName(conversando), x * 1094, y * 367, x * 1324, y * 415, tocolor(255, 255, 255, 255), 1.00, font[1], "center", "center", false, false, false, true, false)
            dxDrawText((edits[3][2] and guiGetText(edits[3][1])..'|' or (guiGetText(edits[3][1]) == '' and 'Digite Aqui' or guiGetText(edits[3][1]))), x * 1099, y * 677, x * 1325, y * 701, (guiGetText(edits[3][1]) == '' and tocolor(33, 33, 33, 255) or tocolor(33, 33, 33, 255)), 1.00, font[3], 'left', 'center', false, true, true, false, false)

            linha = 0
            for i, v in ipairs(infostinder) do
                if v[1] == getPlayerName(conversando)..getPlayerName(localPlayer) then
                    if (i > proximaPagina2 and linha < maxLinhas3) then
                        linha = linha + 1
                        if v[3] == 'enviado' then
                            dxDrawImage(posMsgsEnviadasTinder[linha][1] - 2, posMsgsEnviadasTinder[linha][2], posMsgsEnviadasTinder[linha][3], posMsgsEnviadasTinder[linha][4], 'Files/Imagens/Tinder/Mensagem.png', 0, 0, 0, tocolor(255, 255, 255, alpha))
                            dxDrawText(' '..v[2], posMsgsEnviadasTinder[linha][1], posMsgsEnviadasTinder[linha][5], posMsgsEnviadasTinder[linha][6], posMsgsEnviadasTinder[linha][7], tocolor(255, 255, 255, alpha), 1.00, font[3], 'left', 'top', false, true, true, false, false)
                        else
                            dxDrawImage(posMsgsRecebidasTinder[linha][1] + 2, posMsgsRecebidasTinder[linha][2], posMsgsRecebidasTinder[linha][3], posMsgsRecebidasTinder[linha][4], 'Files/Imagens/Tinder/Mensagem.png', 0, 0, 0, tocolor(255, 255, 255, alpha))
                            dxDrawText(' '..v[2], posMsgsRecebidasTinder[linha][1], posMsgsRecebidasTinder[linha][5], posMsgsRecebidasTinder[linha][6], posMsgsRecebidasTinder[linha][7], tocolor(255, 255, 255, alpha), 1.00, font[3], 'left', 'top', false, true, true, false, false)
                        end
                    end
                end
            end

        else
            window = 'Tinder Conversas'
        end
    else
        if window ~= 'Contatos' then
            if windowConfig == nil then 
                if windows[window] then
                    for i, v in ipairs(windows[window]) do
                        if (v[5] == 'imagem') then
                            if string.find(v[6], '${avatar}') then
                            elseif string.find(v[6], '${avatarfdp}') then
                            else
                                dxDrawImage(v[1], v[2], v[3], v[4], v[6], 0, 0, 0, v[7], false)
                            end
                        elseif (v[5] == 'texto') then
                            if string.find(v[6], '${nome}') then
                                dxDrawText(string.gsub(v[6], '${nome}', '')..''..string.gsub(string.gsub(getPlayerName(localPlayer), '#%x%x%x%x%x%x', ''), '_', ' '), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                            elseif string.find(v[6], '${emprego}') then
                                dxDrawText(string.gsub(v[6], '${emprego}', '')..''..(getElementData(localPlayer, 'Emprego') or 'Desempregado'), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                            elseif string.find(v[6], '${dinheiro}') then
                                dxDrawText(string.gsub(v[6], '${dinheiro}', '')..''..getPlayerMoney(localPlayer), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                            elseif string.find(v[6], '${banco}') then
                                dxDrawText(string.gsub(v[6], '${banco}', '')..'R$ '..config.convertNumber((getElementData(localPlayer, 'TS:Bancobb') or 0)), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                            elseif string.find(v[6], '${passaporte}') then
                                dxDrawText(string.gsub(v[6], '${passaporte}', '')..''..(getElementData(localPlayer, 'ID') or 'N/A'), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                            elseif string.find(v[6], '${créditos}') then 
                                dxDrawText(string.gsub(v[6], '${créditos}', '')..''..(getElementData(localPlayer, 'Mbs') or 0), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                            else
                                dxDrawText(v[6], v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                            end
                        elseif (v[5] == 'rectangle') then
                            dxDrawRectangle(v[1], v[2], v[3], v[4], v[6], false)
                        elseif (v[5] == 'rectangle-border') then
                            drawBorde(v[1], v[2], v[3], v[4], isMouseInPosition(v[1], v[2], v[3], v[4]) and tocolor(39, 146, 245, alpha) or v[6], isMouseInPosition(v[1], v[2], v[3], v[4]) and tocolor(39, 146, 245, alpha) or v[6], true)
                        elseif (v[5] == 'editbox') then
                            dxDrawText((edits[v[6]][2] and guiGetText(edits[v[6]][1])..'|' or guiGetText(edits[v[6]][1])), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                        elseif (v[5] == 'circle') then
                            if (v[7] ~= false) then 
                                dxDrawImage(v[1], v[2], v[3], v[4], 'Files/Imagens/Icons/Bola.png', 0, 0, 0, isMouseInPosition(v[1], v[2], v[3], v[4]) and tocolor(39, 146, 245, alpha) or v[6])
                            else 
                                dxDrawImage(v[1], v[2], v[3], v[4], 'Files/Imagens/Icons/Bola.png', 0, 0, 0, v[6]) 
                            end
                        elseif (v[5] == 'number') then 
                            dxDrawText((number or ''), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                        elseif (v[5] == 'timer') then 
                            dxDrawText((min or 0)..':'..(sec or 0), v[1], v[2], v[3], v[4], v[10], v[7], v[8], v[9], 'center', false, false, false, false, false)
                        end
                    end
                end
            else
                dxDrawImage(x * 1095.91, y * 236, x * 228.51, y * 495.11, 'Files/Imagens/interface.png', 0, 0, 0, tocolor(41, 41, 41, alpha), false)
                if windowConfig == 'Wallpapers' then
                    dxDrawText('Wallpapers', x * 1095, y * 277, x * 1324, y * 315, tocolor(255, 255, 255, 255), 2.00, 'default-bold', 'center', 'center', false, false, false, false, false)
                    for i, v in ipairs(wallpapers) do
                        if isMouseInPosition(v[1], v[2], v[3], v[4]) then
                            dxDrawImage(v[1] - 1, v[2] - 1, v[3] + 2, v[4] + 2, 'Files/Imagens/'..v[5]..'.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
                        else
                            dxDrawImage(v[1], v[2], v[3], v[4], 'Files/Imagens/'..v[5]..'.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
                        end
                    end
                elseif windowConfig == 'Notificações' then
                    dxDrawText('Notificações', x * 1095, y * 277, x * 1324, y * 315, tocolor(255, 255, 255, 255), 2.00, 'default-bold', 'center', 'center', false, false, false, false, false)
                    for i, v in ipairs(ative) do
                        dxDrawImage(v[1], v[2], v[3], v[4], 'Files/Imagens/icons/'..((getElementData(localPlayer, v[5]) or 'sim') == 'sim' and 'on' or 'off')..'.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
                        dxDrawText(v[5], v[6], v[7], v[8], v[9], tocolor(255, 255, 255, alpha), 1, font[1], 'left', 'center', false, false, false, false, false)
                    end
                end
                dxDrawText('Voltar', x * 1102, y * 257, x * 1162, y * 281, tocolor(255, 255, 255, alpha), 1, 'default-bold', 'center', 'center', false, false, false, false, false)
            end
        else
            dxDrawImage(x * 1095.91, y * 236, x * 228.51, y * 495.11, 'Files/Imagens/interface.png', 0, 0, 0, tocolor(41, 41, 41, alpha), false)
            dxDrawRectangle(x * 1096, y * 342, x * 230, y * 16, tocolor(65, 65, 65, alpha))
            dxDrawRectangle(x * 1096, y * 437, x * 230, y * 16, tocolor(65, 65, 65, alpha))
            dxDrawText('Voltar', x * 1102, y * 257, x * 1162, y * 281, tocolor(255, 255, 255, alpha), 1, 'default-bold', 'center', 'center', false, false, false, false)
            dxDrawText('Contatos', x * 1095, y * 295, x * 1324, y * 347, tocolor(255, 255, 255, alpha), 1, font[2], 'center', 'center', false, false, false, false)
            dxDrawText('Emergência', x * 1103, y * 341, x * 1284, y * 359, tocolor(130, 130, 130, alpha), 1, 'default-bold', 'left', 'center', false, false, false, false)
            dxDrawText('Contatos', x * 1103, y * 437, x * 1284, y * 453, tocolor(130, 130, 130, alpha), 1.00, 'default-bold', 'left', 'center', false, false, false, false, false)
            dxDrawText('+', x * 1302, y * 434, x * 1329, y * 455, tocolor(255, 255, 255, alpha), 1.00, 'default-bold', 'center', 'center', false, false, true, false, false)

            for i, v in ipairs(posBarraEmergencia) do
                if isMouseInPosition(v[1], v[2], v[3], v[4]) then
                    dxDrawRectangle(v[1], v[2], v[3], v[4], tocolor(70, 70, 70, alpha), false)
                end
            end 

            dxDrawText('Suporte', x * 1102, y * 360, x * 1288, y * 378, tocolor(200, 200, 200, alpha), 1.00, 'default', 'left', 'top', false, false, false, false, false)
            dxDrawText('Policia', x * 1102, y * 378, x * 1288, y * 396, tocolor(200, 200, 200, alpha), 1.00, 'default', 'left', 'top', false, false, false, false, false)
            dxDrawText('Mecânico', x * 1102, y * 396, x * 1288, y * 414, tocolor(200, 200, 200, alpha), 1.00, 'default', 'left', 'top', false, false, false, false, false)
            dxDrawText('Samu', x * 1102, y * 414, x * 1288, y * 432, tocolor(200, 200, 200, alpha), 1.00, 'default', 'left', 'top', false, false, false, false, false)

            linha = 0
            for i, v in ipairs(contatos) do
                if (i > proximaPagina and linha < maxLinhas) then
                    linha = linha + 1

                    if isMouseInPosition(posBarraContato[linha][1], posBarraContato[linha][2], posBarraContato[linha][3], posBarraContato[linha][4]) then
                        dxDrawRectangle(posBarraContato[linha][1], posBarraContato[linha][2], posBarraContato[linha][3], posBarraContato[linha][4], tocolor(70, 70, 70, 100), false)
                    end

                    dxDrawImage(posBarraContato[linha][5], posBarraContato[linha][6], posBarraContato[linha][7], posBarraContato[linha][8], 'Files/Imagens/Icons/enviarmensagem.png', 0, 0, 0, (isMouseInPosition(posBarraContato[linha][5], posBarraContato[linha][6], posBarraContato[linha][7], posBarraContato[linha][8]) and tocolor(39, 146, 245, alpha) or tocolor(255, 255, 255, alpha)), false)
                    dxDrawImage(posBarraContato[linha][9], posBarraContato[linha][10], posBarraContato[linha][11], posBarraContato[linha][12], 'Files/Imagens/Icons/telefone.png', 0, 0, 0, (isMouseInPosition(posBarraContato[linha][9], posBarraContato[linha][10], posBarraContato[linha][11], posBarraContato[linha][12]) and tocolor(39, 146, 245, alpha) or tocolor(255, 255, 255, alpha)), false)
                    dxDrawImage(posBarraContato[linha][13], posBarraContato[linha][14], posBarraContato[linha][15], posBarraContato[linha][16], 'Files/Imagens/Icons/lixo.png', 0, 0, 0, (isMouseInPosition(posBarraContato[linha][13], posBarraContato[linha][14], posBarraContato[linha][15], posBarraContato[linha][16]) and tocolor(39, 146, 245, alpha) or tocolor(255, 255, 255, alpha)), false)

                    dxDrawText(v[1]..' ['..v[2]..']', posTextContato[linha][1], posTextContato[linha][2], posTextContato[linha][3], posTextContato[linha][4], tocolor(200, 200, 200, alpha), 1.00, 'default', 'left', 'center', false, false, true, false, false)
                    
                end
            end
        end
    end

    dxDrawImage(x * 1267, y * 241, x * 47, y * 10, 'Files/Imagens/status_bar.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
    if window == 'Bloqueio' then 
        dxDrawText(getTimer(),  x * 1093, y * 310, x * 1319, y * 374, tocolor(255, 255, 255, alpha), 1.00, font[5], 'center', 'center', false, false, false, false, false) 
    else 
        dxDrawText(getTimer(), x * 1108, y * 236, x * 1155, y * 252, tocolor(255, 255, 255, alpha), 1.00, font[1], 'center', 'center', false, false, false, false, false)  
    end 

end

addEventHandler('onClientClick', root, 
    function(b, s)
        if (b == 'right') then 
            if isEventHandlerAdded('onClientRender', root, dxDraw) then 
                if window == 'inicio' then 
                    if (s == 'down') then 
                        for i, v in ipairs(icons) do
                            if v.download == true then 
                                if baixado[v[1]] == true then
                                    if isMouseInPosition(slots[indexapp[v[1]]][1], slots[indexapp[v[1]]][2], slots[indexapp[v[1]]][3], slots[indexapp[v[1]]][4]) then 
                                        selectapp = v[1]
                                    end
                                end
                            else 
                                if isMouseInPosition(slots[indexapp[v[1]]][1], slots[indexapp[v[1]]][2], slots[indexapp[v[1]]][3], slots[indexapp[v[1]]][4]) then 
                                    selectapp = v[1]
                                end
                            end
                        end
                    elseif (s == 'up') then 
                        for i, v in ipairs(slots) do
                            if isMouseInPosition(v[1], v[2], v[3], v[4]) then
                                for ii, vv in ipairs(icons) do 
                                    if indexapp[vv[1]] == i then 
                                        selectapp = ''
                                        return 
                                    end
                                end

                                indexapp[selectapp] = i
                                break
                            end
                        end

                        selectapp = ''
                    end
                end
            end
        end
    end
)

addEventHandler('onClientDoubleClick', root, function (button)
    if button == 'left' and isEventHandlerAdded('onClientRender', root, dxDraw) then
        if window == 'Spotify' then 
            linha = 0
            for i, v in ipairs(musicasSearch) do
                if (i > indexPag and linha < #spotifyPosition) then
                    linha = linha + 1
                    if isMouseInPosition(spotifyPosition[linha][1], spotifyPosition[linha][2], spotifyPosition[linha][3], spotifyPosition[linha][4]) then
                        if isElement(soundSpotify) then
                            stopSound(soundSpotify)
                        end
                        soundSpotify = playSound("https://api.soundcloud.com/tracks/"..tostring(v[3]).."/stream?client_id=N2eHz8D7GtXSl6fTtcGHdSJiS74xqOUI&q")
                    end
                end
            end
        end
    end
end)

bindKey('enter', 'down',
    function ()
        if isEventHandlerAdded('onClientRender', root, dxDraw) then
            if window == 'Conversa Zap' then
                if isElement(conversando) then
                    if guiGetText(edits[3][1]) ~= '' then
                        triggerServerEvent('Goiaba.onSendMessage', localPlayer, localPlayer, getElementData(conversando, 'ID'), guiGetText(edits[3][1]))
                        guiSetText(edits[3][1], '')
                    end
                end
            elseif window == 'Conversa Tinder' then
                if isElement(conversando) then 
                    if guiGetText(edits[3][1]) ~= '' then
                        triggerServerEvent('Goiaba.onSendMessageTinder', localPlayer, localPlayer, getElementData(conversando, 'ID'), guiGetText(edits[3][1]))
                        guiSetText(edits[3][1], '')
                    end
                end
            end
        end
    end
)

function UpDown (b)
    if isEventHandlerAdded('onClientRender', root, dxDraw) then
        if window == 'Spotify' then 
            if isMouseInPosition(x * 1103, y * 357, x * 213, y * 298) then
                if b == 'mouse_wheel_down' then
                    indexPag = indexPag + 1
                    if (indexPag > #musicasSearch - #spotifyPosition) then
                        indexPag = #musicasSearch - #spotifyPosition
                    end
                elseif b == 'mouse_wheel_up'  then
                    if (indexPag > 0) then
                        indexPag = indexPag - 1
                    end
                end
            end
        elseif window ~= 'Whatsapp' then 
            if isMouseInPosition(x * 1095.91, y * 236, x * 228.51, y * 495.11) then
                if b == 'mouse_wheel_down' then
                    proximaPagina = proximaPagina + 1
                    if (proximaPagina > #contatos - maxLinhas) then
                        proximaPagina = #contatos - maxLinhas
                    end
                elseif b == 'mouse_wheel_up'  then
                    if (proximaPagina > 0) then
                        proximaPagina = proximaPagina - 1
                    end
                end
            end
        elseif window == 'Appstore' then 
            if b == 'mouse_wheel_down' then
                proximaPagina3 = proximaPagina3 + 1
                if (proximaPagina3 > #appsdownload - maxLinhas3) then
                    proximaPagina3 = #appsdownload - maxLinhas3
                end
            elseif b == 'mouse_wheel_up'  then
                if (proximaPagina3 > 0) then
                    proximaPagina3 = proximaPagina3 - 1
                end
            end
        else 
            if b == 'mouse_wheel_down' then
                proximaPagina = proximaPagina2 + 1
                if (proximaPagina > #personswpp - maxLinhas2) then
                    proximaPagina = #personswpp - maxLinhas2
                end
            elseif b == 'mouse_wheel_up'  then
                if (proximaPagina > 0) then
                    proximaPagina = proximaPagina2 - 1
                end
            end
        end
    end
end
bindKey('mouse_wheel_up', 'down', UpDown)
bindKey('mouse_wheel_down', 'down', UpDown)


TimerDownload = false
function onClientClick (b, s)
    if (b == 'left') and (s == 'down') then 
        if isEventHandlerAdded('onClientRender', root, dxDraw) then
            edits[1][2] = false
            edits[2][2] = false
            edits[3][2] = false
            if (window == 'Bloqueio') then 
                if isMouseInPosition(x * 1194, y * 669, x * 29.22, y * 33.03) then 
                    window = 'inicio'
                    playSoundFrontEnd(32)
                end
            elseif (window == 'inicio') then
                for i, v in ipairs(icons) do
                    if isMouseInPosition(slots[indexapp[v[1]]][1], slots[indexapp[v[1]]][2], slots[indexapp[v[1]]][3], slots[indexapp[v[1]]][4]) then
                        if v.download == true then 
                            if baixado[v[1]] ~= true then
                                return 
                            end
                        end
                        if (v[3]) then
                            if (v[3] == 'trigger') then
                                if (v[4] == 'client') then
                                    triggerEvent(v[5], localPlayer)
                                end
                            elseif (v[3] == 'window') then
                                window = v[1]
                                if window == 'Telefone' then
                                    number = ''
                                end
                                if editSpotify and editSpotify[2] then
                                    guiSetText(editSpotify[2], '')
                                end
                            end
                        end
                    end
                end
            elseif (window == 'Spotify') then
                editSpotify[1] = false
                if isMouseInPosition(x * 1102, y * 315, x * 188, y * 31) then
                    if guiEditSetCaretIndex(editSpotify[2], string.len(guiGetText(editSpotify[2]))) then
                        guiBringToFront(editSpotify[2])
                        editSpotify[1] = true
                        guiSetInputMode('no_binds_when_editing')
                    end
                elseif isMouseInPosition(x * 1296, y * 324, x * 13, y * 13) then
                    indexPag = 0
                    triggerServerEvent('Caio.searchMusics', localPlayer, guiGetText(editSpotify[2]))
                elseif isMouseInPosition(x * 1188, y * 636, x * 43, y * 43) then
                    if isElement(soundSpotify) then
                        setSoundPaused(soundSpotify, not isSoundPaused(soundSpotify))
                    end
                elseif isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'inicio'
                end
            elseif (window == 'Configuração') then
                if windowConfig ~= nil then
                    if windowConfig == 'Notificações' then
                        if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                            windowConfig = nil
                        else
                            for i, v in ipairs(ative) do
                                if isMouseInPosition(v[1], v[2], v[3], v[4]) then
                                    if getElementData(localPlayer, v[5]) == 'sim' then
                                        setElementData(localPlayer, v[5], 'não')
                                    else
                                        setElementData(localPlayer, v[5], 'sim')
                                    end
                                end
                            end
                        end
                    elseif windowConfig == 'Wallpapers' then
                        if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                            windowConfig = nil
                        else
                            for i, v in ipairs(wallpapers) do
                                if isMouseInPosition(v[1], v[2], v[3], v[4]) then
                                    wallpaper = v[5]
                                    triggerServerEvent('Caio.onSetNewWallpaper', localPlayer, localPlayer, wallpaper)
                                end
                            end
                        end
                    end
                else
                    if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                        window = 'inicio'
                    elseif isMouseInPosition(x * 1103, y * 418, x * 43, y * 43) then
                        windowConfig = 'Notificações'
                    elseif isMouseInPosition(x * 1103, y * 466, x * 43, y * 43) then
                        windowConfig = 'Wallpapers'
                    end
                end
            elseif window == 'Informações' then
                if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'inicio'
                end
            elseif window == 'GPS' then 
                if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'inicio'
                elseif isMouseInPosition(x * 1132, y * 396, x * 153, y * 26) then 
                    if guiEditSetCaretIndex(edits[1][1], string.len(guiGetText(edits[1][1]))) then
                        guiBringToFront(edits[1][1])
                        edits[1][2] = true
                        guiSetInputMode('no_binds_when_editing')
                    end
                elseif isMouseInPosition(x * 1161, y * 474, x * 100, y * 30) then 
                    triggerServerEvent('Pedro.enviarLocalização', localPlayer, localPlayer, guiGetText(edits[1][1]))
                end
            elseif window == 'Banco' then
                if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'inicio'
                elseif isMouseInPosition(x * 1132, y * 396, x * 153, y * 26) then 
                    if guiEditSetCaretIndex(edits[1][1], string.len(guiGetText(edits[1][1]))) then
                        guiBringToFront(edits[1][1])
                        edits[1][2] = true
                        guiSetInputMode('no_binds_when_editing')
                    end
                elseif isMouseInPosition(x * 1132, y * 427, x * 153, y * 26) then
                    if guiEditSetCaretIndex(edits[2][1], string.len(guiGetText(edits[2][1]))) then
                        guiBringToFront(edits[2][1])
                        edits[2][2] = true
                        guiSetInputMode('no_binds_when_editing')
                    end
                elseif isMouseInPosition(x * 1161, y * 474, x * 100, y * 30) then 
                    if string.find(guiGetText(edits[2][1]), '+') or string.find(guiGetText(edits[2][1]), '-') then return end
                    triggerServerEvent('Caio.onEnviar', localPlayer, localPlayer, guiGetText(edits[1][1]), guiGetText(edits[2][1]))
                end
            elseif window == 'Telefone' then 
                if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'inicio'
                else 
                    for i, v in ipairs(windows['Telefone']) do 
                        if (v[5] == 'circle') then 
                            if isMouseInPosition(v[1], v[2], v[3], v[4]) then
                                if (v[7] ~= false) then 
                                    if not tonumber(number) then 
                                        number = v[7]
                                    else 
                                        number = (number)..v[7]
                                    end
                                else 
                                    triggerServerEvent('Pedro.ligar', localPlayer, localPlayer, tonumber(number))
                                end
                            end
                        end
                    end
                end
            elseif window == 'Recebendo' then 
                if isMouseInPosition(x * 1131, y * 638, x * 50, y * 50) then 
                    triggerServerEvent('Pedro.atender', localPlayer, localPlayer)
                elseif isMouseInPosition(x * 1245, y * 638, x * 50, y * 50) then 
                    triggerServerEvent('Pedro.recusar', localPlayer, localPlayer)
                end
            elseif window == 'Chamando' then 
                if isMouseInPosition(x * 1190, y * 638, x * 50, y * 50) then  
                    triggerServerEvent('Pedro.encerrar', localPlayer, localPlayer)
                end
            elseif window == 'Ligação' then 
                if isMouseInPosition(x * 1190, y * 638, x * 50, y * 50) then 
                    triggerServerEvent('Pedro.encerrar', localPlayer, localPlayer)
                end
            elseif window == 'Whatsapp' then
                if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'inicio'
                else 
                    linha = 0
                    for i, v in ipairs(personswpp) do
                        if (i > proximaPagina2 and linha < maxLinhas2) then
                            linha = linha + 1
                            if isMouseInPosition(posBarrasConversas[linha][1], posBarrasConversas[linha][2], posBarrasConversas[linha][3], posBarrasConversas[linha][4]) then 
                                local receiver = getPlayerFromID(tonumber(v[3]))
                                if isElement(receiver) then
                                    window = 'Conversa Zap'
                                    conversando = receiver
                                else
                                    config.notify_client('Este jogador está ausente da cidade.', 'info')
                                end
                                triggerEvent('Pedro.deleteMessage', localPlayer, v[2])
                            end
                        end
                    end
                end
            elseif window == 'Contatos' then
                if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'inicio'
                elseif isMouseInPosition(x * 1304, y * 437, x * 22, y * 16) then
                    window = 'Adicionar contato'
                else
                    for i, v in ipairs(posBarraEmergencia) do
                        if isMouseInPosition(v[1], v[2], v[3], v[4]) then
                            triggerServerEvent('Caio.onChamarOcorrencia', localPlayer, localPlayer, v[5])
                        end
                    end
                    linha = 0
                    for i, v in ipairs(contatos) do
                        if (i > proximaPagina and linha < maxLinhas) then
                            linha = linha + 1
                            if isMouseInPosition(posBarraContato[linha][5], posBarraContato[linha][6], posBarraContato[linha][7], posBarraContato[linha][8]) then
                                local receiver = getPlayerFromID(tonumber(v[2]))
                                if isElement(receiver) then
                                    window = 'Conversa Zap'
                                    conversando = receiver
                                else
                                    config.notify_client('Este jogador está ausente da cidade.', 'info')
                                end
                            elseif isMouseInPosition(posBarraContato[linha][9], posBarraContato[linha][10], posBarraContato[linha][11], posBarraContato[linha][12]) then
                                triggerServerEvent('Pedro.ligar', localPlayer, localPlayer, v[2])
                            elseif isMouseInPosition(posBarraContato[linha][13], posBarraContato[linha][14], posBarraContato[linha][15], posBarraContato[linha][16]) then
                                triggerServerEvent('Caio.onDeleteContato', localPlayer, localPlayer, v[2])
                                table.remove(contatos, i)
                            end
                        end
                    end            
                end
            elseif window == 'Conversa Zap' then
                if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'inicio'
                elseif isMouseInPosition(x * 1122, y * 694, x * 178, y * 26) then
                    if guiEditSetCaretIndex(edits[3][1], string.len(guiGetText(edits[3][1]))) then
                        guiBringToFront(edits[3][1])
                        edits[3][2] = true
                        guiSetInputMode('no_binds_when_editing')
                    end
                end
            elseif window == 'Adicionar contato' then
                if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'Contatos'
                elseif isMouseInPosition(x * 1132, y * 396, x * 153, y * 26) then 
                    if guiEditSetCaretIndex(edits[1][1], string.len(guiGetText(edits[1][1]))) then
                        guiBringToFront(edits[1][1])
                        edits[1][2] = true
                        guiSetInputMode('no_binds_when_editing')
                    end
                elseif isMouseInPosition(x * 1132, y * 427, x * 153, y * 26) then
                    if guiEditSetCaretIndex(edits[2][1], string.len(guiGetText(edits[2][1]))) then
                        guiBringToFront(edits[2][1])
                        edits[2][2] = true
                        guiSetInputMode('no_binds_when_editing')
                    end
                elseif isMouseInPosition(x * 1161, y * 474, x * 100, y * 30) then 
                    triggerServerEvent('Caio.onAdicionarContato', localPlayer, localPlayer, guiGetText(edits[1][1]), guiGetText(edits[2][1]))
                end
            elseif window == 'Recarga' then 
                if isMouseInPosition(x * 1132, y * 365, x * 153, y * 26) then 
                    plano = 1 
                    config.notify_client('Plano 1 selecionado', 'info')
                elseif isMouseInPosition(x * 1132, y * 396, x * 153, y * 26) then 
                    plano = 2
                    config.notify_client('Plano 2 selecionado', 'info')
                elseif isMouseInPosition(x * 1132, y * 427, x * 153, y * 26) then 
                    plano = 3
                    config.notify_client('Plano 3 selecionado', 'info')
                elseif isMouseInPosition(x * 1161, y * 474, x * 100, y * 30) then
                    if plano ~= 0 then 
                        triggerServerEvent('Pedro.compraPlano', localPlayer, localPlayer, config.planos[plano][1], config.planos[plano][2])
                    end
                elseif isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'inicio'
                end
            elseif window == 'Appstore' then
                if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'inicio' 
                else
                    local linha = 0
                    for i, v in ipairs(downloads) do 
                        if (i > proximaPagina3 and linha < maxLinhas3) then
                            linha = linha + 1
                            if  isMouseInPosition(posIconDownload[linha][1], posIconDownload[linha][2], posIconDownload[linha][3], posIconDownload[linha][4]) then 
                                if baixado[v[1]] ~= true then
                                    if not isTimer(TimerDownload) then
                                        addBarra(v[1])  
                                        TimerDownload = setTimer(function()
                                            triggerServerEvent('Pedro.addApp', localPlayer, localPlayer, v[1])
                                            baixado[v[1]] = true
                                        end, 8000, 1)
                                    end
                                end
                            end
                        end
                    end
                end
            elseif window == 'Tinder' then 
                if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'inicio' 
                elseif isMouseInPosition(x * 1136, y * 596, x * 150, y * 35) then 
                    window = 'Tinder Select'
                end
            elseif window == 'Tinder Select' then 
                if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'inicio' 
                elseif isMouseInPosition(x * 1133, y * 626, x * 53, y * 53) then 
                    if #tinder > 0 then 
                        table.remove(tinder, 1)
                    end
                elseif isMouseInPosition(x * 1235, y * 626, x * 53, y * 53) then 
                    if #tinder > 0 then 
                        triggerServerEvent('Pedro.likeTinder', localPlayer, localPlayer, tinder[1][4])
                        print(tinder[1][4])
                        table.remove(tinder, 1)
                    end
                elseif isMouseInPosition(x * 1127, y * 705, x * 24, y * 24) then 
                    window = 'Tinder Perfil' 
                elseif isMouseInPosition(x * 1198, y * 705, x * 24, y * 24) then 
                    window = 'Tinder Select' 
                elseif isMouseInPosition(x * 1268, y * 705, x * 24, y * 24) then 
                    window = 'Tinder Conversas'
                end
            elseif window == 'Tinder Perfil' then 
                bio = false
                if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'inicio' 
                elseif isMouseInPosition(x * 1127, y * 705, x * 24, y * 24) then 
                    window = 'Tinder Perfil' 
                elseif isMouseInPosition(x * 1198, y * 705, x * 24, y * 24) then 
                    window = 'Tinder Select' 
                elseif isMouseInPosition(x * 1268, y * 705, x * 24, y * 24) then 
                    window = 'Tinder Conversas'
                elseif isMouseInPosition(x * 1118, y * 435, x * 30, y * 30) then
                    if avatar > 1 then  
                        avatar = avatar - 1
                    end
                elseif isMouseInPosition(x * 1279, y * 435, x * 30, y * 30) then 
                    if avatar < 99 then  
                        avatar = avatar + 1
                    end
                elseif isMouseInPosition(x * 1118, y * 528, x * 187, y * 100) then
                    if guiEditSetCaretIndex(biografia, string.len(guiGetText(biografia))) then
                        guiBringToFront(biografia)
                        bio = true
                        guiSetInputMode('no_binds_when_editing')
                    end
                elseif isMouseInPosition(x * 1123, y * 646, x * 182, y * 25) then 
                    outputChatBox('Alteraçoes salvas', 255, 255, 255, true)
                    setElementData(localPlayer, 'Avatar', avatar)
                    setElementData(localPlayer, 'Biografia', guiGetText(biografia))
                end
            elseif window == 'Tinder Conversas' then 
                if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'inicio' 
                elseif isMouseInPosition(x * 1127, y * 705, x * 24, y * 24) then 
                    window = 'Tinder Perfil' 
                elseif isMouseInPosition(x * 1198, y * 705, x * 24, y * 24) then 
                    window = 'Tinder Select' 
                elseif isMouseInPosition(x * 1268, y * 705, x * 24, y * 24) then 
                    window = 'Tinder Conversas'
                else 
                    linha = 0
                    for i, v in ipairs(personstinder) do
                        if (i > proximaPagina2 and linha < maxLinhas3) then
                            linha = linha + 1
                            if  isMouseInPosition(x * 1094 + 2, posBarrasConversasTinder[linha][1], x * 230, y * 40) then 
                                local receiver = getPlayerFromID(tonumber(v[3]))
                                if isElement(receiver) then
                                    window = 'Conversa Tinder'
                                    conversando = receiver
                                else
                                    config.notify_client('Este jogador está ausente da cidade.', 'info')
                                end
                            end
                        end
                    end
                end
            elseif window == 'Conversa Tinder' then 
                if isMouseInPosition(x * 1102, y * 256, x * 60, y * 25) then
                    window = 'inicio'
                elseif isMouseInPosition(x * 1094, y * 678, x * 233, y * 25) then
                    if guiEditSetCaretIndex(edits[3][1], string.len(guiGetText(edits[3][1]))) then
                        guiBringToFront(edits[3][1])
                        edits[3][2] = true
                        guiSetInputMode('no_binds_when_editing')
                    end
                end
            end
        end
    end 
end

function dxBarraDownload()
    local posBarra = interpolateBetween(0, 0, 0, 200, 0, 0, ((getTickCount() - tickd) / 8000), 'Linear')
    drawBorde(x * 1108, y * 663, x * 200, y * 12, tocolor(33, 33, 33, 255))
    drawBorde(x * 1108, y * 663, x * posBarra, y * 12, tocolor(39, 146, 245, 255))
    dxDrawText('Baixando '..(nome or ''), x * 1106, y * 680, x * 1315, y * 709, tocolor(255, 255, 255, 255), 1.00, font[1], "center", "center", false, false, false, false, false)
end

function addBarra(nomee)
    if not isEventHandlerAdded('onClientRender', root, dxBarraDownload) then 
        tickd = getTickCount()
        addEventHandler('onClientRender', root, dxBarraDownload)    
        nome = nomee

        setTimer(function()
            removeEventHandler('onClientRender', root, dxBarraDownload)
        end, 8000, 1)
    end
end

addEvent('Pedro.insertTinder', true)
addEventHandler('Pedro.insertTinder', root, 
    function(avatar, nick, recado, id)
        table.insert(tinder, {avatar, nick, recado, id})
    end
)


addEvent('Caio.onInsertTable', true)
addEventHandler('Caio.onInsertTable', root,
    function (contato, id)
        table.insert(contatos, {contato, id})
    end
)

addEvent('Caio.onOpenCelular', true)
addEventHandler('Caio.onOpenCelular', root,
    function (fundo, action)
        if (action == 'add') then
            if not isEventHandlerAdded('onClientRender', root, dxDraw) then 
                wallpaper = tonumber(fundo)
                windowConfig = nil
                contatos = {}
                addEventHandler('onClientRender', root, dxDraw)
                addEventHandler('onClientClick', root, onClientClick)
                showCursor(true)
                painel = true 
                if (getElementData(localPlayer, 'Recebendo') or false) ~= false then
                    window = 'Recebendo'
                elseif (getElementData(localPlayer, 'Call') or false) ~= false then 
                    window = 'Ligação'
                    if isTimer(Timer) then killTimer(Timer) end
                    Timer = setTimer(setTiming, 1000, 0)
                else 
                    window = 'Bloqueio'
                end 
                tick[1] = getTickCount()
                playSound('Files/Sons/abrindo_celular.mp3', false)
                triggerServerEvent('Goiaba.setAnimationPhone', localPlayer, 1)

                editSpotify = {false, guiCreateEdit(screen[1], screen[2], 0, 0, '', false)}
                biografia = guiCreateEdit(screen[1], screen[2], 0, 0, '', false)
                
                edits = {
                    {guiCreateEdit(screen[1] - 1000, screen[2] - 1000, 0, 0, '', false), false},
                    {guiCreateEdit(screen[1] - 1000, screen[2] - 1000, 0, 0, '', false), false},
                    {guiCreateEdit(screen[1] - 1000, screen[2] - 1000, 0, 0, '', false), false},
                }

                guiEditSetMaxLength(edits[1][1], 13)
                guiEditSetMaxLength(edits[2][1], 13)
                guiEditSetMaxLength(edits[3][1], 55)
                guiEditSetMaxLength(biografia, 85)
                avatar = (getElementData(localPlayer, 'Avatar') or 1)
                for i, v in ipairs(icons) do 
                    if not indexapp[v[1]] then 
                        indexapp[v[1]] = i
                    end
                end

                selectapp = ''

                triggerServerEvent('Pedro.makeAppsS', localPlayer)

                tinder = {}
                triggerServerEvent('Pedro.makeTinder', localPlayer)
            end
        else
            if isEventHandlerAdded('onClientRender', root, dxDraw) then 
                if (painel == true) then
                    painel = false 
                    tick[1] = getTickCount()
                    showCursor(false)
                    playSound('Files/Sons/fechando_celular.mp3', false)
                    triggerServerEvent('Goiaba.setAnimationPhone', localPlayer, 2)
                    removeEventHandler('onClientClick', root, onClientClick)
                    setTimer(function()
                        removeEventHandler('onClientRender', root, dxDraw)
                        if isTimer(Timer) then killTimer(Timer) end 
                    end, 1000, 1)
                    if isElement(editSpotify[2]) then
                        destroyElement(editSpotify[2])
                    end
                    if isElement(biografia) then
                        destroyElement(biografia)
                    end
                    if edits and edits[1][1] and edits[3][1] and edits[2][1] then
                        destroyElement(edits[1][1])
                        destroyElement(edits[2][1])
                        destroyElement(edits[3][1])
                    end
                end
            end
        end
    end
)

function fecharCel()
	if isEventHandlerAdded('onClientRender', root, dxDraw) then 
        if (painel == true) then
            painel = false 
            tick[1] = getTickCount()
            showCursor(false)
            playSound('Files/Sons/fechando_celular.mp3', false)
            triggerServerEvent('Goiaba.setAnimationPhone', localPlayer, 2)
            setTimer(function()
            removeEventHandler('onClientRender', root, dxDraw)
            if isTimer(Timer) then killTimer(Timer) end 
            end, 1000, 1)
            if isElement(editSpotify[2]) then
                destroyElement(editSpotify[2])
            end
            if isElement(biografia) then
                destroyElement(biografia)
            end
        end
    end
end


bindKey('backspace', 'down', 
    function()
        if isEventHandlerAdded('onClientPreRender', root, render) then 
            triggerEvent('Pedro.Selfie', localPlayer)
        elseif isEventHandlerAdded('onClientRender', root, dxDraw) then 
            if window == 'Telefone' then 
                if number and tonumber(number) and (tonumber(number) > 0) then 
                    number = number:sub(1, -2)
                end
            end
        end
    end
)

addEvent('Pedro.changeWindowCell', true)
addEventHandler('Pedro.changeWindowCell', root, 
    function(new, avatarr)
        window = new
        avatar = avatarr 
        if new == 'Ligação' then
            if isTimer(Timer) then killTimer(Timer) end
            min, sec = 0, 0
            Timer = setTimer(setTiming, 1000, 0)   
        end
    end
)

addEvent('Pedro.tocarSom', true)
addEventHandler('Pedro.tocarSom', root, 
    function(sound)
        if isElement(toque) then destroyElement(toque) end 
        toque = playSound(sound, true)
    end
)

addEvent('Pedro.destroySound', true)
addEventHandler('Pedro.destroySound', root, 
    function()
        if isElement(toque) then destroyElement(toque) end 
    end
)

addEvent('Pedro.insertMessage', true)
addEventHandler('Pedro.insertMessage', root, 
    function(receiver, message, type, avatar, nick, id)
        table.insert(infoswpp, {receiver, message, type})
        indexCount = 0
        for i, v in ipairs(infoswpp) do
            if receiver == v[1] then
                indexCount = indexCount + 1
            end
        end
        if (indexCount > 5) then
            table.remove(infoswpp, 1)
        end

        for i, v in ipairs(personswpp) do 
            if (tonumber(v[3]) == id) then 
                return 
            end
        end

        table.insert(personswpp, {avatar, nick, id})
    end
)

addEvent('Pedro.insertMessageTinder', true)
addEventHandler('Pedro.insertMessageTinder', root, 
    function(receiver, message, type, avatar, nick, id)
        table.insert(infostinder, {receiver, message, type})
        indexCount = 0
        for i, v in ipairs(infostinder) do
            if receiver == v[1] then
                indexCount = indexCount + 1
            end
        end
        if (indexCount > 5) then
            table.remove(infostinder, 1)
        end

        for i, v in ipairs(personstinder) do 
            if (tonumber(v[3]) == id) then 
                return 
            end
        end

        table.insert(personstinder, {avatar, nick, id})
    end
)


addEvent('Pedro.addConversaOnMatch', true)
addEventHandler('Pedro.addConversaOnMatch', root, 
    function(avatar, nick, id)
        for i, v in ipairs(personstinder) do 
            if (tonumber(v[3]) == id) then 
                return 
            end
        end

        table.insert(personstinder, {avatar, nick, id})
    end
)


addEvent('Pedro.deleteMessage', true)
addEventHandler('Pedro.deleteMessage', root, 
    function(receiver)
        for i, v in ipairs(personswpp) do 
            if v[2] == receiver then 
                table.remove(personswpp, i)
            end
        end
    end
)

addEvent('Pedro.makeAppsC', true)
addEventHandler('Pedro.makeAppsC', root, 
    function(app)
        baixado[app] = true
    end
)
------------------------------------------------
function getTimer()
    local tempo = getRealTime()
    local hora = tempo.hour
    local minuto = tempo.minute
    if tonumber(hora) < 10 then
        hours = '0'..hora
    else
        hours = hora
    end

    if tonumber(minuto) < 10 then
        minutes = '0'..minuto
    else
        minutes = minuto
    end

    return hours .. ':' .. minutes
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end

function isMouseInPosition(x,y,w,h)
	if isCursorShowing() then
		local sx,sy = guiGetScreenSize()
		local cx,cy = getCursorPosition()
		local cx,cy = (cx*sx),(cy*sy)
		if (cx >= x and cx <= x+w) and (cy >= y and cy <= y+h) then
			return true
		end
	end
end

min, sec = 0, 0 
function setTiming()
    if sec < 60 then 
        sec = sec + 1
    else 
        sec = 0 
        min = min + 1
    end
end

function drawBorde(x, y, w, h, borderColor, bgColor, postGUI)
    if (x and y and w and h) then
        if (not borderColor) then
            borderColor = tocolor(0, 0, 0, 200)
        end
      
        if (not bgColor) then
            bgColor = borderColor
        end        
        postGUI = false

        dxDrawRectangle(x, y, w, h, bgColor, postGUI)

        dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI) -- top
        dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI) -- bottom
        dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI) -- left
        dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI) -- right
    end
end

local rootElement = getRootElement ( )
local mplayer = getLocalPlayer ( )
local sw, sh = guiGetScreenSize ( )

local speed, strafespeed = 0, 0
local rotX, rotY = 0,0
local mouseFrameDelay = 0

local options = 
{
    invertMouseLook = false,
    mouseSensitivity = 0.15
}

function math.clamp ( value, lower, upper )
 value, lower, upper = tonumber ( value ), tonumber ( lower ), tonumber ( upper )
 if value and lower and upper then
  if value < lower then 
   value = lower
  elseif value > upper then 
   value = upper 
  end
  return value
 end
 return false
end

function getElementOffset ( entity, offX, offY, offZ )
 local posX, posY, posZ = 0, 0, 0
 if isElement ( entity ) and type ( offX ) == 'number' and type ( offY ) == 'number' and type ( offZ ) == 'number' then
  local center = getElementMatrix ( entity )
  if center then
   posX = offX * center [ 1 ] [ 1 ] + offY * center [ 2 ] [ 1 ] + offZ * center [ 3 ] [ 1 ] + center [ 4 ] [ 1 ]
   posY = offX * center [ 1 ] [ 2 ] + offY * center [ 2 ] [ 2 ] + offZ * center [ 3 ] [ 2 ] + center [ 4 ] [ 2 ]
   posZ = offX * center [ 1 ] [ 3 ] + offY * center [ 2 ] [ 3 ] + offZ * center [ 3 ] [ 3 ] + center [ 4 ] [ 3 ]
  end
 end
 return posX, posY, posZ
end

function render ( )
    dxDrawText('Mova o mouse para movimentar a camêra\nPressione backspace para sair do modo selfie.', x * 473, y * 676, x * 893, y * 768, tocolor(255, 255, 255, 255), 1.00, font[1], 'center', 'center', false, false, false, false, false)
    
    local PI = math.pi
    if getKeyState ( 'num_4' ) then
        rotX = rotX - options.mouseSensitivity * 0.05745
    elseif getKeyState ( 'num_6' ) then
        rotX = rotX + options.mouseSensitivity * 0.05745
    end

    if getKeyState ( 'num_8' ) then
        rotY = rotY + options.mouseSensitivity * 0.05745  
        rotY = math.clamp ( rotY, -PI / 2.05, PI / 2.05 )
    elseif getKeyState ( 'num_2' ) then
        rotY = rotY - options.mouseSensitivity * 0.05745
        rotY = math.clamp ( rotY, -PI / 2.05, PI / 2.05 )
    end

    local cameraAngleX = rotX 
    local cameraAngleY = rotY

    local freeModeAngleZ = math.sin(cameraAngleY)
    local freeModeAngleY = math.cos(cameraAngleY) * math.cos(cameraAngleX)
    local freeModeAngleX = math.cos(cameraAngleY) * math.sin(cameraAngleX)

    local camPosX, camPosY, camPosZ = getPedBonePosition ( mplayer, 25 )
    camPosZ = camPosZ + 0.29

    if rotY < 0 and isPedInVehicle ( mplayer ) ~= true then
        local r = getPedRotation ( mplayer )
        camPosX = camPosX - math.sin ( math.rad(r) ) * (-rotY/4.5)
        camPosY = camPosY + math.cos ( math.rad(r) ) * (-rotY/4.5)
    end

    local camTargetX = camPosX + freeModeAngleX * 100
    local camTargetY = camPosY + freeModeAngleY * 100
    local camTargetZ = camPosZ + freeModeAngleZ * 100
    
    local camAngleX = camPosX - camTargetX
    local camAngleY = camPosY - camTargetY
    local camAngleZ = 0
    
    local angleLength = math.sqrt(camAngleX*camAngleX+camAngleY*camAngleY+camAngleZ*camAngleZ)

    local camNormalizedAngleX = camAngleX / angleLength
    local camNormalizedAngleY = camAngleY / angleLength
    local camNormalizedAngleZ = 0
    
    local normalAngleX = 0
    local normalAngleY = 0
    local normalAngleZ = 1

    local normalX = (camNormalizedAngleY * normalAngleZ - camNormalizedAngleZ * normalAngleY)
    local normalY = (camNormalizedAngleZ * normalAngleX - camNormalizedAngleX * normalAngleZ)
    local normalZ = (camNormalizedAngleX * normalAngleY - camNormalizedAngleY * normalAngleX)
  

    camPosX = camPosX + freeModeAngleX * speed
    camPosY = camPosY + freeModeAngleY * speed
    camPosZ = camPosZ + freeModeAngleZ * speed

    camPosX = camPosX + normalX * strafespeed
    camPosY = camPosY + normalY * strafespeed
    camPosZ = camPosZ + normalZ * strafespeed
    
    camTargetX = camPosX + freeModeAngleX * 100
    camTargetY = camPosY + freeModeAngleY * 100
    camTargetZ = camPosZ + freeModeAngleZ * 100
 
    if isPedInVehicle ( mplayer ) and getKeyState ( 'mouse1' ) ~= true then
        if getControlState ( 'vehicle_look_behind' ) then
            camTargetX, camTargetY, camTargetZ = getElementOffset ( mplayer, 0, -3, 0 )
        else
            camTargetX, camTargetY, camTargetZ = getElementOffset ( mplayer, 0, 3, 0 )
        end
    end
 
    setPedAimTarget ( mplayer, camTargetX, camTargetY, camTargetZ )
    setCameraMatrix ( camPosX, camPosY, camPosZ, camTargetX, camTargetY, camTargetZ )
end

function mousecalc ( _, _, aX, aY )
 if isCursorShowing ( ) or isMTAWindowActive ( ) then
  mouseFrameDelay = 5
  return
 elseif mouseFrameDelay > 0 then
  mouseFrameDelay = mouseFrameDelay - 1
  return
 end
 
 aX = aX - sw / 2 
 aY = aY - sh / 2
 
 if options.invertMouseLook then
  aY = -aY
 end
 
 rotX = rotX + aX * options.mouseSensitivity * 0.01745
 rotY = rotY - aY * options.mouseSensitivity * 0.01745
    
 local PI = math.pi
 if rotX > PI then
  rotX = rotX - 2 * PI
 elseif rotX < -PI then
  rotX = rotX + 2 * PI
 end
    
 if rotY > PI then
  rotY = rotY - 2 * PI
 elseif rotY < -PI then
  rotY = rotY + 2 * PI
 end

 rotY = math.clamp ( rotY, -PI / 2.05, PI / 2.05 )
end

local UniStat = { 
    items = { }
}

local sw, sh = guiGetScreenSize ( )

local colors = { 
    white = tocolor ( 255, 255, 255, 255 ) 
}

local lexemes = {
    [ 'health' ] = {
        getString = function ( arg, player )
            local health = math.floor ( getElementHealth ( player ) + 0.5 )
            
            return health
        end
    },
    [ 'armor' ] = { 
        getString = function ( arg, player )
            return math.floor ( getPedArmor ( player ) + 0.5 )
        end
    },
    [ 'video' ] = {
        getString = function ( arg, player )
            if arg == 'name' then
                return getElementData ( player, 'vcName' )
            elseif arg == 'ram' then
                return getElementData ( player, 'vcRAM' )
            elseif arg == 'ps' then
                return getElementData ( player, 'vcPSVer' )
            end
        end,
        onInit = function ( player )
            local dxStat = dxGetStatus ( )
            
            setElementData ( player, 'vcName', dxStat.VideoCardName )
            setElementData ( player, 'vcRAM', dxStat.VideoCardRAM .. 'MB' )
            setElementData ( player, 'vcPSVer', dxStat.VideoCardPSVersion )
        end
    },
    [ 'time' ] = {
        getString = function ( arg, player )
            local timestamp = getElementData ( player, 'times' )
            local time = getRealTime ( timestamp )

            return time.hour .. ':' .. time.minute .. ':' .. time.second
        end,
        onInit = function ( )
            setTimer ( 
                function ( )
                    local timestamp = getRealTime ( ).timestamp
                    setElementData ( localPlayer, 'times', timestamp )
                end
            , 1000, 0 )
        end
    },
    [ 'tl' ] = {
        getString = function ( arg, player )
            local timeLeft = getElementData ( player, 'tl' )
            
            if arg == 'min' then
                return math.floor ( timeLeft / 60000 )
            elseif arg == 'sec' then
                return math.floor ( timeLeft / 1000 )
            elseif arg == 'msec' then
                return math.floor ( timeLeft )
            end
        end,
        onInit = function ( )
            UniStat.enterTime = getTickCount ( )
            
            setTimer ( 
                function ( )
                    local currentTime = getTickCount ( )
                    setElementData ( localPlayer, 'tl', currentTime - UniStat.enterTime )
                end
            , 1000, 0 )
        end
    },
    [ 'rot' ] = {
        getString = function ( arg, player )
            return math.floor ( getPedRotation ( player ) + 0.5 )
        end
    },
    [ 'afk' ] = {
        getString = function ( arg, player )
            local isAFK = getElementData ( player, 'afk' ) or 0
            local statusName = isAFK > 0 and 'AFK' or 'В ИГРЕ'
            
            return statusName
        end
    },
}

addEvent('Pedro.Selfie', true)
addEventHandler('Pedro.Selfie', root,  
    function()
        if not isEventHandlerAdded('onClientPreRender', root, render) then 
            toggleAllControls(false)
            setPedAnimation(localPlayer, false)
            setPedAnimation(localPlayer, 'PED', 'gang_gunstand')
            addEventHandler ( 'onClientPreRender', root, render )
            addEventHandler ( 'onClientCursorMove', root, mousecalc )
            removeEventHandler('onClientRender', root, dxDraw)
            showCursor(false)
        else 
            toggleAllControls(true)
            setPedAnimation(localPlayer, false)
            removeEventHandler ( 'onClientPreRender', root, render )
            removeEventHandler ( 'onClientCursorMove', root, mousecalc )
            addEventHandler('onClientRender', root, dxDraw)
            triggerServerEvent('Goiaba.setAnimationPhone', localPlayer, 1)
            setCameraTarget (localPlayer)
        end
    end
)

addEventHandler("onClientPlayerWasted", getLocalPlayer(), 
	function ()
		fecharCel()
	end
)
------------------------------------------------        

addEvent('Caio.getMusics', true)
addEventHandler('Caio.getMusics', root, function(musics)
    musicasSearch = {}
    for i, v in ipairs(musics) do
        musicasSearch[i] = {v.title, milToMin(v.duration), v.id}
    end
end)

function milToMin(value)
	seconds = math.floor(value/1000)
	local results = {}
	local sec = ( seconds %60 )
	local min = math.floor ( ( seconds % 3600 ) /60 )
	local hou = math.floor ( ( seconds % 86400 ) /3600 )
	if hou > 0 then
		return string.format('%01d:%02d:%02d', hou, min, sec)
	else
		return string.format('%02d:%02d', min, sec)
	end
end

function dxRectangleRounded(x, y, w, h, tipo, borderColor, bgColor, postGUI)
	borderColor = borderColor or tocolor(0, 0, 0, 200)
    bgColor = bgColor or borderColor
    postGui = postGui or false
    dxDrawRectangle(x, y, w, h, bgColor, postGUI)
    if tipo == '1' then
        dxDrawRectangle(x + 1, y - 1, w - 2, 1, borderColor, postGUI)
        dxDrawRectangle(x + 1, y + h, w - 2, 1, borderColor, postGUI)
        dxDrawRectangle(x - 1, y + 1, 1, h - 2, borderColor, postGUI)
        dxDrawRectangle(x + w, y + 1, 1, h - 2, borderColor, postGUI)
    elseif tipo == '2' then
        dxDrawRectangle(x + 1, y - 1, w - 2, 1, borderColor, postGUI)
    elseif tipo == '3' then
        dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI)
        dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI)
        dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI)
        dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI)
    end
end