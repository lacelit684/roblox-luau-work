--[[

	Path/To/ExemplaryLibrary.luau
	Library
	Name your library whatever.
	
	Contributors:
	* Irene "lacelit684" - Lead Developer since 2026-06-21
	State role, add and remove as needed.
	
	Created: 2026-06-21
	Last Modified: 2026-06-28
	Keep these up to date or your records will suffer your incompetence.
	
	Version: 0.0.3
	Increment the first one when you make a backwards incompatible change to the module.
	Increment the second one when you add backwards compatible functionality.
	Increment the third one when you fix bugs.
	
	Licence: MPL-2.0
	
	Description:
	Describe the library here.
	This example shows how a utility library can expose constants, helper functions, and procedural utilities.
	
	Citations:
	[1] Use Harvard citations to cite your sources for whatever magic data.

	Dependencies:
	* Add any required modules, services, or libraries here.
	
	You can also write extra things in this section, like a changelog, acknowledgements or a memorial.
	I used this to pay my respects to the fathers of the field of physics in my previous libraries.
	
]]

-- Argument documentation can have three tags for guidance.
-- [MUST] indicates the argument has to follow this rule or something evil will happen.
-- [SHOULD] indicates the argument ought to follow this rule or the program may not work as intended.
-- [MAY] indicates the argument can be controlled to produce different results.



local ExemplaryLibrary = {} -- Name your library after the file name.

-- Preamble
-- This is where module imports, citations and declarations go.



-- Types
-- This is where types go.

type AlphaBravo = ("A" | "B")



-- Constants
-- This is where constant values go.

-- If you have constants, write down down like so.
-- If people will argue over what the value could be, write the actual value somewhere in the description.

const NM_TO_M = 1E-9 -- Nanometer to meter conversion factor | m nm^-1

-- These are public constants exposed by the module table.

ExemplaryLibrary.VISIBLE_MIN = 380 -- Start of visible spectrum (380 nm) | nm
ExemplaryLibrary.VISIBLE_MAX = 780 -- End of visible spectrum (780 nm) | nm

const PLANCK_CONSTANT = 6.6261E-34 -- Planck's constant | J s
const SPEED_OF_LIGHT = 299792458 -- Speed of light in a vacuum | m s^-1
const BOLTZMANN_CONSTANT = 1.3806E-23 -- Boltzmann's constant | J K^-1

const IRENE_HAS_GIRLFRIEND = false -- Whether Irene has a girlfriend (false) (this is so sad chat)

const alpha: AlphaBravo = "A" -- A for Alpha



-- Variables
-- This is where shared mutable state goes.

local bravo: AlphaBravo = "B" -- B for Bravo



-- Functions
-- This is where functions that calculate and return a value go.

--[[
Calculates the distance travelled by a particle at constant velocity.

Inputs:
* speed (number): The speed of the particle. | m s^-1
... [SHOULD] Not be negative.
* timeTravelled (number): The time the particle has travelled for. | s
... [SHOULD] Not be negative.

Returns:
* [1] (number): The distance travelled by the particle. | m
]]
function ExemplaryLibrary.DistanceTravelled(speed: number, timeTravelled: number): (number)
	return speed * timeTravelled
end

--[[
Calculates the speed of a particle given the distance travelled and the time taken.

Inputs:
* distanceTravelled (number): The distance travelled by the particle. | m
... [SHOULD] Not be negative.
* timeTravelled (number): The time the particle has travelled for. | s
... [MUST] Not be zero.
... [SHOULD] Not be negative.

Returns:
* [1] (number): The speed of the particle. | m s^-1
]]
function ExemplaryLibrary.SpeedCalculation(distanceTravelled: number, timeTravelled: number): (number)

	assert(timeTravelled ~= 0, "Time travelled must not be zero")
	return distanceTravelled / timeTravelled

end

-- We have the Shift + scroll combo for a reason.

--[[
Numerically integrates a numeric one-argument function over a given domain using a left Riemann sum.

Inputs:
* functionToIntegrate (function): The function to integrate.
... [SHOULD] Take a single number as input and return a single number.
* domainMin (number): The minimum value of the domain.
* domainMax (number): The maximum value of the domain.
* stepSize (number): The precision of the integration. Defaults to 1e-3.
... [MUST] Not be zero.
... [MAY] Be adjusted to control the balance between computational load and accuracy.

Returns:
* [1] (number): The result of the integration.
]]
function ExemplaryLibrary.NumericallyIntegrateCrap(
	functionToIntegrate: (number) -> number,
	
	domainMin: number,
	domainMax: number,
	
	stepSize: number?
): (number)

	local step = stepSize or 1e-3
	assert(step ~= 0, "Step size must not be zero")

	local area = 0

	-- God help your poor, poor server CPU...
	for x = domainMin, domainMax, step do

		area += functionToIntegrate(x) * step

	end

	return area

end



-- Procedures
-- This is where functions designed to do something outside of computing and returning a value go.

--[[
Prints an asterisk Christmas tree and something nice.

Inputs:
* height (number): The height of the tree.
... [SHOULD] be greater than 0.
Actions:

* Prints a nice little asterisk tree to the console.
* Also prints "your mom".

Returns:
* [1] (boolean): The success state of the function body.
* [2] (unknown): The error message if the function fails.
]]
function ExemplaryLibrary.PrintTree(height: number): (boolean, any)

	local success, err = pcall(function()

		for i = 1, height do

			print(
				string.rep(" ", height - i),
				string.rep("*", 1 + 2 * i),
				string.rep(" ", height - i)
			)

		end

		print("your mom")

	end)

	return success, err

end



-- Termination

return ExemplaryLibrary