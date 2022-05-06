Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 27
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 0, g = 0, b = 0}

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for cops on duty, requires esx_society
Config.EnableCustomPeds           = false -- enable custom peds in cloak room? See Config.CustomPeds below to customize peds

Config.EnableESXService           = false -- enable esx service?
Config.MaxInService               = -1

Config.Locale                     = 'es'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.65,
			Colour  = 0
		},
		
		Cloakrooms = {
			vector3(462.82, -999.38, 29.74),
			vector3(-1124.25, -834.93, 12.41),
			vector3(536.33, -23.34, 69.66),
			vector3(132.53, -769.78, 241.18)
		},

		CloakShop = {
			vector3(463.23, -996.38, 29.74) 
		},

		Armories = {
			vector3(474.85, -996.58, 25.30),
			vector3(482.58, -995.69, 29.72),
			vector3(151.7, -736.68, 241.18)
		},

		Vehicles = {
			{
				Spawner = vector3(445.95, -1012.31, 27.54),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 1.0},
					{coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 1.0},
					{coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 1.0},
					{coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 1.0}
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 27.13),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 1.0},
					{coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 1.0}
				}
			},

			{
				Spawner = vector3(-1125.58, -833.14, 12.40),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(-1124.68, -839.42, 13.08), heading = 128.94, radius = 1.0},
					{coords = vector3(-1121.17, -844.13, 12.10), heading = 128.58, radius = 1.0}
				}
			},

			{
				Spawner = vector3(535.33, -22.04, 69.66),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(533.31, -25.36, 70.63), heading = 205.19, radius = 1.0},
					{coords = vector3(529.49, -28.81, 70.63), heading = 209.24, radius = 1.0}
				}
			},

			{
				Spawner = vector3(-724.66, -1334.47, 0.64),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(-716.46, -1339.60, -0.1), heading = 150.0, radius = 1.0}
				}
			},

			{
				Spawner = vector3(-41.08, -621.3, 34.08),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(-36.95, -618.06, 34.08), heading = 166.33, radius = 1.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 42.7),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0}
				}
			},
			{
				Spawner = vector3(-1103.26, -840.78, 36.71),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(-1095.36, -835.28, 37.68), heading = 307.72, radius = 10.0}
				}
			}
		},

		-- Boats = {
		-- 	{
		-- 		Spawner = vector3(-1800.62, -972.72, 1.32),
		-- 		InsideShop = vector3(477.0, -1106.4, 43.0),
		-- 		SpawnPoints = {
		-- 			{coords = vector3(-1812.1, -988375, 0.17), heading = 161.3, radius = 3.0}
		-- 		}
		-- 	}
		-- },

		BossActions = {
			vector3(462.22, -985.42, 29.75)
		}

	},

	BCSDSANDY = {

		Blip = {
			Coords  = vector3(1857.78, 3683.61, 34.27),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.65,
			Colour  = 0
		},
		
		Cloakrooms = {
			vector3(1850.72, 3693.76, 33.31) 
		},
	
		CloakShop = {
			vector3(1849.36, 3696.08, 33.31) 
		},
	
		Armories = {
			vector3(1855.76, 3699.2, 33.31),
			vector3(1841.96, 3690.76, 33.31)
		},
	
		Vehicles = {
			{
				Spawner = vector3(1869.08, 3694.68, 32.62),
				InsideShop = vector3(1830.02, 3630.59, 34.38),
				SpawnPoints = {
					{coords = vector3(1876.55, 3690.6, 33.42), heading = 213.86, radius = 1.0},
					{coords = vector3(1872.21, 3688.71, 33.46), heading = 210.57, radius = 1.0}
				}
			}
		},
	
		Helicopters = {
			{
				Spawner = vector3(1869.48, 3659.9, 32.87),
				InsideShop = vector3(1830.02, 3630.59, 34.38),
				SpawnPoints = {
					{coords = vector3(1869.55, 3644.35, 33.94), heading = 27.18, radius = 5.0}
				}
			}
		},
	
		-- Boats = {
		-- 	{
		-- 		Spawner = vector3(1800.62, -972.72, 1.32),
		-- 		InsideShop = vector3(477.0, -1106.4, 43.0),
		-- 		SpawnPoints = {
		-- 			{coords = vector3(-1812.1, -988375, 0.17), heading = 161.3, radius = 3.0}
		-- 		}
		-- 	}
		-- },
	
		BossActions = {
			vector3(1861.72, 3688.52, 33.31)
		}
	
	},

	BCSDPALETO = {

		Blip = {
			Coords  = vector3(-433.48, 6018.66, 31.49),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.65,
			Colour  = 0
		},
		
		Cloakrooms = {
			vector3(-451.47, 6009.88, 30.88) 
		},

		CloakShop = {
			vector3(-453.74, 6011.46, 30.90) 
		},

		Armories = {
			vector3(-425.27, 5998.51, 30.75),
			vector3(-428.73, 5995.21, 30.75)
		},

		Vehicles = {
			{
				Spawner = vector3(-450.11, 6003.33, 30.51),
				InsideShop = vector3(1830.02, 3630.59, 34.38),
				SpawnPoints = {
					{coords = vector3(-448.0, 5994.48, 30.95), heading = 88.23, radius = 0.2},
					{coords = vector3(-455.7, 6001.88, 31.6), heading = 86.59, radius = 1.0}
				}
			},
			{ --barcos
				Spawner = vector3(-275.7, 6640.06, 6.57),
				InsideShop = vector3(-462.11, 6041.47, 31.34),
				SpawnPoints = {
					{coords = vector3(-289.06, 6652.55, 1.11), heading = 113.4, radius = 1}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-466.52, 5998.18, 30.28),
				InsideShop = vector3(-475.2, 5988.84, 31.72),
				SpawnPoints = {
					{coords = vector3(-475.2, 5988.84, 31.72), heading = 318.14, radius = 5.0}
				}
			}
		},

		-- Boats = {
		-- 	{
		-- 		Spawner = vector3(1800.62, -972.72, 1.32),
		-- 		InsideShop = vector3(477.0, -1106.4, 43.0),
		-- 		SpawnPoints = {
		-- 			{coords = vector3(-1819.96, -975.2, 0.7), heading = 96.6, radius = 3.0}
		-- 		}
		-- 	}
		-- },

		BossActions = {
			vector3(-445.11, 6012.66, 35.73)
		}

	}

}

