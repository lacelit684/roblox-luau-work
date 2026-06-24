--[[

	ClassTemplate.luau
	Class Definition
	
	Contributors:
	* YOUR NAME - YOUR ROLE since YYYY-MM-DD
	
	Created: YYYY-MM-DD
	Last Modified: YYYY-MM-DD
	
	Version: 1.2.3
	
	License: LICENSE
	
	Description:
	REPLACE

	Dependencies:
	AS NEEDED
	
]]



-- Preamble

local Class = {} -- REPLACE
Class.__index = Class



-- Types

type ClassData = {

}

export type Class = typeof(setmetatable({} :: ClassData, Class))



-- Constants



-- Variables



-- Constructors

function Class.new()

	local self = {}

	return setmetatable(self, Class)

end




-- Functions



-- Procedures



-- Lifecycle



-- Termination

return Class