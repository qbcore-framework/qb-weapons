--*[[ Local Functions ]]

local function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Wait(5)
	end
end



--*[[ Player Pseudo-Class ]]

--* Init data object
Player = {}
Player.Updater = {}
Player.Actions = {}
Player.Animations = {}

--* Player Methods
Player.Reset = function()
	Player.Ped = nil
	Player.ID = nil
	Player.IsLEO = false
	Player.Position = nil
	Player.CanShoot = true
	Player.HolsterType = nil
	Player.WeaponHolstered = true
	Player.LastWeapon = `WEAPON_UNARMED`
end

Player.Update = function()
	Player.Updater.Ped()
	Player.Updater.ID()
	Player.Updater.IsLEO()
	Player.Updater.Position()
	Player.Updater.HolsterType()
	Player.Updater.CurrentWeapon()
	Weapon.Updater.UsesHolster()
end

Player.Updater.Ped = function()
	Player.Ped = PlayerPedId()
end

Player.Updater.ID = function()
	Player.ID = PlayerId()
end

Player.Updater.IsLEO = function()
	local test = QBCore.Functions.GetPlayerData().job.name == 'police'
	Player.IsLEO =  test
end

Player.Updater.Position = function()
	Player.Position = GetEntityCoords(Player.Ped, true)
	Player.Heading = GetEntityHeading(Player.Ped)
end

Player.Updater.HolsterType = function()
	Player.HolsterType = GetPedDrawableVariation(Player.Ped, 7)
end

Player.Updater.CurrentWeapon = function()
	Weapon.Hash = GetSelectedPedWeapon(Player.Ped)
end

Player.Updater.LastWeapon = function()
	Player.LastWeapon = Weapon.Hash
end

Player.Actions.GiveWeapon = function()
	print(Weapon.Hash)
	GiveWeaponToPed(ped, Weapon.Hash, 0, false, true)
	SetCurrentPedWeapon(Player.Ped, Weapon.Hash , true)
	Player.Updater.CurrentWeapon()
end

Player.Actions.DrawWeapon = function()
	loadAnimDict('rcmjosh4')
	loadAnimDict('reaction@intimidation@1h')
	Player.CanShoot = false
	Player.Updater.Position()
	print(Player.IsLEO)
	if Weapon.UsesHolster and Player.IsLEO then
		Player.Animations.DrawFromHolsterShort()
	else
		Player.Animations.DrawFromBack()
	end
	Player.CanShoot = true
	Player.Updater.LastWeapon()
	if Config.debug then TriggerEvent('table', Weapon) end
end

Player.Actions.HolsterWeapon = function()
	loadAnimDict('reaction@intimidation@1h')
	loadAnimDict('reaction@intimidation@cop@unarmed')
	Player.CanShoot = false
	SetCurrentPedWeapon(Player.Ped, Player.LastWeapon, true)
	Player.Updater.Position()
	print(Player.IsLEO)
	if Weapon.UsesHolster and Player.IsLEO then
		Player.Animations.WeaponToHolster()
	else
		Player.Animations.WeaponToBack()
	end
	Player.CanShoot = true
	Player.Updater.LastWeapon()
	if Config.debug then TriggerEvent('table', Weapon) end
end

--* Animations

Player.Animations.DrawFromHolsterShort = function()	-- Draw from holster - short
	TaskPlayAnimAdvanced(Player.Ped, 'rcmjosh4', 'josh_leadout_cop2', Player.Position, 0, 0, Player.Heading, 3.0, 3.0, -1, 50, 0, 0, 0)
	Citizen.Wait(300)
	Player.Actions.GiveWeapon()
	Player.Animations.RenderHolsterEmpty()
	ClearPedTasks(Player.Ped)
end

