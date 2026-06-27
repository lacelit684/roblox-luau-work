--[[

	ColourScienceLibrary.luau
	Utility Library
	
	Authors:
	* Irene "lacelit684" - Lead Developer since 2026-06-22
	
	Created: 2026-06-22
	Last Modified: 2026-06-24
	
	Version: 2.0.1
	
	License: MPL-2.0
	
	Description:
	Module for numerical calculation regarding digital colour science concepts.
	
	Citations:
	[1] Viggiano, J.A.S., Salvaggio, N. and Sampat, N. (n.d.). Chromaticity Matrix to Tristimulus Matrix Conversion for RGB Color Spaces -Even In the Dark. [online] Rochester Institute of Technology, p.2. Available at: https://s3.cad.rit.edu/cadgallery_production/storage/media/uploads/projects/1441/documents/390/chromaticitymatrixtotristimulusmatrixconversionfor.pdf [Accessed 26 Jun. 2025].
	[2] TrueGeometry (2025). Gamma Curve Analysis. [online] True Geometry’s Blog. Available at: https://blog.truegeometry.com/calculators/Explain_the_piecewise_nature_of_the_sRGB_gamma_curve_and_why_it_was_implemented_calculation.html [Accessed 26 Jun. 2025].
	
]]



-- Preamble

-- This declaration can be removed to free up a small amount of the native code budget at the cost of poor performance. You ought to leave this in unless you already have a large amount of native code in your project.
--!native

local ColourScienceLibrary = {}

ColourScienceLibrary.Citations = {
	[1] = "Viggiano, J.A.S., Salvaggio, N. and Sampat, N. (n.d.). Chromaticity Matrix to Tristimulus Matrix Conversion for RGB Color Spaces -Even In the Dark. [online] Rochester Institute of Technology, p.2. Available at: https://s3.cad.rit.edu/cadgallery_production/storage/media/uploads/projects/1441/documents/390/chromaticitymatrixtotristimulusmatrixconversionfor.pdf [Accessed 26 Jun. 2025].",
	[2] = "TrueGeometry (2025). Gamma Curve Analysis. [online] True Geometry’s Blog. Available at: https://blog.truegeometry.com/calculators/Explain_the_piecewise_nature_of_the_sRGB_gamma_curve_and_why_it_was_implemented_calculation.html [Accessed 26 Jun. 2025]."
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
function ColourScienceLibrary:GetCitations(index: number?)

	if index then
		return ColourScienceLibrary.Citations[index]
	else
		return ColourScienceLibrary.Citations
	end

end



-- Constants

ColourScienceLibrary.VISIBLE_MIN = 380 -- Start of visible spectrum (380 nm) | nm
ColourScienceLibrary.VISIBLE_MAX = 780 -- End of visible spectrum (780 nm) | nm



-- Functions

-- Calculates the relative large cone stimulus value for a given wavelength of light. [1]
-- ---
-- Inputs:
-- * wavelength (number): The wavelength to calculate for. | nm
-- ... [MUST] Be greater than 0.
-- ---
-- Returns:
-- * [1] (number): The relative large cone stimulus value for the given wavelength of light.
function ColourScienceLibrary.XStimulus(wavelength: number)

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
function ColourScienceLibrary.YStimulus(wavelength: number)

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
function ColourScienceLibrary.ZStimulus(wavelength: number)

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
function ColourScienceLibrary.Tristimulus(wavelength: number)

	assert(wavelength > 0, "Wavelength must be greater than 0")

	return
		ColourScienceLibrary.XStimulus(wavelength),
		ColourScienceLibrary.YStimulus(wavelength),
		ColourScienceLibrary.ZStimulus(wavelength)

end


-- Calculates the linear RGB values of a colour from its CIE XYZ tristimulus values. [1]
-- ---
-- Inputs:
-- * x (number): The large cone tristimulus value.
-- ... [SHOULD] Be greater than or equal to 0.
-- * y (number): The medium cone tristimulus value.
-- ... [SHOULD] Be greater than or equal to 0.
-- * z (number): The small cone tristimulus value.
-- ... [SHOULD] Be greater than or equal to 0.
-- ---
-- Returns:
-- * [1] (number): The red linear RGB value.
-- * [2] (number): The green linear RGB value.
-- * [3] (number): The blue linear RGB value.
function ColourScienceLibrary.XYZToLRGB(x: number, y: number, z: number)

	local red   =  3.2404542 * x - 1.5371385 * y - 0.4985314 * z
	local green = -0.9692660 * x + 1.8760108 * y + 0.0415560 * z
	local blue  =  0.0556434 * x - 0.2040259 * y + 1.0572252 * z

	return red, green, blue

end


-- Calculates the gamma-corrected display sRGB version of a linear RGB value. [2]
-- ---
-- Inputs:
-- * value (number): The linear RGB value to correct.
-- ... [SHOULD] Be in the range [0, 1].
-- * accurate (boolean) (optional): If true, uses a more accurate though marginally slower gamma correction.
-- ... [MAY] Be omitted to default to false.
-- ---
-- Returns:
-- * [1] (number): The gamma-corrected sRGB value.
function ColourScienceLibrary.GammaCorrection(value: number, accurate: boolean?)

	accurate = not not accurate

	if accurate then
		if value <= 0.0031308 then
			return 12.92 * value
		else
			return 1.055 * ( value ^ (1 / 2.4) ) - 0.055
		end
	else
		return value ^ (1 / 2.2)
	end

end


-- Calculates the gamma-corrected display sRGB values of a colour from its clamped linear RGB values. [2]
-- ---
-- Inputs:
-- * red (number): The red linear RGB value.
-- ... [SHOULD] Be in the range [0, 1].
-- * green (number): The green linear RGB value.
-- ... [SHOULD] Be in the range [0, 1].
-- * blue (number): The blue linear RGB value.
-- ... [SHOULD] Be in the range [0, 1].
-- * accurate (boolean) (optional): If true, uses a more accurate though marginally slower gamma correction.
-- ... [MAY] Be omitted to default to false.
-- ---
-- Returns:
-- * [1] (number): The gamma-corrected sRGB red value.
-- * [2] (number): The gamma-corrected sRGB green value.
-- * [3] (number): The gamma-corrected sRGB blue value.
function ColourScienceLibrary.LRGBToDisplay(
	red: number,
	green: number,
	blue: number,
	
	accurate: boolean?
)

	return
		math.clamp(ColourScienceLibrary.GammaCorrection( red, accurate ), 0, 1),
		math.clamp(ColourScienceLibrary.GammaCorrection( green, accurate ), 0, 1),
		math.clamp(ColourScienceLibrary.GammaCorrection( blue, accurate ), 0, 1)

end



-- Procedures



-- Termination

return ColourScienceLibrary