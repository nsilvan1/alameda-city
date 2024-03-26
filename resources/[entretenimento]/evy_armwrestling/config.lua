--========================================================================================================================================================================-
--========================================================================================================================================================================-
--=========================================                                                                                      =========================================-                         
--=========================================                                                                                      =========================================-
--=========================================                                                                                      =========================================-
--========================================================================================================================================================================-
--========================================================================================================================================================================-



globalConfig = {

  language = 'en', --change with 'en' for english, 'fr' for french, 'cz' for czech, 'de' for german




-- Configure uma nova linha para adicionar uma tabela, xyz são as coordenadas, model são os adereços usados ​​como tabela. As 3 mesas de queda de braço são
                                                    -- 'prop_arm_wrestle_01' --
                                              -- 'bkr_prop_clubhouse_arm_wrestle_01a' --
                                              -- 'bkr_prop_clubhouse_arm_wrestle_02a' --

  props = { 
    
    {x = 2003.15, y = 3051.74, z = 47.21, model = 'prop_arm_wrestle_01'},
    {x = 343.48, y =-924.97, z = 29.25, model = 'bkr_prop_clubhouse_arm_wrestle_02a'}

  },

  showBlipOnMap = false, -- Defina como true para mostrar o blip para cada tabela

  blip = { --Blip informação

    title="Arm wrestle",  
    colour=0, -- 
    id=1 

  }

}

text = { 
  ['en'] = {
    ['win'] = "Você venceu !",
    ['lose'] = "Você perdeu",
    ['full'] = "Uma luta de quebra de braço já está em andamento",
    ['tuto'] = "Para ganhar, pressione rapidamente ",
    ['wait'] = "Esperando adversário",
  },
  ['fr'] = {
    ['win'] = "Vous avez gagné !",
    ['lose'] = "Vous avez perdu",
    ['full'] = "Un bras de fer est déjà en cours",
    ['tuto'] = "Pour gagner, appuyez rapidement sur ",
    ['wait'] = "En attente d'un adversaire",
  },
  ['cz'] = {
    ['win'] = "Vyhrál jsi !",
    ['lose'] = "Prohrál jsi",
    ['full'] = "Zápasový zápas již probíhá",
    ['tuto'] = "Chcete-li vyhrát, rychle stiskněte ",
    ['wait'] = "Čekání na protivníka",
  },
  ['de'] = {
    ['win'] = "Du hast gewinnen !",
    ['lose'] = "Du hast verloren",
    ['full'] = "Ein Wrestling Match ist bereits im Gange",
    ['tuto'] = "Um zu gewinnen, drücken Sie schnell ",
    ['wait'] = "Warten auf einen Gegner",
  },

}