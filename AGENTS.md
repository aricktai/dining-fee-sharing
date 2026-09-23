# AI Coding Instructions

## 1. Project Scope

This repository contains the **Dining Record** web application.

### Current implementation
- Primary implementation file: `index.html`
- Architecture: single-file HTML application
- Target device: iPhone, especially iPhone Safari
- Hosting: GitHub Pages
- Backend: Supabase
- Nearby restaurant search: OpenStreetMap / Overpass API
- Map navigation: Google Maps links
- Fixed participants: A / S / E / J / P

Do not split `index.html` into `app.js`, `style.css`, or other source files unless explicitly requested by the user.

## 2. Source-of-Truth Priority

When determining current behavior or requirements, use this priority:

1. The user's latest explicit instruction
2. `AGENTS.md`
3. `docs/PROJECT_CONTEXT.md`
4. `docs/CURRENT_STATE.md`
5. Relevant detailed specification documents under `docs/`
6. Current implementation in `index.html`
7. Historical/original documents only when explicitly requested

Do not use archived or old versions to infer current behavior unless the user explicitly asks for historical comparison or recovery.

## 3. Documentation Map

### 3.1 Read for every coding task

Before modifying code, always read:
- `docs/PROJECT_CONTEXT.md`
- `docs/CURRENT_STATE.md`

### 3.2 Read according to the task

Read these when the task touches the corresponding area:
- `docs/PRODUCT_SPEC.md` — product requirements and user-facing behavior
- `docs/BUSINESS_RULES.md` — split, payment, settlement, validation, calculations
- `docs/UI_SPEC.md` — UI/UX, iPhone Safari, input behavior
- `docs/ARCHITECTURE.md` — application structure, state, storage, integrations
- `docs/DATA_MODEL.md` — Supabase schema, JSON structures, RLS intent
- `docs/API_INTEGRATION.md` — Supabase, OSM/Overpass, Google Maps, geolocation
- `docs/DECISIONS.md` — established design decisions that should not be casually reversed

When a proposed change conflicts with an existing decision, do not silently override it.

### 3.3 Workflow documents

Use at the appropriate stage:
- `docs/TEST_PLAN.md` — regression and acceptance checks
- `docs/CHANGELOG.md` — meaningful released/versioned changes
- `docs/RELEASE_CHECKLIST.md` — release/deployment preparation

### 3.4 Special-purpose documents

- `docs/CODEX_INSTRUCTIONS.md` — Codex-specific working rules
- `docs/CHATGPT_HANDOFF.md` — ChatGPT ↔ Codex handoff format

These complement `AGENTS.md`; they do not replace it.

## 4. Required Coding Workflow

Before modifying `index.html`:

1. Read `docs/PROJECT_CONTEXT.md`.
2. Read `docs/CURRENT_STATE.md`.
3. Identify the functional areas affected.
4. Read only the relevant specification documents.
5. Check `docs/DECISIONS.md` when an existing design decision may be affected.
6. Inspect the relevant portion of `index.html`.
7. Make the smallest change that satisfies the request.
8. Preserve unrelated existing functionality.
9. Run the relevant checks from `docs/TEST_PLAN.md`.
10. Update documentation when a confirmed change makes persistent project knowledge inaccurate.
11. Update `docs/CHANGELOG.md` for meaningful released/version changes.
12. Update `docs/CURRENT_STATE.md` when the implemented state materially changes.

## 5. Versioning Rule

- Current baseline version: **V4.0.1**
- Feature versions may advance as **V3.8 → V3.9 → V4.0**.
- Small feature adjustments, UI refinements, bug fixes, and behavior fixes may use patch versions such as **V3.9 → V3.9.1 → V3.9.2 → V3.9.3**.
- Keep version references consistent across code and documentation.

## 6. Current Architecture

The current application is a single-file implementation:

```text
index.html
```

Do not assume `app.js` or `style.css` exists unless the user explicitly requests an architectural change and those files are created.

The root `index.html` is the authoritative current implementation.

## 7. Files AI Should Not Read Unless Explicitly Requested

Do not inspect these directories unless the user specifically asks:
- `backup/`
- `old/`
- `archive/`
- `test-data/`
- `screenshots/`

Do not modify archived versions unless explicitly requested.

## 8. Requirement Change Detection

When the user introduces a new requirement, constraint, preference, business rule, UI rule, architecture decision, integration requirement, or versioning rule that may affect future work:

