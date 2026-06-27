--[[

	MathsLibrary.luau
	Utility Library
	
	Authors:
	* Irene "lacelit684" - Lead Developer since 2026-06-23
	
	Created: 2026-06-23
	Last Modified: 2026-06-24
	
	Version: 0.0.1
	
	License: MPL-2.0
	
	Description:
	Module for calculating some maths using helpers.
	
]]



-- Preamble

-- This declaration can be removed to free up a small amount of the native code budget at the cost of poor performance. You ought to leave this in unless you already have a large amount of native code in your project. This is a mathematics library. You really ought to.
--!native

local MathsLibrary = {}

MathsLibrary.Citations = {}

-- Fetches built-in citations.
-- ---
-- Inputs:
-- * index (number) (optional): The index of the citation to print.
-- ... [MUST] be an integer.
-- ... [MUST] be 1 or greater.
-- ---
-- Returns:
-- * [1] (string | table): The citation at the given index if index is present, or a table of all citations if index is absent.
function MathsLibrary:GetCitations(index: number?)

	if index then
		return MathsLibrary.Citations[index]
	else
		return MathsLibrary.Citations
	end

end



-- Constants

MathsLibrary.VISIBLE_MIN = 380 -- Start of visible spectrum (380 nm) | nm
MathsLibrary.VISIBLE_MAX = 780 -- End of visible spectrum (780 nm) | nm



-- Functions

-- Calculates the quotient a dividend and a divisor without throwing an error upon division by invalid divisor.
-- ---
-- Inputs:
-- * dividend (number): The number to divide.
-- * divisor (number): The number to divide by.
-- ... [SHOULD] Not be 0 or nil.
-- ---
-- Returns:
-- * [1] (number): The result of the division, or 0 if the divisor is 0 or nil.
function MathsLibrary.SafeDivide(dividend: number, divisor: number)

	if divisor == 0 or divisor == nil then
		return 0
	else
		return dividend / divisor
	end

end


-- Calculates the sum of all unpacked arguments.
-- ---
-- Inputs:
-- * ... ({number}): The arguments to sum.
-- ... [MAY] Be a tuple.
-- ---
-- Returns:
-- * [1] (number): The sum of the unpacked arguments.
function MathsLibrary.Sum(...: number)

	local sum = 0

	for _, number in pairs({...}) do
		sum += number
	end

	return sum

end


-- Calculates the potentially partial integration of a function over a domain of real values.
-- ---
-- Inputs:
-- * integrandFunction (function): The function to integrate.
-- ... [MUST] Take a number as the first argument and return one number.
-- ... The variable will be forwarded into the first argument to integrate the function.
-- ... [MAY] Take additional constant arguments.
-- ... Extra positional arguments will be forwarded to these in order.
-- * minimumValue (number) (optional): The minimum value to integrate from.
-- ... [MUST] Be greater than 0 if present.
-- ... [MAY] Be omitted to default to the start of the visible spectrum in nanometres (380).
-- * maximumValue (number) (optional): The maximum value to integrate to.
-- ... [MUST] Be greater than 0 if present.
-- ... [MAY] Be omitted to default to the end of the visible spectrum in nanometres (780).
-- * gammaStep (number) (optional): The step size to use for the numerical integration.
-- ... [MUST] Be greater than 0 if present.
-- ... [MAY] Be omitted to default to 1.
-- ... [MAY] Be adjusted to control the balance between computational load and accuracy.
-- * ... (any?) (optional): Additional constant arguments to forward to the spectrum function.
-- ---
-- Returns:
-- * [1] (number): The result of the integral.
function MathsLibrary.PartialIntegration(
	integrandFunction: (number, ...any?) -> number,
	
	minimumWavelength: number?,
	maximumWavelength: number?,

	gammaStep: number?,
	
	...: any?
)

	local step: number = gammaStep or 1
	local minimum: number = minimumWavelength or MathsLibrary.VISIBLE_MIN
	local maximum: number = maximumWavelength or MathsLibrary.VISIBLE_MAX

	local integral = 0

	local extraArgs = table.pack(...)

	for wavelength = minimum, maximum, step do

		integral += integrandFunction(wavelength, table.unpack(extraArgs))

	end

	return integral

end



-- Procedures



-- Termination

return MathsLibrary