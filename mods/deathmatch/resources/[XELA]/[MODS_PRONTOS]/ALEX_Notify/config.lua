config = {

	limite = 5, -- Máximo de infobox por vez


	anuncio_adm = {'Staff', 'Console'}, --ACL de quem pode mandar avisos de Adm
	anuncio_pm = {'Policial'}, --ACL de quem pode mandar avisos de Policia
	anuncio_mec = {'Mecanica'}, --ACL de quem pode mandar avisos de Mecanica
	anuncio_hp = {'Hospital'}, --ACL de quem pode mandar avisos de Hospital
	
	-- anuncio_ilegal = {"Chefe_Ilegal"}, --ACL de quem pode mandar avisos do Ilegal
	
	
	comandos = {
		['avisoadm'] = 'aa', --Comando que vai ser usado para criar uma Notify de Admin
		['avisopm'] = 'pm', --Comando que vai ser usado para criar uma Notify de Policia
		['avisomec'] = 'mec', --Comando que vai ser usado para criar uma Notify de Mecanico
		['avisohp'] = 'hp', --Comando que vai ser usado para criar uma Notify de Hospital
	
	},

	types = {
		['Sucesso'] = {
			color = {127, 166, 67},
			image = 'assets/images/success.png',
			sound = 'assets/sounds/success.mp3',
		},

		['Aviso'] = {
			color = {221, 166, 25},
			image = 'assets/images/warning.png',
			sound = 'assets/sounds/warning.mp3',
		},

		['Erro'] = {
			color = {235, 55, 55},
			image = 'assets/images/error.png',
			sound = 'assets/sounds/error.wav',
		},

		['Ajuda'] = {
			color = {221, 166, 25},
			image = 'assets/images/help.png',
			sound = 'assets/sounds/help.mp3',
		},

		['Informação'] = {
			color = {50, 129, 246},
			image = 'assets/images/info.png',
			sound = 'assets/sounds/info.mp3',
		},

		['BOT'] = {
			color = {50, 129, 246},
			image = 'assets/images/bot.png',
			sound = 'assets/sounds/info.mp3',
		},

		['Admin'] = {
			color = {194, 16, 194},
			image = 'assets/images/adminduty.png',
			sound = 'assets/sounds/adminduty.mp3',
		},

		['Policia'] = {
			color = {50, 129, 246},
			image = 'assets/images/police.png',
			sound = 'assets/sounds/siren.mp3',
		},

		['Hospital'] = {
			color = {235, 55, 55},
			image = 'assets/images/hp.png',
			sound = 'assets/sounds/siren.mp3',
		},

		['Mecanica'] = {
			color = {221, 166, 25},
			image = 'assets/images/mec.png',
			sound = 'assets/sounds/horn.mp3',
		},

	},

}