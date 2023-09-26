config = {
    License = { -- Proteção de Resource
        ["User"] = "KKKMÓFÁCIL",
        ["Key"] = "STRINGSCRIPTERKKKK"
    },

    GPS = true, -- Ativar ou desativar GPS (Voz do GPS)
    VolumeGPS = 1.0, -- Volume da voz do GPS
    UseDefault = true, -- Usar os blips padrões do seu servidor
    RecalculateRoute = true, -- Recalcular rota automaticamente
    DayAndNigthRadar = true, -- Função de caso estiver de noite no jogo, o radar muda
    BlipsName = "${nameBlip} x${amountBlip}", -- Nome na lista de blips

    MarkAll = {
        State = true, -- Quando alguem do carro marcar, marca para todos
        WhoCanScore = 2, -- Quem é liberado para marcar para todos: Exemplo: 1 (p1), 2 (p2)
        VehiclesBlocked = { -- Veiculos que não possuem esta funcionalidade
            ["Bike"] = true,
            ["Helicopter"] = true,
            ["Plane"] = true,
            ["Trailer"] = true,
        },
    }, 

    MiniMap = {
        Location = { 40, 848, 309, 192 }, -- Em 1920x1080
        Trajeto = { 157, 1, 252, 255 },
        BorderColor = { 0, 0, 0, 200 },
        DamageEffect = true, -- Efeito de quando tomar dano ficar vermelho o minimapa
        SempreNoCarro = false, -- Se ativo, aparece apenas quando o player tiver no carro
        UseMask = true,
        Mask = { 255, 255, 255, 50 },
    },

    F11 = {
        BindOpen = "F11",
        ChatShow = true, -- Sumir o chat quando abrir o F11, aparecer o chat quando fechar o F11
        BlipMouseName = true, -- Ao passar mouse no blip aparecer o nome
        BlipHoverSize = true, -- Ao passar mouse no blip, aumenta o size do blip
        CustomCursor = false, -- Cursor custom
        Sound = true, -- Som de ao abrir e ao fechar
        ListaBlips = 0, -- Quantidade de blips que aparece no scroll direito do mapa
        Background = {
            Color = { 41, 76, 74, 255 },
            ColorNight = { 31, 41, 35, 255 }, -- Caso esteja ativado a opção "DayAndNigthRadar"
            UseMask = true,
            Mask = { 255, 255, 255, 127 },
        },
        BackgroundListBlip = { 33, 33, 33, 255 },
        BorderColor = { 0, 0, 0, 255 },
        Trajeto = { 157, 1, 252, 255 },
        ZoomPadrao = 0.3, -- Zoom padrão de quando abre o F11
    },

    HudConfig = { -- Lista de oque vai ser bloqueado no setPlayerHudComponentVisible
        {component = "radar", show = false},
        {component = "radio", show = false},
    },

    --[[
        Modo de Usar:

        - { Nome do Blip, x, y, z, Image blip (imagens que ficam dentro do me/stringdev/mstradar/assets/)}
    --]]

    DefaultBlips = {
	--Postos de Combustíveis
		{ "Hospital", 2031.192, -1414.224, 17, "blips/hospital.png" },
    },
	
    ZonasDisabilitada = {
    },

    notifyS = function (player, message, type)
        exports["infobox"]:addBox(player, type, message)
    end,
    
    notifyC = function (message, type)
        exports["infobox"]:addBox(type, message)
    end
}