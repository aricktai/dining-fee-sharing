# Codex Instructions

## Before coding
必讀：
1. PROJECT_CONTEXT.md
2. CURRENT_STATE.md
3. PRODUCT_SPEC.md
4. BUSINESS_RULES.md
5. DECISIONS.md
6. CHANGELOG.md
7. relevant docs
8. TEST_PLAN.md

## Rules
- 保持 single HTML，除非明確要求。
- 不移除既有功能。
- 不自行更改 business rules。
- 不預填 individual split。
- 不重新 render active amount input。
- 不把 secret/service_role key 放前端。
- 不因修改 OSM 而破壞 favorites。
- 不因 UI 修正而破壞 mobile input。
- 不自行建立多層版本號。

## After coding
- syntax check
- targeted test
- regression test
- update CURRENT_STATE
- update CHANGELOG
- update DECISIONS if needed

## Version
Current V3.7 → next V3.8.