Config.AuthorizedWeapons = {
	cadete = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	oficiali = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
	},

	oficialii = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	oficialiii = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	sargentoi = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	sargentoii = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	detectivei = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	detectiveii = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	tenientei = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	tenienteii = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	capitani = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	capitanii = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	comandante = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	boss = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		{weapon = 'WEAPON_DOUBLEACTION', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	cadetebcsd = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		--{weapon = 'WEAPON_DOUBLEACTION', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	rangeri = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		--{weapon = 'WEAPON_DOUBLEACTION', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
	},

	rangerii = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		--{weapon = 'WEAPON_DOUBLEACTION', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	rangeriii = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		--{weapon = 'WEAPON_DOUBLEACTION', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	sheriffsargentoi = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		--{weapon = 'WEAPON_DOUBLEACTION', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	sheriffsargentoii = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		--{weapon = 'WEAPON_DOUBLEACTION', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	sherifftenientei = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		--{weapon = 'WEAPON_DOUBLEACTION', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	sherifftenienteii = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		--{weapon = 'WEAPON_DOUBLEACTION', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	sheriffcapitani = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		--{weapon = 'WEAPON_DOUBLEACTION', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	sheriffcapitanii = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		--{weapon = 'WEAPON_DOUBLEACTION', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	sheriffmariscali = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		--{weapon = 'WEAPON_DOUBLEACTION', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	sheriffmariscalii = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		--{weapon = 'WEAPON_DOUBLEACTION', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

	sheriffcomandante = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
		--{weapon = 'WEAPON_DOUBLEACTION', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 0, 0, nil}, price = 0},
	},

}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{model = 'police', price = 0},
			{model = 'scpd2', price = 0},
            {model = 'scpd3', price = 0},
			{model = 'scpd4', price = 0},
			{model = 'scpd7', price = 0},
			{model = 'pbike', price = 0},
			{model = 'policeb1', price = 0},
			{model = 'policeb2', price = 0},
			{model = 'policeb', price = 0},
			--{model = 'riot', price = 0},
			{model = 'policet', price = 0},
			{model = '2015polstang', price = 0},
			{model = 'dinghy', price = 0},
			{model = 'predator', price = 0},
		},

		oficiali = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
		},
	
		oficialii = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
		},
	
		oficialiii = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},
	
		sargentoi = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},

		sargentoii = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},
	
		detectivei = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},

		detectiveii = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},
	
		tenientei = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},
	
		tenienteii = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},

		capitani = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},
	
		capitanii = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},

		comandante = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},
	
		boss = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			
			
		},
	
		cadetebcsd = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
		},
	
		rangeri = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
		},
	
		rangerii = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
		},
	
		rangeriii = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},
	
		sheriffsargentoi = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},

		sheriffsargentoii = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},
	
		sherifftenientei = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},

		sherifftenienteii = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},
	
		sheriffcapitani = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},

		sheriffcapitanii = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},
	
		sheriffmariscali = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},
	
		sheriffmariscalii = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},

		sheriffcomandante = {
	{ model = 'police', label = 'Patrulla', price = 100},
	{ model = 'xls2poli', label = 'XLS', price = 100},
	{ model = 'valorviper', label = 'Viper', price = 100},
	{ model = 'valorsuzu', label = 'Suzu', price = 100},
	{ model = 'valorquad', label = 'Quad', price = 100},
	{ model = 'valorporsche', label = 'Porche', price = 100},
	{ model = 'calorkawa', label = 'Kawa', price = 100},
	{ model = 'valorharley', label = 'Harley', price = 100},
	{ model = 'valorgmc', label = 'GCM', price = 100},
	{ model = 'valorgator', label = 'Gator', price = 100},
	{ model = 'valorfpis', label = 'FPIS', price = 100},
	{ model = 'valorf250', label = 'F250', price = 100},
	{ model = 'valorcvpik9', label = 'CVPIK9', price = 100},
	{ model = 'valorcvpi', label = 'CVPI', price = 100},
	{ model = 'valorcap', label = 'CAP', price = 100},
	{ model = 'valorbmw', label = 'BMW', price = 100},
	{ model = 'valor20ram', label = 'RAM', price = 100},
	{ model = 'valor20fpiu', label = 'FPIU', price = 100},
	{ model = 'valor18tahoe', label = 'TAHOE', price = 100},
	{ model = 'valor18charg', label = 'Charger', price = 100},
	{ model = 'futop', label = 'Futop', price = 100},
	{ model = 'policet2', label = 'CET2', price = 100},
	{ model = 'polvacca', label = 'Vacca', price = 100},
			{model = 'police4', price = 0},
			{model = 'fbi2', price = 0},
			
			
		},
	},
	
	--[[Boats = {
		cadete = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},

		oficiali = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		oficialii = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		oficialiii = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		sargentoi = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},

		sargentoii = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		detectivei = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},

		detectiveii = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		tenientei = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		tenienteii = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},

		capitani = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		capitanii = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},

		comandante = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		boss = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		cadetebcsd = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		rangeri = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		rangerii = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		rangeriii = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		sheriffsargentoi = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},

		sheriffsargentoii = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		sherifftenientei = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},

		sherifftenienteii = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		sheriffcapitani = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},

		sheriffcapitanii = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		sheriffmariscali = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	
		sheriffmariscalii = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},

		sheriffcomandante = {
			{model = 'dinghy', price = 0},
{model = 'predator', price = 0},
		},
	},--]]

	helicopter = {
		cadete = {
		},

		oficiali = {
		},
	
		oficialii = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},
	
		oficialiii = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},
	
		sargentoi = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},

		sargentoii = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},
	
		detectivei = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},

		detectiveii = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},
	
		tenientei = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},
	
		tenienteii = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},

		capitani = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},
	
		capitanii = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},

		comandante = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},
	
		boss = {
			{model = 'polmav', props = {modLivery = 0}, price = 0},
			{model = 'polmav', props = {modLivery = 1}, price = 0}
		},
	
		cadetebcsd = {
		},
	
		rangeri = {
		},
	
		rangerii = {
			{model = 'polmav', props = {modLivery = 1}, price = 0}
		},
	
		rangeriii = {
			{model = 'polmav', props = {modLivery = 1}, price = 0}
		},
	
		sheriffsargentoi = {
			{model = 'polmav', props = {modLivery = 1}, price = 0}
		},

		sheriffsargentoii = {
			{model = 'polmav', props = {modLivery = 1}, price = 0}
		},
	
		sherifftenientei = {
			{model = 'polmav', props = {modLivery = 1}, price = 0}
		},

		sherifftenienteii = {
			{model = 'polmav', props = {modLivery = 1}, price = 0}
		},
	
		sheriffcapitani = {
			{model = 'polmav', props = {modLivery = 1}, price = 0}
		},

		sheriffcapitanii = {
			{model = 'polmav', props = {modLivery = 1}, price = 0}
		},
	
		sheriffmariscali = {
			{model = 'polmav', props = {modLivery = 1}, price = 0}
		},
	
		sheriffmariscalii = {
			{model = 'polmav', props = {modLivery = 1}, price = 0}
		},

		sheriffcomandante = {
			{model = 'polmav', props = {modLivery = 1}, price = 0}
		},
	},
}

