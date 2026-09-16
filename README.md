# Dining Record V3.7 — AI Project Documentation

這是一套供 **ChatGPT + Codex + GitHub** 共用的 Dining Record 專案記憶文件。

## Baseline
- Current version: **V3.7**
- Next version: **V3.8**
- Single-file HTML
- Primary device: iPhone 16 Pro / Safari
- Hosting: GitHub Pages
- Backend: Supabase
- Nearby restaurants: OpenStreetMap / Overpass
- Maps: Google Maps link
- Members: A / S / E / J / P

## 文件角色
| 文件 | 主要用途 |
|---|---|
| PROJECT_CONTEXT.md | AI 長期專案背景、不可違反規則 |
| PRODUCT_SPEC.md | 產品需求與功能規格 |
| ARCHITECTURE.md | 系統架構與模組 |
| DATA_MODEL.md | Supabase schema / RLS |
| UI_SPEC.md | UI、iPhone Safari 規格 |
| BUSINESS_RULES.md | 分攤、付款、結算規則 |
| API_INTEGRATION.md | Supabase / OSM / Maps |
| CURRENT_STATE.md | 目前真正實作狀態 |
| CHANGELOG.md | 版本歷史 |
| DECISIONS.md | 重要設計決策 |
| TEST_PLAN.md | 測試與 regression |
| CODEX_INSTRUCTIONS.md | Codex 工作規則 |
| CHATGPT_HANDOFF.md | ChatGPT ↔ Codex 交接格式 |
| RELEASE_CHECKLIST.md | 發版前檢查 |

## AI 防失憶原則
修改前先讀：
1. PROJECT_CONTEXT.md
2. CURRENT_STATE.md
3. PRODUCT_SPEC.md
4. BUSINESS_RULES.md
5. DECISIONS.md

修改後更新：
- CURRENT_STATE.md
- CHANGELOG.md
- 必要時 DECISIONS.md

版本只能依序：V3.7 → V3.8 → V3.9。
