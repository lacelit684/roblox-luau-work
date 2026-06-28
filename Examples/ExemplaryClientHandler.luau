--[[

	Path/To/ExemplaryClientHandler.luau
	Client-Side Handler
	Name your client-side handler whatever.

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
	Describe the client-side handler here.
	This example shows how a client-side entry-point script can initialise controllers and maintain per-player state.

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

type PlayerScoreSheet = {number}
type PlayerScoreSheetMap = {[Player]: PlayerScoreSheet}



-- Constants
-- This is where constant values go.

-- Populate this list with the controller modules relevant to your project.
local CONTROLLERS = {}



-- Variables
-- This is where shared mutable state goes.

local playerScoreSheets: PlayerScoreSheetMap = {}



-- Functions
-- This is where helper functions that support the script go.

--[[
Calculates the total score of a player.

Inputs:
* player (player): The subject player.

Returns:
* [1] (number): The sum of the subject player's scores.
]]
local function getTotalScore(player: Player): number

	local scoreSheet = playerScoreSheets[player]
	if not scoreSheet then
		return 0
	end

	local sum = 0

	for _, score in pairs(scoreSheet) do
		sum += score
	end

	return sum

end



-- Procedures
-- This is where functions designed to do something outside of computing and returning a value go.

--[[
Appends a score to a player's score sheet.

Inputs:
* player (player): The subject player.
* score (number): The score to add.
... [MUST] be greater than or equal to 0.

Actions:
* Adds the score to the player's score sheet.

Returns:
* (none)
]]
local function appendScore(player: Player, score: number)

	assert(score >= 0, "Score must be greater than or equal to 0")

	local scoreSheet = playerScoreSheets[player]
	if not scoreSheet then
		scoreSheet = {}
		playerScoreSheets[player] = scoreSheet
	end

	table.insert(scoreSheet, score)

end

--[[
Resets the score sheet for a player.

Inputs:
* player (player): The subject player.

Actions:
* Clears the player's recorded scores.

Returns:
* (none)
]]
local function resetScoreSheet(player: Player)
	playerScoreSheets[player] = {}
end



-- Lifecycle
-- This is what the handler should do autonomously.

--[[
Initialises all registered controllers.

Inputs:
* (none)

Actions:
* Calls each controller's Init method if it exists.

Returns:
* (none)
]]
local function initialiseControllers()

	for _, controller in pairs(CONTROLLERS) do
		if controller.Init then
			controller:Init()
		end
	end

end

--[[
Starts all registered controllers and binds player lifecycle events.

Inputs:
* (none)

Actions:
* Calls each controller's Start method if it exists.
* Tracks newly joined players and removes leaving players from state.

Returns:
* (none)
]]
local function startControllers()

	for _, controller in pairs(CONTROLLERS) do
		if controller.Start then
			coroutine.wrap(function()
				controller:Start()
			end)()
		end
	end

	Players.PlayerAdded:Connect(function(player: Player)
		playerScoreSheets[player] = {5}
	end)

	Players.PlayerRemoving:Connect(function(player: Player)
		playerScoreSheets[player] = nil
	end)

	print("ExemplaryClientHandler started.")

end

initialiseControllers()
startControllers()



-- Termination