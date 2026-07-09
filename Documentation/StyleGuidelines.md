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

## Module-Specific Conventions

Use the detailed reference in [ModuleTypeGuidelines.md](ModuleTypeGuidelines.md) for implementation-specific guidance. The common rule is simple: match the module's role to its shape.

- Class modules should model a concrete object or concept, expose a constructor, and keep state and behavior together.
- Service modules should own long-lived shared state, react to events, and expose lifecycle methods such as `Init` and `Start`.
- Controller modules should coordinate runtime behavior for a feature, UI flow, or gameplay system without becoming a dumping ground for unrelated logic.
- DataBlock modules should represent data schemas, config tables, or reusable records with minimal side effects.
- Library modules should contain stateless helpers, conversion utilities, and shared calculations.
- Handler modules should sit at the boundary of a runtime layer and keep communication concerns explicit.
- Script entry points should remain thin and delegate work to services, controllers, or handlers.

### Script Entry Point Conventions
- Use ModuleScript for reusable logic and data.
- Use Script for server-side entry points and LocalScript for client-side entry points.
- Keep startup logic short and explicit; call into one or two modules rather than embedding all logic in a single script.
- Prefer `Init`/`Start` or equivalent lifecycle methods over ad-hoc initialization.

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