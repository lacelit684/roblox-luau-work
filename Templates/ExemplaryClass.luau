--[[

	Path/To/ExemplaryClass.luau
	Class Definition
	Name your class whatever.
	
	Contributors:
	* Irene "lacelit684" - Lead Developer since 2026-06-24
	State role, add and remove as needed.
	
	Created: 2026-06-24
	Last Modified: 2026-06-24
	Keep these up to date or your records will suffer your incompetence.
	
	Version: 0.0.0
	Increment the first one when you make a backwards incompatible change to the module.
	Increment the second one when you add backwards compatible functionality.
	Increment the third one when you fix bugs.
	
	Licence: MPL-2.0
	
	Description:
	Describe the class here.
	Exemplary class showcasing and interactively documenting Irene's programming conventions for class definitions.

	Dependencies:
	They go here.
	
	You can also write extra things in this section, like a changelog, acknowledgements or a memorial.
	I used this to pay my respects to the fathers of the field of physics in my previous libraries.
	
]]



-- Preamble

local ExemplaryClass = {} -- Name your class after the file name.
ExemplaryClass.__index = ExemplaryClass



-- Types

-- Are there even annotations for types???
type Chicken = ("🐥" | "🐤" | "🐣" | "🐔" | "🍗")

type ClassData = {
	Alpha: number,
	Bravo: string,
	Charlie: Chicken?
}

export type Class = typeof(setmetatable({} :: ClassData, ExemplaryClass))



-- Constants



-- Variables



-- Constructors

-- Generates a new instance of ExemplaryClass.
-- ---
-- Inputs:
-- * alpha (number): The value of this instance's Alpha.
-- * bravo (string): The value of this instance's Bravo.
-- * charlie (Chicken): The value of this instance's Charlie.
-- ... What? Excuse me?
-- Returns:
-- * [1]: The initialised instance of ExemplaryClass.
function ExemplaryClass.new(alpha: number, bravo: string, charlie: Chicken?)

	local self = {}
	self.Alpha = alpha
	self.Bravo = bravo
	self.Charlie = charlie

	return setmetatable(self, ExemplaryClass)

end



-- Functions


-- Returns the repetition of this ExemplaryClass's Alpha by this ExemplaryClass's Bravo multiplied by a factor.
-- ---
-- Inputs:
-- * factor (number): The value with which to multiply the amount of repetitions by.
-- Returns:
-- * [1]: The ExemplaryClass's Alpha string repeated.
function ExemplaryClass:Generate(factor: number)

	local count = self.Alpha * factor

	assert(count % 1 == 0, "Product of Alpha and factor must be integer")
	assert(count >= 0, "Product of Alpha and factor must be at least 0")
	
	return self.Bravo:rep(self.Alpha * factor)

end



-- Procedures

-- Prints the string associated with this ExemplaryClass's Charlie.
-- ---
-- Inputs:
-- * (none)
-- ---
-- Returns:
-- * (none)
function ExemplaryClass:MakeASoundCharlie()

	local chicken = self.Charlie

	if chicken == "🐤" or chicken == "🐥" or chicken == "🐣" then
		print("cheep cheep")
		return
	end

	if chicken == "🐔" then
		print("cluck cluck cluck")
		return
	end

	if chicken == "🍗" then
		print("I bore witness to the vicious yet calculated slaughter of my brethren. Eventually, the giants took an iron grip on me, and I had nowhere to run as they tore my throat open as easily as they birthed me in their gray and white monolith, a monument against the heavens. My plumes ripped off - my flesh coated and scalded with boiling oil for an eternity - crushed, wrecked, torn apart and corroded in an eldritch oleum - is this hell?")
		return
	end

	print("...")

end



-- Termination

return ExemplaryClass