--[[

	ServerHandlerTemplate.luau
	Server-Side Handler

	Contributors:
	* YOUR NAME - YOUR ROLE since YYYY-MM-DD

	Created: YYYY-MM-DD
	Last Modified: YYYY-MM-DD

	Version: 1.2.3
	Increment the first number for breaking changes.
	Increment the second for new backwards-compatible functionality.
	Increment the third for bug fixes.

	Licence: MPL-2.0

	Description:
	Describe the server-side handler here.
	Keep this short and specific to the module's purpose.

	Dependencies:
	* Add any required modules, services, or libraries here.

]]

-- Argument documentation can have three tags for guidance.
-- [MUST] indicates the argument has to follow this rule or something evil will happen.
-- [SHOULD] indicates the argument ought to follow this rule or the program may not work as intended.
-- [MAY] indicates the argument can be controlled to produce different results.



-- Preamble
-- This is where module imports, citations and declarations go.

local Players = game:GetService("Players")



-- Types
-- This is where types go.



-- Constants
-- This is where constant values go.

local CONTROLLERS = {}
local SERVICES = {}



-- Variables
-- This is where shared mutable state goes.



-- Functions
-- This is where functions that calculate and return a value go.



-- Procedures
-- This is where functions designed to do something outside of computing and returning a value go.



-- Lifecycle

for _, service in pairs(SERVICES) do
	if service.Init then
		service:Init()
	end
end

for _, service in pairs(SERVICES) do
	if service.Start then
		coroutine.wrap(function()
			service:Start()
		end)()
	end
end

for _, controller in pairs(CONTROLLERS) do
	if controller.Init then
		controller:Init()
	end
end

for _, controller in pairs(CONTROLLERS) do
	if controller.Start then
		coroutine.wrap(function()
			controller:Start()
		end)()
	end
end

Players.PlayerAdded:Connect(function(player: Player)
	print(string.format("Player %s joined.", player.Name))
end)

Players.PlayerRemoving:Connect(function(player: Player)
	print(string.format("Player %s left.", player.Name))
end)



-- Termination