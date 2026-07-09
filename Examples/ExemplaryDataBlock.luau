--[[

	Path/To/ExemplaryDataBlock.luau
	Data Block
	Name your data block whatever.

	Contributors:
	* Irene "lacelit684" - Lead Developer since 2026-06-27
	State role, add and remove as needed.
	
	Created: 2026-06-27
	Last Modified: 2026-06-28
	Keep these up to date or your records will suffer your incompetence.
	
	Version: 0.0.1
	Increment the first one when you make a backwards incompatible change to the module.
	Increment the second one when you add backwards compatible functionality.
	Increment the third one when you fix bugs.
	
	Licence: MPL-2.0

	Description:
	Describe the data block here.
	This example shows how a static data block can bundle shared values and sample instances together.

	Dependencies:
	* Add any required modules, services, or libraries here. There probably won't be many for static data.

	You can also write extra things in this section, like a changelog, acknowledgements or a memorial.

]]

-- Argument documentation can have three tags for guidance.
-- [MUST] indicates the argument has to follow this rule or something evil will happen.
-- [SHOULD] indicates the argument ought to follow this rule or the program may not work as intended.
-- [MAY] indicates the argument can be controlled to produce different results.



-- Preamble
-- This is where module imports, citations and declarations go.

local ExemplaryClass = require("ExemplaryClass.luau")



-- Data
-- This is where data tables and static values go.

local ExemplaryDataBlock = { -- Name your block after the file name.
	["ExemplaryClassInstance1"] = ExemplaryClass.new(1, "fat", "🐥"),
	["yngspijonhdftsoijm_alphabet"] = "abcdefghijklmnopqrstuvwxyz"
}



-- Termination

return ExemplaryDataBlock