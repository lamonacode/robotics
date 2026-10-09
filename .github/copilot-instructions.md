# Copilot Instructions for this repository

## Repository status

This repository is currently a minimal scaffold. There is no application code, no automated build pipeline, and no test or lint configuration yet. Keep future changes focused and explicit until project tooling is added.

## Build, test, and lint commands

No build, test, or lint commands are currently defined in this repository.

When the project adds a language/tooling stack, prefer the narrowest command that checks the changed behavior:
- Python: run the specific test file or test node instead of the full suite when possible (`pytest path/to/test_file.py -k <name>`)
- Node.js: run the targeted test or script for the changed area instead of the entire project (`npm test -- --runInBand path/to/test.js`)
- Other tooling: keep the same pattern—run the smallest relevant command that validates the change

## High-level architecture

At this stage, the repository does not yet contain a multi-file application with established runtime boundaries. The main principle is to keep the project layout simple and intentional as it grows.

When code is added, maintain a clear separation between:
- core robot logic / domain behavior
- hardware or device interfaces
- simulation, testing, or validation utilities
- scripts and configuration that support execution

Avoid mixing unrelated responsibilities into the same module or folder just because they are all part of the same feature.

## Key conventions

- Keep the repository root clean: generated files, local artifacts, and editor metadata should not be scattered across the top level.
- Add project tooling only when it is clearly needed; prefer the standard toolchain for the language chosen rather than mixing ecosystems.
- Preserve a predictable layout as the repo grows: keep app code, tests, and scripts in clearly named areas rather than root-level ad hoc files.
- Update this file whenever the project adds a real build/test/lint workflow or a stable architecture.
