--[[

	Path/To/ExemplaryService.luau
	Service
	Name your service whatever.

	Contributors:
	* Irene "lacelit684" - Lead Developer since 2026-06-27
	State role, add and remove as needed.
	
	Created: 2026-06-27
	Last Modified: 2026-06-28
	Keep these up to date or your records will suffer your incompetence.

	Version: 0.0.1
	Increment the first number for breaking changes.
	Increment the second for new backwards-compatible functionality.
	Increment the third for bug fixes.

	Licence: MPL-2.0

	Description:
	Describe the service here.
	This example shows how a simple service can expose state and lifecycle methods while reacting to player events.

	Dependencies:
	* Add any required modules, services, or libraries here.

	You can also write extra things in this section, like a changelog, acknowledgements or a memorial.

]]

-- Argument documentation can have three tags for guidance.
-- [MUST] indicates the argument has to follow this rule or something evil will happen.
-- [SHOULD] indicates the argument ought to follow this rule or the program may not work as intended.
-- [MAY] indicates the argument can be controlled to produce different results.



local ExemplaryService = {} -- Name your service after the file name.

-- Preamble
-- This is where module imports, citations and declarations go.

local Players = game:GetService("Players")



-- Types
-- This is where types go.

type AppleCounter = number



-- Constants
-- This is where constant values go.

const INITIAL_APPLES = 123



-- Variables
-- This is where shared mutable state goes.

local apples = 0
ExemplaryService.bananas = 456



-- Functions
-- This is where functions that calculate and return a value go.

--[[
Returns the amount of apples.

Inputs:
* (none)

Returns:
[1] (AppleCounter): The amount of apples.
]]
function ExemplaryService:GetApples(): AppleCounter
	return apples
end



-- Procedures
-- This is where functions designed to do something outside of computing and returning a value go.

--[[
Increments the count of apples by the specified amount.

Inputs:
* amount (number): The amount which the apple count should be increased by.
... [MUST] be an integer.
... [MUST] be greater than or equal to 1.

Actions:
Increments apples by amount.

Returns:
* (none)
]]
function ExemplaryService:IncrementApples(amount: number)

	assert(amount % 1 == 0, "Amount must be integer")
	assert(amount >= 1, "Amount must be 1 or greater")

	apples += amount

end



-- Lifecycle
-- This is what the service should do nearly autonomously.

--[[
Sets up the service.

Inputs:
* (none)

Actions:
Sets up the service's passive elements.

Returns:
* (none)
]]
function ExemplaryService:Init()
	apples = INITIAL_APPLES
	print("ExemplaryService initialised.")
end

--[[
Begins the active operation of the service.

Inputs:
* (none)

Actions:
Starts the service's active elements.

Returns:
* (none)
]]
function ExemplaryService:Start()

	Players.PlayerAdded:Connect(function(player: Player)
		apples += player.UserId
	end)

	print("ExemplaryService started.")

end

-- TODO: ADD MORE EXAMPLE CODE



-- Termination
return ExemplaryService