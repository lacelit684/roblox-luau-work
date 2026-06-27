--[[

	LoggerClass.luau
	Class Definition
	
	Contributors:
	* Irene "lacelit684" - Lead Developer since 2026-06-26
	
	Created: 2026-06-26
	Last Modified: 2026-06-26
	
	Version: 0.0.0
	
	Licence: CC BY-NC
	
	Description:
	Class for loggers which print information in a standard format.

	Dependencies:
	(none)
	
]]



-- Preamble

local LoggerClass = {} -- REPLACE
LoggerClass.__index = LoggerClass



-- Types

type LoggerData = {
	Name: string,
	MinimumLevel: number
}

export type Logger = setmetatable<LoggerData, typeof(LoggerClass)>



-- Constants

LoggerClass.LEVEL_VERB = 1
LoggerClass.LEVEL_INFO = 2
LoggerClass.LEVEL_WARN = 3
LoggerClass.LEVEL_ERRR = 4
LoggerClass.LEVEL_FATL = 5



-- Variables



-- Constructors

function LoggerClass.new(name: string, minimumLevel: number?): Logger

	local self = {}

	self.Name = name
	self.MinimumLevel = minimumLevel or 2

	return setmetatable(self, LoggerClass)

end




-- Functions



-- Procedures

function LoggerClass:PrintVerbose(message: string)

	if not (self.MinimumLevel >= LoggerClass.LEVEL_VERB) then return end
	print(`[{self.Name}] <VERBOSE>: {message}`)

end

function LoggerClass:PrintInfo(message: string)

	if not (self.MinimumLevel >= LoggerClass.LEVEL_INFO) then return end
	print(`[{self.Name}] <INFO>: {message}`)

end

function LoggerClass:Warn(message: string)

	if not (self.MinimumLevel >= LoggerClass.LEVEL_WARN) then return end
	warn(`[{self.Name}] <WARNING>: {message}`)

end

function LoggerClass:ThrowError(message: string)

	if not (self.MinimumLevel >= LoggerClass.LEVEL_ERRR) then return end
	warn(`[{self.Name}] <ERROR>: {message}`)

end

function LoggerClass:ThrowFatal(message: string)

	if not (self.MinimumLevel >= LoggerClass.LEVEL_FATL) then return end
	warn(`[{self.Name}] <FATAL>: {message}`)

end


function LoggerClass:SetMinimumLevel(minimumLevel: number)

	assert(LoggerClass.LEVEL_VERB <= minimumLevel and minimumLevel <= LoggerClass.LEVEL_FATL, "Level must be in range 1 (verbose) to 5 (fatal)")
	self.MinimumLevel = minimumLevel

end



-- Lifecycle



-- Termination

return LoggerClass