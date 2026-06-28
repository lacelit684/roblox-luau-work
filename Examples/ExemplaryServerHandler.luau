--[[

	Path/To/ExemplaryServerHandler.luau
	Server-Side Handler
	Name your server-side handler whatever.

	Contributors:
	* Irene "lacelit684" - Lead Developer since 2026-06-27
	State role, add and remove as needed.

	Created: 2026-06-27
	Last Modified: 2026-06-28
	Keep these up to date or your records will suffer your incompetence.
	
	Version: 0.0.1
	Increment the first one when you make a backwards incompatible change to the module.
	Increment the second one when you add backwards compatible functionality.
	Increment the third one when you fix bugs.

	Licence: MPL-2.0

	Description:
	Describe the server-side handler here.
	This example shows how a server-side entry-point script can initialise services and controllers together.

	Dependencies:
	Add any required modules, services, or libraries here.

	You can also write extra things in this section, like a changelog, acknowledgements or a memorial.

]]

-- Argument documentation can have three tags for guidance.
-- [MUST] indicates the argument has to follow this rule or something evil will happen.
-- [SHOULD] indicates the argument ought to follow this rule or the program may not work as intended.
-- [MAY] indicates the argument can be controlled to produce different results.



-- Preamble
-- This is where imports, citations, and declarations go.

local Players = game:GetService("Players")



-- Types
-- This is where types go.

type PlayerRegistry = {[Player]: boolean}



-- Constants
-- This is where constant values go.

const STARTING_PLAYER_CAPACITY = 16



-- Variables
-- This is where shared mutable state goes.

local services = {}
local controllers = {}
local trackedPlayers: PlayerRegistry = {}



-- Functions
-- This is where helper functions that support the script go.

--[[
Returns the number of players currently tracked by the server handler.

Inputs:
* (none)

Returns:
* [1] (number): The current tracked player count.
]]
local function getTrackedPlayerCount(): number
	local count = 0

	for _ in pairs(trackedPlayers) do
		count += 1
	end

	return count
end

--[[
Determines whether a player is currently tracked by the server handler.

Inputs:
* player (player): The subject player.

Returns:
* [1] (boolean): Whether the player is being tracked.
]]
local function isPlayerTracked(player: Player): boolean
	return trackedPlayers[player] == true
end



-- Procedures
-- This is where functions designed to do something outside of computing and returning a value go.

--[[
Begins tracking a player on the server.

Inputs:
* player (player): The subject player.

Actions:
* Adds the player to the internal registry.
* Prints a short welcome message.

Returns:
* (none)
]]
local function trackPlayer(player: Player)
	trackedPlayers[player] = true
	print(`Tracking {player.Name}`)
end

--[[
Stops tracking a player on the server.

Inputs:
* player (player): The subject player.

Actions:
* Removes the player from the internal registry.

Returns:
* (none)
]]
local function releasePlayer(player: Player)
	trackedPlayers[player] = nil
	print(`Released tracking for {player.Name}`)
end

--[[
Creates a simple welcome announcement for a player.

Inputs:
* player (player): The subject player.

Actions:
* Prints a basic greeting to the console.

Returns:
* (none)
]]
local function broadcastWelcome(player: Player)
	print(`Welcome, {player.Name}. Server handler is online.`)
end



-- Lifecycle
-- This is what the handler should do autonomously.

--[[
Initialises the registered services and controllers.

Inputs:
* (none)

Actions:
* Calls each service and controller's Init method when present.

Returns:
* (none)
]]
local function initialiseModules()

	for _, service in pairs(services) do
		if service.Init then
			service:Init()
		end
	end

	for _, controller in pairs(controllers) do
		if controller.Init then
			controller:Init()
		end
	end

	print("ExemplaryServerHandler initialised.")

end

--[[
Starts the registered services and controllers.

Inputs:
* (none)

Actions:
* Calls each service and controller's Start method when present.
* Registers player lifecycle handlers.

Returns:
* (none)
]]
local function startModules()

	for _, service in pairs(services) do
		if service.Start then
			coroutine.wrap(function()
				service:Start()
			end)()
		end
	end

	for _, controller in pairs(controllers) do
		if controller.Start then
			coroutine.wrap(function()
				controller:Start()
			end)()
		end
	end

	Players.PlayerAdded:Connect(function(player: Player)
		trackPlayer(player)
		broadcastWelcome(player)
	end)

	Players.PlayerRemoving:Connect(function(player: Player)
		releasePlayer(player)
	end)

	print("ExemplaryServerHandler started.")

end

initialiseModules()
startModules()



-- Termination