Config = {}

Config.Plate = 'GoPostal'
Config.Car = 'boxville2'

Config.JobBlipName = 'Destination'

Config.Money = '300'

Config.Language = 'EN' -- [EN], [ES], [FR], [DE], [RU] --

Config.Clothes = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 26,   ['torso_2'] = 2,
        ['arms'] = 11,  
        ['pants_1'] = 105,
        ['shoes_1'] = 10,
        ['chain_1'] = 12,   ['chain_2'] = 2,
        ['glasses_1'] = 3,  ['glasses_2'] = 3,
        ['watches_1'] = 3,  
    },

    female = {
        ['tshirt_1'] = 1, 
        ['torso_1'] = 54,   ['torso_2'] = 3,
        ['arms'] = 9,
        ['pants_1'] = 64,   ['pants_2'] = 1, 
        ['shoes_1'] = 24,   
    }
}

Config.Coords = {
    service = {X= 78.74, Y= 111.90, Z= 80.19},
    startj = {X= 68.85, Y= 126.51, Z= 78.21},
    cardel = {X= 73.38, Y= 120.6, Z= 78.21},
    carspwn = {X= 60.11, Y= 121.56, Z= 79.17, H= 162.23},
    blip = {X= 78.7, Y= 111.78, Z= 80.19},   
}

Config.Jobs = { 
    {X= -34.49, Y= 6625.86, Z= 29.33},
    {X= -416.9, Y= 6255.22, Z= 29.52},
    {X= 31.17, Y= 6596.67, Z= 31.84},
    {X= -372.12, Y= 6180.85, Z= 30.51},
    {X= -214.5, Y= 6431.54, Z= 30.47},
    {X= 1691.01, Y= 4683.75, Z= 42.04},
    {X= 1712.6, Y= 4634.16, Z= 42.31},
    {X= 2564.32, Y= 4680.4, Z= 33.10},
    {X= 1835.79, Y= 3776.88, Z= 32.47},
    {X= 1480.72, Y= 3678.36, Z= 33.28},
    {X= 1987.07, Y= 3813.82, Z= 31.27},
    {X= 1654.69, Y= 3820.89, Z= 34.47},
    {X= 911.05, Y= 3644.51, Z= 32.68},
    {X= -1146.65, Y= 546.55, Z= 100.52},
    {X= -867.29, Y= 785.52, Z= 190.95},
    {X= -134.42, Y= 600.52, Z= 204.18},
    {X= -378.89, Y= 351.66, Z= 108.08},
    {X= -1006.99, Y= 512.84, Z= 78.62},
    {X= -2008.5, Y= 367.58, Z= 93.83},
    {X= -1817.61, Y= 343.41, Z= 87.64},
    {X= -1109.08, Y= -1060.6, Z= 1.16},
    {X= -1085.95, Y= -1503.79, Z= 4.72},
    {X= 132.48, Y= -71.52, Z= 66.74},
    {X= -569.34, Y= 169.73, Z= 65.59},
    {X= 968.88, Y= -551.72, Z= 58.17},
    {X= 868.16, Y= -518.72, Z= 56.35},
    {X= 1371.06, Y= -562.48, Z= 73.36},
    {X= 328.92, Y= -1845.49, Z= 27.75},
    {X= -13.34, Y= -1451.29, Z= 29.56},
    {X= -20.82, Y= -1858.55, Z= 25.41},
    {X= 1295.38, Y= -1739.42, Z= 53.29},
}

