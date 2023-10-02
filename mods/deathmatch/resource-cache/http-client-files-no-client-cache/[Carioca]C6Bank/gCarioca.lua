-- Carioca Dev e Carioca Group, trazendo o melhor para o seu servidor! --



Config = {
	TEMPO = 5, -- tempo q pode utilizar o banco novamente
	AMOUNT = 250, -- quantidade inicial do banco

	MULTAR = {
		ACL = "Policial", -- Acl que pode aplicar multa 
		COMANDO = "multar", -- comando para alicar multa exp /multar 0 5000
	},

	ATMs = { -- posições do banco //--obj= objeto do banco blip= id do blip x,y,z= vocês ja sabe rx,ry,rz= Rotaçao do banco // para adicionar mais atms, basta clonar a linha e colar abaixo mudando a localização.
		{obj = 2942, blip = 52, x = -2486.100, y = -622.269, z = 133.177, rx = -0, ry = 0, rz = 268.19705200195, i = 0, d = 0},
	},

	Discord = {-- [[ Configuração da embed ]]-- 
        ["AvatarUrl"] = "", -- [[  Link da logo, ficara no avatar (foto de perfil do bot) ]] -- 
        ["UserName"] = "Seu servidor",  -- [[  nome do servidor ]] -- 
        ["ColorEmbed"] =  16777215, -- [[  cod... rgb 'cor da lista' ]] -- 
        ["TituloEmbed"] = "Logs C6", -- [[  titulo ]] -- 
        ["MsgDireitos"] = "Seu servidor | Todos os seus direitos reservados", 
        ["IconUrl"] = "https://media.discordapp.net/attachments/1074206782727135302/1084836454800302180/MTJ4NTEyYmIuanBn.png",   -- [[  Link da logo (ficara no direitos) ]] -- 
        ["ImageUrl"]= "https://media.discordapp.net/attachments/1074206782727135302/1084836735302774864/bmstMS0uanBn.png",-- [[  Link da logo "Opcional, wallpaper" (banner na parte de baixo da msg) ]] -- 
        ["ThumbnailUrl"] = "", -- [[  Link da logo (imagem ao lado da msg) ]] -- 
    },

    Url = {-- [[  Link da Webhooks ]] -- 
        ["UrlDiscord"] = "LINK DO SEU WEBHOOK AQUI",
    },
}



--[[
Segue abaixo o element para vincular o seu sistema bancario com qualquer hud

local dados = getElementData(localPlayer, "bankDados") or 0 
dxDrawText((dados["AMOUNT"] or "0")

]]--





