--[[
 ______    ______      _____       ____        ______                 
/\__  _\  /\__  _\    /\  __`\    /\  _`\     /\  _  \     /'\_/`\    
\/_/\ \/  \/_/\ \/    \ \ \/\ \   \ \,\L\_\   \ \ \L\ \   /\      \   
   \ \ \     \ \ \     \ \ \ \ \   \/_\__ \    \ \  __ \  \ \ \__\ \  
    \ \ \     \_\ \__   \ \ \_\ \    /\ \L\ \   \ \ \/\ \  \ \ \_/\ \ 
     \ \_\    /\_____\   \ \_____\   \ `\____\   \ \_\ \_\  \ \_\\ \_\
      \/_/    \/_____/    \/_____/    \/_____/    \/_/\/_/   \/_/ \/_/
                                                     
                         » CopyRight © 2022
                 » Meu discord discord.gg/sY5wHR8hW3                                                                          
]]--

configLicense = {
    ["User"] = "1069113178514001982", -- ID DO USUARIO
    ["Key"] = "C78-66F-07C-F46-TIOSAM", -- KEY DO USUARIO
}

--====================================[ IMPORTANTES ]================================================

config = { 

    importante = {
	
        comandoCriar = 'criargrupo'; -- COMANDO PARA CRIAR O GRUPO
        comandoExcluir = 'excluirgrupo'; -- COMANDO PARA EXCLUIR O GRUPO
        teclaPaineis = 'f7'; -- TECLA PARA ABRIR O PAINEL DE CONVITES, E SE VOCE ESTIVER EM UM GRUPO, PARA ABRIR O PAINEL DELE
        bancoDelay = 10; -- DELAY PARA REALIZAR OUTRA OPERACAO COM O BANCO ( EM SEGUNDOS )
        convidarDelay = 30; -- DELAY PARA CONVIDAR UMA PESSOA NOVAMENTE PARA O GRUPO ( EM SEGUNDOS )
        corDesign = {45, 179, 255}; -- COR DO DESIGN EM RGB
        corDesignHEX = "#2DB3FF"; -- COR DO DESIGN EM HEX
		
    }; 
	
    tipo = {
        ['Corporacao'] = 'Policial'; -- SE FOR SELECIONADO CORPORAÇÃO QUANDO FOR CRIAR O GRUPO, IRA SETAR ALEM DA TAG DO GRUPO EM ESPECIFICO A TAG DE POLICIAL TAMBEM
        ['Faccao'] = 'Gang'; -- SE FOR SELECIONADO FACÇÃO QUANDO FOR CRIAR O GRUPO, IRA SETAR ALEM DA TAG DO GRUPO EM ESPECIFICO A TAG DE GANG TAMBEM
    };	

    permissao = { -- ACL QUE PODE CRIAR OU EXCLUIR GRUPOS
        'Console';  
    }; 
	
--====================================[ CONFIGURAÇÃO DOS GRUPOS ]========================================== 
	
    imagensGrupo = { -- NOME DO GRUPO , DIRETORIO DA IMAGEM DA LOGO DO GRUPO
        ['PMERJ'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 1
        ['BAEP'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 2	
        ['CHOQUE'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 1
        ['PMBA'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 2	
        ['PF'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 1
        ['ROTA'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 2	
        ['PMESP'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 1
        ['FT'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 2	
        ['DETRAN'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 1
        ['Samu'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 2	
        ['PC'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 1
        ['CV'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 2	
        ['TDT'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 1
        ['TDF'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 2	
        ['RODO'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 1
        ['BDM'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 2	
        ['FAIXA'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 1
        ['MC'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 2	
        ['ADA'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 1
        ['TDR'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 2		
        ['Yakuza'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 1
        ['PCC'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 2	
        ['TCP'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 1
        ['GROTA'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 2	
        ['CPX'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 1	
        ['Advogado'] = 'files/grupos/logo.png'; -- LOGO DO GRUPO 1		
    };

    mensagemConvite = { -- NOME DO GRUPO , PEQUENA MENSAGEM QUE IRA APARECER QUANDO ALGUEM RECEBER UM CONVITE
        ['PMERJ'] = 'PMERJ - Convite'; -- NOME DO GRUPO 1 PARA APARECER, QUANDO FOR CONVIDAR ALGUEM
        ['BAEP'] = 'BAEP - Convite'; -- NOME DO GRUPO 1 PARA APARECER, QUANDO FOR CONVIDAR ALGUEM
        ['CHOQUE'] = 'CHOQUE - Convite'; -- NOME DO GRUPO 1 PARA APARECER, QUANDO FOR CONVIDAR ALGUEM
        ['PMBA'] = 'PMBA - Convite';-- NOME DO GRUPO 1 PARA APARECER, QUANDO FOR CONVIDAR ALGUEM
        ['PF'] = 'PF - Convite'; -- NOME DO GRUPO 1 PARA APARECER, QUANDO FOR CONVIDAR ALGUEM
        	
        ['PMESP'] = 'PMESP - Convite'; -- LOGO DO GRUPO 1
        ['EB'] = 'EB - Convite'; -- LOGO DO GRUPO 2
        ['FT'] = 'FT - Convite'; -- LOGO DO GRUPO 2	
        ['DETRAN'] = 'DETRAN - Convite'; -- LOGO DO GRUPO 1
        ['Samu'] = 'Samu - Convite'; -- LOGO DO GRUPO 2	
        ['PC'] = 'PC - Convite'; -- LOGO DO GRUPO 1
        ['CV'] = 'CV - Convite'; -- LOGO DO GRUPO 2	
        ['TDT'] = 'TDT - Convite'; -- LOGO DO GRUPO 1
        ['TDF'] = 'TDF - Convite'; -- LOGO DO GRUPO 2	
        ['RODO'] = 'RODO - Convite'; -- LOGO DO GRUPO 1
        ['BDM'] = 'BDM - Convite'; -- LOGO DO GRUPO 2	
        ['FAIXA'] = 'FAIXA - Convite'; -- LOGO DO GRUPO 1
        ['MC'] = 'MC - Convite'; -- LOGO DO GRUPO 2	
        ['ADA'] = 'ADA - Convite'; -- LOGO DO GRUPO 1
        ['TDR'] = 'TDR - Convite'; -- LOGO DO GRUPO 2		
        ['Yakuza'] = 'YAKUZA - Convite'; -- LOGO DO GRUPO 1
        ['PCC'] = 'PCC - Convite'; -- LOGO DO GRUPO 2	
        ['TCP'] = 'TCP - Convite'; -- LOGO DO GRUPO 1
        ['GROTA'] = 'GROTA - Convite'; -- LOGO DO GRUPO 2	
        ['CPX'] = 'CPX - Convite';	
		['Advogado'] = 'Advogado - Convite'; -- LOGO DO GRUPO 1
    }; 

    permissoesGrupos = { -- CARGOS DOS GRUPOS ( DO MAIOR AO MENOR )
	
	    -- NOME DO GRUPO 
        ['PMERJ'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Comandante'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Soldado'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Recruta'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
		
		---------------
		        ['BAEP'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Comandante'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Soldado'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Recruta'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
		--------------
				        ['Advogado'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Juíz'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Advogado'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Estudante'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
		----------
		
----------------
		        ['EB'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Comandante'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Soldado'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Recruta'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
		
-------------------

		        ['PF'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Comandante'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Soldado'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Recruta'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
		
------------------
		        ['ROTA'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Comandante'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Soldado'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Recruta'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
		
------------------
		        ['PMESP'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Comandante'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Soldado'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Recruta'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
		
------------
		        ['FT'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Comandante'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Soldado'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Recruta'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
		

-------------

		        ['DETRAN'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Comandante'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Soldado'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Recruta'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
		
          ----------------SAMU-------
		
		['Samu'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Chefe da SAMU'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Médico(a)'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Enfermeiro(a)'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
		
		--------------------
				        ['PC'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Comandante'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Soldado'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Recruta'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
		
---------------------
		        ['PMBA'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Comandante'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Soldado'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Recruta'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
		

-------------FACS-------------------
		['TDR'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Gerente'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'CRIA'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'TESTE'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
		--------------------
				['CV'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Gerente'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'CRIA'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'TESTE'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
------------
		['TDT'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Gerente'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'CRIA'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'TESTE'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
-----------
		['TDF'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Gerente'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'CRIA'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'TESTE'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
------------
		['RODO'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Gerente'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'CRIA'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'TESTE'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
--------------
		['TCP'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Gerente'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'CRIA'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'TESTE'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
-------------
		['FAIXA'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Gerente'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'CRIA'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'TESTE'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
---------------
		['MC'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Gerente'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'CRIA'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'TESTE'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
--------------
		['ADA'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Gerente'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'CRIA'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'TESTE'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
--------------
		['PCC'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Gerente'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'CRIA'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'TESTE'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
----------------
		['GROTA'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Gerente'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'CRIA'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'TESTE'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
---------------
		['CPX'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Gerente'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'CRIA'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'TESTE'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
		------------------
				['BDM'] = {  -------------------------------------------------------------------------------------------- GRUPO 1 		
		
            {
                nomeCargo = 'Gerente'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'CRIA'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'TESTE'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 	
---------------
		-- NOME DO GRUPO
        ['Yakuza'] = { -------------------------------------------------------------------------------------------- GRUPO 2
		
		
            {
                nomeCargo = 'Gerente'; -- NOME DO CARGO

                permissoes = { 
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = true; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = true; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = true; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = true; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Maloka'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = true; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };

			
            {
                nomeCargo = 'Cria'; -- NOME DO CARGO

                permissoes = {
                    ['deposit'] = true; -- PERMISSAO PARA DEPOSITAR
                    ['withdraw'] = false; -- PERMISSAO PARA SACAR
                    ['invite'] = false; -- PERMISSAO PARA CONVIDAR
                    ['kick'] = false; -- PERMISSAO PARA EXPULSAR
                    ['promote'] = false; -- PERMISSAO PARA PROMOVER
                    ['downgrade'] = false; -- PERMISSAO PARA REBAIXAR
                };
            };	
        }; 
		
		
			
    }; 
} 	
--====================================[ INFOBOX ]====================================  

function message(player, text, type)
    exports['XELA_Notify']:addBox(player, text, type) -- EXPORTS DA SUA INFOBOX
end