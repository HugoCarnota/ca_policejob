local CurrentActionData, handcuffTimer, dragStatus, blipsCops, currentTask = {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, isHandcuffed, hasAlreadyJoined, playerInService = false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged, isInShopMenu = false, false
local hasShot = false

local CurrentAsignation = 'Sin Asignación'

ESX = nil

local PlayerData              = {}
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	-- LOCALIZADOR --

	local blips = {}

	RegisterNetEvent('chaini_policiaRefuerzos:ClDelete')
	AddEventHandler('chaini_policiaRefuerzos:ClDelete', function(source)
	
		RemoveBlip(blips[source])
		blips[source] = nil
		ESX.TriggerServerCallback('chaini_policiaRefuerzos:getName',function(name, asign)
			ESX.ShowNotification(asign.. ' | '..name.." ha desactivado su localizador")
		end,source)
	end)
	
	RegisterNetEvent('chaini_policiaRefuerzos:ClmanageRef')
	AddEventHandler('chaini_policiaRefuerzos:ClmanageRef', function(source,pos,color)
	
		if blips[source] then
			SetBlipCoords(blips[source], pos.x,pos.y,pos.z)
		else
			blips[source] = AddBlipForCoord(pos.x, pos.y, pos.z)
			ESX.TriggerServerCallback('chaini_policiaRefuerzos:getName',function(name, asign)
				Citizen.Wait(100)
				ESX.ShowNotification(asign.. ' | '..name.." ha activado su localizador")
				Citizen.Wait(100)
				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName(asign..' | '..name)
				EndTextCommandSetBlipName(blips[source]) 
			end,source)
			SetBlipColour(blips[source], color)
		end
	end) 

	--

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	Citizen.Wait(5000)
	if ESX.PlayerData.job.name == 'police' then
		Citizen.Wait(1000)
		exports.ft_libs:EnableArea("esx_eden_garage_area_Deposito1_mecanodeletepoint")
		exports.ft_libs:EnableArea("esx_eden_garage_area_Deposito2_mecanodeletepoint")
		exports.ft_libs:EnableArea("esx_eden_garage_area_Deposito1_mecanospawnpoint")
		exports.ft_libs:EnableArea("esx_eden_garage_area_Deposito2_mecanospawnpoint")
	else
		Citizen.Wait(1000)
		exports.ft_libs:DisableArea("esx_eden_garage_area_Deposito1_mecanodeletepoint")
		exports.ft_libs:DisableArea("esx_eden_garage_area_Deposito2_mecanodeletepoint")
		exports.ft_libs:DisableArea("esx_eden_garage_area_Deposito1_mecanospawnpoint")
		exports.ft_libs:DisableArea("esx_eden_garage_area_Deposito2_mecanospawnpoint")
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	Citizen.Wait(5000)
	if PlayerData.job.name == 'police' then
		Citizen.Wait(100)
		exports.ft_libs:EnableArea("esx_eden_garage_area_Deposito1_mecanodeletepoint")
		exports.ft_libs:EnableArea("esx_eden_garage_area_Deposito2_mecanodeletepoint")
		Citizen.Wait(100)
		exports.ft_libs:EnableArea("esx_eden_garage_area_Deposito1_mecanospawnpoint")
		exports.ft_libs:EnableArea("esx_eden_garage_area_Deposito2_mecanospawnpoint")
	else
		Citizen.Wait(100)
		exports.ft_libs:DisableArea("esx_eden_garage_area_Deposito1_mecanodeletepoint")
		exports.ft_libs:DisableArea("esx_eden_garage_area_Deposito2_mecanodeletepoint")
		Citizen.Wait(100)
		exports.ft_libs:DisableArea("esx_eden_garage_area_Deposito1_mecanospawnpoint")
		exports.ft_libs:DisableArea("esx_eden_garage_area_Deposito2_mecanospawnpoint")
	end
end)

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function setUniform(uniform, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		local uniformObject

		if skin.sex == 0 then
			uniformObject = Config.Uniforms[uniform].male
		else
			uniformObject = Config.Uniforms[uniform].female
		end

		if uniformObject then
			TriggerEvent('skinchanger:loadClothes', skin, uniformObject)

			if uniform == 'bullet_wear' then
				--SetPedArmour(playerPed, 100)
			end
		else
			ESX.ShowNotification(_U('no_outfit'))
		end
	end)
end

openCustomClothesMenu = function()
    ESX.TriggerServerCallback('esx_policejob:getCustomOutfits', function(result)
        local elements = {}
        for i = 1, #result, 1 do
            table.insert(elements, {label = result[i]['label'], value = result[i]['skin'], id = result[i]['id']})
        end
        ESX.UI.Menu.Open('default',GetCurrentResourceName(),"custom_menu_outfits",
        { 
        title = "Uniformes", 
        align = "bottom-right", 
        elements = elements 
        }, function(data, menu)
			openOptionsCustomClothesMenu(data.current.value, data.current.id)
        end, function(data, menu) 
        menu.close() 
        end)
    end)
end

openOptionsCustomClothesMenu = function(value, id)
	local elements = {}
	table.insert(elements, {label = "Establecer Outfit", value = "ponerOutfit"})
	--table.insert(elements, {label = "Eliminar Outfit", value = "removeOutfit"})

	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'right',
		elements = elements
	}, function(data, menu)
		cleanPlayer(playerPed)

		if data.current.value == 'ponerOutfit' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadClothes', skin, value)
            end)
			menu.close()
		end

		if data.current.value == 'removeOutfit' then
			TriggerServerEvent('esx_policejob:removeCustomClothes', id)
			ESX.ShowNotification('Has eliminado el conjunto')
			menu.close()
		end
	end, function(data, menu)
		menu.close()
	end)
end

setSexCustomOutfit = function(clothes, vestimenta, rango)
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'sexo', {
		title = "Introduce el Sexo (m o f)",
	}, function (data3, menu3)
		local sexo = data3.value
		
		if sexo ~= nil then
			TriggerServerEvent('esx_policejob:customOutfit', clothes, vestimenta, rango, sexo)
			menu3.close()
		end

	end, function (data3, menu3)
		menu3.close()
	end)
end

setGradeCustomOutfit = function(clothes, vestimenta)
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'rango', {
		title = "Introduce el Rango (Número del Grado)",
	}, function (data2, menu2)
		local rango = data2.value
		
		if rango ~= nil then
			if rango == cadete then
				rango = 0
				setSexCustomOutfit(clothes, vestimenta, rango)
			else
				setSexCustomOutfit(clothes, vestimenta, rango)
			end
		end

	end, function (data2, menu2)
		menu2.close()
	end)
end

function OpenCloakroomMenu()
	local playerPed = PlayerPedId()
	local grade = ESX.PlayerData.job.grade_name

	local elements = {
		--{label = _U('citizen_wear'), value = 'citizen_wear'},
		--{label = _U('police_wear'), uniform = grade},
		--{label = _U('gilet_wear'), uniform = 'gilet_wear'},
		{label = "Menú EUP", value = 'eup'},
		--{label = "Limpiar Uniforme", uniform = 'bullet_wear'},
		{label = 'Vestimentas', value = 'vestimentas_usuario'},
		{label = 'Coger chaleco', value = 'coger_chaleto'}, --hashashin		
		{label = 'Taquilla Personal', value = 'taquilla_personal'}						
	}

	if Config.EnableCustomPeds then
		for k,v in ipairs(Config.CustomPeds.shared) do
			table.insert(elements, {label = v.label, value = 'freemode_ped', maleModel = v.maleModel, femaleModel = v.femaleModel})
		end

		for k,v in ipairs(Config.CustomPeds[grade]) do
			table.insert(elements, {label = v.label, value = 'freemode_ped', maleModel = v.maleModel, femaleModel = v.femaleModel})
		end
	end
	
	-- if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
	-- 	table.insert(elements, {label = 'Uniformes de Servicio', value = 'openCustomOutfit'})
	-- 	-- table.insert(elements, {label = "Guardar Vestimentas", value = 'setCustomOutfit'})
	-- end

	-- if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade_name == 'boss' then
	-- 	-- table.insert(elements, {label = 'Uniformes de Servicio', value = 'openCustomOutfit'})
	-- 	table.insert(elements, {label = "Guardar Vestimentas", value = 'setCustomOutfit'})
	-- end

	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'right',
		elements = elements
	}, function(data, menu)
		cleanPlayer(playerPed)

		if data.current.value == 'taquilla_personal' then
			OpenPersonalInventory()
		end

		if data.current.value == 'openCustomOutfit' then
			openCustomClothesMenu()
		end

		if data.current.value == 'setCustomOutfit' then
			TriggerEvent('skinchanger:getSkin', function(skin) plySkin = skin; end)
    		local clothes = plySkin
			ESX.UI.Menu.CloseAll()
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Vestimenta_Custom', {
				title = "Introduce un nombre para la vestimenta",
			}, function (data, menu)
				local vestimentasCustom = data.value
				
				if vestimentasCustom ~= nil then
					setGradeCustomOutfit(clothes, vestimentasCustom)
				end

			end, function (data, menu)
				menu.close()
			end)
		end

		if data.current.value == 'citizen_wear' then
			if Config.EnableNonFreemodePeds then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local isMale = skin.sex == 0

					TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
							TriggerEvent('esx:restoreLoadout')
						end)
					end)

				end)
			else
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

			if Config.EnableESXService then
				ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
					if isInService then
						playerInService = false

						local notification = {
							title    = _U('service_anonunce'),
							subject  = '',
							msg      = _U('service_out_announce', GetPlayerName(PlayerId())),
							iconType = 1
						}

						TriggerServerEvent('esx_service:notifyAllInService', notification, 'police')

						TriggerServerEvent('esx_service:disableService', 'police')
						TriggerEvent('esx_policejob:updateBlip')
						ESX.ShowNotification(_U('service_out'))
					end
				end, 'police')
			end
		end

		if data.current.value == 'vestimentas_usuario' then
			ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)
				local elements = {}
				for i=1, #dressing, 1 do
				  table.insert(elements, {label = dressing[i], value = i})
				end
	  
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
					title    = 'Tus vestimentas',
					align    = 'right',
					elements = elements,
				  }, function(data, menu)
	  
					TriggerEvent('skinchanger:getSkin', function(skin)
	  
					  ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerOutfit', function(clothes)
	  
						TriggerEvent('skinchanger:loadClothes', skin, clothes)
						TriggerEvent('esx_skin:setLastSkin', skin)
	  
						TriggerEvent('skinchanger:getSkin', function(skin)
						  TriggerServerEvent('esx_skin:save', skin)
						end)
						
						ESX.ShowNotification('Vestimenta puesta')
						HasLoadCloth = true
					  end, data.current.value)
					end)
				  end, function(data, menu)
					menu.close()
					
					CurrentAction     = 'shop_menu'
					CurrentActionMsg  = 'Presiona'
					CurrentActionData = {}
				  end
				)
			end)
		end


		if Config.EnableESXService and data.current.value ~= 'citizen_wear' then
			local awaitService

			ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
				if not isInService then

					ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
						if not canTakeService then
							ESX.ShowNotification(_U('service_max', inServiceCount, maxInService))
						else
							awaitService = true
							playerInService = true

							local notification = {
								title    = _U('service_anonunce'),
								subject  = '',
								msg      = _U('service_in_announce', GetPlayerName(PlayerId())),
								iconType = 1
							}

							TriggerServerEvent('esx_service:notifyAllInService', notification, 'police')
							TriggerEvent('esx_policejob:updateBlip')
							ESX.ShowNotification(_U('service_in'))
						end
					end, 'police')

				else
					awaitService = true
				end
			end, 'police')

			while awaitService == nil do
				Citizen.Wait(5)
			end

			-- if we couldn't enter service don't let the player get changed
			if not awaitService then
				return
			end
		end

		if data.current.uniform then
			setUniform(data.current.uniform, playerPed)
			--SetPedArmour(playerPed, 100)
		elseif data.current.value == 'coger_chaleto' then --hashashin
			TriggerServerEvent('esx_policejob:darchalecop')
		elseif data.current.value == 'eup' then
			ESX.TriggerServerCallback(
				"esx_skin:getPlayerSkin",
				function(skin, jobSkin)
					OpenEUPClothesMenu('police', skin.sex)
				end
			)
			--SetPedArmour(playerPed, 100)
		elseif data.current.value == 'freemode_ped' then
			local modelHash

			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					modelHash = GetHashKey(data.current.maleModel)
				else
					modelHash = GetHashKey(data.current.femaleModel)
				end

				ESX.Streaming.RequestModel(modelHash, function()
					SetPlayerModel(PlayerId(), modelHash)
					SetModelAsNoLongerNeeded(modelHash)
					SetPedDefaultComponentVariation(PlayerPedId())
					TriggerEvent('esx:restoreLoadout')
				end)
			end)
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end)
end


