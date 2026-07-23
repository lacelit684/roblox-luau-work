--[[

	Path/To/ExemplaryClass.luau
	Class Definition
	Name your class whatever.
	
	Contributors:
	- Lucy "lacelit684" - Lead Developer since 2026-07-23
	State role, add and remove as needed.
	
	Created: 2026-06-24
	Last Modified: 2026-07-23
	Keep these up to date or your records will suffer your incompetence.
	
	Version: 0.0.1
	Increment the first one when you make a backwards incompatible change to the module.
	Increment the second one when you add backwards compatible functionality.
	Increment the third one when you fix bugs.
	
	Licence: MPL-2.0
	
	Description:
	Describe the class here.
	This example shows how a class can define typed state, public constants, constructors, and instance methods.

	Dependencies:
	* Add any required modules, services, or libraries here.
	
	You can also write extra things in this section, like a changelog, acknowledgements or a memorial.
	
]]

-- Argument documentation can have three tags for guidance.
-- [MUST] indicates the argument has to follow this rule or something evil will happen.
-- [SHOULD] indicates the argument ought to follow this rule or the program may not work as intended.
-- [MAY] indicates the argument can be controlled to produce different results.



local ExemplaryClass = {} -- Name your class after the file name.

-- Preamble
-- This is where module imports, citations and declarations go.

ExemplaryClass.__index = ExemplaryClass



-- Types
-- This is where types go.

type Chicken = ("🐥" | "🐤" | "🐣" | "🐔" | "🍗")

type ExemplaryClassData = {
	Alpha: number,
	Bravo: string,
	Charlie: Chicken?
}

export type ExemplaryClassInstance = typeof(setmetatable({} :: ExemplaryClassData, ExemplaryClass))



-- Constants
-- This is where constant values go.

-- If you have constants, write them down like so.
-- If people will argue over what the value could be, write the actual value somewhere in the description.
const DEFAULT_ALPHA = 0 -- Default value for Alpha when a caller does not provide one.
const DEFAULT_BRAVO = "" -- Default string for Bravo when a caller does not provide one.
const DEFAULT_CHARLIE = "🐥" -- Default chicken variant used for examples.

-- These are public constants exposed by the module table.
ExemplaryClass.DEFAULT_ALPHA = DEFAULT_ALPHA
ExemplaryClass.DEFAULT_BRAVO = DEFAULT_BRAVO
ExemplaryClass.DEFAULT_CHARLIE = DEFAULT_CHARLIE



-- Variables
-- This is where shared mutable state goes.
-- Keep this section brief unless the class genuinely needs it.



-- Constructors
-- This is where dedicated functions that generate the given class go.

--[[
Generates a new instance of ExemplaryClass.

@param alpha number -- The numeric value assigned to the instance's Alpha field. | [MUST] Be finite.
@param bravo string -- The string value assigned to the instance's Bravo field.
@param charlie Chicken? -- The optional chicken variant assigned to the instance's Charlie field. | [MAY] Be omitted.

@return ExemplaryClassInstance -- The initialised instance of ExemplaryClass.
]]
function ExemplaryClass.new(alpha: number, bravo: string, charlie: Chicken?): (ExemplaryClassInstance)

	local self = {}
	self.Alpha = alpha
	self.Bravo = bravo
	self.Charlie = charlie

	return setmetatable(self, ExemplaryClass)

end



-- Functions
-- This is where functions that calculate and return a value go.

--[[
Repeats the Bravo string a number of times derived from Alpha and a scaling factor.

@param factor number -- The multiplier applied to the number of repetitions. | [MUST] Be an integer. [MUST] Not be less than 0.

@return string -- The repeated Bravo string.
]]
function ExemplaryClass:Generate(factor: number): (string)

	local count = self.Alpha * factor

	assert(count % 1 == 0, "Product of Alpha and factor must be integer")
	assert(count >= 0, "Product of Alpha and factor must be at least 0")
	
	return self.Bravo:rep(count)

end



-- Procedures
-- This is where functions designed to do something outside of computing and returning a value go.

--[[
Prints the string associated with this ExemplaryClass's Charlie field.

Actions:
- Prints a short phrase based on the current chicken value. Falls back to an ellipsis when the value is unknown.
]]
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
		print("Is this hell? My skin scalded of oleum, my feathers shredded away, my organs denatured into chaos...")
		return
	end

	print("...")

end



-- Termination

return ExemplaryClass