Config.CustomPeds = {
	shared = {
		{label = 'Sheriff Ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'},
		{label = 'Police Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},

	recruit = {},

	officer = {},

	sergeant = {},

	lieutenant = {},

	boss = {
		{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	cadete = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 285,   ['torso_2'] = 8,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 1,
			['pants_1'] = 109,   ['pants_2'] = 12,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] = 52,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 53, 	['bags_2'] = 0,
			['mask_1'] = 125,   ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 56,  ['tshirt_2'] = 0,
			['torso_1'] = 330,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 51,
			['pants_1'] = 68,   ['pants_2'] = 0,
			['shoes_1'] = 74,   ['shoes_2'] = 0,
			['helmet_1'] = 1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 2,  ['bproof_2'] = 0,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	oficiali = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 8,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 109,   ['pants_2'] = 12,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] =  -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 53, 	['bags_2'] = 0,
			['mask_1'] = 125,   ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 56,  ['tshirt_2'] = 0,
			['torso_1'] = 330,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 42,
			['pants_1'] = 124,   ['pants_2'] = 12,
			['shoes_1'] = 47,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 3,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	oficialii = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 8,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 109,   ['pants_2'] = 12,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] =  -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 53, 	['bags_2'] = 0,
			['mask_1'] = 125,   ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 56,  ['tshirt_2'] = 0,
			['torso_1'] = 330,   ['torso_2'] = 1,
			['decals_1'] = 15,   ['decals_2'] = 0,
			['arms'] = 42,
			['pants_1'] = 124,   ['pants_2'] = 12,
			['shoes_1'] = 47,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 3,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	oficialiii = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 8,
			['decals_1'] = 16,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 109,   ['pants_2'] = 12,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] =  -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 53, 	['bags_2'] = 0,
			['mask_1'] = 125,   ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 56,  ['tshirt_2'] = 0,
			['torso_1'] = 330,   ['torso_2'] = 1,
			['decals_1'] = 15,   ['decals_2'] = 2,
			['arms'] = 47,
			['pants_1'] = 124,   ['pants_2'] = 12,
			['shoes_1'] = 47,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 3,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	sargentoi = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 8,
			['decals_1'] = 16,   ['decals_2'] = 4,
			['arms'] = 11,
			['pants_1'] = 109,   ['pants_2'] = 12,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] =  -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 53, 	['bags_2'] = 0,
			['mask_1'] = 125,   ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 56,  ['tshirt_2'] = 0,
			['torso_1'] = 323,   ['torso_2'] = 1,
			['decals_1'] = 15,   ['decals_2'] = 4,
			['arms'] = 51,
			['pants_1'] = 124,   ['pants_2'] = 12,
			['shoes_1'] = 47,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 3,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	sargentoii = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 8,
			['decals_1'] = 16,   ['decals_2'] = 2,
			['arms'] = 11,
			['pants_1'] = 109,   ['pants_2'] = 12,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] =  -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 53, 	['bags_2'] = 0,
			['mask_1'] = 125,   ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 56,  ['tshirt_2'] = 0,
			['torso_1'] = 323,   ['torso_2'] = 1,
			['decals_1'] = 15,   ['decals_2'] = 4,
			['arms'] = 51,
			['pants_1'] = 124,   ['pants_2'] = 12,
			['shoes_1'] = 47,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 3,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	detectivei = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 8,
			['decals_1'] = 16,   ['decals_2'] = 4,
			['arms'] = 11,
			['pants_1'] = 109,   ['pants_2'] = 12,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] =  -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 53, 	['bags_2'] = 0,
			['mask_1'] = 125,   ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 56,  ['tshirt_2'] = 0,
			['torso_1'] = 323,   ['torso_2'] = 1,
			['decals_1'] = 15,   ['decals_2'] = 4,
			['arms'] = 51,
			['pants_1'] = 124,   ['pants_2'] = 12,
			['shoes_1'] = 47,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 3,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	detectiveii = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 8,
			['decals_1'] = 16,   ['decals_2'] = 2,
			['arms'] = 11,
			['pants_1'] = 109,   ['pants_2'] = 12,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] =  -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 53, 	['bags_2'] = 0,
			['mask_1'] = 125,   ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 56,  ['tshirt_2'] = 0,
			['torso_1'] = 323,   ['torso_2'] = 1,
			['decals_1'] = 15,   ['decals_2'] = 4,
			['arms'] = 51,
			['pants_1'] = 124,   ['pants_2'] = 12,
			['shoes_1'] = 47,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 3,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	tenientei = { -- currently the same as oficialiii_wear
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 8,
			['decals_1'] = 45,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 109,   ['pants_2'] = 12,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] =  -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 53, 	['bags_2'] = 0,
			['mask_1'] = 125,   ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 56,  ['tshirt_2'] = 0,
			['torso_1'] = 323,   ['torso_2'] = 1,
			['decals_1'] = 15,   ['decals_2'] = 5,
			['arms'] = 51,
			['pants_1'] = 124,   ['pants_2'] = 12,
			['shoes_1'] = 47,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 3,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	tenienteii = { -- currently the same as oficialiii_wear
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 8,
			['decals_1'] = 45,   ['decals_2'] = 1,
			['arms'] = 11,
			['pants_1'] = 109,   ['pants_2'] = 12,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] =  -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 53, 	['bags_2'] = 0,
			['mask_1'] = 125,   ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 56,  ['tshirt_2'] = 0,
			['torso_1'] = 323,   ['torso_2'] = 1,
			['decals_1'] = 15,   ['decals_2'] = 5,
			['arms'] = 51,
			['pants_1'] = 124,   ['pants_2'] = 12,
			['shoes_1'] = 47,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 3,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	capitani = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 8,
			['decals_1'] = 45,   ['decals_2'] = 2,
			['arms'] = 11,
			['pants_1'] = 109,   ['pants_2'] = 12,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] =  -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 53, 	['bags_2'] = 0,
			['mask_1'] = 125,   ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 56,  ['tshirt_2'] = 0,
			['torso_1'] = 323,   ['torso_2'] = 1,
			['decals_1'] = 15,   ['decals_2'] = 6,
			['arms'] = 51,
			['pants_1'] = 124,   ['pants_2'] = 12,
			['shoes_1'] = 47,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 3,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	capitanii = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 8,
			['decals_1'] = 45,   ['decals_2'] = 2,
			['arms'] = 11,
			['pants_1'] = 109,   ['pants_2'] = 12,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] =  -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 53, 	['bags_2'] = 0,
			['mask_1'] = 125,   ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 56,  ['tshirt_2'] = 0,
			['torso_1'] = 323,   ['torso_2'] = 1,
			['decals_1'] = 15,   ['decals_2'] = 6,
			['arms'] = 51,
			['pants_1'] = 124,   ['pants_2'] = 12,
			['shoes_1'] = 47,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 3,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	comandante = { -- currently the same as oficialiii_wear
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 8,
			['decals_1'] = 45,   ['decals_2'] = 3,
			['arms'] = 11,
			['pants_1'] = 109,   ['pants_2'] = 12,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] =  -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 53, 	['bags_2'] = 0,
			['mask_1'] = 125,   ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 56,  ['tshirt_2'] = 0,
			['torso_1'] = 323,   ['torso_2'] = 1,
			['decals_1'] = 15,   ['decals_2'] = 6,
			['arms'] = 51,
			['pants_1'] = 124,   ['pants_2'] = 12,
			['shoes_1'] = 47,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 3,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	boss = { -- currently the same as subcomisario_wear
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 8,
			['decals_1'] = 43,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 109,   ['pants_2'] = 12,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] =  -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 53, 	['bags_2'] = 0,
			['mask_1'] = 125,   ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 56,  ['tshirt_2'] = 0,
			['torso_1'] = 323,   ['torso_2'] = 1,
			['decals_1'] = 44,   ['decals_2'] = 5,
			['arms'] = 51,
			['pants_1'] = 124,   ['pants_2'] = 12,
			['shoes_1'] = 47,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 3,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	cadetebcsd = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 55,   ['pants_2'] = 0,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] = 13,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 54, 	['bags_2'] = 0,
			['mask_1'] = 125,  ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 55,   ['pants_2'] = 0,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] = 141,  ['helmet_2'] = 5,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 54, 	['bags_2'] = 0,
			['mask_1'] = 125,  ['mask_2'] = 0
		}
	},
	rangeri = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 55,   ['pants_2'] = 0,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] = 141,  ['helmet_2'] = 5,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 54, 	['bags_2'] = 0,
			['mask_1'] = 125,  ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 23 +  46,  ['tshirt_2'] = 1,
			['torso_1'] = 128 +  153,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 2 +  18, 
			['pants_1'] = 34 +  89,   ['pants_2'] = 7,
			['shoes_1'] = 22 +  52,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 2,  ['bproof_2'] = 0,
			['mask_1'] = 26 + 121,  ['mask_2'] = 0
		}
	},
	rangerii = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 55,   ['pants_2'] = 0,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] = 141,  ['helmet_2'] = 5,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 54, 	['bags_2'] = 0,
			['mask_1'] = 125,  ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 23 +  46,  ['tshirt_2'] = 1,
			['torso_1'] = 128 +  153,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 2 +  18, 
			['pants_1'] = 34 +  89,   ['pants_2'] = 7,
			['shoes_1'] = 22 +  52,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 2,  ['bproof_2'] = 0,
			['mask_1'] = 26 + 121,  ['mask_2'] = 0
		}
	},
	rangeriii = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 2,
			['decals_1'] = 16,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 55,   ['pants_2'] = 0,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] = 141,  ['helmet_2'] = 5,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 54, 	['bags_2'] = 0,
			['mask_1'] = 125,  ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 23 +  46,  ['tshirt_2'] = 1,
			['torso_1'] = 128 +  153,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 2 +  18, 
			['pants_1'] = 34 +  89,   ['pants_2'] = 7,
			['shoes_1'] = 22 +  52,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 2,  ['bproof_2'] = 0,
			['mask_1'] = 26 + 121,  ['mask_2'] = 0
		}
	},
	sheriffsargentoi = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 2,
			['decals_1'] = 16,   ['decals_2'] = 4,
			['arms'] = 11,
			['pants_1'] = 55,   ['pants_2'] = 0,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] = 141,  ['helmet_2'] = 5,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 54, 	['bags_2'] = 0,
			['mask_1'] = 125,  ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 50,  ['tshirt_2'] = 0,
			['torso_1'] = 218,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 20,
			['pants_1'] = 124,   ['pants_2'] = 7,
			['shoes_1'] = 46,   ['shoes_2'] = 0,
			['helmet_1'] = 2,  ['helmet_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 1,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	sheriffsargentoii = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 2,
			['decals_1'] = 16,   ['decals_2'] = 2,
			['arms'] = 11,
			['pants_1'] = 55,   ['pants_2'] = 0,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] = 141,  ['helmet_2'] = 5,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 54, 	['bags_2'] = 0,
			['mask_1'] = 125,  ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 50,  ['tshirt_2'] = 0,
			['torso_1'] = 218,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 20,
			['pants_1'] = 124,   ['pants_2'] = 7,
			['shoes_1'] = 46,   ['shoes_2'] = 0,
			['helmet_1'] = 2,  ['helmet_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 1,
			['mask_1'] = 24 +  121,  ['mask_2'] = 0
		}
	},
	sherifftenientei = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 2,
			['decals_1'] = 45,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 55,   ['pants_2'] = 0,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] = 141,  ['helmet_2'] = 5,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 54, 	['bags_2'] = 0,
			['mask_1'] = 125,  ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 68,  ['tshirt_2'] = 5,
			['torso_1'] = 281,   ['torso_2'] = 5,
			['decals_1'] = 11,   ['decals_2'] = 1,
			['arms'] = 3,
			['pants_1'] = 71,   ['pants_2'] = 6,
			['shoes_1'] = 74,   ['shoes_2'] = 0,
			['helmet_1'] = 2,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 1,
			['mask_1'] = 26 + 121,  ['mask_2'] = 0
		}
	},
	sherifftenienteii = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 2,
			['decals_1'] = 45,   ['decals_2'] = 1,
			['arms'] = 11,
			['pants_1'] = 55,   ['pants_2'] = 0,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] = 141,  ['helmet_2'] = 5,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 54, 	['bags_2'] = 0,
			['mask_1'] = 125,  ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 68,  ['tshirt_2'] = 5,
			['torso_1'] = 281,   ['torso_2'] = 5,
			['decals_1'] = 11,   ['decals_2'] = 1,
			['arms'] = 3,
			['pants_1'] = 71,   ['pants_2'] = 6,
			['shoes_1'] = 74,   ['shoes_2'] = 0,
			['helmet_1'] = 2,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 1,
			['mask_1'] = 26 + 121,  ['mask_2'] = 0
		}
	},
	sheriffcapitani = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 55,   ['pants_2'] = 0,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] = 141,  ['helmet_2'] = 5,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 54, 	['bags_2'] = 0,
			['mask_1'] = 125,  ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 68,  ['tshirt_2'] = 5,
			['torso_1'] = 281,   ['torso_2'] = 5,
			['decals_1'] = 11,   ['decals_2'] = 1,
			['arms'] = 3,
			['pants_1'] = 71,   ['pants_2'] = 6,
			['shoes_1'] = 74,   ['shoes_2'] = 0,
			['helmet_1'] = 2,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 1,
			['mask_1'] = 26 + 121,  ['mask_2'] = 0
		}
	},
	sheriffcapitanii = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 55,   ['pants_2'] = 0,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] = 141,  ['helmet_2'] = 5,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 54, 	['bags_2'] = 0,
			['mask_1'] = 125,  ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 68,  ['tshirt_2'] = 5,
			['torso_1'] = 281,   ['torso_2'] = 5,
			['decals_1'] = 11,   ['decals_2'] = 1,
			['arms'] = 3,
			['pants_1'] = 71,   ['pants_2'] = 6,
			['shoes_1'] = 74,   ['shoes_2'] = 0,
			['helmet_1'] = 2,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 1,
			['mask_1'] = 26 + 121,  ['mask_2'] = 0
		}
	},
	sheriffmariscali = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 55,   ['pants_2'] = 0,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] = 141,  ['helmet_2'] = 5,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 54, 	['bags_2'] = 0,
			['mask_1'] = 125,  ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 68,  ['tshirt_2'] = 5,
			['torso_1'] = 281,   ['torso_2'] = 5,
			['decals_1'] = 11,   ['decals_2'] = 1,
			['arms'] = 3,
			['pants_1'] = 71,   ['pants_2'] = 6,
			['shoes_1'] = 74,   ['shoes_2'] = 0,
			['helmet_1'] = 2,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 1,
			['mask_1'] = 26 + 121,  ['mask_2'] = 0
		}
	},
	sheriffmariscalii = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 55,   ['pants_2'] = 0,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] = 141,  ['helmet_2'] = 5,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 54, 	['bags_2'] = 0,
			['mask_1'] = 125,  ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 68,  ['tshirt_2'] = 5,
			['torso_1'] = 281,   ['torso_2'] = 5,
			['decals_1'] = 11,   ['decals_2'] = 1,
			['arms'] = 3,
			['pants_1'] = 71,   ['pants_2'] = 6,
			['shoes_1'] = 74,   ['shoes_2'] = 0,
			['helmet_1'] = 2,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 1,
			['mask_1'] = 26 + 121,  ['mask_2'] = 0
		}
	},
	sheriffcomandante = {
		male = {
			['tshirt_1'] = 70,  ['tshirt_2'] = 0,
			['torso_1'] = 282,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 55,   ['pants_2'] = 0,
			['shoes_1'] = 54,   ['shoes_2'] = 0,
			['helmet_1'] = 141,  ['helmet_2'] = 5,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0,
			['bags_1'] = 54, 	['bags_2'] = 0,
			['mask_1'] = 125,  ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 68,  ['tshirt_2'] = 5,
			['torso_1'] = 281,   ['torso_2'] = 5,
			['decals_1'] = 11,   ['decals_2'] = 1,
			['arms'] = 3,
			['pants_1'] = 71,   ['pants_2'] = 6,
			['shoes_1'] = 74,   ['shoes_2'] = 0,
			['helmet_1'] = 2,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 11,  ['bproof_2'] = 1,
			['mask_1'] = 26 + 121,  ['mask_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0
		},
		female = {
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0
		}
	},

	gilet_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0
		},
		female = {
			['bproof_1'] = 10,  ['bproof_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0
		}
	},

	--ROPA PRISIÓN
	prison_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 156, ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 87, ['pants_1']  = 67,
			['pants_2']  = 0,   ['shoes_1']  = 100,
			['shoes_2']  = 0,  ['chain_1']  = 0,
			['chain_2']  = 0,
			['bproof_1'] = 3,  ['bproof_2'] = 0,
			['mask_1'] = 17,  ['mask_2'] = 2
		},
		female = {
			['tshirt_1'] = 14,   ['tshirt_2'] = 0,
			['torso_1']  = 230,  ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 104,  ['pants_1'] = 71,
			['pants_2']  = 0,  ['shoes_1']  = 100,
			['shoes_2']  = 0,   ['chain_1']  = 0,
			['chain_2']  = 0,
			['bproof_1'] = 5,  ['bproof_2'] = 0,
			['mask_1'] = 20,  ['mask_2'] = 2
		}
	}

}