function OpenEUPClothesMenu(masterJob, sex)
	local elements = {}
	local categoryOutfits = {}

	for name, outfit in pairs(Config.EUPOutFits) do
		if not categoryOutfits[outfit.category] then
			categoryOutfits[outfit.category] = {}
		end
		if (sex == 0 and outfit.ped == "mp_m_freemode_01") or (sex == 1 and outfit.ped == "mp_f_freemode_01") then
			categoryOutfits[outfit.category][name] = outfit
		end
	end
	for _, categoryName in pairs(sortedKeys(categoryOutfits)) do
		if (EUPCategoryAllowed(masterJob, categoryName)) then
			table.insert(elements, {label = categoryName, value = categoryName})
		end
	end
	ESX.UI.Menu.Open(
		"default",
		GetCurrentResourceName(),
		"eupcategories",
		{
			title = "Ropa EUP",
			align = "bottom-right",
			elements = elements
		},
		function(data, menu)
			local elements2 = {}
			local selectedCategory = data.current.value
			local fisrtOutFit = nil
			for _, name in pairs(sortedKeys(categoryOutfits[selectedCategory])) do
				if(fisrtOutFit == nil) then
					fisrtOutFit = name
				end
				table.insert(elements2, {label = name, value = name})
			end
			local selected = false
			setEUPOutfit(categoryOutfits[selectedCategory][fisrtOutFit], sex)
			ESX.UI.Menu.Open(
				"default",
				GetCurrentResourceName(),
				"eupclothes",
				{
					title = "Ropa EUP - " .. selectedCategory,
					align = "bottom-right",
					elements = elements2
				},
				function(dataOutfit, menuOutfit)
					selected = true
					local selectedEUPOutfit = dataOutfit.current.value
					setEUPOutfit(categoryOutfits[selectedCategory][selectedEUPOutfit], sex)
					if (categoryOutfits[selectedCategory][selectedEUPOutfit].armor ~= nil) then
						SetPedArmour(PlayerPedId(), categoryOutfits[selectedCategory][selectedEUPOutfit].armor)
					else
						SetPedArmour(PlayerPedId(), 0)
					end
				end,
				function(dataOutfit, menuOutfit)
					menuOutfit.close()
					fisrtOutFit = nil
					if(selected == false)then
						ESX.TriggerServerCallback(
							"esx_skin:getPlayerSkin",
							function(skin)
								TriggerEvent("skinchanger:loadSkin", skin)
							end
						)
					end
				end,
				function(dataOutfit, menuOutfit)
					local selectedEUPOutfit = dataOutfit.current.value
					setEUPOutfit(categoryOutfits[selectedCategory][selectedEUPOutfit], sex)
				end
				
			)
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function sortedKeys(query, sortFunction)
	local keys, len = {}, 0
	for k, _ in pairs(query) do
		len = len + 1
		keys[len] = k
	end
	table.sort(keys, sortFunction)
	return keys
end
function EUPCategoryAllowed(masterJob, category)
	local category = Config.EUPOutFitsCategories[category]
	if (category ~= nil) then
		for _, k in pairs(category.jobs) do
			if (k == masterJob) then
				return true
			end
		end
		return false
	end
	return true
end

function setEUPOutfit(outfit, sex)
	local ped = PlayerPedId()
	local skinEup = TranslateEupToSkinChanger(outfit, sex)
	TriggerEvent('skinchanger:getSkin', function(skin)
		TriggerEvent('skinchanger:loadClothes', skin, skinEup)
	end)
end
function GetEUPComponentVariationForId(outfit, id, variation)
	for _, comp in ipairs(outfit.components) do
		if(comp[1] == id)then
			return comp[variation]
		end
	end
	return nil
end
function GetEUPPropIndexForId(outfit, id, variation)
	for _, comp in ipairs(outfit.props) do
		if(comp[1] == id)then
			return comp[variation]
		end
	end
	return nil
end


function TranslateEupToSkinChanger(outfit, sex)
	
	local skin = {
		['mask_1'] = GetEUPComponentVariationForId(outfit, 1, 2) - 1,  
		['mask_2'] = GetEUPComponentVariationForId(outfit, 1, 3) - 1,

		['arms'] = GetEUPComponentVariationForId(outfit, 3, 2) - 1,  
		['arms_2'] = GetEUPComponentVariationForId(outfit, 3, 3) - 1,

		['pants_1'] = GetEUPComponentVariationForId(outfit, 4, 2) - 1,  
		['pants_2'] = GetEUPComponentVariationForId(outfit, 4, 3) - 1,

		['bags_1'] = GetEUPComponentVariationForId(outfit, 5, 2) - 1,  
		['bags_2'] = GetEUPComponentVariationForId(outfit, 5, 3) - 1,

		['shoes_1'] = GetEUPComponentVariationForId(outfit, 6, 2) - 1,  
		['shoes_2'] = GetEUPComponentVariationForId(outfit, 6, 3) - 1,

		['chain_1'] =  GetEUPComponentVariationForId(outfit, 7, 2) - 1,  
		['chain_2'] = GetEUPComponentVariationForId(outfit, 7, 3) - 1,

		['tshirt_1'] = GetEUPComponentVariationForId(outfit, 8, 2) - 1,  
		['tshirt_2'] = GetEUPComponentVariationForId(outfit, 8, 3) - 1,  

		['bproof_1'] = GetEUPComponentVariationForId(outfit, 9, 2) - 1,  
		['bproof_2'] = GetEUPComponentVariationForId(outfit, 9, 3) - 1,  

		['decals_1'] = GetEUPComponentVariationForId(outfit, 10, 2) - 1,  
		['decals_2'] = GetEUPComponentVariationForId(outfit, 10, 3) - 1,

		['torso_1'] = GetEUPComponentVariationForId(outfit, 11, 2) - 1,  
		['torso_2'] = GetEUPComponentVariationForId(outfit, 11, 3) - 1,
		
		['helmet_1'] =  GetEUPPropIndexForId(outfit, 0, 2) - 1,  
		['helmet_2'] = GetEUPPropIndexForId(outfit, 0, 3) - 1, 
		['glasses_1'] =  GetEUPPropIndexForId(outfit, 1, 2) - 1,  
		['glasses_2'] = GetEUPPropIndexForId(outfit, 1, 3) - 1, 
		['ears_1'] =  GetEUPPropIndexForId(outfit, 2, 2) - 1,   
		['ears_2'] =  GetEUPPropIndexForId(outfit, 2, 3) - 1,  
	}
	if(sex == 0)then --male
		if(skin['mask_1'] >= 8)then --ok
			skin['mask_1'] = skin['mask_1'] + 6
		end
		if(skin['arms'] >= 16)then --ok
			skin['arms'] = skin['arms'] + 2
		end
		if(skin['pants_1'] >= 16)then --ok
			skin['pants_1'] = skin['pants_1'] + 31
		end
		if(skin['bags_1'] > 9)then --ok
			skin['bags_1'] = skin['bags_1'] + 2
		end
		if(skin['shoes_1'] >= 16)then --ok
			skin['shoes_1'] = skin['shoes_1'] + 46
		end
		if(skin['chain_1'] >= 16)then
			skin['chain_1'] = skin['chain_1'] + 36
		end
		if(skin['tshirt_1'] >= 16)then -- ok
			skin['tshirt_1'] = skin['tshirt_1'] + 3
		end
		if(skin['bproof_1'] > 9)then --ok
			skin['bproof_1'] = skin['bproof_1'] + 2
		end
		if(skin['decals_1'] >= 16)then --ok
			skin['decals_1'] = skin['decals_1'] + 2
		end
		if(skin['torso_1'] >= 16)then --ok
			skin['torso_1'] = skin['torso_1'] + 100
		end

		if(skin['helmet_1'] >= 20)then --ok
			skin['helmet_1'] = skin['helmet_1'] + 36
		end
		if(skin['glasses_1'] >= 16)then
			skin['glasses_1'] = skin['glasses_1']
		end
		if(skin['ears_1'] >= 16)then
			skin['ears_1'] = skin['ears_1']
		end
	else --female
		if(skin['mask_1'] >= 8)then --ok
			skin['mask_1'] = skin['mask_1'] + 9
		end
		if(skin['arms'] >= 16)then --ok
			skin['arms'] = skin['arms'] + 2
		end
		if(skin['pants_1'] >= 16)then --ok
			skin['pants_1'] = skin['pants_1'] + 36
		end
		if(skin['bags_1'] >= 9)then --ok
			skin['bags_1'] = skin['bags_1'] + 7
		end
		if(skin['shoes_1'] >= 16)then --ok
			skin['shoes_1'] = skin['shoes_1'] + 48
		end
		if(skin['chain_1'] >= 16)then
			skin['chain_1'] = skin['chain_1'] + 13
		end
		if(skin['tshirt_1']>= 16)then -- ok
			skin['tshirt_1'] = skin['tshirt_1'] + 28
		end
		if(skin['bproof_1'] >= 8)then --ok
			skin['bproof_1'] = skin['bproof_1'] + 7
		end
		if(skin['decals_1'] >= 16)then --ok
			skin['decals_1'] = skin['decals_1'] + 5
		end
		if(skin['torso_1'] >= 16)then --ok
			skin['torso_1'] = skin['torso_1'] + 112
		end
	
		if(skin['helmet_1'] >= 20)then --ok
			skin['helmet_1'] = skin['helmet_1'] + 42
		end
		if(skin['glasses_1'] >= 16)then
			skin['glasses_1'] = skin['glasses_1'] + 4
		end
		if(skin['ears_1'] >= 16)then
			skin['ears_1'] = skin['ears_1'] + 1
		end
	end
	return skin
end

-- function TranslateEupToSkinChanger(outfit, sex)
	
-- 	local skin = {
-- 		['mask_1'] = GetEUPComponentVariationForId(outfit, 1, 2) - 1,  
-- 		['mask_2'] = GetEUPComponentVariationForId(outfit, 1, 3) - 1,

-- 		['arms'] = GetEUPComponentVariationForId(outfit, 3, 2) - 1,  
-- 		['arms_2'] = GetEUPComponentVariationForId(outfit, 3, 3) - 1,

-- 		['pants_1'] = GetEUPComponentVariationForId(outfit, 4, 2) - 1,  
-- 		['pants_2'] = GetEUPComponentVariationForId(outfit, 4, 3) - 1,

-- 		['bags_1'] = GetEUPComponentVariationForId(outfit, 5, 2) - 1,  
-- 		['bags_2'] = GetEUPComponentVariationForId(outfit, 5, 3) - 1,

-- 		['shoes_1'] = GetEUPComponentVariationForId(outfit, 6, 2) - 1,  
-- 		['shoes_2'] = GetEUPComponentVariationForId(outfit, 6, 3) - 1,

-- 		['chain_1'] =  GetEUPComponentVariationForId(outfit, 7, 2) - 1,  
-- 		['chain_2'] = GetEUPComponentVariationForId(outfit, 7, 3) - 1,

-- 		['tshirt_1'] = GetEUPComponentVariationForId(outfit, 8, 2) - 1,  
-- 		['tshirt_2'] = GetEUPComponentVariationForId(outfit, 8, 3) - 1,  

-- 		['bproof_1'] = GetEUPComponentVariationForId(outfit, 9, 2) - 1,  
-- 		['bproof_2'] = GetEUPComponentVariationForId(outfit, 9, 3) - 1,  

-- 		['decals_1'] = GetEUPComponentVariationForId(outfit, 10, 2) - 1,  
-- 		['decals_2'] = GetEUPComponentVariationForId(outfit, 10, 3) - 1,

-- 		['torso_1'] = GetEUPComponentVariationForId(outfit, 11, 2) - 1,  
-- 		['torso_2'] = GetEUPComponentVariationForId(outfit, 11, 3) - 1,
		
-- 		['helmet_1'] =  GetEUPPropIndexForId(outfit, 0, 2) - 1,  
-- 		['helmet_2'] = GetEUPPropIndexForId(outfit, 0, 3) - 1, 
-- 		['glasses_1'] =  GetEUPPropIndexForId(outfit, 1, 2) - 1,  
-- 		['glasses_2'] = GetEUPPropIndexForId(outfit, 1, 3) - 1, 
-- 		['ears_1'] =  GetEUPPropIndexForId(outfit, 2, 2) - 1,   
-- 		['ears_2'] =  GetEUPPropIndexForId(outfit, 2, 3) - 1,  
-- 	}
-- 	if(sex == 0)then --male
-- 		if(skin['mask_1'] >= 8)then --ok
-- 			skin['mask_1'] = skin['mask_1'] + 14
-- 		end
-- 		if(skin['arms'] >= 16)then --ok
-- 			skin['arms'] = skin['arms']
-- 		end
-- 		if(skin['pants_1'] >= 16)then --ok
-- 			skin['pants_1'] = skin['pants_1'] + 36
-- 		end
-- 		if(skin['bags_1'] > 9)then --ok
-- 			skin['bags_1'] = skin['bags_1'] + 4
-- 		end
-- 		if(skin['shoes_1'] >= 16)then --ok
-- 			skin['shoes_1'] = skin['shoes_1'] + 36
-- 		end
-- 		if(skin['chain_1'] >= 16)then
-- 			skin['chain_1'] = skin['chain_1'] + 36
-- 		end
-- 		if(skin['tshirt_1'] >= 16)then -- ok
-- 			skin['tshirt_1'] = skin['tshirt_1'] + 14
-- 		end
-- 		if(skin['bproof_1'] > 9)then --ok
-- 			skin['bproof_1'] = skin['bproof_1'] + 13
-- 		end
-- 		if(skin['decals_1'] >= 16)then --ok
-- 			skin['decals_1'] = skin['decals_1'] + 2
-- 		end
-- 		if(skin['torso_1'] >= 16)then --ok
-- 			skin['torso_1'] = skin['torso_1'] + 150
-- 		end

-- 		if(skin['helmet_1'] >= 20)then --ok
-- 			skin['helmet_1'] = skin['helmet_1'] + 10
-- 		end
-- 		if(skin['glasses_1'] >= 16)then
-- 			skin['glasses_1'] = skin['glasses_1'] + 3
-- 		end
-- 		if(skin['ears_1'] >= 16)then
-- 			skin['ears_1'] = skin['ears_1']
-- 		end
-- 	else --female
-- 		if(skin['mask_1'] >= 8)then --ok
-- 			skin['mask_1'] = skin['mask_1'] + 14
-- 		end
-- 		if(skin['arms'] >= 16)then --ok
-- 			skin['arms'] = skin['arms'] + 2
-- 		end
-- 		if(skin['pants_1'] >= 16)then --ok
-- 			skin['pants_1'] = skin['pants_1'] + 36
-- 		end
-- 		if(skin['bags_1'] >= 9)then --ok
-- 			skin['bags_1'] = skin['bags_1'] + 4
-- 		end
-- 		if(skin['shoes_1'] >= 16)then --ok
-- 			skin['shoes_1'] = skin['shoes_1'] + 27
-- 		end
-- 		if(skin['chain_1'] >= 16)then
-- 			skin['chain_1'] = skin['chain_1'] + 13
-- 		end
-- 		if(skin['tshirt_1']>= 16)then -- ok
-- 			skin['tshirt_1'] = skin['tshirt_1'] + 17
-- 		end
-- 		if(skin['bproof_1'] >= 8)then --ok
-- 			skin['bproof_1'] = skin['bproof_1'] + 2
-- 		end
-- 		if(skin['decals_1'] >= 16)then --ok
-- 			skin['decals_1'] = skin['decals_1'] + 5
-- 		end
-- 		if(skin['torso_1'] >= 16)then --ok
-- 			skin['torso_1'] = skin['torso_1'] + 146
-- 		end
	
-- 		if(skin['helmet_1'] >= 20)then --ok
-- 			skin['helmet_1'] = skin['helmet_1'] + 5
-- 		end
-- 		if(skin['glasses_1'] >= 16)then
-- 			skin['glasses_1'] = skin['glasses_1'] + 4
-- 		end
-- 		if(skin['ears_1'] >= 16)then
-- 			skin['ears_1'] = skin['ears_1'] + 1
-- 		end
-- 	end
-- 	return skin
-- end

function OpenCloakShopMenu()
	local playerPed = PlayerPedId()
	local grade = ESX.PlayerData.job.grade_name

	local elements = {
		{label = "Crear Uniforme", value = 'shop'},
		{label = "Comprar Uniforme", value = 'shop2'}
		
	}

	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'right',
		elements = elements
	}, function(data, menu)
		cleanPlayer(playerPed)

		if data.current.value == 'shop2' then
			menu.close()
			TriggerEvent("esx_edencsp_pd", source)
		elseif data.current.value == 'shop' then
			TriggerEvent('esx_skin:openSaveableMenu')
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_CloakShop'
		CurrentActionMsg  = "Pulsa ~y~E ~w~para abrir la tienda"
		CurrentActionData = {}
	end)
