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

## Repository 建議結構

```text
/
├── AGENTS.md
├── index.html
├── README.md
├── .gitignore
├── docs/
│   ├── PROJECT_CONTEXT.md
│   ├── PRODUCT_SPEC.md
│   ├── ARCHITECTURE.md
│   ├── DATA_MODEL.md
│   ├── UI_SPEC.md
│   ├── BUSINESS_RULES.md
│   ├── API_INTEGRATION.md
│   ├── CURRENT_STATE.md
│   ├── CHANGELOG.md
│   ├── DECISIONS.md
│   ├── TEST_PLAN.md
│   ├── CODEX_INSTRUCTIONS.md
│   ├── CHATGPT_HANDOFF.md
│   └── RELEASE_CHECKLIST.md
└── .github/
    └── copilot-instructions.md
```

## 文件角色
| 文件 | 主要用途 |
|---|---|
| AGENTS.md | AI 總規則、文件導航與讀檔策略 |
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

## AI 防失憶與節省 Token 原則

實際讀檔策略以根目錄 `AGENTS.md` 為準：

- 每次 coding task 必讀：`PROJECT_CONTEXT.md`、`CURRENT_STATE.md`
- 其他文件依任務類型讀取
- 不要求每次把 14 個 `docs/*.md` 全部讀完
- 修改完成後，僅在內容確實受影響時更新對應文件

版本依序：**V3.7 → V3.8 → V3.9 → V4.0**，不使用 V3.7.1 等多層版本。
