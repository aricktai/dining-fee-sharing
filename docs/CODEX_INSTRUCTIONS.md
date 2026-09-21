# Codex Instructions

## Before coding

Follow root `AGENTS.md` as the primary AI workflow.

For every coding task, read:
1. `PROJECT_CONTEXT.md`
2. `CURRENT_STATE.md`

Then read only the documents relevant to the task:
- `PRODUCT_SPEC.md` for feature/behavior requirements
- `BUSINESS_RULES.md` for calculations, split/payment/settlement rules
- `UI_SPEC.md` for UI/UX or iPhone Safari changes
- `ARCHITECTURE.md` for structural changes
- `DATA_MODEL.md` for Supabase data changes
- `API_INTEGRATION.md` for Supabase/OSM/Maps/geolocation changes
- `DECISIONS.md` when an established decision may be affected
- `TEST_PLAN.md` for the relevant regression checks

Read `CHANGELOG.md` when preparing or recording a version/release change rather than as mandatory context for every small edit.

## Rules
- Keep the current single HTML architecture unless explicitly requested otherwise.
- Treat root `index.html` as the current implementation.
- Do not remove existing functionality.
- Do not independently change business rules.
- Do not prefill individual split values.
- Do not re-render the active amount input while typing.
- Do not put secret/service_role keys in the frontend.
- Do not break favorites while modifying OSM behavior.
- Do not break mobile input behavior while changing UI.
- Do not create multi-level version numbers.

## After coding
- run syntax/structural checks where possible
- run targeted tests
- run relevant regression tests from `TEST_PLAN.md`
- update `CURRENT_STATE.md` when implemented state materially changes
- update `CHANGELOG.md` for meaningful released/versioned changes
- update `DECISIONS.md` only when a confirmed design decision changes or is added

## Version
Current **V3.9** → next **V4.0**.
