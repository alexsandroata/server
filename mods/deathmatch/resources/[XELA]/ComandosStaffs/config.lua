Apolo_Config = {

    Geral = {
        ["Id"] = "ID", -- [[  ElementData ID ]] -- 
    },

    Discord = {-- [[ Configuração da embed ]] -- 
        ["AvatarUrl"] = "",
        ["UserName"] = "", 
        ["ColorEmbed"] =  3092790,
        ["TituloEmbed"] = "`📄` Comandos Staff",
        ["MsgDireitos"] = "Todos os seus direitos reservados", 
        ["IconUrl"] = "https://media.discordapp.net/attachments/958553788233429052/964934481708462121/logo-apolo.png",
        ["ImageUrl"]= "",
        ["ThumbnailUrl"] = "https://media.discordapp.net/attachments/958553788233429052/964934481708462121/logo-apolo.png",
    },

    Url = {-- [[  Link da Webhooks ]] -- 
        ["UrlDiscord"] = "",
    },
    
    Comandos = { -- [[  Coamndos do script ]] -- 
        ["Nc"] = "nc", 
        ["Vida"] = "vida",
        ["Fix"] = "fix",
        ["Dv"] = "dv",
        ["Colete"] = "colete",
        ["Car"] = "car",
        ["Avisar"] = "avisar",
        ["Tp"] = "tp",
        ["Puxar"] = "puxar",
    },

    Acls = { -- [[  Permissões para executar os comandos ]] -- 
        ["AclNc"] = "Staff",
        ["AclVida"] = "Staff",
        ["AclFix"] = "Staff",
        ["AclDv"] = "Staff",
        ["AclColete"] = "Staff",
        ["AclCar"] = "Staff",
        ["AclAvisar"] = "Staff",
        ["AclTp"] = "Staff",
        ["AclPuxar"] = "Staff",
    },

    Mensagens = {-- [[ Mensagens Infobox ]] -- 
        ["ErroID"] = "Voce precisa informar o id do player.",
        ["ErroPlayer"] = "Jogador não encontrado.",
        ["ErroVida"] = "Voce precisa informar a quantidade de vida que o jogador recebera.",
        ["ErroVeiculo"] = "O Jogador nao esta em um veiculo.",
        ["ErroArmor"] = "Voce precisa informar a quantidade de colete que o jogador recebera.",
        ["MsgAtivouNC"] = "Voce ativou o modo de nc.",
        ["MsgDesativouNC"] = "Voce desativou o modo de nc.",
        ["ErroIdVeiculo"] = "Voce precisa adicionar o id do veiculo.",
        ["ErroVeiculoExistente"] = "O jogador ja esta em um veiculo.",
        ["ErroTpID"] = "Voce precisa adicionar o segundo id.",
        ["ErroPermissao"] = "Você não ter permissão para usar esse comando."
    },
}

function outputMessage(elem, msg, type)
    exports.Scripts_Dxmessages:outputDx (elem, type, msg)
end