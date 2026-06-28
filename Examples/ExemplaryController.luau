--[[

	Path/To/ExemplaryController.luau
	Runtime Controller
	Name your controller whatever.

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
	Describe the controller here.
	This example shows how a lightweight runtime controller might keep its own state and expose lifecycle methods.

	Dependencies:
	Add any required modules, services, or libraries here.

]]

-- Argument documentation can have three tags for guidance.
-- [MUST] indicates the argument has to follow this rule or something evil will happen.
-- [SHOULD] indicates the argument ought to follow this rule or the program may not work as intended.
-- [MAY] indicates the argument can be controlled to produce different results.



local Controller = {}

-- Preamble
-- This is where module imports, citations and declarations go.

local RunService = game:GetService("RunService")



-- Types
-- This is where types go.

type ControllerState = {
	Active: boolean,
	TickCount: number,
	LastMessage: string,
}



-- Constants
-- This is where constant values go.

const DEFAULT_MESSAGE = "idle"

-- These are public constants exposed by the module table.
Controller.DEFAULT_MESSAGE = DEFAULT_MESSAGE



-- Variables
-- This is where shared mutable state goes.

local state: ControllerState = {
	Active = false,
	TickCount = 0,
	LastMessage = DEFAULT_MESSAGE,
}

local heartbeatConnection = nil



-- Functions
-- This is where functions that calculate and return a value go.

--[[
Returns the current tick count recorded by the controller.

Inputs:
* (none)

Returns:
* [1] (number): The number of processed controller ticks.
]]
function Controller:GetTickCount(): number
	return state.TickCount
end

--[[
Returns the controller's most recent status message.

Inputs:
* (none)

Returns:
* [1] (string): The current status string.
]]
function Controller:GetStatus(): string
	return state.LastMessage
end

--[[
Reduces the controller's tick count by the provided amount.

Inputs:
* amount (number): The amount which should be subtracted from the tick counter.
... [MUST] be an integer.
... [MUST] be greater than or equal to 1.

Returns:
* [1] (number): The updated tick count.
]]
function Controller:CountDown(amount: number): number

	assert(amount % 1 == 0, "Amount must be integer")
	assert(amount >= 1, "Amount must be 1 or greater")

	state.TickCount -= amount
	state.LastMessage = "counted down"

	return state.TickCount

end



-- Procedures
-- This is where functions designed to do something outside of computing and returning a value go.

--[[
Processes a heartbeat update from the engine.

Inputs:
* deltaTime (number): The elapsed time since the previous update.
... [SHOULD] be non-negative.

Actions:
* Advances the controller tick count.
* Updates the status message with the latest frame time.

Returns:
* (none)
]]
function Controller:Heartbeat(deltaTime: number)

	if not state.Active then
		return
	end

	state.TickCount += 1
	state.LastMessage = string.format("heartbeat %.3f", deltaTime)

end



-- Lifecycle
-- This is what the controller should do nearly autonomously.

--[[
Sets up the controller.

Inputs:
* (none)

Actions:
* Resets the controller state.
* Clears any previous connection handles.

Returns:
* (none)
]]
function Controller:Init()

	state.Active = false
	state.TickCount = 0
	state.LastMessage = DEFAULT_MESSAGE

	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end

	print("ExemplaryController initialised.")

end

--[[
Begins the active operation of the controller.

Inputs:
* (none)

Actions:
* Starts the heartbeat loop.
* Sets the controller to an active state.

Returns:
* (none)
]]
function Controller:Start()

	if state.Active then
		return
	end

	state.Active = true
	state.LastMessage = "running"

	heartbeatConnection = RunService.Heartbeat:Connect(function(deltaTime: number)
		self:Heartbeat(deltaTime)
	end)

	print("ExemplaryController started.")

end

--[[
Stops the active operation of the controller.

Inputs:
* (none)

Actions:
* Disconnects the heartbeat connection.
* Marks the controller as inactive.

Returns:
* (none)
]]
function Controller:Stop()

	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end

	state.Active = false
	state.LastMessage = "stopped"

	print("ExemplaryController stopped.")

end



-- Termination

return Controller