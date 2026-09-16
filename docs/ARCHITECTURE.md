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

Authentication token：sessionStorage。
Favorites：localStorage。

## 架構原則
目前維持 single-file HTML；除非使用者明確要求，不改成 framework 或多檔 frontend。
