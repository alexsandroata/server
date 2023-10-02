Config = {
	Discord = {-- [[ Configuração da embed ]]-- 
        ["AvatarUrl"] = "https://media.discordapp.net/attachments/1125847883162325185/1134489144895217704/logo_tandera.png?ex=65178499&is=65163319&hm=d3d0265662637e706616722bcc189eee20bc7d4c813bc408e472e0a1683cbb37&=&width=402&height=402", -- [[  Link da logo, ficara no avatar (foto de perfil do bot) ]] -- 
        ["UserName"] = "Seu servidor",  -- [[  nome do servidor ]] -- 
        ["ColorEmbed"] =  16777215, -- [[  cod... rgb 'cor da lista' ]] -- 
        ["TituloEmbed"] = "Logs C6", -- [[  titulo ]] -- 
        ["MsgDireitos"] = "Seu servidor | Todos os seus direitos reservados", 
        ["IconUrl"] = "https://media.discordapp.net/attachments/1125847883162325185/1134597486976188557/roupas.png?ex=651740c0&is=6515ef40&hm=3a31977b3b883190ad19511040be3768e6d65766ab4bbfb617be08989da7df83&=",   -- [[  Link da logo (ficara no direitos) ]] -- 
        ["ImageUrl"]= "https://media.discordapp.net/attachments/1125847883162325185/1134489144895217704/logo_tandera.png?ex=65178499&is=65163319&hm=d3d0265662637e706616722bcc189eee20bc7d4c813bc408e472e0a1683cbb37&=&width=402&height=402",-- [[  Link da logo "Opcional, wallpaper" (banner na parte de baixo da msg) ]] -- 
        ["ThumbnailUrl"] = "https://cdn.discordapp.com/attachments/1125847883162325185/1134597333003288606/alianca.png?ex=6517409b&is=6515ef1b&hm=895a425303b2879e93cf91a319d58b0fb970c1f947bc1e1e1b3e89f1cde06392&", -- [[  Link da logo (imagem ao lado da msg) ]] -- 
    },

    Url = {-- [[  Link da Webhooks ]] -- 
        ["UrlDiscord"] = "https://discord.com/api/webhooks/1157188656684085258/6EniJTRPwvhQprd2N8Hw4Op4EV3uD00mo9xcQx4FKffODmrfafEyOOXDCocnt2udyOZ5", -- [[ Sua webhook de bate ponto aqui]]
        ["UrlDiscord2"] = "https://discord.com/api/webhooks/1157203015200145428/y3WDTXQnWNcVxAC84BAQ-TPXxgcsqBIvdOgJxF8qFSTa1SALf6Dwerz4RDSNbMTHvbaC", -- [[ Sua webhook de comandos aqui]]
    },
}

message = function (element, msg, type)
    exports['XELA_Notify']:addBox(element, msg, type)
end