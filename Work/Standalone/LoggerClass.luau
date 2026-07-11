--[[

	LoggerClass.luau
	Class Definition

	Contributors:
	* Irene "lacelit684" - Lead Developer since 2026-06-26

	Created: 2026-06-26
	Last Modified: 2026-06-28

	Version: 0.1.0

	Licence: MPL-2.0

	Description:
	Class for loggers which print information in a standard format.

	Dependencies:
	(none)

]]

-- Preamble

local LoggerClass = {}
LoggerClass.__index = LoggerClass

-- Types

type LoggerData = {
	Name: string,
	MinimumLevel: number,
}

export type Logger = setmetatable<LoggerData, typeof(LoggerClass)>

-- Constants

LoggerClass.LEVEL_VERBOSE = 1
LoggerClass.LEVEL_INFO = 2
LoggerClass.LEVEL_WARNING = 3
LoggerClass.LEVEL_ERROR = 4
LoggerClass.LEVEL_FATAL = 5

-- Constructors

--[[
Generates a new Logger.

Inputs:
* initialName (string): Initial name of the logger.
* initialMinimumLevel (number): Initial minimum level of the logger.
... [MUST] Be at least 
]]
function LoggerClass.new(initialName: string, initialMinimumLevel: number?): Logger

	local self: LoggerData = {
		Name = initialName,
		MinimumLevel = initialMinimumLevel or LoggerClass.LEVEL_INFO
	}

	return setmetatable(self, LoggerClass)

end

-- Procedures
function LoggerClass:PrintVerbose(message: string)
	if self.MinimumLevel > LoggerClass.LEVEL_VERBOSE then
		return
	end

	print(`[{self.Name}] <VERBOSE>: {message}`)
end

function LoggerClass:PrintInfo(message: string)
	if self.MinimumLevel > LoggerClass.LEVEL_INFO then
		return
	end

	print(`[{self.Name}] <INFO>: {message}`)
end

function LoggerClass:Warn(message: string)
	if self.MinimumLevel > LoggerClass.LEVEL_WARNING then
		return
	end

	warn(`[{self.Name}] <WARNING>: {message}`)
end

function LoggerClass:ThrowError(message: string)
	if self.MinimumLevel > LoggerClass.LEVEL_ERROR then
		return
	end

	warn(`[{self.Name}] <ERROR>: {message}`)
end

function LoggerClass:ThrowFatal(message: string)
	if self.MinimumLevel > LoggerClass.LEVEL_FATAL then
		return
	end

	warn(`[{self.Name}] <FATAL>: {message}`)
end


function LoggerClass:SetName(name: string)
	
end

function LoggerClass:SetMinimumLevel(minimumLevel: number)

	assert(
		LoggerClass.LEVEL_VERBOSE <= minimumLevel
		and minimumLevel <= LoggerClass.LEVEL_FATAL,
		"Level must be in range 1 (verbose) to 5 (fatal)"
	)

	self.MinimumLevel = minimumLevel

end

return LoggerClass