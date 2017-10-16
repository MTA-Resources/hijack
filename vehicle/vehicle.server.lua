----------------------------------------
-- All vehicles that could spawn.
----------------------------------------
local models = {
	533, -- Feltzer
	445, -- Admiral
	470, -- Patriot
	429, -- Banshee
}

----------------------------------------
-- All positions where a vehicle could 
-- spawn at.
----------------------------------------
local positions = {
	{
		x: 2491.82,
		y: -1683.28,
		z: 13.34
		rx: 0,
		ry: 270
	}, -- Grove Street, Los Santos
	{
		x: 1934.19,
		y: -1775.72,
		z: 12.97,
		rx: 0,
		ry: 0
	}, -- Downtown Gas Station, Los Santos
}

----------------------------------------
-- When the script starts, the variable is 
-- automatically defined as false.
----------------------------------------
local isVehicleSpawned = false

----------------------------------------
-- The spawned vehicle.
----------------------------------------
local vehicle = nil

----------------------------------------
-- The spawned vehicle's blip.
----------------------------------------
local blip = nil

local destinationMarker = nil

local destinationBlip = nil

----------------------------------------
-- Defines the interval between each 
-- spawn (in milliseconds).
----------------------------------------
local EACH_SPAWN_INTERVAL = (1000 * 60 * 10) -- Ten minutes

----------------------------------------
-- Executed when a player exits from the 
-- vehicle.
----------------------------------------
function handleVehicleExit()
	destroyElement(vehicle)
	destroyElement(blip)
end

----------------------------------------
-- Executed when a player enters in the 
-- vehicle.
----------------------------------------
function handleVehicleEnter(thePlayer, seat)
	destinationMarker = createMarker(2443, -1647, 12, "cylinder", 3)
	destinationBlip = createBlipAttachedTo(destinationMarker, 51)
end

----------------------------------------
-- Executes a function on every X 
-- milliseconds.
----------------------------------------
setTimer(function()
	if #models == 0 then return
	if #positions == 0 then return
	if isVehicleSpawned then return
	
	local drawnVehicle = math.random(1, #models)
	local drawnPosition = math.random(1, #positions)
	vehicle = createVehicle(drawnVehicle, drawnPosition.x, drawnPosition.y, drawnPosition.z, drawnPosition.rx, drawnPosition.rz)
	blip = createBlipAttachedTo(vehicle, 55)
	addEventHandler("onVehicleEnter", vehicle, handleVehicleEnter)
	addEventHandler("onVehicleExit", vehicle, handleVehicleExit)

	outputChatBox("A new hijack is available on the map!")
end, EACH_SPAWN_INTERVAL)