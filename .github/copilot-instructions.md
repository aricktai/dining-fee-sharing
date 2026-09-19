# Repository AI Instructions

This repository is **Dining Record**.

Use root `/AGENTS.md` as the primary repository AI instruction file.

Before any code change, always read:
- `/docs/PROJECT_CONTEXT.md`
- `/docs/CURRENT_STATE.md`

Then read only the documentation relevant to the requested task, as defined by `/AGENTS.md`.

Current baseline: **V3.7**  
Next version: **V3.8**

Current implementation:
- `/index.html`
- single-file HTML architecture

Preserve:
- A/S/E/J/P
- split/payment rules
- real-time discrepancy behavior
- favorites
- OSM / Overpass behavior
- Supabase history behavior
- iPhone Safari input behavior

Never expose secret/service_role credentials.

After meaningful changes:
- update `/docs/CURRENT_STATE.md` when implementation state changes
- update `/docs/CHANGELOG.md` for released/versioned changes
- update `/docs/DECISIONS.md` when a confirmed design decision changes or is added
- run the relevant checks in `/docs/TEST_PLAN.md`