1. Do not silently treat it as a permanent rule.
2. Identify it as a potential project change.
3. Ask whether it should be recorded when confirmation is needed.
4. If confirmed, update the appropriate documentation file.
5. Do not update documentation for temporary ideas or discussion.

## 9. Conflict Handling

If project documents conflict:

1. Do not silently choose one.
2. Identify the conflict.
3. Use the source-of-truth priority and documented current state where that clearly resolves it.
4. If the conflict remains unresolved, ask the user.
5. After confirmation, update the appropriate document so the conflict does not recur.

## 10. Preserve Existing Features

When implementing a new feature or fix:
- Do not remove existing functionality.
- Do not redesign unrelated UI.
- Do not change database field names unnecessarily.
- Do not change API behavior unnecessarily.
- Do not change established business rules unless explicitly requested.
- Do not replace OpenStreetMap with another provider unless explicitly requested.
- Do not introduce a framework or build system unless explicitly requested.

Prefer minimal, targeted modifications.

## 11. Security

Never expose or commit:
- Supabase service-role keys
- secret/private API keys
- passwords
- access tokens
- authentication secrets
- private credentials

The browser application may contain the intended Supabase publishable/public configuration where appropriate for the existing architecture.

Do not weaken authentication, authorization, or RLS assumptions merely to simplify implementation.

## 12. iPhone / Safari Compatibility

The application is primarily designed for iPhone Safari.

When modifying UI:
- preserve touch usability
- preserve responsive behavior
- preserve date/time input compatibility
- avoid rebuilding the active amount input while typing
- avoid desktop-only interaction patterns
- avoid unnecessary browser-dependent behavior

Treat reported iPhone Safari regressions as priority test cases.

## 13. External API Changes

When modifying Supabase, OpenStreetMap / Overpass, Google Maps, or browser geolocation behavior, read `docs/API_INTEGRATION.md` first.

Preserve existing error handling and fallback behavior unless explicitly requested otherwise.

## 14. Database Changes

Before changing Supabase-related data behavior:

1. Read `docs/DATA_MODEL.md`.
2. Check the current implementation in `index.html`.
3. Read `docs/API_INTEGRATION.md`.
4. Check `docs/DECISIONS.md` when relevant.

Do not rename or remove database fields without explicit confirmation.

## 15. Testing

For meaningful code changes:
- use the relevant cases in `docs/TEST_PLAN.md`
- perform syntax/structural checks where possible
- run targeted tests for the changed behavior
- run regression tests for affected existing features

For UI changes, include iPhone-sized behavior. For calculations and data changes, include representative and boundary cases.

## 16. Documentation Maintenance

Documentation is part of the project.

Update the appropriate document when a confirmed change affects:
- requirements
- business rules
- architecture
- data model
- UI specifications
- API integration
- project decisions
- current implementation state
- released functionality

Avoid duplicating the same rule across many files when one authoritative document is sufficient.

## 17. Changelog

When releasing a new version:

1. Confirm the version sequence.
2. Update `docs/CHANGELOG.md`.
3. Summarize meaningful implemented changes.
4. Keep version history chronological.

Do not log temporary ideas as released changes.

## 18. Recommended Task Reading Matrix

| Task | Documents to Read |
|---|---|
| Any code change | PROJECT_CONTEXT + CURRENT_STATE |
| New feature | PRODUCT_SPEC + relevant BUSINESS_RULES/UI_SPEC |
| Business calculation | BUSINESS_RULES + DATA_MODEL when persistence is affected |
| UI modification | UI_SPEC |
| Architecture change | ARCHITECTURE + DECISIONS |
| Supabase change | DATA_MODEL + API_INTEGRATION |
| OSM / Google Maps change | API_INTEGRATION |
| Database change | DATA_MODEL + API_INTEGRATION |
| Bug fix | CURRENT_STATE + relevant specification |
| Regression testing | TEST_PLAN |
| Version release | CHANGELOG + RELEASE_CHECKLIST |
| ChatGPT → Codex handoff | CHATGPT_HANDOFF + CODEX_INSTRUCTIONS |
| Historical investigation | Explicitly requested historical files only |

## 19. Final Rule

Do not guess when the repository contains the relevant information.

Read the appropriate documentation first, but do not load unrelated documents merely because they exist.

Do not silently change project rules.

Do not modify unrelated code.

Prefer small, reversible, well-scoped changes.