end

OpenPersonalInventory = function()
	local elements = {}
	table.insert(elements, {label = "Sacar Objeto",  value = 'get_personal_stock'})
	table.insert(elements, {label = "Depositar Objeto", value = 'put_personal_stock'})

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory', {
		title    = "Taquilla Personal",
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'get_personal_stock' then
			OpenGetPersonalStocksMenu()
		elseif data.current.value == 'put_personal_stock' then
			OpenPutPersonalStockMenu()
		end
	end, function(data, menu)
	end)
end

function OpenArmoryMenu(station)
	local elements = {
		{label = _U('buy_weapons'), value = 'buy_weapons'}
	}

	if Config.EnableArmoryManagement then
		-- table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = "Coger Munición",     value = 'get_ammo'})
		table.insert(elements, {label = _U('put_weapon'),     value = 'put_weapon'})
		-- table.insert(elements, {label = "Abrir Inventario", value = 'open_inventory'})
		table.insert(elements, {label = "Sacar Objeto",  value = 'get_stock'})
		table.insert(elements, {label = _U('deposit_object'), value = 'put_stock'})
		table.insert(elements, {label = 'Destruir Dinero Negro', value = 'destroy_black_money'})
		table.insert(elements, {label = 'Secar Dinero', value = 'secar_black_money'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory', {
		title    = _U('armory'),
		align    = 'right',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'get_weapon' then
			OpenGetWeaponMenu()
		elseif data.current.value == 'open_inventory' then
			TriggerEvent('sonn:inventory:openMenuWarehouseSociety', 'police')
		elseif data.current.value == 'put_weapon' then
			OpenPutWeaponMenu()
		elseif data.current.value == 'buy_weapons' then
			OpenBuyWeaponsMenu()
		elseif data.current.value == 'get_ammo' then
			OpenAmmoStorage()
		elseif data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenu()
		elseif data.current.value == 'destroy_black_money' then
			TriggerServerEvent('esx_policejob:destroyBlackMoney')
		elseif data.current.value == 'secar_black_money' then
			TriggerServerEvent('esx_policejob:secarBlackMoney')
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}
	end)
end

function OpenPoliceActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'police_actions', {
		title    = 'SAPD ',
		align    = 'bottom-right',
		elements = {
			{label = "Solicitar Refuerzos", value = 'localizador'},
			{label = _U('citizen_interaction'), value = 'citizen_interaction'},
			{label = _U('vehicle_interaction'), value = 'vehicle_interaction'},
			{label = _U('object_spawner'), value = 'object_spawner'},
			{label = "Unidad K9", value = 'k9_unit'},
			{label = "Comunicados Radiales", value = 'radio'},
			{label = "Asignaciones", value = 'asignaciones'},
			{label = "Control Defcon", value = 'defcon_menu'}
			
		}}, function(data, menu)

			if data.current.value == 'radio' then
				OpenRadioMenu()
			end

			if data.current.value == 'k9_unit' then
				ExecuteCommand('k9')
			end

			if data.current.value == 'asignaciones' then
				OpenAsignacionesMenu()
			end

			if data.current.value == 'defcon_menu' then
				local elements = {
				  {label = 'DEFCON 1', value = 'defcon_1'},
				  {label = 'DEFCON 2', value = 'defcon_2'},
				  {label = 'DEFCON 3', value = 'defcon_3'},
				  {label = 'DEFCON 4', value = 'defcon_4'},
				  {label = 'DEFCON 5', value = 'defcon_5'}
				}
		  
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'defcon_menu', {
				  title    = 'Menú Alertas',
				  align    = 'bottom-right',
				  elements = elements
				}, function(data2, menu2)
		  
					local action = data2.current.value
					local msg = nil
		  
					if action == 'defcon_1' then
					  TriggerServerEvent("ca_defcon:tac0")
					elseif action == 'defcon_2' then
					  TriggerServerEvent("ca_defcon:tac1")
					elseif action == 'defcon_3' then
					  TriggerServerEvent("ca_defcon:tac2")
					elseif action == 'defcon_4' then
					  TriggerServerEvent("ca_defcon:tac3")
					elseif action == 'defcon_5' then
					  TriggerServerEvent("ca_defcon:tac4")
					end
				end, function(data2, menu2)
				  menu2.close()
				end)
			  end

			if data.current.value == 'localizador' then
				ExecuteCommand('refpolice')
				--TriggerServerEvent('chaini_policiaRefuerzos:manageRef')
				local elements = {
					{label = 'Dale al [DELETE] para ver las referencias diponibles', value = ''},
				--	{label = '🟣 Referencia 320', value = 'r320'},
				--	{label = '🔵 Referencia 488', value = 'r488'},
				--	{label = '🟡 Referencia 487', value = 'r487'},
				--	{label = '🟣 [LSPD] 6 ADAM', value = 'rlspd6'},
				--	{label = '🟡 [BCSD] 6 ADAM', value = 'rbcsd6'},
				--	{label = '🔴 Referencia QRR', value = 'rqrr'},
				--	{label = '⚪ Referencia', value = 'rgpslspd'},
				--	{label = 'Desactivar Referencias', value = 'nref'}
				}
	
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'reference_interaction', {
					title    ='Referencias',
					align    = 'bottom-right',
					elements = elements
				}, function(data2, menu2)
					local action = data2.current.value
	
					if action then
						if action then
							if CurrentAsignation ~= "Sin Asignación" then
								TriggerServerEvent('chaini_policiaRefuerzos:manageRef', action)
							else
								ESX.ShowNotification('Tienes que asignarte antes de pedir refuerzos')
							end
						end
						menu2.close()
						menu.close()
					end

					if action == 'rqrr' then
						local coords = vector3(135.82,-749.15,258.15)
						local id = GetPlayerServerId(PlayerId())
						local text = "Agente en peligro."
						local playerCoords = vector3(135.82,-749.15,258.15)
						TriggerServerEvent("guille_dispatch:sendAlert", text, coords, id)
					end
				end, function(data2, menu2)
					menu2.close()
				end)
			end 

		if data.current.value == 'citizen_interaction' then
			local elements = {
				{label = _U('id_card'), value = 'identity_card'},
				{label = _U('search'), value = 'search'},
				{label = _U('handcuff'), value = 'handcuff'},
				{label = _U('uncuff'), value = 'uncuff'},
				{label = _U('drag'), value = 'drag'},
				{label = "Desescoltar", value = 'undrag'},
				{label = _U('put_in_vehicle'), value = 'put_in_vehicle'},
				{label = _U('out_the_vehicle'), value = 'out_the_vehicle'},
				--{label = _U('fine'), value = 'fine'},
				{label = "Servicios Comunitarios", value = 'comunitarios'},
				{label = "Hacer la RCP", value = 'revive_player'},
				{label = _U('unpaid_bills'), value = 'unpaid_bills'}
				--{label = "Meter en prisión", value = 'jail'}
			}

			if Config.EnableLicenses then
				table.insert(elements, {label = _U('license_check'), value = 'license'})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('citizen_interaction'),
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
					local action = data2.current.value

					if action == 'identity_card' then
						OpenIdentityCardMenu(closestPlayer)
					elseif action == 'search' then
						ExecuteCommand('me le cachea')
						OpenBodySearchMenu(closestPlayer)
						local animDict = "anim@gangops@facility@servers@bodysearch@"
						local animName = "player_search"
						
						RequestAnimDict(animDict)
						while not HasAnimDictLoaded(animDict) do
							Citizen.Wait(10)
						end
						TaskPlayAnim(PlayerPedId(),"anim@gangops@facility@servers@bodysearch@","player_search",8.0, -8, -1, 49, 0, 0, 0, 0)
						Citizen.Wait(6000)
						ClearPedTasksImmediately(PlayerPedId())
					elseif action == 'revive_player' then
						revivePlayer(closestPlayer)
					elseif action == 'handcuff' then
						local target, distance = ESX.Game.GetClosestPlayer()
						playerheading = GetEntityHeading(PlayerPedId())
						playerlocation = GetEntityForwardVector(PlayerPedId())
						playerCoords = GetEntityCoords(PlayerPedId())
						local target_id = GetPlayerServerId(target)
						if distance <= 2.0 then
							ExecuteCommand('me le esposa las manos')
							TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'handcuff', 1.0)
							TriggerServerEvent('esx_policejob:requestarrestEvo', target_id, playerheading, playerCoords, playerlocation)
						else
							ESX.ShowNotification('No estás lo suficientemente cerca')
						end
					elseif action == 'uncuff' then
						local target, distance = ESX.Game.GetClosestPlayer()
						playerheading = GetEntityHeading(PlayerPedId())
						playerlocation = GetEntityForwardVector(PlayerPedId())
						playerCoords = GetEntityCoords(PlayerPedId())
						local target_id = GetPlayerServerId(target)
						if distance <= 2.0 then
							ExecuteCommand('me le quita las esposas')
							TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'cuffseffect', 1.0)
							TriggerServerEvent('esx_policejob:requestrelease', target_id, playerheading, playerCoords, playerlocation)
						else
							ESX.ShowNotification('No estás lo suficientemente cerca')
						end
					elseif action == 'drag' then
						ExecuteCommand('me le escolta')
						TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(closestPlayer))
						local animDict = "switch@trevor@escorted_out"
						local animName = "001215_02_trvs_12_escorted_out_idle_guard2"
								
						RequestAnimDict(animDict) 
						while not HasAnimDictLoaded(animDict) do
							Citizen.Wait(10)
						end 
						TaskPlayAnim(PlayerPedId(),"switch@trevor@escorted_out","001215_02_trvs_12_escorted_out_idle_guard2",8.0, -8, -1, 49, 0, 0, 0, 0)
					elseif action == 'undrag' then
						ExecuteCommand('me le desescolta')
						TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(closestPlayer))
						ClearPedTasksImmediately(PlayerPedId())
					elseif action == 'put_in_vehicle' then
						ExecuteCommand('me abre la puerta, le mete en el vehículo y le pone el cinturon')
						Citizen.Wait(100)
						ExecuteCommand('me cierra la puerta')
						TriggerServerEvent('esx_policejob:putInVehicle', GetPlayerServerId(closestPlayer))
					elseif action == 'out_the_vehicle' then
						ExecuteCommand('me abre la puerta')
						Citizen.Wait(100)
						ExecuteCommand('me le quita el cinturon y le baja del vehículo')
						TriggerServerEvent('esx_policejob:OutVehicle', GetPlayerServerId(closestPlayer))
					elseif action == 'fine' then
						OpenFineMenu(closestPlayer)
					elseif action == 'comunitarios' then
						SendToCommunityService(GetPlayerServerId(closestPlayer))
					elseif action == 'license' then
						ShowPlayerLicense(closestPlayer)
					elseif action == 'unpaid_bills' then
						OpenUnpaidBillsMenu(closestPlayer)
					elseif action == 'jail' then
						JailPlayer(GetPlayerServerId(closestPlayer))
					end
				else
					ESX.ShowNotification(_U('no_players_nearby'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'vehicle_interaction' then
			local elements  = {}
			local playerPed = PlayerPedId()
			local vehicle = ESX.Game.GetVehicleInDirection()

			table.insert(elements, {label = _U('vehicle_info'), value = 'vehicle_infos'})
			table.insert(elements, {label = _U('pick_lock'), value = 'hijack_vehicle'})
			table.insert(elements, {label = "Incautar Vehículo", value = 'incautar'})
			table.insert(elements, {label = _U('impound'), value = 'impound'})
			table.insert(elements, {label = "Extras", value = 'extras'})

			--table.insert(elements, {label = _U('search_database'), value = 'search_database'})

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_interaction', {
				title    = _U('vehicle_interaction'),
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
				local coords  = GetEntityCoords(playerPed)
				vehicle = ESX.Game.GetVehicleInDirection()
				action  = data2.current.value

				if action == 'search_database' then
					LookupVehicle()
				elseif action == 'extras' then
					local ped = PlayerPedId()
					local vehicle = GetVehiclePedIsIn(ped, false)
					if IsPedInAnyVehicle(ped, false) and GetPedInVehicleSeat(vehicle, -1) == ped then
						openDynamicMenu(vehicle)
					else
					ESX.ShowNotification("No estás subido en ningún vehículo")
					end
				elseif DoesEntityExist(vehicle) then
					if action == 'vehicle_infos' then
						local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
						OpenVehicleInfosMenu(vehicleData)
					elseif action == 'hijack_vehicle' then
						if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
							TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
							Citizen.Wait(20000)
							ClearPedTasksImmediately(playerPed)

							SetVehicleDoorsLocked(vehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)
							ESX.ShowNotification(_U('vehicle_unlocked'))
						end
					
					elseif action == 'incautar' then
						if currentTask.busy then
							return
						end

						ESX.ShowHelpNotification(_U('impound_prompt'))
						TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)

						currentTask.busy = true
						currentTask.task = ESX.SetTimeout(10000, function()
							ClearPedTasks(playerPed)
							IncautarVehicle(vehicle)
							Citizen.Wait(100) -- sleep the entire script to let stuff sink back to reality
							ExecuteCommand("do pasados unos minutos se vería como llega una grua, carga el vehículo y se lo lleva dirección depósito")
						end)

						-- keep track of that vehicle!
						Citizen.CreateThread(function()
							while currentTask.busy do
								Citizen.Wait(1000)

								vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
								if not DoesEntityExist(vehicle) and currentTask.busy then
									exports['mythic_notify']:SendAlert('inform',_U('impound_canceled_moved'))
									ESX.ClearTimeout(currentTask.task)
									ClearPedTasks(playerPed)
									currentTask.busy = false
									break
								end
							end
						end)
					elseif action == 'impound' then
						-- is the script busy?
						if currentTask.busy then
							return
						end

						ESX.ShowHelpNotification(_U('impound_prompt'))
						TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)

						currentTask.busy = true
						currentTask.task = ESX.SetTimeout(10000, function()
							ClearPedTasks(playerPed)
							ImpoundVehicle(vehicle)
							Citizen.Wait(100) -- sleep the entire script to let stuff sink back to reality
							ExecuteCommand("do pasados unos minutos se vería como llega una grua, carga el vehículo y se lo lleva dirección depósito")
						end)

						-- keep track of that vehicle!
						Citizen.CreateThread(function()
							while currentTask.busy do
								Citizen.Wait(1000)

								vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
								if not DoesEntityExist(vehicle) and currentTask.busy then
									ESX.ShowNotification(_U('impound_canceled_moved'))
									ESX.ClearTimeout(currentTask.task)
									ClearPedTasks(playerPed)
									currentTask.busy = false
									break
								end
							end
						end)
					end
				else
					ESX.ShowNotification(_U('no_vehicles_nearby'))
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'object_spawner' then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then --and ESX.PlayerData.job.grade_name == 'boss' then
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
					title    = _U('traffic_interaction'),
					align    = 'bottom-right',
					elements = {
						{label = _U('cone'), model = 'prop_air_conelight'},
						{label = _U('barrier'), model = 'prop_barrier_work05'},
						{label = "Barrera 2", model = 'prop_mp_barrier_02b'},
						{label = _U('spikestrips'), model = 'p_ld_stinger_s'},
						{label = "Luz", model = 'prop_air_conelight'},
						{label = "Desvío", model = 'prop_mp_arrow_barrier_01'}
				}}, function(data2, menu2)
					local playerPed = PlayerPedId()
					local coords, forward = GetEntityCoords(playerPed), GetEntityForwardVector(playerPed)
					local x, y, z = table.unpack(coords + forward * 1.0)
					
					
					if data2.current.label == "Luz" then 
						--print("spawnluz")
						z = z - 2.24

						ESX.Game.SpawnObject(data2.current.model, {
							x = x,
							y = y,
							z = z
						}, function(obj)
							SetEntityHeading(obj, GetEntityHeading(playerPed))
							--PlaceObjectOnGroundProperly(obj)
						end)

					elseif data2.current.label == _U('cone') then 
						
						z = z - 1.14
						--print("cono",z)

						ESX.Game.SpawnObject(data2.current.model, {
							x = x,
							y = y,
							z = z
						}, function(obj)
							SetEntityHeading(obj, GetEntityHeading(playerPed))
							--PlaceObjectOnGroundProperly(obj)
						end)
					else 
						ESX.Game.SpawnObject(data2.current.model, {
							x = x,
							y = y,
							z = z
						}, function(obj)
							SetEntityHeading(obj, GetEntityHeading(playerPed))
							PlaceObjectOnGroundProperly(obj)
						end)
					
					end

					
					
				end, function(data2, menu2)
					menu2.close()
				end)
			else
				ESX.ShowNotification('No tienes el grado de jefe')
			end
		elseif data.current.value == 'repair_vehicle' then
			if IsPedInAnyVehicle(PlayerPedId()) then
				local currentVehicle = GetVehiclePedIsIn(PlayerPedId())
				SetVehicleFixed(currentVehicle)
				SetVehicleEngineOn(currentVehicle, true, true)
				ESX.ShowNotification("Vehículo reparado.")
			else
				ESX.ShowNotification("Debes de estar dentro del vehículo para repararlo")
			end
		end
	end, function(data, menu)
		menu.close()
	end)
end

function LiveryMenu(vehicle)
	local livery_count = GetVehicleLiveryCount(vehicle)
	
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'texturas',
	  {
		title = "Texturas",
		align = 'bottom-right',
		elements = {
			{label = "Textura", value = 1, type = 'slider', min = 1, max = livery_count}
		},
	  },
	  function(data2, menu2)
		SetVehicleLivery(vehicle, data2.current.value)
	end,
	function(data2, menu2)
		menu2.close()
	end)
end

function ExtrasMenu(vehicle)
    
	local veh_extras = {['vehicleExtras'] = {}}
	local extras = 0
	local elementos = {}
    
	for extraID = 0, 20 do
        if DoesExtraExist(vehicle, extraID) then
			veh_extras.vehicleExtras[extraID] = (IsVehicleExtraTurnedOn(vehicle, extraID) == 1)
            extras = extras + 1
        end
    end

	for k=1, extras do
		veh_extras.vehicleExtras[k] = checked
		if veh_extras.vehicleExtras[k] then
			--SetVehicleExtra(vehicle, k, 0)
			table.insert(elementos, {
				opcion = k,
				label = "Extra " .. (k),
				value = 1, type = 'slider', min = 0, max = 1,
			})
		else
			--SetVehicleExtra(vehicle, k, 1)
			table.insert(elementos, {
				opcion = k,
				label = "Extra " .. (k),
				value = 0, type = 'slider', min = 0, max = 1,
			})
		end
	end

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'extras',
	  {
		title = "Extras",
		align = 'bottom-right',
		elements = elementos,
	  },
	  function(data2, menu2)
		if data2.current.value == 1 then
			SetVehicleExtra(vehicle, data2.current.opcion, 0)
	  	else
			SetVehicleExtra(vehicle, data2.current.opcion, 1)
		end
	end,
	function(data2, menu2)

	menu2.close()
	end)
    
end

function openDynamicMenu(vehicle)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'extras',
	  {
		title = "Extras Vehículo",
		align = 'bottom-right',
		elements = {
			{ label = 'Texturas', value = 'texturas' },
			{ label = 'Extras', value = 'extras' },
		},
	  },
	  function(data, menu)
		if data.current.value == 'texturas' then
			LiveryMenu(vehicle)
		elseif data.current.value == 'extras' then
			ExtrasMenu(vehicle)
		end
	end,
	function(data, menu)

	menu.close()
	end)
end

function SendToCommunityService(player)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Menu Servicios Comunitarios', {
		title = "Menu Servicios Comunitarios",
	}, function (data2, menu)
		local community_services_count = tonumber(data2.value)
		
		if community_services_count == nil then
			ESX.ShowNotification('Servicios Comunitarios Incorrectos')
		else
			TriggerServerEvent("esx_communityservice:sendToCommunityService", player, community_services_count)
			menu.close()
		end
	end, function (data2, menu)
		menu.close()
	end)
