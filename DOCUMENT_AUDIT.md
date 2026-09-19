# Documentation Audit — Dining Record V3.7

This audit records documentation consistency fixes made to the uploaded V3.7 documentation package.

## Confirmed issues corrected

1. **Repository placement**
   - `.gitignore` was stored under `docs/`; moved to repository root.
   - `.github/copilot-instructions.md` was stored under `docs/.github/`; moved to root `.github/`.

2. **AGENTS.md implementation contradiction**
   - The previous file said to treat `index.html`, `app.js`, and `style.css` as current implementation, while later saying not to assume `app.js` or `style.css` exists.
   - Revised to make root `index.html` the authoritative current implementation and preserve the single-file architecture.

3. **AI document-loading strategy**
   - README/Codex/Copilot previously implied broader mandatory reading than necessary.
   - Revised to always read `PROJECT_CONTEXT.md` + `CURRENT_STATE.md`, then read other documents based on task scope.

4. **Version wording**
   - Release checklist wording “下一版只 +0.1” was replaced with “follow the established version sequence,” avoiding ambiguity around V3.9 → V4.0.

## Cross-document consistency confirmed

The uploaded documents consistently describe:
- Current baseline: V3.7
- Next version: V3.8
- Single-file HTML architecture
- Fixed members: A/S/E/J/P
- Individual split starts blank
- Real-time split/payment discrepancy
- Favorites stored in localStorage
- OSM/Overpass nearby search
- Google Maps used as a link, not Google Places API
- Supabase backend with history authentication/RLS intent
- Full history requires authentication while today's data is available without full-history login
- Frontend must not expose service_role/secret credentials
- iPhone Safari input stability as a protected behavior

## Files intentionally not substantively changed

The following source documents were already mutually consistent and were preserved:
- `PROJECT_CONTEXT.md`
- `PRODUCT_SPEC.md`
- `ARCHITECTURE.md`
- `DATA_MODEL.md`
- `UI_SPEC.md`
- `BUSINESS_RULES.md`
- `API_INTEGRATION.md`
- `CURRENT_STATE.md`
- `CHANGELOG.md`
- `DECISIONS.md`
- `TEST_PLAN.md`
- `CHATGPT_HANDOFF.md`

## Note

This audit checks documentation consistency within the uploaded package. It does not verify the documentation against a live/current `index.html`, because that implementation file was not included in this ZIP.
