--[[

	Path/To/ExemplaryService.luau
	Service
	Name your service whatever.

	Contributors:
	* Irene "lacelit684" - Lead Developer since 2026-06-27
	State role, add and remove as needed.
	
	Created: 2026-06-27
	Last Modified: 2026-06-27
	Keep these up to date or your records will suffer your incompetence.

	Version: 0.0.0
	Increment the first number for breaking changes.
	Increment the second for new backwards-compatible functionality.
	Increment the third for bug fixes.

	Licence: MPL-2.0

	Description:
	Describe the service here.
	Keep this short and specific to the module's purpose.

	Dependencies:
	Add any required modules, services, or libraries here.

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

-- Constants
-- Add shared constants here.

INITIAL_APPLES = 123



-- Variables
-- Add shared state, caches, or Roblox Instance references here.

apples = 0
ExemplaryService.bananas = 456



-- Functions
-- Add helper methods that compute or return values here.

function ExemplaryService:GetApples(): number
	return apples
end



-- Procedures

function ExemplaryService:IncrementApples()
	apples += 1
end



-- Lifecycle

function ExemplaryService:Init() -- Sets up the state of the service.
	
	apples = INITIAL_APPLES
	print("ExemplaryService initialised.")

end

function ExemplaryService:Start() -- Begins the active operation of the service.

	Players.PlayerAdded:Connect(function(player: Player)
		apples += player.UserId
	end)

	print("ExemplaryService started.")

end



-- Termination
return ExemplaryService