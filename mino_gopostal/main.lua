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
service = false

vehout1 = false
vehout2 = false
plane1 = false
plane2 = false

militar = false
sandy = false
seed = false

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
        Citizen.Wait(6)

		if ESX ~= nil then
			PlayerJobInfo = ESX.PlayerData.job

			if PlayerJobInfo ~= nil then
				if PlayerJobInfo.name == "pilot" then
        			local playerPed = PlayerPedId()
					local coords = GetEntityCoords(playerPed)
					if GetDistanceBetweenCoords(coords, Config.Coords.service.X, Config.Coords.service.Y, Config.Coords.service.Z, true) < 20 then
						DrawMarker(20, Config.Coords.service.X, Config.Coords.service.Y, Config.Coords.service.Z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 3, 57, 82, 200, false, true, 2, nil, nil, false)
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
		Citizen.Wait(6)
		if ESX ~= nil then
			PlayerJobInfo = ESX.PlayerData.job

			if PlayerJobInfo ~= nil then
				if PlayerJobInfo.name == "technician" then
					local playerPed = PlayerPedId()
					local coords = GetEntityCoords(playerPed)
					if service == true then
						if vehout1 == false then
							if GetDistanceBetweenCoords(coords, Config.Coords.carout1.X, Config.Coords.carout1.Y, Config.Coords.carout1.Z, true) < 20 then
								DrawMarker(36, Config.Coords.carout1.X, Config.Coords.carout1.Y, Config.Coords.carout1.Z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 3, 57, 82, 200, false, true, 2, nil, nil, false)
								if GetDistanceBetweenCoords(coords, Config.Coords.carout1.X, Config.Coords.carout1.Y, Config.Coords.carout1.Z, true) < 1.2 then
									ESX.ShowHelpNotification(Config.Translations[Config.Language]['SPWN_CAR'])
									if IsControlJustReleased(0, Keys['E']) then
										blip1 = AddBlipForCoord(vector3(Config.Coords.cardel1.X, Config.Coords.cardel1.Y, Config.Coords.cardel1.Z))
										ESX.Game.SpawnVehicle(Config.Car, vector3(Config.Coords.carspwn1.X, Config.Coords.carspwn1.Y, Config.Coords.carspwn1.Z), Config.Coords.carspwn1.H, function(veh)
											vehicle = veh
											SetVehicleNumberPlateText(veh, Config.Plate)
											TaskWarpPedIntoVehicle(playerPed, veh, -1)
											vehout1 = true
										end)
									end
								end 
							end 
						end
						if vehout1 == true then
							if GetDistanceBetweenCoords(coords, Config.Coords.cardel1.X, Config.Coords.cardel1.Y, Config.Coords.cardel1.Z, true) < 20 then
								DrawMarker(23, Config.Coords.cardel1.X, Config.Coords.cardel1.Y, Config.Coords.cardel1.Z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 0, 0, 200, false, true, 2, nil, nil, false)
								if GetDistanceBetweenCoords(coords, Config.Coords.cardel1.X, Config.Coords.cardel1.Y, Config.Coords.cardel1.Z, true) < 1.2 then
									ESX.ShowHelpNotification(Config.Translations[Config.Language]['DEL_CAR'])
									if IsControlJustReleased(0, Keys['E']) then
										DeleteVehicle(GetVehiclePedIsIn(playerPed))
										vehout1 = false
										RemoveBlip(blip1)
									end
								end 
							end 
						end
						if vehout2 == false then
							if GetDistanceBetweenCoords(coords, Config.Coords.carout2.X, Config.Coords.carout2.Y, Config.Coords.carout2.Z, true) < 20 then
								DrawMarker(36, Config.Coords.carout2.X, Config.Coords.carout2.Y, Config.Coords.carout2.Z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 3, 57, 82, 200, false, true, 2, nil, nil, false)
								if GetDistanceBetweenCoords(coords, Config.Coords.carout2.X, Config.Coords.carout2.Y, Config.Coords.carout2.Z, true) < 1.2 then
									ESX.ShowHelpNotification(Config.Translations[Config.Language]['SPWN_CAR'])
									if IsControlJustReleased(0, Keys['E']) then
										blip2 = AddBlipForCoord(vector3(Config.Coords.carout1.X, Config.Coords.carout1.Y, Config.Coords.carout1.Z))
										ESX.Game.SpawnVehicle(Config.Car, vector3(Config.Coords.carspwn2.X, Config.Coords.carspwn2.Y, Config.Coords.carspwn2.Z), Config.Coords.carspwn2.H, function(veh)
											vehicle = veh
											SetVehicleNumberPlateText(veh, Config.Plate)
											TaskWarpPedIntoVehicle(playerPed, veh, -1)
											vehout2 = true
										end)
									end
								end 
							end 
						end
						if vehout2 == true then
							if GetDistanceBetweenCoords(coords, Config.Coords.cardel2.X, Config.Coords.cardel2.Y, Config.Coords.cardel2.Z, true) < 20 then
								DrawMarker(23, Config.Coords.cardel2.X, Config.Coords.cardel2.Y, Config.Coords.cardel2.Z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 0, 0, 200, false, true, 2, nil, nil, false)
								if GetDistanceBetweenCoords(coords, Config.Coords.cardel2.X, Config.Coords.cardel2.Y, Config.Coords.cardel2.Z, true) < 1.2 then
									ESX.ShowHelpNotification(Config.Translations[Config.Language]['DEL_CAR'])
									if IsControlJustReleased(0, Keys['E']) then
										Citizen.Wait(0)
										DeleteVehicle(GetVehiclePedIsIn(playerPed))
										vehout2 = false
										RemoveBlip(blip2)
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