Config.Translations = {
    ['EN'] = {
        ['START_J'] = 'Press ~INPUT_CONTEXT~ To Start Your ~y~Journey~s~',
        ['STARTED_J'] = 'You have entered service',
        ['FINISH_J'] = 'Press ~INPUT_CONTEXT~ To Finish Your ~y~Journey~s~',
        ['FINISHED_J'] = 'Yoy have finished service',

        ['SPWN_CAR'] = 'Press ~INPUT_CONTEXT~ To Spawn a ~y~Car~s~',
        ['DEL_CAR'] = 'Press ~INPUT_CONTEXT~ To Delete the ~y~Car~s~',

        ['HOUSE'] = 'Press ~INPUT_CONTEXT~ To Leave the Letter.',
        ['NEXTJ'] = 'Go to the next house or return to GoPostal HUB to finish de delivery.'

        ['BLIP'] = 'Go Postal'
    },

    ['ES'] = {
        ['START_J'] = 'Presione ~INPUT_CONTEXT~ Para Empezar a ~b~trabajar~s~',
        ['STARTED_J'] = 'Has entrado de servicio',
        ['FINISH_J'] = 'Presione ~INPUT_CONTEXT~ Para Dejar de ~b~trabajar~s~',
        ['FINISHED_J'] = 'Has dejado de trabajar',

        ['SPWN_CAR'] = 'Presione ~INPUT_CONTEXT~ Para Sacar un ~b~coche~s~',
        ['DEL_CAR'] = 'Presione ~INPUT_CONTEXT~ Para Borrar el ~b~coche~s~',

        ['HOUSE'] = 'Presione ~INPUT_CONTEXT~ Para Dejar la Carta en el Buzón',
        ['NEXTJ'] = 'Dirijase a la siguiente casa o vuelva a la sede de GoPostal'

        ['BLIP'] = 'Go Postal'
    },

    ['FR'] = {
        ['START_J'] = 'Appuyez sur ~INPUT_CONTEXT~ pour commencer à ~b~travailler~s~',
        ['STARTED_J'] = 'Vous êtes venu en service',
        ['FINISH_J'] = 'Appuyez sur ~INPUT_CONTEXT~ pour arrêter ~b~working~s~',
        ['FINISHED_J'] = 'Vous avez cessé de travailler',

        ['SPWN_CAR'] = 'Appuyez sur ~INPUT_CONTEXT~ pour retirer une ~b~voiture~s~',
        ['DEL_CAR'] = 'Appuyez sur ~INPUT_CONTEXT~ pour supprimer la ~b~voiture~s~',

        ['HOUSE'] = 'Appuyez sur ~INPUT_CONTEXT~ pour laisser une lettre dans la boîte aux lettres',
        ['NEXTJ'] = 'Aller à la prochaine maison ou retourner au siège de GoPostal'

        ['BLIP'] = 'Go Postal'
    },

    ['DE'] = {
        ['START_J'] = 'Drücken Sie ~INPUT_CONTEXT~, um mit ~b~working~s~ zu beginnen',
        ['STARTED_J'] = 'Du bist im Dienst',
        ['FINISH_J'] = 'Drücken Sie ~INPUT_CONTEXT~, um die ~b~Arbeit~s~ zu stoppen',
        ['FINISHED_J'] = 'Sie haben aufgehört zu arbeiten',

        ['SPWN_CAR'] = 'Drücke ~INPUT_CONTEXT~, um ein ~b~Auto~s~ herauszunehmen',
        ['DEL_CAR'] = 'Drücken Sie ~INPUT_CONTEXT~, um das ~b~Auto~s~ zu löschen',

        ['HOUSE'] = 'Drücken Sie ~INPUT_CONTEXT~, um einen Brief in der Mailbox zu hinterlassen',
        ['NEXTJ'] = 'Gehe zum nächsten Haus oder kehre zur GoPostal-Zentrale zurück'

        ['BLIP'] = 'Go Postal'
    },

    ['RU'] = {
        ['START_J'] = 'Нажмите ~INPUT_CONTEXT~, чтобы начать ~b~работу~s~',
        ['STARTED_J'] = 'Вы пришли на дежурство',
        ['FINISH_J'] = 'Нажмите ~INPUT_CONTEXT~, чтобы остановить ~b~работу~s~',
        ['FINISHED_J'] = 'Вы прекратили работу',

        ['SPWN_CAR'] = 'Нажмите ~INPUT_CONTEXT~, чтобы вывести ~b~ТРАНСПОРТНОЕ СРЕДСТВО~s~',
        ['DEL_CAR'] = 'Нажмите ~INPUT_CONTEXT~, чтобы удалить ~b~ТРАНСПОРТНОЕ СРЕДСТВО~s~',

        ['HOUSE'] = 'Нажмите ~INPUT_CONTEXT~, чтобы оставить письмо в почтовом ящике',
        ['NEXTJ'] = 'Перейти к следующему дому или вернуться в штаб-квартиру GoPostal'

        ['BLIP'] = 'Go Postal'
    }
}