end

function OpenIdentityCardMenu(player)
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)

		local elements = {
			{label = _U('name', data.name)},
			{label = _U('job', ('%s - %s'):format(data.job, data.grade))}
		}

		if Config.EnableESXIdentity then
			table.insert(elements, {label = _U('sex', _U(data.sex))})
			table.insert(elements, {label = _U('dob', data.dob)})
			table.insert(elements, {label = _U('height', data.height)})
		end

		if data.drunk then
			table.insert(elements, {label = _U('bac', data.drunk)})
		end

		if data.licenses then
			table.insert(elements, {label = _U('license_label')})

			for i=1, #data.licenses, 1 do
				table.insert(elements, {label = data.licenses[i].label})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction2', {
			title    = _U('citizen_interaction'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
				
			end, function(data, menu)
			menu.close()

		end)

	end, GetPlayerServerId(player))
end

function OpenBodySearchMenu(player)
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		local elements = {}

		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'money' and data.accounts[i].money > 0 then
				table.insert(elements, {
					label    = _U('confiscate_money', ESX.Math.Round(data.accounts[i].money)),
					value    = 'money',
					labelItem = 'Efectivo',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})

				break
			end
		end

		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
				table.insert(elements, {
					label    = _U('confiscate_dirty', ESX.Math.Round(data.accounts[i].money)),
					value    = 'black_money',
					labelItem = 'Dinero Negro',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})

				break
			end
		end

		table.insert(elements, {label = _U('guns_label')})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    = _U('confiscate_weapon', ESX.GetWeaponLabel(data.weapons[i].name), data.weapons[i].ammo),
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end

		table.insert(elements, {label = _U('inventory_label')})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label    = _U('confiscate_inv', data.inventory[i].count, data.inventory[i].label),
					value    = data.inventory[i].name,
					labelItem = data.inventory[i].label,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
			title    = _U('search'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.value then
				if data.current.itemType == 'item_standard' then
					ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "amount_items_confiscate", {
						["title"] = "¿Cantidad?"
					}, function(menuData, menuHandle)
						local cantidad = tonumber(menuData["value"])
						if cantidad <= data.current.amount then
							TriggerServerEvent('ca_mafias:confiscatePlayerItem', GetPlayerServerId(player), data.current.itemType, data.current.value, cantidad)
							ExecuteCommand('me le quita x'..cantidad..' de ' ..data.current.labelItem)
							OpenBodySearchMenu(player)
							ESX.UI.Menu.CloseAll()
						else
							ESX.ShowNotification('Cantidad Invalida')
						end
					end, function(menuData, menuHandle)
						menuHandle.close()
					end)
				else
					ExecuteCommand('me le quita x1 de ' ..data.current.value)
					TriggerServerEvent('ca_mafias:confiscatePlayerItem', GetPlayerServerId(player), data.current.itemType, data.current.value, data.current.amount)
					OpenBodySearchMenu(player)
				end
			end
		end, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenFineMenu(player)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine', {
		title    = _U('fine'),
		align    = 'bottom-right',
		elements = {
			{label = "Capítulo 1", value = 0},
			{label = "Capítulo 2",   value = 1},
			{label = "Capítulo 3", value = 2},
			{label = "Capítulo 4",   value = 3},
			{label = "Capítulo 5",   value = 4},
			{label = "Capítulo 6",   value = 5},
			{label = "Capítulo 7",   value = 6},
			{label = "Capítulo 8",   value = 7},
			{label = "Capítulo 9",   value = 8},
			{label = "Capítulo 10",   value = 9},
			{label = "Capítulo 11",   value = 10},
			{label = "Capítulo 12",   value = 11},
			{label = "Capítulo 13/14",   value = 12},


	}}, function(data, menu)
		OpenFineCategoryMenu(player, data.current.value)
	end, function(data, menu)
		menu.close()
	end)
end

function OpenFineCategoryMenu(player, category)
	ESX.TriggerServerCallback('esx_policejob:getFineList', function(fines)
		local elements = {}

		for k,fine in ipairs(fines) do
			table.insert(elements, {
				label     = ('%s <span style="color:green;">%s</span>'):format(fine.label, _U('armory_item', ESX.Math.GroupDigits(fine.amount))),
				value     = fine.id,
				amount    = fine.amount,
				fineLabel = fine.label
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine_category', {
			title    = _U('fine'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			menu.close()

			if Config.EnablePlayerManagement then
				TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_police', _U('fine_total', data.current.fineLabel), data.current.amount)
			else
				TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), '', _U('fine_total', data.current.fineLabel), data.current.amount)
			end

			ESX.SetTimeout(300, function()
				OpenFineCategoryMenu(player, category)
			end)
		end, function(data, menu)
			menu.close()
		end)
	end, category)
end

function LookupVehicle()
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'lookup_vehicle', {
		title = _U('search_database_--title'),
	}, function(data, menu)
		local length = string.len(data.value)
		if not data.value or length < 2 or length > 8 then
			ESX.ShowNotification(_U('search_database_error_invalid'))
		else
			ESX.TriggerServerCallback('esx_policejob:getVehicleInfos', function(retrivedInfo)
				local elements = {{label = _U('plate', retrivedInfo.plate)}}
				menu.close()

				if not retrivedInfo.owner then
					table.insert(elements, {label = _U('owner_unknown')})
				else
					table.insert(elements, {label = _U('owner', retrivedInfo.owner)})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_infos', {
					title    = _U('vehicle_info'),
					align    = 'bottom-right',
					elements = elements
				}, nil, function(data2, menu2)
					menu2.close()
				end)
			end, data.value)

		end
	end, function(data, menu)
		menu.close()
	end)
end

function revivePlayer(closestPlayer)
	local closestPlayerPed =  ESX.Game.GetClosestPlayer()

	if IsPedDeadOrDying(closestPlayerPed, 1) then
		local playerPed = PlayerPedId()
		local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
		ESX.ShowNotification("Intentando revivir")

		for i=1, 15 do
			Citizen.Wait(900)
			ESX.Streaming.RequestAnimDict(lib, function()
				TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
			end)
		end
		TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
	else
		ESX.ShowNotification("El jugador esta consciente")
	end
end

function ShowPlayerLicense(player)
	local elements = {}

	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(playerData)
		if playerData.licenses then
			for i=1, #playerData.licenses, 1 do
				if playerData.licenses[i].label and playerData.licenses[i].type then
					table.insert(elements, {
						label = playerData.licenses[i].label,
						type = playerData.licenses[i].type
					})
				end
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_license', {
			title    = _U('license_revoke'),
			align    = 'bottom-right',
			elements = elements,
		}, function(data, menu)
			ESX.ShowNotification(_U('licence_you_revoked', data.current.label, playerData.name))
			TriggerServerEvent('esx_policejob:message', GetPlayerServerId(player), _U('license_revoked', data.current.label))

			TriggerServerEvent('esx_license:removeLicense', GetPlayerServerId(player), data.current.type)

			ESX.SetTimeout(300, function()
				ShowPlayerLicense(player)
			end)
		end, function(data, menu)
			menu.close()
		end)

	end, GetPlayerServerId(player))
end

function OpenUnpaidBillsMenu(player)
	local elements = {}

	ESX.TriggerServerCallback('esx_billing:getTargetBills', function(bills)
		local total = 0
		for k,bill in ipairs(bills) do
			table.insert(elements, {
				label = ('%s - <span style="color:red;">%s</span>'):format(bill.label, _U('armory_item', ESX.Math.GroupDigits(bill.amount))),
				billId = bill.id
			})
			total = total + bill.amount
		end
		table.insert(elements, {
			label = ('Total multas pendientes <span style="color:red;">%s $</span>'):format(total)
		})
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing', {
			title    = _U('unpaid_bills'),
			align    = 'bottom-right',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenVehicleInfosMenu(vehicleData)
	ESX.TriggerServerCallback('esx_policejob:getVehicleInfos', function(retrivedInfo)
		local elements = {{label = _U('plate', retrivedInfo.plate)}}

		if not retrivedInfo.owner then
			table.insert(elements, {label = _U('owner_unknown')})
		else
			table.insert(elements, {label = _U('owner', retrivedInfo.owner)})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_infos', {
			title    = _U('vehicle_info'),
			align    = 'bottom-right',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, vehicleData.plate)
end

function OpenGetWeaponMenu()
	ESX.TriggerServerCallback('esx_policejob:getArmoryWeapons', function(weapons)
		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {
					label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name),
					value = weapons[i].name,
					type = 'item_weapon',
					haveImage = true
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_get_weapon', {
			title    = _U('get_weapon_menu'),
			align    = 'bottom-right',
			elements = elements,
			enableImages = true
		}, function(data, menu)
			menu.close()

			ESX.TriggerServerCallback('esx_policejob:removeArmoryWeapon', function()
				OpenGetWeaponMenu()
			end, data.current.value)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutWeaponMenu()
	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()

	for i=1, #weaponList, 1 do
		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			table.insert(elements, {
				label = weaponList[i].label,
				value = weaponList[i].name,
				type = 'item_weapon',
				haveImage = true
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon', {
		title    = _U('put_weapon_menu'),
		align    = 'bottom-right',
		elements = elements,
		enableImages = true
	}, function(data, menu)
		menu.close()

		ESX.TriggerServerCallback('esx_policejob:addArmoryWeapon', function()
			OpenPutWeaponMenu()
		end, data.current.value, true)
	end, function(data, menu)
		menu.close()
	end)
end

function OpenBuyWeaponsMenu()
	local elements = {}
	local playerPed = PlayerPedId()

	for k,v in ipairs(Config.AuthorizedWeapons[ESX.PlayerData.job.grade_name]) do
		local weaponNum, weapon = ESX.GetWeapon(v.weapon)
		local components, label = {}
		local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

		if v.components then
			for i=1, #v.components do
				if v.components[i] then
					local component = weapon.components[i]
					local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

					if hasComponent then
						label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_owned'))
					else
						if v.components[i] > 0 then
							label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_item', ESX.Math.GroupDigits(v.components[i])))
						else
							label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_free'))
						end
					end

					table.insert(components, {
						label = label,
						componentLabel = component.label,
						hash = component.hash,
						name = component.name,
						price = v.components[i],
						hasComponent = hasComponent,
						componentNum = i
					})
				end
			end
		end

		if hasWeapon and v.components then
			label = ('%s: <span style="color:green;">></span>'):format(weapon.label)
		elseif hasWeapon and not v.components then
			label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_owned'))
		else
			if v.price > 0 then
				label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_item', ESX.Math.GroupDigits(v.price)))
			else
				label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_free'))
			end
		end

		table.insert(elements, {
			label = label,
			weaponLabel = weapon.label,
			name = weapon.name,
			components = components,
			price = v.price,
			hasWeapon = hasWeapon
		})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons', {
		title    = "Comprar Armas",
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if data.current.hasWeapon then
			if #data.current.components > 0 then
				OpenWeaponComponentShop(data.current.components, data.current.name, menu)
			end
		else
			ESX.TriggerServerCallback('esx_policejob:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						ESX.ShowNotification(_U('armory_bought', data.current.weaponLabel, ESX.Math.GroupDigits(data.current.price)))
					end

					menu.close()
					OpenBuyWeaponsMenu()
				else
					ESX.ShowNotification(_U('armory_money'))
				end
			end, data.current.name, 1)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenWeaponComponentShop(components, weaponName, parentShop)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons_components', {
		title    = "Comprar Componentes",
		align    = 'bottom-right',
		elements = components
	}, function(data, menu)
		if data.current.hasComponent then
			ESX.ShowNotification(_U('armory_hascomponent'))
		else
			ESX.TriggerServerCallback('esx_policejob:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						ESX.ShowNotification(_U('armory_bought', data.current.componentLabel, ESX.Math.GroupDigits(data.current.price)))
					end

					menu.close()
					parentShop.close()
					OpenBuyWeaponsMenu()
				else
					ESX.ShowNotification(_U('armory_money'))
				end
			end, weaponName, 2, data.current.componentNum)
		end
	end, function(data, menu)
		menu.close()
	end)
end

