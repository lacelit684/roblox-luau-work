--[[

	BlackbodyPhysicsLibrary.luau
	Utility Library
	
	Contributors:
	* Irene "lacelit684" - Lead Developer since 2026-06-21
	
	Created: 2025-06-25
	Last Modified: 2026-06-24
	
	Version: 3.0.1
	
	Licence: MPL-2.0
	
	Description:
	Module for numerical calculation of approximate thermal radiation at a given temperature.

	Dependencies:
	MathsLibrary.luau
	
	Citations:
	[1] Wyman, C., Sloan, P.-P. and Shirley, P. (2013). Simple Analytic Approximations to the CIE XYZ Color Matching Functions. Journal of Computer Graphics Techniques, [online] 2(2), p.5. Available at: https://jcgt.org/published/0002/02/01/paper.pdf [Accessed 26 Jun. 2025].
	
	In Memoriam: Max Planck, Albert Einstein, Niels Bohr
	
	Remember, wavelength should stay in nanometres.
	
]]



-- Preamble

-- This declaration can be removed to free up a small amount of the native code budget at the cost of poor performance. You ought to leave this in unless you already have a large amount of native code in your project.
--!native

local BlackbodyPhysicsLibrary = {}

BlackbodyPhysicsLibrary.Citations = {
	[1] = "Wyman, C., Sloan, P.-P. and Shirley, P. (2013). Simple Analytic Approximations to the CIE XYZ Color Matching Functions. Journal of Computer Graphics Techniques, [online] 2(2), p.5. Available at: https://jcgt.org/published/0002/02/01/paper.pdf [Accessed 26 Jun. 2025]."
}

-- Fetches built-in citations.
-- ---
-- Inputs:
-- * index (number) (optional): The index of the citation to print.
-- ... [MUST] be an integer.
-- ... [MUST] be 1 or greater.
-- ---
-- Returns:
-- * [1] (string | table): The citation at the given index if index is present, or a table of all citations if index is absent.
function BlackbodyPhysicsLibrary.GetCitations(index: number?)

	if index then
		return BlackbodyPhysicsLibrary.Citations[index]
	else
		return BlackbodyPhysicsLibrary.Citations
	end

end

local MathsLibraryPointer: Instance? = script:FindFirstChild("MathsLibraryPointer")
if not (MathsLibraryPointer and MathsLibraryPointer:IsA("ObjectValue")) then error("Requires MathsLibrary.luau!") end
local MathsLibrary = require(MathsLibraryPointer.Value)



-- Constants

const NM_TO_M = 1E-9 -- Nanometer to meter conversion factor | m nm^-1

BlackbodyPhysicsLibrary.VISIBLE_MIN = 380 -- Start of visible spectrum (380 nm) | nm
BlackbodyPhysicsLibrary.VISIBLE_MAX = 780 -- End of visible spectrum (780 nm) | nm

const PLANCK_CONSTANT = 6.6261E-34 -- Planck's constant | J s
const SPEED_OF_LIGHT = 299792458 -- Speed of light in a vacuum | m s^-1
const BOLTZMANN_CONSTANT = 1.3806E-23 -- Boltzmann's constant | J K^-1



-- Functions


-- Calculates the spectral radiance of a blackbody at a given wavelength and temperature.
-- ---
-- Inputs:
-- * wavelength (number): The wavelength to calculate for. | nm
-- ... [MUST] Be greater than 0.
-- * temperature (number): The temperature to calculate for. | K
-- ... [SHOULD] Be greater than 0.
-- ---
-- Returns:
-- * [1] (number): The spectral radiance of the blackbody at the given wavelength and temperature. | J s^-1 m^-2 sr^-1 nm^-1
function BlackbodyPhysicsLibrary.SpectralRadiance(wavelength: number, temperature: number)
	
	assert(wavelength > 0, "Wavelength must be greater than 0")

	local numerator = 2 * PLANCK_CONSTANT * SPEED_OF_LIGHT^2

	local denominator = (wavelength ^ 5) * (
		math.exp(
			PLANCK_CONSTANT
				* SPEED_OF_LIGHT
				* wavelength ^ -1
				* BOLTZMANN_CONSTANT ^ -1
				* temperature ^ -1
		)
		- 1
	)

	return MathsLibrary.SafeDivide(numerator, denominator)

end


-- Calculates the relative large cone stimulus value for a given wavelength of light. [1]
-- ---
-- Inputs:
-- * wavelength (number): The wavelength to calculate for. | nm
-- ... [MUST] Be greater than 0.
-- ---
-- Returns:
-- * [1] (number): The relative large cone stimulus value for the given wavelength of light.
function BlackbodyPhysicsLibrary.XStimulus(wavelength: number)

	assert(wavelength > 0, "Wavelength must be greater than 0")

	local scale_1 = (wavelength - 442.0) * (if wavelength < 442.0 then 0.0624 else 0.0374)
	local scale_2 = (wavelength - 599.8) * (if wavelength < 599.8 then 0.0264 else 0.0323)
	local scale_3 = (wavelength - 501.1) * (if wavelength < 501.1 then 0.0490 else 0.0382)

	return
		  0.362 * math.exp(-0.5 * scale_1 ^ 2)
		+ 1.056 * math.exp(-0.5 * scale_2 ^ 2)
		- 0.065 * math.exp(-0.5 * scale_3 ^ 2)

