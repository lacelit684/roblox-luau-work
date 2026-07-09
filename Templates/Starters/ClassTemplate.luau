--[[

	ClassTemplate.luau
	Class Definition

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
	Describe the class here.
	Keep this short and specific to the module's purpose.

	Dependencies:
	* Add any required modules, services, or libraries here.

]]

-- Argument documentation can have three tags for guidance.
-- [MUST] indicates the argument has to follow this rule or something evil will happen.
-- [SHOULD] indicates the argument ought to follow this rule or the program may not work as intended.
-- [MAY] indicates the argument can be controlled to produce different results.



local Class = {}

-- Preamble
-- This is where module imports, citations and declarations go.

Class.__index = Class



-- Types
-- This is where types go.

type ClassData = {}

export type ClassInstance = typeof(setmetatable({} :: ClassData, Class))



-- Constants
-- This is where constant values go.



-- Variables
-- This is where shared mutable state goes.



-- Constructors
-- This is where initialisation helpers go.

--[[
Creates a new instance of the class.

Inputs:
* (none)

Returns:
* [1] (ClassInstance): The new instance.
]]
function Class.new(): ClassInstance
	local self = {}
	return setmetatable(self, Class)
end



-- Functions
-- This is where functions that calculate and return a value go.



-- Procedures
-- This is where functions designed to do something outside of computing and returning a value go.



-- Termination

return Class