-- Job

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(6)
		if ESX ~= nil then
			PlayerJobInfo = ESX.PlayerData.job

			if PlayerJobInfo ~= nil then
				if PlayerJobInfo.name == "technician" then
					local playerPed = PlayerPedId()
					local coords = GetEntityCoords(playerPed)
					if service == true then
						if plane1 == false then
							if GetDistanceBetweenCoords(coords, Config.Coords.planesel.X, Config.Coords.planesel.Y, Config.Coords.planesel.Z, true) < 20 then
								DrawMarker(33, Config.Coords.planesel.X, Config.Coords.planesel.Y, Config.Coords.planesel.Z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 3, 57, 82, 200, false, true, 2, nil, nil, false)
								if GetDistanceBetweenCoords(coords, Config.Coords.planesel.X, Config.Coords.planesel.Y, Config.Coords.planesel.Z, true) < 1.2 then
									ESX.ShowHelpNotification(Config.Translations[Config.Language]['START_JOB'])
									if IsControlJustReleased(0, Keys['E']) then
										MenuPlane()
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

function MenuPlane()
	local menuOpened = true
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	ESX.UI.Menu.Open("default", GetCurrentResourceName(), "menu_plane", {
		title = Config.Translations[Config.Language]['SEL_DEST'],
		align = "bottom-right",
		elements = {
			{label = "Fort Zancudo", value = "militar_base"},
			{label = "Sandy Shores", value = "sandy"},
			{label = "Grapeseed", value = "grapeseed"}
		}
	}, 
	function(Data, MenuPlane)
		if Data.current.value == "militar_base" then
			ESX.Game.SpawnVehicle("bombushka", vector3(Config.Coords.planespwn.X, Config.Coords.planespwn.Y, Config.Coords.planespwn.Z), Config.Coords.planespwn.H, function(veh)
				vehicle = veh
				TaskWarpPedIntoVehicle(playerPed, veh, -1)
			end)
			blipfort = AddBlipForCoord(vector3(Config.Coords.militar.X, Config.Coords.militar.Y, Config.Coords.militar.Z))
			militar = true
		elseif Data.current.value == "sandy" then 
			ESX.Game.SpawnVehicle("miljet", vector3(Config.Coords.planespwn.X, Config.Coords.planespwn.Y, Config.Coords.planespwn.Z), Config.Coords.planespwn.H, function(veh)
				vehicle = veh
				TaskWarpPedIntoVehicle(playerPed, veh, -1)
			end)
			blipsandy = AddBlipForCoord(vector3(Config.Coords.sandy.X, Config.Coords.sandy.Y, Config.Coords.sandy.Z))
			sandy = true
		elseif Data.current.value == "grapeseed" then 
			ESX.Game.SpawnVehicle("velum", vector3(Config.Coords.planespwn.X, Config.Coords.planespwn.Y, Config.Coords.planespwn.Z), Config.Coords.planespwn.H, function(veh)
				vehicle = veh
				TaskWarpPedIntoVehicle(playerPed, veh, -1)
			end)
			blipseed = AddBlipForCoord(vector3(Config.Coords.seed.X, Config.Coords.seed.Y, Config.Coords.seed.Z))
			seed = true
		end

		MenuPlane.close()
		menuOpened = false
	end,
	
	function(Data, MenuPlane)
		MenuPlane.close()
		MenuOpened = false
	end)
