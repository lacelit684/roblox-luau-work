local Library = {} -- Don't copy this, it's just to make the static analyser shut up.

Library._Citations = {
	[1] = "AS NEEDED"
}

--[[
Fetches built-in citations.

Inputs:
* index (number) (optional): The index of the citation to print.
... [MUST] be an integer if passed.
... [MUST] be 1 or greater.
... [MAY] be excluded to fetch a table of all citations instead.

Returns:
* [1] (string | {string}): The citation at the given index if index is present, or a table of all citations if index is absent.
]]
function Library:GetCitations(index: number?): (string | {string})

	if index then
		return Library._Citations[index]
	else
		return Library._Citations
	end

end