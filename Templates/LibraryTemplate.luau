--[[

	LibraryTemplate.luau
	Utility Library
	
	Contributors:
	* YOUR NAME - YOUR ROLE since YYYY-MM-DD
	
	Created: YYYY-MM-DD
	Last Modified: YYYY-MM-DD
	
	Version: 1.2.3
	
	Licence: LICENCE
	
	Description:
	REPLACE
	
	Citations:
	[1] AS NEEDED

	Dependencies:
	AS NEEDED
	
]]



-- Preamble

local Library = {}

Library.Citations = {
	[1] = "AS NEEDED"
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
function Library:GetCitations(index: number?)

	if index then
		return Library.Citations[index]
	else
		return Library.Citations
	end

end



-- Types



-- Constants



-- Functions



-- Procedures



-- Termination

return Library