end

-- Calculates the relative medium cone stimulus value for a given wavelength of light. [1]
-- ---
-- Inputs:
-- * wavelength (number): The wavelength to calculate for. | nm
-- ... [MUST] Be greater than 0.
-- ---
-- Returns:
-- * [1] (number): The relative medium cone stimulus value for the given wavelength of light.
function BlackbodyPhysicsLibrary.YStimulus(wavelength: number)

	assert(wavelength > 0, "Wavelength must be greater than 0")

	local scale_1 = (wavelength - 568.8) * (if wavelength < 568.8 then 0.0213 else 0.0247)
	local scale_2 = (wavelength - 530.9) * (if wavelength < 530.9 then 0.0613 else 0.0322)

	return
		  0.821 * math.exp(-0.5 * scale_1 ^ 2)
		+ 0.286 * math.exp(-0.5 * scale_2 ^ 2)

end

-- Calculates the relative small cone stimulus value for a given wavelength of light. [1]
-- ---
-- Inputs:
-- * wavelength (number): The wavelength to calculate for. | nm
-- ... [MUST] Be greater than 0.
-- ---
-- Returns:
-- * [1] (number): The relative small cone stimulus value for the given wavelength of light.
function BlackbodyPhysicsLibrary.ZStimulus(wavelength: number)

	assert(wavelength > 0, "Wavelength must be greater than 0")

	local scale_1 = (wavelength - 437.0) * (if wavelength < 437.0 then 0.0845 else 0.0278)
	local scale_2 = (wavelength - 459.0) * (if wavelength < 459.0 then 0.0385 else 0.0725)

	return
		  1.217 * math.exp(-0.5 * scale_1 ^ 2)
		+ 0.681 * math.exp(-0.5 * scale_2 ^ 2)

end


-- Calculates the relative tristimulus values for a given wavelength of light. [1]
-- ---
-- Inputs:
-- * wavelength (number): The wavelength to calculate for. | nm
-- ... [MUST] Be greater than 0.
-- ---
-- Returns:
-- * [1] (number): The relative large cone stimulus value for the given wavelength of light.
-- * [2] (number): The relative medium cone stimulus value for the given wavelength of light.
-- * [3] (number): The relative small cone stimulus value for the given wavelength of light.
function BlackbodyPhysicsLibrary.Tristimulus(wavelength: number)

	assert(wavelength > 0, "Wavelength must be greater than 0")

	return
		BlackbodyPhysicsLibrary.XStimulus(wavelength),
		BlackbodyPhysicsLibrary.YStimulus(wavelength),
		BlackbodyPhysicsLibrary.ZStimulus(wavelength)

end


-- Calculates the power emitted by a blackbody at a given temperature, angle, and area by numerically integrating the product of the spectral radiance and the solid angle subtended by the area over a given wavelength range.
-- ---
-- Inputs:
-- * temperature (number): The temperature to calculate for. | K
-- ... [MUST] Be greater than 0.
-- * angle (number) (optional): The angle subtended by the area. | sr
-- ... [MUST] Be greater than 0 if present.
-- ... [MAY] Be omitted to default to 1 sr.
-- * area (number) (optional): The area to calculate for. | m^2
-- ... [MUST] Be greater than 0 if present.
-- ... [MAY] Be omitted to default to 1 m^2.
-- * minimumWavelength (number) (optional): The minimum wavelength to integrate over. | nm
-- ... [MUST] Be greater than 0 if present.
-- ... [MAY] Be omitted to default to the start of the visible spectrum (380 nm).
-- * maximumWavelength (number) (optional): The maximum wavelength to integrate over. | nm
-- ... [MUST] Be greater than 0 if present.
-- ... [MAY] Be omitted to default to the end of the visible spectrum (780 nm).
-- * gammaStep (number) (optional): The step size to use for the numerical integration. | nm
-- ... [MUST] Be greater than 0 if present.
-- ... [MAY] Be omitted to default to 1 nm.
-- ... [MAY] Be adjusted to control the balance between computational load and accuracy.
-- ---
-- Returns:
-- * [1] (number): The power emitted by the blackbody at the given temperature, angle, and area. | J s^-1
function BlackbodyPhysicsLibrary.BlackbodyPower(
	temperature: number,
	angle: number?,
	area: number?,
	
	minimumWavelength: number?,
	maximumWavelength: number?,
	
	gammaStep: number?
)
	
	local step: number = gammaStep or 1
	local minimum: number = minimumWavelength or BlackbodyPhysicsLibrary.VISIBLE_MIN
	local maximum: number = maximumWavelength or BlackbodyPhysicsLibrary.VISIBLE_MAX
	
	local power = 0
	
	for wavelength = minimum, maximum, step do

		local wavelengthMeters = wavelength * NM_TO_M

		local radiance = BlackbodyPhysicsLibrary.SpectralRadiance(wavelengthMeters, temperature)

		power += step * radiance * angle * area

	end
	
	return power
	
end



-- Termination

return BlackbodyPhysicsLibrary