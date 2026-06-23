--[[

	LibraryCleanTemplate.luau
	
	Authors:
	* YOUR NAME - YOUR ROLE since YYYY-MM-DD
	
	Created: YYYY-MM-DD
	Last Modified: YYYY-MM-DD
	
	Version: 1.2.3
	
	License: LICENSE
	
	Description:
	REPLACE
	
	Citations:
	[1] AS SUCH
	
]]



-- Preamble

local module = {}

module.Citations = {
	[1] = "AS SUCH"
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
function module.GetCitations(index: number?)

	if index then
		return module.Citations[index]
	else
		return module.Citations
	end

end



-- Constants



-- Functions



-- Procedures



-- Termination

return module