# Metadata

## Contributors
* <b>Irene "lacelit684"</b> - Lead Writer since 2026-06-27

## Dates
<b>Created:</b> 2026-06-27
<b>Last Modified:</b> 2026-06-27

## Legal
<b>Licence:</b> MPL-2.0

## Description
A markdown document on Irene's Luau and Roblox formatting conventions.

---

# Formatting Guide

## Module Headers

Every module should begin with a short header comment block that includes:
- the file name and module type
- contributor information
- creation and last-modified dates
- version information
- licence information
- a one-line description
- dependencies, citations, or notable notes when relevant

Such as:

```lua
--[[

	FileName.luau
	Module Type

	Contributors:
	* YOUR NAME - YOUR ROLE since YYYY-MM-DD

	Created: YYYY-MM-DD
	Last Modified: YYYY-MM-DD

	Version: 0.1.0
	Increment the first number for breaking changes.
	Increment the second for new backwards-compatible functionality.
	Increment the third for bug fixes.

	Licence: MPL-2.0

	Description:
	Describe the module here.

	Dependencies:
	Add any required modules, services, or libraries here.

]]
```

## Section Comments
Keep section comments intact and use them to organise code clearly. Sections present may vary based on module type, but common sections include:

- Preamble
- Types
- Constants
- Variables
- Constructors
- Functions
- Procedures
- Lifecycle
- Termination

For Roblox code, the Preamble section should also cover service references, module setup, and any required `require` calls.

## Commenting Style
Use comments to explain intent, constraints, and assumptions rather than restating obvious code.

### Function Documentation
Document functions with a short description followed by:
- Inputs
- Actions
- Returns

Use these tags where appropriate:
- \[MUST\] for hard requirements
- \[SHOULD\] for recommended constraints
- \[MAY\] for optional behaviour

If working with units, include them in input or return descriptions.

Example:

```lua
-- Calculates the distance travelled by a particle at constant velocity.
-- ---
-- Inputs:
-- * speed (number): The speed of the particle. | m s^-1
-- * timeTravelled (number): The time travelled. | s
-- ---
-- Returns:
-- * [1] (number): The distance travelled. | m
```

## Naming Conventions
- Use PascalCase for module tables, classes, and service/controller names.
- Use camelCase for functions, methods, locals, and variables.
- Use UPPER_SNAKE_CASE for constants.
- Keep names descriptive and explicit.
- Prefer `Init` and `Start` for lifecycle-style methods in services and controllers.

## Type Usage
- Prefer explicit parameter and return types.
- Use type aliases for unions and repeated object shapes.
- Export public types with `export type` when they matter outside the module.

## Roblox-Specific Notes
- Keep Roblox services in the Preamble section and Instance references in the Variables section.
- Use comments to explain why a module depends on a specific service, object, or RemoteEvent.
- For client/server modules, make the lifecycle intent obvious.
- Keep code readable - don't overcomment on already-intuitive logic.

## Minimalism
Comments are made to make modules quick to understand, not ornately documented for every trivial line.

### Prefer
- clear section comments
- enough documentation to explain non-obvious behaviour
- minimal filler and redundant boilerplate

### Avoid
- empty sections with no purpose
- repeated comments that say the same thing as the code
- excessive metadata that crowds out useful structure