OpenGetPersonalStocksMenu = function()
	ESX.TriggerServerCallback('esx_policejob:getPersonalStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			if  items[i].count > 0 then
				table.insert(elements, {
					label = 'x' .. items[i].count .. ' ' .. items[i].label,
					value = items[i].name,
					type = 'item_standard',
					haveImage = true
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = "Taquilla Personal",
			align    = 'bottom-right',
			elements = elements,
			enableImages = true
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_policejob:getPersonalStockItem', itemName, count)

					Citizen.Wait(300)
					OpenGetPersonalStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenGetStocksMenu()
	ESX.TriggerServerCallback('esx_policejob:getStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			if  items[i].count > 0 then
				table.insert(elements, {
					label = 'x' .. items[i].count .. ' ' .. items[i].label,
					value = items[i].name,
					type = 'item_standard',
					haveImage = true
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('police_stock'),
			align    = 'bottom-right',
			elements = elements,
			enableImages = true
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_policejob:getStockItem', itemName, count)

					Citizen.Wait(300)
					OpenGetStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

OpenPutPersonalStockMenu = function()
	ESX.TriggerServerCallback('esx_policejob:getPlayerInventory', function(inventory)
		local elements = {}

		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = _U('dirty_money', ESX.Math.GroupDigits(inventory.blackMoney)),
				type  = 'item_account',
				value = 'black_money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name,
					type = 'item_standard',
					haveImage = true
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('inventory'),
			align    = 'bottom-right',
			elements = elements,
			enableImages = true
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_policejob:putPersonalStockItems', itemName, count, data.current.type)

					Citizen.Wait(300)
					OpenPutPersonalStockMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutStocksMenu()
	ESX.TriggerServerCallback('esx_policejob:getPlayerInventory', function(inventory)
		local elements = {}

		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = _U('dirty_money', ESX.Math.GroupDigits(inventory.blackMoney)),
				type  = 'item_account',
				value = 'black_money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name,
					type = 'item_standard',
					haveImage = true
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('inventory'),
			align    = 'bottom-right',
			elements = elements,
			enableImages = true
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_policejob:putStockItems', itemName, count, data.current.type)

					Citizen.Wait(300)
					OpenPutStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	Citizen.Wait(5000)
	TriggerServerEvent('esx_policejob:forceBlip')
end)

RegisterNetEvent('esx_policejob:menuEUP')
AddEventHandler('esx_policejob:menuEUP', function(job, genero)
	OpenEUPClothesMenu(job, genero)
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = _U('phone_police'),
		number     = 'police',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTVGcd/u3cfSXaTLEk2j80TCI8ECI9ABCyoiBqhBVQqVG2ppVKBQqUVgUl5OU7HKqNOHUHU0oHamZZWoGkVS6cWAR2JPJuAQBPy2ISEvLN57+v2u2E33e4k6Ngz85+9d++95/zP9/h/39GpqsqiRYsIGz8QZAq28/8PRfC+4HT4fMXFxeiH+GC54NeCbYLLATLpYe/ECx4VnBTsF0wWhM6lXY8VbBE0Ch4IzLcpfDFD2P1TgrdC7nMCZLRxQ9AkiAkQCn77DcH3BC2COoFRkCSIG2JzLwqiQi0RSmCD4JXbmNKh0+kc/X19tLtc9Ll9sk9ZS1yoU71YIk3xsbEx8QaDEc2ttxmaJSKC1ggSKBK8MKwTFQVXRzs3WzpJGjmZgvxcMpMtWIwqsjztvSrlzjYul56jp+46qSmJmMwR+P3+4aZ8TtCprRkk0DvUW7JjmV6lsqoKW/pU1q9YQOE4Nxkx4ladE7zd8ivuVmJQfXZKW5dx5EwPRw4fxNx2g5SUVLw+33AkzoRaQDP9SkFu6OKqz0uF8yaz7vsOL6ycQVLkcSg/BlWNsjuFoKE1knqDSl5aNnmPLmThrE0UvXqQqvJPyMrMGorEHwQfEha57/3P7mXS684GFjy8kreLppPUuBXfyd/ibeoS2kb0mWPANhJdYjb61AxUvx5PdT3+4y+Tb3mTd19ZSebE+VTXVGNQlHAC7w4VhH8TbA36vKq6ilnzlvPSunHw6Trc7XpZ14AyfgYeyz18crGN1Alz6e3qwNNQSv4dZox1h/BW9+O7eIaEsVv41Y4XeHJDG83Nl4mLTwzGhJYtx0PzNTjOB9KMTlc7Nkcem39YAGU7cbeBKVLMPGMVf296nMd2VbBq1wmizHoqqm/wrS1/Zf0+N19YN2PIu1fcIda4Vk66Zx/rVi+jo9eIX9wZGGcFXUMR6BHUa76/2ezioYcXMtpyAl91DSaTfDxlJbtLprHm2ecpObqPuTPzSNV9yKz4a4zJSuLo71/j8Q17ON69EmXiPIlNMe6FoyzOqWPW/MU03Lw5EFcyKghTrNDh7+/vw545mcJcWbTiGKpRdGPMXbx90sGmDaux6sXk+kimjU+BjnMkx3kYP34cXrFuZ+3nrHi6iDMt92JITcPjk3R3naRwZhpuNSqoD93DKaFVU7j2dhcF8+YzNlpErbIBTVh8toVccbaysPB+4pMcuPw25kwSsau7BIlmHpy3guaOPtISYyi/UkaJM5Lpc5agq5Xkcl6gIHkmqaMn0dtylcjIyPThCNyhaXyfR2W0I1our0v6qBii07ih5rDtGSOxNVdk1y4R2SR8jR/g7hQD9l1jUeY/WLJB5m39AlZN4GZyIQ1fFJNsEgt0duBIc5GRkcZF53mNwIzhXPDgQPoZIkiMkbTxtstDMVnmFA4cOsbz2/aKjSQjev4Mp9ZAg+hIpFhB3EH5Yal16+X+Kq3dGfxkzRY+KauBjBzREvGN0kNCTARu94AejBLMHorAQ7cEQMGs2cXvkWshYLDi6e9l728O8P1XW6hKeB2yv42q18tjj+iFTGoSi+X9jJM9RTxS9E+OHT0krhNiZqlbqraoT7RAU5bBGrEknEBhgJks7KXbLS8qERI0ErVqF/Y4K6NHZfLZB+/wzJvncacvFd91oXO3o/O40MfZKJOKu/rne+mRQByXM4lYreb1tUnkizVVA/0SpfpbWaCNBeEE5gb/UH19NLqEgDF+oNDQWcn41Cj0EXFEWqzkOIyYekslFkThsvMxpIyE2hIc6lXGZ6cPyK7Nnk5OipixRdxgUESAYmhq68VsGgy5CYKCUAJTg0+izApXne3CJFmUTwg4L3FProFxU+6krqmXu3MskkhSD2av41jLdzlnfFrSdCZxyqfMnppN6ZUa7pwt0h3fiK9DCt4IO9e7YqisvI7VYgmNv7mhBKKD/9psNi5dOMv5ZjukjsLdr0ffWsyTi6eSlfcA+dmiVyOXs+/sHNZu3M6PdxzgVO9GmDSHsSNqmTz/R6y6Xxqma4fwaS5Mn85n1ZE0Vl3CHBER3lUNEhiURpPJRFdTOcVnpUJnPIhR7cZXfoH5UYc5+E4RzRH3sfSnl9m2dSMjE+Tz9msse+o5dr7UwcQ5T3HwlWUkNuzG3dKFSTbsNs7m/Y8vExOlC29UWkMJlAxKoRQMR3IC7x85zOn6fHS50+U/2Untx2R1voinu5no+DQmz7yPXmMKZnsu0wrm0Oe3YhOVHdm8A09dBQYhTv4T7C+xUPrZh8Qn2MMr4qcDSRfoirWgKAvtgOpv1JI8Zi77X15G7L+fxeOUOiUFxZiULD5fSlNzNM62W+k1yq5gjajGX/ZHvOIyxd+Fkj+P092rWP/si0Qr7VisMaEWuCiYonXFwbAUTWWPYLV245NITnGkUXnpI9butLJn2y6iba+hlp7C09qBcvoN7FYL9mhxo1/y/LoEXK8Pv6qIC8WbBY/xr9YlPLf9dZT+OqKTUwfmDBm/GOw7ws4FWpuUP2gJEZvKqmocuXPZuWYJMzKuSsH+SNwh3bo0p6hao6HeEqwYEZ2M6aKWd3PwTCy7du/D0F1DsmzE6/WGLr5LsDF4LggnYBacCOboQLHQ3FFfR58SR+HCR1iQH8ukhA5s5o5AYZMwUqOp74nl8xvRHDlRTsnxYpJsUjtsceHt2C8Fm0MPJrphTkZvBc4It9RKLOFx91Pf0Igu0k7W2MmkOewS2QYJUJVWVz9VNbXUVVwkyuAmKTFJayrDo/4Jwe/CT0aGYTrWVYEeUfsgXssMRcpyenraQJa0VX9O3ZU+Ma1fax4xGxUsUVFkOUbcama1hf+7+LmA9juHWshwmwOE1iMmCFYEzg1jtIm1BaxW6wCGGoFdewPfvyE4ertTiv4rHC73B855dwp2a23bbd4tC1hvhOCbX7b4VyUQKhxrtSOaYKngasizvwi0RmOS4O1QZf2yYfiaR+73AvhTQEVf+rpn9/8IMAChKDrDzfsdIQAAAABJRU5ErkJggg=='
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

RegisterCommand('polarrestar', function()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if ESX.PlayerData.job.name == 'police' then
        local target, distance = ESX.Game.GetClosestPlayer()
        playerheading = GetEntityHeading(PlayerPedId())
        playerlocation = GetEntityForwardVector(PlayerPedId())
        playerCoords = GetEntityCoords(PlayerPedId())
        local target_id = GetPlayerServerId(target)
        if distance <= 2.0 then
            ExecuteCommand('me le esposa las manos')
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'handcuff', 1.0)
            TriggerServerEvent('esx_policejob:requestarrestEvo', target_id, playerheading, playerCoords, playerlocation)
        else
            ESX.ShowNotification('No estás lo suficientemente cerca')
        end
    end
end, false)
RegisterKeyMapping('polarrestar', 'Arrestar en tecla', 'keyboard', 'F5')

RegisterCommand('polliberar', function()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if ESX.PlayerData.job.name == 'police' then
		local target, distance = ESX.Game.GetClosestPlayer()
		playerheading = GetEntityHeading(PlayerPedId())
		playerlocation = GetEntityForwardVector(PlayerPedId())
		playerCoords = GetEntityCoords(PlayerPedId())
		local target_id = GetPlayerServerId(target)
		if distance <= 2.0 then
			ExecuteCommand('me le quita las esposas')
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'cuffseffect', 1.0)
			TriggerServerEvent('esx_policejob:requestrelease', target_id, playerheading, playerCoords, playerlocation)
		else
			ESX.ShowNotification('No estás lo suficientemente cerca')
		end
    end
end, false)
RegisterKeyMapping('polliberar', 'Quitar Esposas', 'keyboard', 'º')

RegisterCommand('p', function()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if ESX.PlayerData.job.name == 'police' then
		local coords = vector3(135.82,-749.15,258.15)
		local id = GetPlayerServerId(PlayerId())
		local text = "Agente en peligro."
		local playerCoords = vector3(135.82,-749.15,258.15)
		TriggerServerEvent("origen_dispatch:sendAlert", text, coords, id)
		TriggerServerEvent('chaini_policiaRefuerzos:manageRef', 'rqrr')
    end
end, false)

RegisterCommand('r', function()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if ESX.PlayerData.job.name == 'police' then
		TriggerServerEvent('chaini_policiaRefuerzos:manageRef', 'r254v')
    end
end, false)

-- don't show dispatches if the player isn't in service
AddEventHandler('esx_phone:cancelMessage', function(dispatchNumber)
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.name == dispatchNumber then
		-- if esx_service is enabled
		if Config.EnableESXService and not playerInService then
			CancelEvent()
		end
	end
end)

AddEventHandler('esx_policejob:hasEnteredMarker', function(station, part, partNum)
	if part == 'Cloakroom' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	elseif part == 'CloakShop' then
		CurrentAction     = 'menu_CloakShop'
		CurrentActionMsg  = "Pulsa ~y~E ~w~para abrir la tienda"
		CurrentActionData = {}
	elseif part == 'Armory' then
		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}
	elseif part == 'Vehicles' then
		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('garage_prompt')
		CurrentActionData = {station = station, part = part, partNum = partNum}
	elseif part == 'Helicopters' then
		CurrentAction     = 'Helicopters'
		CurrentActionMsg  = _U('helicopter_prompt')
		CurrentActionData = {station = station, part = part, partNum = partNum}
	-- elseif part == 'Boats' then
	-- 	CurrentAction     = 'Boats'
	-- 	CurrentActionMsg  = _U('garage_prompt')
	-- 	CurrentActionData = {station = station, part = part, partNum = partNum}
	elseif part == 'BossActions' then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}
	end
end)

AddEventHandler('esx_policejob:hasExitedMarker', function(station, part, partNum)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

AddEventHandler('esx_policejob:hasEnteredEntityZone', function(entity)
	local playerPed = PlayerPedId()

	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and IsPedOnFoot(playerPed) then
		CurrentAction     = 'remove_entity'
		CurrentActionMsg  = _U('remove_prop')
		CurrentActionData = {entity = entity}
	end

	if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed)

			for i=0, 7, 1 do
				SetVehicleTyreBurst(vehicle, i, true, 1000)
			end
		end
	end
end)

AddEventHandler('esx_policejob:hasExitedEntityZone', function(entity)
	if CurrentAction == 'remove_entity' then
		CurrentAction = nil
	end
end)

RegisterNetEvent('esx_policejob:handcuffEvo')
AddEventHandler('esx_policejob:handcuffEvo', function()
	local playerPed = PlayerPedId()
	if not isHandcuffed then
		if Config.EnableHandcuffTimer then
			if handcuffTimer.active then
				ESX.ClearTimeout(handcuffTimer.task)
			end

			StartHandcuffTimer()
		end
	else
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

RegisterNetEvent('esx_policejob:unrestrain')
AddEventHandler('esx_policejob:unrestrain', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		isHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)

		-- end timer
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

RegisterNetEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(copId)
	if isHandcuffed then
		dragStatus.isDragged = not dragStatus.isDragged
		dragStatus.CopId = copId
	end
end)

Citizen.CreateThread(function()
	local wasDragged

	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed and dragStatus.isDragged then
			local targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

			if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and not IsPedDeadOrDying(targetPed, true) then
				if not wasDragged then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
					wasDragged = true 
				else
					Citizen.Wait(1000)
				end
			else
				wasDragged = false
				dragStatus.isDragged = false
				DetachEntity(playerPed, true, false)
			end
		elseif wasDragged then
			wasDragged = false
			DetachEntity(playerPed, true, false)
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if IsAnyVehicleNearPoint(coords, 5.0) then
			local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

			if DoesEntityExist(vehicle) then
				local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

				for i=maxSeats - 1, 0, -1 do
					if IsVehicleSeatFree(vehicle, i) then
						freeSeat = i
						break
					end
				end

				if freeSeat then
					TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
					dragStatus.isDragged = false
				end
			end
		end
	end
end)

RegisterNetEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function()
	local playerPed = PlayerPedId()

	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		TaskLeaveVehicle(playerPed, vehicle, 16)
	end
end)

RegisterNetEvent('esx_policejob:getarrested')
AddEventHandler('esx_policejob:getarrested', function(playerheading, playercoords, playerlocation)
	playerPed = PlayerPedId()
	SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(PlayerPedId(), x, y, z - 1)
	SetEntityHeading(PlayerPedId(), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(PlayerPedId(), 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0)
	Citizen.Wait(3760)	
	isHandcuffed = true
	TriggerEvent('esx_policejob:handcuffEvo')
	loadanimdict('mp_arresting')
	TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
end)

RegisterNetEvent('esx_policejob:doarrested')
AddEventHandler('esx_policejob:doarrested', function()
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(PlayerPedId(), 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0, 0, 0, 0)
	Citizen.Wait(3000)

end) 

RegisterNetEvent('esx_policejob:douncuffing')
AddEventHandler('esx_policejob:douncuffing', function()
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('esx_policejob:getuncuffed')
AddEventHandler('esx_policejob:getuncuffed', function(playerheading, playercoords, playerlocation)
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(PlayerPedId(), x, y, z - 1)
	SetEntityHeading(PlayerPedId(), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	isHandcuffed = false
	TriggerEvent('esx_policejob:handcuffEvo')
	ClearPedTasks(PlayerPedId())
end)

-- Handcuff
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed then
			--DisableControlAction(0, 1, true) -- Disable pan
			--DisableControlAction(0, 2, true) -- Disable tilt
			DisableControlAction(0, 21, true)
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			--DisableControlAction(0, 32, true) -- W
			--DisableControlAction(0, 34, true) -- A
			--DisableControlAction(0, 31, true) -- S
			--DisableControlAction(0, 30, true) -- D

			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?

			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job

			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			--DisableControlAction(2, 199, true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, 36, true) -- Disable going stealth

			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle

			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Create blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.PoliceStations) do
		local blip = AddBlipForCoord(v.Blip.Coords)

		SetBlipSprite (blip, v.Blip.Sprite)
		SetBlipDisplay(blip, v.Blip.Display)
		SetBlipScale  (blip, v.Blip.Scale)
		SetBlipColour (blip, v.Blip.Colour)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(_U('map_blip'))
		EndTextCommandSetBlipName(blip)
	end
end)



-- Draw markers and more
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
			local playerPed = PlayerPedId()
			local playerCoords = GetEntityCoords(playerPed)
			local isInMarker, hasExited, letSleep = false, false, true
			local currentStation, currentPart, currentPartNum

			for k,v in pairs(Config.PoliceStations) do
				for i=1, #v.Cloakrooms, 1 do
					local distance = #(playerCoords - v.Cloakrooms[i])

					if distance < Config.DrawDistance then
						DrawMarker(27, v.Cloakrooms[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Cloakroom', i
						end
					end
				end

				for i=1, #v.CloakShop, 1 do
					local distance = #(playerCoords - v.CloakShop[i])

					if distance < Config.DrawDistance then
						DrawMarker(27, v.CloakShop[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 50, 80, 190, 100, false, true, 2, true, false, false, false)
						letSleep = false

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'CloakShop', i
						end
					end
				end

				for i=1, #v.Armories, 1 do
					local distance = #(playerCoords - v.Armories[i])

					if distance < Config.DrawDistance then
						DrawMarker(27, v.Armories[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Armory', i
						end
					end
				end

				for i=1, #v.Vehicles, 1 do
					local distance = #(playerCoords - v.Vehicles[i].Spawner)

					if distance < Config.DrawDistance then
						DrawMarker(27, v.Vehicles[i].Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Vehicles', i
						end
					end
				end

				-- for i=1, #v.Boats, 1 do
				-- 	local distance =  #(playerCoords - v.Boats[i].Spawner)

				-- 	if distance < Config.DrawDistance then
				-- 		DrawMarker(27, v.Boats[i].Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
				-- 		letSleep = false

				-- 		if distance < Config.MarkerSize.x then
				-- 			isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Boats', i
				-- 		end
				-- 	end
				-- end

				for i=1, #v.Helicopters, 1 do
					local distance =  #(playerCoords - v.Helicopters[i].Spawner)

					if distance < Config.DrawDistance then
						DrawMarker(27, v.Helicopters[i].Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Helicopters', i
						end
					end
				end

				if Config.EnablePlayerManagement and ESX.PlayerData.job.grade_name == 'boss' then
					for i=1, #v.BossActions, 1 do
						local distance = #(playerCoords - v.BossActions[i])

						if distance < Config.DrawDistance then
							DrawMarker(27, v.BossActions[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
							letSleep = false

							if distance < Config.MarkerSize.x then
								isInMarker, currentStation, currentPart, currentPartNum = true, k, 'BossActions', i
							end
						end
					end
				end
			end

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
				if
					(LastStation and LastPart and LastPartNum) and
					(LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentStation
				LastPart                = currentPart
				LastPartNum             = currentPartNum

				TriggerEvent('esx_policejob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end

			if letSleep then
				Citizen.Wait(500)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Enter / Exit entity zone events
Citizen.CreateThread(function()
	local trackedEntities = {
		'prop_air_conelight',
		'prop_barrier_work06a',
		'p_ld_stinger_s',
		'prop_boxpile_07d',
		'hei_prop_cash_crate_half_full',
		'prop_barrier_work05',
		'prop_mp_arrow_barrier_01',
		'prop_mp_barrier_02b',
		'prop_roadcone01a'
	}

	while true do
		Citizen.Wait(500)

		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity   = nil

		for i=1, #trackedEntities, 1 do
			local object = GetClosestObjectOfType(playerCoords, 3.0, GetHashKey(trackedEntities[i]), false, false, false)

			if DoesEntityExist(object) then
				local objCoords = GetEntityCoords(object)
				local distance = #(playerCoords - objCoords)

				if closestDistance == -1 or closestDistance > distance then
					closestDistance = distance
					closestEntity   = object
				end
			end
		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then
			if LastEntity ~= closestEntity then
				TriggerEvent('esx_policejob:hasEnteredEntityZone', closestEntity)
				LastEntity = closestEntity
			end
		else
			if LastEntity then
				TriggerEvent('esx_policejob:hasExitedEntityZone', LastEntity)
				LastEntity = nil
			end
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		local wait = 0
		if ESX ~= nil then
			wait = 1200
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
				wait = 0
				if CurrentAction then
					local playerPed = PlayerPedId()
					local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
					ESX.ShowFloatingHelpNotification(CurrentActionMsg, vector3(playerX, playerY, playerZ))

					if IsControlJustReleased(0, 38) and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then

						if CurrentAction == 'menu_cloakroom' then
							OpenCloakroomMenu()
						elseif CurrentAction == 'menu_CloakShop' then
							OpenCloakShopMenu()
						elseif CurrentAction == 'menu_armory' then
							if not Config.EnableESXService then
								OpenArmoryMenu(CurrentActionData.station)
							elseif playerInService then
								OpenArmoryMenu(CurrentActionData.station)
							else
								ESX.ShowNotification(_U('service_not'))
							end
						elseif CurrentAction == 'menu_vehicle_spawner' then
							if not Config.EnableESXService then
								OpenVehicleSpawnerMenu('car', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
							elseif playerInService then
								OpenVehicleSpawnerMenu('car', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
							else
								ESX.ShowNotification(_U('service_not'))
							end
						-- elseif CurrentAction == 'Boats' then
						-- 	if not Config.EnableESXService then
						-- 		OpenVehicleSpawnerMenu('Boats', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
						-- 	elseif playerInService then
						-- 		OpenVehicleSpawnerMenu('Boats', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
						-- 	else
						-- 		ESX.ShowNotification(_U('service_not'))
						-- 	end
						elseif CurrentAction == 'Helicopters' then
							if not Config.EnableESXService then
								OpenVehicleSpawnerMenu('helicopter', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
							elseif playerInService then
								OpenVehicleSpawnerMenu('helicopter', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
							else
								ESX.ShowNotification(_U('service_not'))
							end
						elseif CurrentAction == 'delete_vehicle' then
							ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
						elseif CurrentAction == 'menu_boss_actions' then
							ESX.UI.Menu.CloseAll()
							TriggerEvent('esx_society:openBossMenu', 'police', function(data, menu)
								menu.close()

								CurrentAction     = 'menu_boss_actions'
								CurrentActionMsg  = _U('open_bossmenu')
								CurrentActionData = {}
							end, { wash = false }) -- disable washing money
						elseif CurrentAction == 'remove_entity' then
							DeleteEntity(CurrentActionData.entity)
						--end
							-- if not IsEntityAPed(CurrentActionData.entity) or not IsPedAPlayer(CurrentActionData.entity) then
							-- 	local owner = GetPlayerServerId(NetworkGetEntityOwner(CurrentActionData.entity))
							-- 	TriggerServerEvent('admincam:deletenetworked', owner, NetworkGetNetworkIdFromEntity(CurrentActionData.entity))
							-- end
						end

						CurrentAction = nil
					end
				end -- CurrentAction end
				if IsControlJustReleased(0, 167) and not isDead and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'police_actions') then
					if not Config.EnableESXService then
						OpenPoliceActionsMenu()
					elseif playerInService then
						OpenPoliceActionsMenu()
					else
						ESX.ShowNotification(_U('service_not'))
					end
				end

				if IsControlJustReleased(0, 56) and IsPedInAnyPoliceVehicle(PlayerPedId()) and not isDead and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'police_actions') then
					if not Config.EnableESXService then
						OpenPoliceActionsMenu()
					elseif playerInService then
						OpenPoliceActionsMenu()
					else
						ESX.ShowNotification(_U('service_not'))
					end
				end

				if IsControlJustReleased(0, 38) and currentTask.busy then
					ESX.ShowNotification(_U('impound_canceled'))
					ESX.ClearTimeout(currentTask.task)
					ClearPedTasks(PlayerPedId())

					currentTask.busy = false
				end
			end
		end
		Wait(wait)
	end
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
	TriggerEvent('esx_policejob:unrestrain')

	if not hasAlreadyJoined then
		TriggerServerEvent('esx_policejob:spawned')
	end
	hasAlreadyJoined = true
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_policejob:unrestrain')
		TriggerEvent('esx_phone:removeSpecialContact', 'police')

		if Config.EnableESXService then
			TriggerServerEvent('esx_service:disableService', 'police')
		end

		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

-- handcuff timer, unrestrain the player after an certain amount of time
function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and handcuffTimer.active then
		ESX.ClearTimeout(handcuffTimer.task)
	end

	handcuffTimer.active = true

	handcuffTimer.task = ESX.SetTimeout(Config.HandcuffTimer, function()
		ESX.ShowNotification(_U('unrestrained_timer'))
		TriggerEvent('esx_policejob:unrestrain')
		handcuffTimer.active = false
	end)
end

function IncautarVehicle(vehicle)
	--local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
	ESX.Game.DeleteVehicle(vehicle)
	ESX.ShowNotification(_U('impound_successful'))
	currentTask.busy = false
end

function ImpoundVehicle(vehicle)
	local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
		ESX.TriggerServerCallback('eden_garage:stockvmecano',function(valid)
			if(valid) then
				
				DeleteVehicle(vehicle)
				TriggerServerEvent('eden_garage:ChangeStateFromFourriereMecano', vehicleProps, true)
				ESX.ShowNotification(_U('impound_successful'))
				currentTask.busy = false
			else
				ESX.Game.DeleteVehicle(vehicle)
				ESX.ShowNotification(_U('impound_successful'))
				currentTask.busy = false
			end
	end,vehicleProps)
end

function loadanimdict(dictname)
	if not HasAnimDictLoaded(dictname) then
		RequestAnimDict(dictname) 
		while not HasAnimDictLoaded(dictname) do 
			Citizen.Wait(1)
		end
	end
end

function JailPlayer(player)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_menu', {
		title = "Tiempo de condena en meses (minutos)",
	}, function (data2, menu) 
		local jailTime = tonumber(data2.value)
		if jailTime == nil then
			ESX.ShowNotification('tiempo no válido!')
		else
			TriggerServerEvent("esx_jail:sendToJail", player, jailTime * 60)
			menu.close()
		end
	end, function (data2, menu)
		menu.close()
	end)
end

function OpenAsignacionesMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine', {
		title    = "Asignaciones",
		align    = 'bottom-right',
		elements = {

			{label = "Mando LSPD", value = 'mandolspd'},
			{label = "Mando BCSD",   value = 'mandobcsd'},
			{label = "U-10", value = 'u10'},
			{label = "U-20",   value = 'u20'},
			{label = "U-30",   value = 'u30'},
			{label = "U-40",   value = 'u40'},
			{label = "U-50",   value = 'u50'},
			{label = "ADAM-10",   value = 'adam10'},
			{label = "ADAM-20",   value = 'adam20'},
			{label = "ADAM-30",   value = 'adam30'},
			{label = "ADAM-40",   value = 'adam40'},
			{label = "ADAM-50",   value = 'adam50'},
			{label = "ADAM-60",   value = 'adam60'},
			{label = "ADAM-70",   value = 'adam70'},
			{label = "ADAM-80",   value = 'adam80'},
			{label = "ADAM-90",   value = 'adam90'},
			{label = "MARY-1",   value = 'mary1'},
			{label = "MARY-2",   value = 'mary2'},
			{label = "MARY-3",   value = 'mary3'},
			{label = "MARY-4",   value = 'mary4'},
			{label = "ALPHA-10",   value = 'alpha10'},
			{label = "ALPHA-20",   value = 'alpha20'},
			{label = "ALPHA-30",   value = 'alpha30'},
			{label = "ALPHA-40",   value = 'alpha40'},
			{label = "BRAVO-10",   value = 'bravo10'},
			{label = "BRAVO-20",   value = 'bravo20'},
			{label = "BRAVO-30",   value = 'bravo30'},
			{label = "BRAVO-40",   value = 'bravo40'},
			{label = "MIKE-1",   value = 'mike1'},
			{label = "MIKE-2",   value = 'mike2'},
			{label = "CHARLIE-10",   value = 'charlie10'},
			{label = "CHARLIE-20",   value = 'charlie20'},
			{label = "TAC-1",   value = 'tac1'},
			{label = "TAC-2",   value = 'tac2'},
			{label = "TAC-3",   value = 'tac3'},
			{label = "TAC-4",   value = 'tac4'},

	}}, function(data, menu)
		local ac = data.current.value
		if ac then
			CurrentAsignation = data.current.label
			Citizen.Wait(100)
			ESX.ShowNotification('Te has asignado en '..data.current.label)
			TriggerServerEvent('esx_policejob:manageAsignacion', CurrentAsignation)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenRadioMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine', {
		title    = "Comunicados Radiales",
		align    = 'bottom-right',
		elements = {
			{label = "Esperando Asignación - 10.8", value = '10.8'},
			{label = "Parada de tráfico - 10.6", value = '10.6'},
			{label = "Cód. 2", value = 'cod2'},
			{label = "Cód. 7", value = 'cod7'},
			{label = "254-V", value = '254v'},
			{label = "Reunión - 10.22", value = '10.22'},
			{label = "Salida de Servicio - 10.10", value = '10.10'}
	}
}, function(data, menu)
		local ac = data.current.value
		if ac == '10.6' then
			ESX.TriggerServerCallback('esx_policejob:getname', function(name, job)
				local ply = PlayerPedId()
				local plyl = GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(GetEntityCoords(ply, true))))
				
				local veh = GetVehiclePedIsIn(PlayerPedId(), false)
				local coordA = GetOffsetFromEntityInWorldCoords(veh, 0.0, 1.0, 1.0)
				local coordB = GetOffsetFromEntityInWorldCoords(veh, 0.0, 105.0, 0.0)
				local frontcar = StartShapeTestCapsule(coordA, coordB, 3.0, 10, veh, 7)
				local a, b, c, d, e = GetShapeTestResult(frontcar)

				local fmodel = GetDisplayNameFromVehicleModel(GetEntityModel(e))
				local fplate = GetVehicleNumberPlateText(e)
				if ESX.PlayerData.job and ESX.PlayerData.job.grade >= 16 then
					ExecuteCommand('rpol [BCSD] - ' ..CurrentAsignation.. " | 10.6 | " ..fmodel.. " con matrícula "..fplate.." en "..plyl)
				else
					ExecuteCommand('rpol [LSPD] - ' ..CurrentAsignation.. " | 10.6 | " ..fmodel.. " con matrícula "..fplate.." en "..plyl)
				end
			end)
		elseif ac == '10.8' then
			ESX.TriggerServerCallback('esx_policejob:getname', function(name, job)
				if ESX.PlayerData.job and ESX.PlayerData.job.grade >= 16 then
					ExecuteCommand('rpol [BCSD] - '..job.. " " ..name.. " 10.8")
				else
					ExecuteCommand('rpol [LSPD] - '..job.. " " ..name.. " 10.8")
				end
			end)
		elseif ac == '10.22' then
			if CurrentAsignation == 'Mando LSPD' then
				ExecuteCommand('rpol [LSPD] - '..CurrentAsignation.. " a toda la maya | 10.22 en comisaría")
			elseif CurrentAsignation == 'Mando BCSD' then
				ExecuteCommand('rpol [BCSD] - '..CurrentAsignation.. " a toda la maya | 10.22 en comisaría")
			else
				ESX.ShowNotification('No estás asignado en Mando')
			end
		elseif ac == '10.10' then
			ESX.TriggerServerCallback('esx_policejob:getname', function(name, job)
				if ESX.PlayerData.job and ESX.PlayerData.job.grade >= 16 then
					ExecuteCommand('rpol [BCSD] - '..job.. " " ..name.. " realiza su 10.10 ¡Buen Servicio!")
				else
					ExecuteCommand('rpol [LSPD] - '..job.. " " ..name.. " realiza su 10.10 ¡Buen Servicio!")
				end
			end)
		elseif ac == 'cod7' then
			ESX.TriggerServerCallback('esx_policejob:getname', function(name, job)
				if ESX.PlayerData.job and ESX.PlayerData.job.grade >= 16 then
					ExecuteCommand('rpol [BCSD] - '..CurrentAsignation.. " realiza un Cód. 7")
				else
					ExecuteCommand('rpol [LSPD] - '..CurrentAsignation.. " realiza un Cód. 7")
				end
			end)
		elseif ac == '254v' then
			ESX.TriggerServerCallback('esx_policejob:getname', function(name, job)
				local ply = PlayerPedId()
				local plyl = GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(GetEntityCoords(ply, true))))
				
				local veh = GetVehiclePedIsIn(PlayerPedId(), false)
				local coordA = GetOffsetFromEntityInWorldCoords(veh, 0.0, 1.0, 1.0)
				local coordB = GetOffsetFromEntityInWorldCoords(veh, 0.0, 105.0, 0.0)
				local frontcar = StartShapeTestCapsule(coordA, coordB, 3.0, 10, veh, 7)
				local a, b, c, d, e = GetShapeTestResult(frontcar)

				local fmodel = GetDisplayNameFromVehicleModel(GetEntityModel(e))
				local fplate = GetVehicleNumberPlateText(e)
				TriggerServerEvent('chaini_policiaRefuerzos:manageRef', 'r254v')
				if ESX.PlayerData.job and ESX.PlayerData.job.grade >= 16 then
					ExecuteCommand('rpol [BCSD] - '..CurrentAsignation.. " inicia un 254-V a un "..fmodel.. " con matrícula "..fplate.. " por la zona de "..plyl..". Activamos referencias.")
				else
					ExecuteCommand('rpol [LSPD] - '..CurrentAsignation.. " inicia un 254-V a un "..fmodel.. " con matrícula "..fplate.. " por la zona de "..plyl..". Activamos referencias.")
				end
			end)
		elseif ac == 'cod2' then
			ESX.TriggerServerCallback('esx_policejob:getname', function(name, job)
				if ESX.PlayerData.job and ESX.PlayerData.job.grade >= 16 then
					ExecuteCommand('rpol [BCSD] - '..CurrentAsignation.. " inicia patrullaje ordinario")
				else
					ExecuteCommand('rpol [LSPD] - '..CurrentAsignation.. " inicia patrullaje ordinario")
				end
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

-------------------- DEFCONS --------------------------------------
RegisterNetEvent('origen_defcon:tac0_c')
AddEventHandler('origen_defcon:tac0_c', function()
    displayLogo("tac0")
end)

RegisterNetEvent('origen_defcon:tac1_c')
AddEventHandler('origen_defcon:tac1_c', function()
    displayLogo("tac1")
end)

RegisterNetEvent('origen_defcon:tac2_c')
AddEventHandler('origen_defcon:tac2_c', function()
    displayLogo("tac2")
end)

RegisterNetEvent('origen_defcon:tac3_c')
AddEventHandler('origen_defcon:tac3_c', function()
    displayLogo("tac3")
end)

RegisterNetEvent('origen_defcon:tac4_c')
AddEventHandler('origen_defcon:tac4_c', function()
    displayLogo("tac4")
end)

function displayLogo (value)
    SendNUIMessage({
        type = "logo",
        display = value
    })
end



-- MUNICIÓN POLICÍA --
OpenAmmoStorage = function()
	PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)

	local elements = {}

	local Location = Config.Armory
	local PedLocation = Config.ArmoryPed

	for i = 1, #Config.Ammo, 1 do
		local accesorie = Config.Ammo[i]

		table.insert(elements, { ["label"] = accesorie["label"], ["name"] = accesorie["name"], ["accesorie"] = accesorie })
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "police_armory_weapon_menu",
		{
			title    = "Municiones",
			align    = "bottom-right",
			elements = elements
		},
	function(data, menu)
		local nameItem = data.current["accesorie"]["name"]

		--ESX.UI.Menu.CloseAll()

		TriggerServerEvent("esx_policejob:play:giveItem", nameItem)

	end, function(data, menu)

		menu.close()
	end, function(data, menu)
	end)
end
