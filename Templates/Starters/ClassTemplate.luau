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
	Add any required modules, services, or libraries here.

]]

local Class = {}
Class.__index = Class



-- Preamble
-- This is where module imports, citations and declarations go.

-- Types
-- This is where types go.

type ClassData = {}

export type ClassInstance = setmetatable<ClassData, typeof(Class)>



-- Constants
-- This is where constant values go.

-- Variables
-- This is where shared mutable state goes.

-- Constructors
-- This is where initialisation helpers go.

function Class.new()
	local self = {}
	return setmetatable(self, Class)
end



-- Functions
-- This is where functions that calculate and return a value go.

-- Procedures
-- This is where functions designed to do something outside of computing and returning a value go.

-- Termination

return Class