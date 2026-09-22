# Architecture

```text
Browser
├─ UI / State / Calculation
├─ localStorage
│   └─ Favorites
├─ Geolocation
├─ OpenStreetMap / Overpass
│   └─ restaurant discovery
├─ Google Maps
│   └─ destination link
└─ Supabase
    ├─ REST API
    ├─ dining_records
    ├─ wallets / wallet_transactions
    ├─ authenticated wallet RPC (atomic + idempotent)
    ├─ Auth
    └─ RLS
```

## State
主要 state：
- selected
- splitMode
- payMode
- owed
- paid
- history
- myLocation
- wallets

Authentication token：sessionStorage。
Favorites：localStorage。

Wallet balances 與 append-only ledger 儲存在 Supabase；前端只讀 summary/history，所有 balance mutation 透過 database-side RPC 完成。餐費錢包結清與 reversal 會在同一 PostgreSQL transaction 內同步更新 dining record。

## 架構原則
目前維持 single-file HTML；除非使用者明確要求，不改成 framework 或多檔 frontend。
