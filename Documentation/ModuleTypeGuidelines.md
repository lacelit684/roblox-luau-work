# Metadata

## Contributors
- <b>Lucy "lacelit684"</b> - Lead Writer since 2026-06-28

## Dates
<b>Created:</b> 2026-06-28
<b>Last Modified:</b> 2026-07-23

## Legal
<b>Licence:</b> MPL-2.0

## Description
A detailed guide for choosing and structuring Luau and Roblox module types, handlers, and runtime scripts in this library.

---

# Module Type Guidelines

## Core Principle

Choose the simplest module shape that fits the responsibility. A module should be easy to understand, easy to test, and easy to extend. If a file begins to mix data, orchestration, networking, and state management, it probably needs to be split.

## Class Modules

Use a class module when you need to model a concrete object or concept that has its own state and behavior.

### Good uses

- inventory items
- reusable stateful utility objects
- wrappers around a data record with methods

### Structure

- Keep a clear constructor such as `new`.
- Use a typed table and `__index` to define methods.
- Keep public constants and exported types near the top of the file.
- Put instance-specific state on the created object, not in shared globals.

### Conventions

- Name the module after the class it defines.
- Prefer explicit instance methods over hidden magic behavior.
- Keep constructor arguments minimal and well documented.
- Avoid using a class for simple helper logic that does not need identity or instance state.

### Common sections

- Preamble
- Types
- Constants
- Variables
- Constructors
- Functions
- Procedures
- Termination

## Service Modules

Use a service module for long-lived shared systems that own state and respond to engine or gameplay events.

### Good uses

- inventory systems
- economy services
- data providers
- player lifecycle handlers
- cross-feature coordination modules

### Structure

- Treat the module as a singleton-like service with a stable entry point.
- Keep shared state in local variables or typed state tables.
- Expose lifecycle methods such as `Init`, `Start`, and optionally `Stop` or `Destroy`.
- Connect events carefully and disconnect them when the service is torn down.

### Conventions

- Keep service responsibilities focused on one domain.
- Document why a service depends on a particular Roblox service or event.
- Prefer explicit state transitions over hidden side effects.
- Avoid turning a service into a catch-all file for unrelated features.

### Lifecycle guidance

- `Init` should prepare state and set defaults.
- `Start` should begin active behavior and register event connections.
- Cleanup should be predictable and intentional.

## Controller Modules

Use a controller module to coordinate runtime behavior for a feature, UI flow, or gameplay system.

### Good uses

- UI flow management
- input handling
- gameplay state coordination
- scene transitions
- feature-specific orchestration

### Structure

- Controllers usually manage state and event wiring for a narrow feature.
- They often delegate work to services, handlers, or libraries rather than owning all business logic themselves.
- Keep lifecycle methods obvious and short.

### Conventions

- Prefer `Init` and `Start` for setup and activation.
- Keep the module focused on orchestration rather than raw data storage.
- Make event handlers readable and named clearly.
- Avoid mixing controller responsibilities with data schema definitions.

## DataBlock Modules

Use a data block module for data definitions, configuration tables, schemas, templates, or reusable records.

### Good uses

- item templates
- weapon stats
- UI configuration
- enum-like tables
- typed object shapes

### Structure

- Keep the module mostly declarative.
- Prefer tables, constants, and type aliases over procedural logic.
- Avoid side effects and engine service lookups unless they are clearly justified.

### Conventions

- Keep data modules deterministic and easy to inspect.
- Document the meaning of key fields and important values.
- Use descriptive names for exported constants and tables.
- Do not bury gameplay logic inside an otherwise data-only module.

## Library Modules

Use a library module for pure utility logic such as calculations, conversions, string helpers, table utilities, or reusable algorithms.

### Good uses

- math helpers
- formatting utilities
- table manipulation
- validation helpers
- conversion functions

### Structure

- Keep functions stateless where possible.
- Prefer pure functions that do not mutate external state.
- Expose constants and helpers through the module table.

### Conventions

- Avoid dependencies on services unless the library is explicitly a service wrapper.
- Keep functions general-purpose and reusable.
- Document edge cases and assumptions clearly.
- Avoid mixing library helpers with gameplay-specific logic.

## Handler Modules

Use a handler module when a file serves as a boundary between layers, systems, or runtime environments.

### Good uses

- remote event handlers
- input event adapters
- UI-to-service bridges
- network request wrappers
- event dispatch logic

### Structure

- Keep handlers focused on receiving input, translating it, and delegating to something else.
- Use explicit method names such as `Handle`, `Bind`, `Dispatch`, or `Request`.
- Keep the module narrow and predictable.

### Conventions

- Do not let a handler become a storage location for unrelated logic.
- Separate protocol concerns from domain behavior.
- Make the boundary explicit in comments and function names.

## Script Entry Points

Scripts, LocalScripts, and ModuleScripts should be used according to their runtime role.

### ModuleScript

- Use for reusable modules, helpers, service definitions, classes, and data definitions.
- Keep import-time behavior side-effect free whenever possible.
- Avoid putting large amounts of runtime logic directly in a module that is meant to be required elsewhere.

### Script

- Use for server-side entry points.
- Keep the file thin and delegate to controllers, services, or handlers.
- Use it to bootstrap the server-side feature, not to implement the whole feature itself.

### LocalScript

- Use for client-side entry points.
- Keep client-specific initialization short and readable.
- Delegate UI, input, and remote handling to dedicated modules when possible.

## Practical Rule of Thumb

If the module is mainly about data, make it a DataBlock.
If it is mainly about behavior and state, make it a Service or Controller.
If it is mainly about reusable logic, make it a Library.
If it is mainly about boundaries and event translation, make it a Handler.
If it is mainly about representing an object with identity, make it a Class.

## Recommended Section Order

Use the same section order whenever practical:

1. Preamble
2. Types
3. Constants
4. Variables
5. Constructors
6. Functions
7. Procedures
8. Lifecycle
9. Termination

This order keeps modules easy to scan and makes it easier for collaborators to find the relevant part of the file quickly.