-- Servicios Comunitarios

Config.ServiceExtensionOnEscape		= 8

-- # Don't change this unless you know what you are doing.
Config.ServiceLocation 				= {x =  170.43, y = -990.7, z = 30.09}

-- # Don't change this unless you know what you are doing.
Config.ReleaseLocation				= {x = 427.33, y = -979.51, z = 30.2}


-- # Don't change this unless you know what you are doing.
Config.ServiceLocations = {
	{ type = "cleaning", coords = vec(170.0, -1006.0, 29.34) },
	{ type = "cleaning", coords = vec(177.0, -1007.94, 29.33) },
	{ type = "cleaning", coords = vec(181.58, -1009.46, 29.34) },
	{ type = "cleaning", coords = vec(189.33, -1009.48, 29.34) },
	{ type = "cleaning", coords = vec(195.31, -1016.0, 29.34) },
	{ type = "cleaning", coords = vec(169.97, -1001.29, 29.34) },
	{ type = "cleaning", coords = vec(164.74, -1008.0, 29.43) },
	{ type = "cleaning", coords = vec(163.28, -1000.55, 29.35) },
	{ type = "gardening", coords = vec(181.38, -1000.05, 29.29) },
	{ type = "gardening", coords = vec(188.43, -1000.38, 29.29) },
	{ type = "gardening", coords = vec(194.81, -1002.0, 29.29) },
	{ type = "gardening", coords = vec(198.97, -1006.85, 29.29) },
	{ type = "gardening", coords = vec(201.47, -1004.37, 29.29) }
}

-- CONFIG MUNICIONES E ITEMS --
Config.Ammo = {
	{ ["label"] = "Munición Ligera", ["name"] = "pboxpistol" },	
	{ ["label"] = "Munición Subfusiles", ["name"] = "boxsmg" },
	{ ["label"] = "Munición Escopetas", ["name"] = "boxshot" },
	{ ["label"] = "Munición Fusiles de Asalto", ["name"] = "boxrifle" },

}

Config.Accesories = {
	{ ["label"] = "Camuflaje Policial", ["name"] = "skinarmapolicia" },
	{ ["label"] = "Silenciador", ["name"] = "silencieux" },
	{ ["label"] = "Empuñadura", ["name"] = "grip" },	

}

--- HOLSTER
Config.CooldownPolice = 100
Config.cooldown		  = 1700

Config.Weapons = {
	"WEAPON_COMBATPISTOL",
}