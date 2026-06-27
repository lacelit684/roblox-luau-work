--[[

	Path/To/ExemplaryServerHandler.luau
	Server-Side Handler
	Name your server-side handler whatever.

	Contributors:
	* Irene "lacelit684" - Lead Developer since 2026-06-27
	State role, add and remove as needed.

	Created: 2026-06-27
	Last Modified: 2026-06-27
	Keep these up to date or your records will suffer your incompetence.
	
	Version: 0.0.0
	Increment the first one when you make a backwards incompatible change to the module.
	Increment the second one when you add backwards compatible functionality.
	Increment the third one when you fix bugs.

	Licence: MPL-2.0

	Description:
	Describe the server-side handler here.
	Keep this short and specific to the module's purpose.

	Dependencies:
	Add any required modules, services, or libraries here.

	You can also write extra things in this section, like a changelog, acknowledgements or a memorial.

]]

-- Preamble
-- This is where module imports, citations and declarations go.

-- Types
-- This is where types go.

-- Constants
-- This is where constant values go.

local Services = {}

local Controllers = {}



-- Variables
-- This is where shared mutable state goes.

-- Functions
-- This is where functions that calculate and return a value go.

-- Procedures
-- This is where functions designed to do something outside of computing and returning a value go.

-- Lifecycle

for _, controller in pairs(Controllers) do
	if controller.Init then
		controller:Init()
	end
end

for _, controller in pairs(Controllers) do
	if controller.Start then
		coroutine.wrap(function()
			controller:Start()
		end)()
	end
end


for _, service in pairs(Services) do
	if service.Init then
		service:Init()
	end
end

for _, service in pairs(Services) do
	if service.Start then
		coroutine.wrap(function()
			service:Start()
		end)()
	end
end


print("server is okay")



-- Termination