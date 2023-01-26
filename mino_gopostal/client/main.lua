-- Mino Developings - Mino Developings - Mino Developings - Mino Developings - Mino Developings - Mino Developings - Mino Developings - Mino Developings --

Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

-- Don't touch this

ESX = nil 

CurrentJob = nil
service = true

vehout = false

delivery = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

RegisterCommand("coords", function()
	print(GetEntityCoords(PlayerPedId()))
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- Service

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

		if ESX ~= nil then
			PlayerJobInfo = ESX.PlayerData.job

			if PlayerJobInfo ~= nil then
				if PlayerJobInfo.name == "pilot" then
        			local playerPed = PlayerPedId()
					local coords = GetEntityCoords(playerPed)
					if GetDistanceBetweenCoords(coords, Config.Coords.service.X, Config.Coords.service.Y, Config.Coords.service.Z, true) < 20 then
						DrawMarker(27, Config.Coords.service.X, Config.Coords.service.Y, Config.Coords.service.Z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 255, 200, false, true, 2, nil, nil, false)
						if GetDistanceBetweenCoords(coords, Config.Coords.service.X, Config.Coords.service.Y, Config.Coords.service.Z, true) < 1.2 then
							if not service then 
								ESX.ShowHelpNotification(Config.Translations[Config.Language]['START_J'])
								if IsControlJustReleased(0, Keys['E']) then
									service = true
									ESX.ShowNotification(Config.Translations[Config.Language]['STARTED_J'])
									ChangeClothes()
								end
            				else
								ESX.ShowHelpNotification(Config.Translations[Config.Language]['FINISH_J'])
								if IsControlJustReleased(0, Keys['E']) then
									service = false
									ESX.ShowNotification(Config.Translations[Config.Language]['FINISHED_J'])
									GetClothes()
								end 
							end 
						end
					end
				end
            end
		end
    end
end)

-- Cars

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if ESX ~= nil then
			PlayerJobInfo = ESX.PlayerData.job

			if PlayerJobInfo ~= nil then
				if PlayerJobInfo.name == "pilot" then
					local playerPed = PlayerPedId()
					local coords = GetEntityCoords(playerPed)
					local distance = GetDistanceBetweenCoords(coords, Config.Coords.startj.X, Config.Coords.startj.Y, Config.Coords.startj.Z, true)
					local distance1 = GetDistanceBetweenCoords(coords, Config.Coords.cardel.X, Config.Coords.cardel.Y, Config.Coords.cardel.Z, true)
					if service == true then
						if vehout == false then
							if distance < 20 then
								DrawMarker(27, Config.Coords.startj.X, Config.Coords.startj.Y, Config.Coords.startj.Z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 0, 255, 200, false, true, 2, nil, nil, false)
								if distance < 1.2 then
									ESX.ShowHelpNotification(Config.Translations[Config.Language]['SPWN_CAR'])
									if IsControlJustReleased(0, Keys['E']) then
										ESX.Game.SpawnVehicle(Config.Car, vector3(Config.Coords.carspwn.X, Config.Coords.carspwn.Y, Config.Coords.carspwn.Z), 160.44, function(veh) 
											vehicle = veh
											SetVehicleNumberPlateText(veh, Config.Plate)
											TaskWarpPedIntoVehicle(playerPed, veh, -1)
										end)
										Job()
									end 
								end 
							end
						end
						if vehout == true then
							if distance1 < 20 then
								DrawMarker(23, Config.Coords.cardel.X, Config.Coords.cardel.Y, Config.Coords.cardel.Z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 0, 200, false, true, 2, nil, nil, false)
								if distance1 < 1.2 then
									ESX.ShowHelpNotification(Config.Translations[Config.Language]['DEL_CAR'])
									if IsControlJustReleased(0, Keys['E']) then
										Citizen.Wait(0)
										DeleteVehicle(GetVehiclePedIsIn(playerPed))
										RemoveBlip(blip_house)
										vehout = false
										delivery = false
									end
								end 
							end 
						end
					end
				end
			end 
		end 
	end
end)

function ChangeClothes()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        if skin.sex == 0 then
            TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.male)
        elseif skin.sex == 1 then
            TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.female)
        end
	end)
end

function GetClothes()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(CurrentSkin, jobSkin)
		local isMale = CurrentSkin.sex == 0
	
		TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(CurrentSkin)
				TriggerEvent('skinchanger:loadSkin', CurrentSkin)
			end)
		end)
	end)
end

function Job()
	delivery = true
	vehout = true

	nexthouse = math.random(1, #Config.Jobs)
	px = Config.Jobs[nexthouse].X
	py = Config.Jobs[nexthouse].Y
	pz = Config.Jobs[nexthouse].Z

	blip_house = AddBlipForCoord(px, py, pz)
	SetBlipSprite(blip_house, 1)
	SetBlipRoute(blip_house, true)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if delivery == true then
			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed)
			local distance2 = GetDistanceBetweenCoords(coords, px, py, pz, true)

			if distance2 < 20 then
				DrawMarker(27, px, py, pz, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 0, 255, 200, false, true, 2, nil, nil, false)
				if distance2 < 1.2 then
					ESX.ShowHelpNotification(Config.Translations[Config.Language]['HOUSE'])
					if IsControlJustReleased(0, Keys['E']) then
						Animation()
						TriggerServerEvent('mino_gopostal:PayMoney')
						RemoveBlip(blip_house)
						Job()
						ESX.ShowNotification(Config.Translations[Config.Language]['NEXTJ'])
					end 
				end
			end 
		end
	end
end)

function Animation()
	playAnim('mp_common', 'givetake1_a', 2500)
	Citizen.Wait(2500)
end 

function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end

-- Blips

CreateThread(function()
	local blip = AddBlipForCoord(Config.Coords.blip.X, Config.Coords.blip.Y, Config.Coords.blip.Z)

	SetBlipSprite (blip, 467)
	SetBlipColour (blip, 5)
	SetBlipAsShortRange(blip, true)
	SetBlipScale(blip, 1.0)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName(Config.Translations[Config.Language]['BLIP'])
	EndTextCommandSetBlipName(blip)
end)