Player.Animations.DrawFromHolster = function()		-- Draw from holster
	TaskPlayAnimAdvanced(Player.Ped, 'reaction@intimidation@cop@unarmed', 'intro', Player.Position, 0, 0, Player.Heading, 3.0, 3.0, -1, 50, 0, 0, 0)
	Citizen.Wait(500)
	SetCurrentPedWeapon(Player.Ped, GetHashKey('WEAPON_UNARMED'), true)
	TaskPlayAnimAdvanced(Player.Ped, 'rcmjosh4', 'josh_leadout_cop2', Player.Position, 0, 0, Player.Heading, 3.0, 3.0, -1, 50, 0, 0, 0)
	Citizen.Wait(300)
	Player.Actions.GiveWeapon()
	Player.Animations.RenderHolsterEmpty()
	Citizen.Wait(500)
	ClearPedTasks(Player.Ped)
end

Player.Animations.WeaponToHolster = function()		-- Reholster right hip - short
	TaskPlayAnimAdvanced(Player.Ped, 'reaction@intimidation@cop@unarmed', 'intro', Player.Position, 0, 0, Player.Heading, 3.0, 3.0, -1, 50, 0, 0, 0)
	Citizen.Wait(500)
	Player.Animations.RenderHolsterFull()
	Player.Actions.GiveWeapon()
	ClearPedTasks(Player.Ped)
end

Player.Animations.DrawFromBack = function() 		-- Draw from back
	Wait(50)
	SetCurrentPedWeapon(Player.Ped, GetHashKey('WEAPON_UNARMED'), true)
	TaskPlayAnimAdvanced(Player.Ped, 'reaction@intimidation@1h', 'intro', Player.Position, 0, 0, Player.Heading, 8.0, 3.0, -1, 50, 0, 0, 0)
	Wait(1000)
	Player.Actions.GiveWeapon()
	Player.Animations.RenderHolsterEmpty()
	Wait(1400)
	ClearPedTasks(Player.Ped)
end

Player.Animations.WeaponToBack = function()			-- Reholster behind back
	SetCurrentPedWeapon(Player.Ped, Player.LastWeapon, true)	-- TODO: This doesn't work. I think it may be an issue with the animation..
	TaskPlayAnimAdvanced(Player.Ped, 'reaction@intimidation@1h', 'outro', Player.Position, 0, 0, Player.Heading, 8.0, 3.0, -1, 50, 0, 0, 0)
	Citizen.Wait(1400)
	SetCurrentPedWeapon(Player.Ped, `WEAPON_UNARMED`, true)
	Player.Animations.RenderHolsterFull()
	ClearPedTasks(Player.Ped)
	Player.Actions.GiveWeapon()
end

Player.Animations.SwapWeaponsBehindBack = function()-- Swap weapons behind back
	TaskPlayAnimAdvanced(Player.Ped, 'reaction@intimidation@1h', 'outro', Player.Position, 0, 0, Player.Heading, 8.0, 3.0, -1, 50, 0, 0, 0)
	Citizen.Wait(1600)
	SetCurrentPedWeapon(Player.Ped, GetHashKey('WEAPON_UNARMED'), true)
	TaskPlayAnimAdvanced(Player.Ped, 'reaction@intimidation@1h', 'intro', Player.Position, 0, 0, Player.Heading, 8.0, 3.0, -1, 50, 0, 0, 0)
	Citizen.Wait(1000)
	Player.Actions.GiveWeapon()
	Citizen.Wait(1400)
	ClearPedTasks(Player.Ped)
end

Player.Animations.RenderHolsterFull = function()
	Weapon.Actions.UpdateServer()
	if Player.HolsterType and Config.HolsterWeapons[Player.LastWeapon] then
		SetPedComponentVariation(Player.Ped, 7, Player.HolsterType, 0, 2)
	end
	Weapon.Reset()
	Player.WeaponHolstered = true
end

Player.Animations.RenderHolsterEmpty = function ()
	if Player.HolsterType and Config.HolsterWeapons[Player.LastWeapon] then
		if Player.HolsterType == 8 then
			SetPedComponentVariation(Player.Ped, 7, 2, 0, 2)
		elseif Player.HolsterType == 1 then
			SetPedComponentVariation(Player.Ped, 7, 3, 0, 2)
		elseif Player.HolsterType == 6 then
			SetPedComponentVariation(Player.Ped, 7, 5, 0, 2)
		end
	end
	Player.WeaponHolstered = false
end