end

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		Citizen.Wait(6) 

		if militar == true then
			if GetDistanceBetweenCoords(coords, Config.Coords.militar.X, Config.Coords.militar.Y, Config.Coords.militar.Z, true) < 50 then
				DrawMarker(23, Config.Coords.militar.X, Config.Coords.militar.Y, Config.Coords.militar.Z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 7.0, 7.0, 7.0, 255, 0, 0, 200, false, true, 2, nil, nil, false)
				if GetDistanceBetweenCoords(coords, Config.Coords.militar.X, Config.Coords.militar.Y, Config.Coords.militar.Z, true) < 5 then
					ESX.ShowHelpNotification(Config.Translations[Config.Language]['EMPTY_CARGO'])

					if IsControlJustReleased(0, Keys['E']) then
						ESX.ShowNotification(Config.Translations[Config.Language]['EMPTY'])
						RemoveBlip(blipfort)
						plane2 = true
						blipairport = AddBlipForCoord(vector3(Config.Coords.airport.X, Config.Coords.airport.Y, Config.Coords.airport.Z))
					end
				end
			end 
		end

		if sandy == true then
			if GetDistanceBetweenCoords(coords, Config.Coords.sandy.X, Config.Coords.sandy.Y, Config.Coords.sandy.Z, true) < 50 then
				DrawMarker(23, Config.Coords.sandy.X, Config.Coords.sandy.Y, Config.Coords.sandy.Z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 7.0, 7.0, 7.0, 255, 0, 0, 200, false, true, 2, nil, nil, false)
				if GetDistanceBetweenCoords(coords, Config.Coords.sandy.X, Config.Coords.sandy.Y, Config.Coords.sandy.Z, true) < 5 then
					ESX.ShowHelpNotification(Config.Translations[Config.Language]['EMPTY_CARGO'])
					if IsControlJustReleased(0, Keys['E']) then
						ESX.ShowNotification(Config.Translations[Config.Language]['EMPTY'])
						RemoveBlip(blipsandy)
						plane2 = true
						blipairport = AddBlipForCoord(vector3(Config.Coords.airport.X, Config.Coords.airport.Y, Config.Coords.airport.Z))
					end 
				end
			end 
		end

		if seed == true then
			if GetDistanceBetweenCoords(coords, Config.Coords.seed.X, Config.Coords.seed.Y, Config.Coords.seed.Z, true) < 50 then
				DrawMarker(23, Config.Coords.seed.X, Config.Coords.seed.Y, Config.Coords.seed.Z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 7.0, 7.0, 7.0, 255, 0, 0, 200, false, true, 2, nil, nil, false)
				if GetDistanceBetweenCoords(coords, Config.Coords.seed.X, Config.Coords.seed.Y, Config.Coords.seed.Z, true) < 5 then
					ESX.ShowHelpNotification(Config.Translations[Config.Language]['EMPTY_CARGO'])
					if IsControlJustReleased(0, Keys['E']) then
						ESX.ShowNotification(Config.Translations[Config.Language]['EMPTY'])
						RemoveBlip(blipseed)
						plane2 = true
						blipairport = AddBlipForCoord(vector3(Config.Coords.airport.X, Config.Coords.airport.Y, Config.Coords.airport.Z))
					end 
				end
			end 
		end
	end
end)

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(6)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		if plane2 == true then
			militar = false
			sandy = false
			seed = false	
			if GetDistanceBetweenCoords(coords, Config.Coords.airport.X, Config.Coords.airport.Y, Config.Coords.airport.Z, true) < 20 then
				DrawMarker(23, Config.Coords.airport.X, Config.Coords.airport.Y, Config.Coords.airport.Z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 30.0, 30.0, 30.0, 3, 57, 82, 200, false, true, 2, nil, nil, false)
				if GetDistanceBetweenCoords(coords, Config.Coords.airport.X, Config.Coords.airport.Y, Config.Coords.airport.Z, true) < 5 then
					Citizen.Wait(0)
					ESX.ShowHelpNotification(Config.Translations[Config.Language]['DEL_PLANE'])
					if IsControlJustReleased(0, Keys['E']) then
						DeleteVehicle(GetVehiclePedIsIn(playerPed))
						RemoveBlip(blipairport)
						ESX.ShowNotification(Config.Translations[Config.Language]['GIVE_MONEY'])
						plane2 = false
						TriggerServerEvent('mino_planejob:PayMoney')
					end 
				end
			end
		end 
	end 
end)

-- Blips

CreateThread(function()
	local blip = AddBlipForCoord(Config.Coords.blip.X, Config.Coords.blip.Y, Config.Coords.blip.Z)

	SetBlipSprite (blip, 307)
	SetBlipColour (blip, 26)
	SetBlipAsShortRange(blip, true)
	SetBlipScale(blip, 1.5)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName(Config.Translations[Config.Language]['BLIP'])
	EndTextCommandSetBlipName(blip)
end)
