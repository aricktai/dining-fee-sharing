# Current State

## Version
**V3.9.2**

## Implemented Baseline
- [x] A/S/E/J/P
- [x] date/time
- [x] restaurant / total
- [x] average split
- [x] individual split
- [x] individual starts blank
- [x] individual real-time discrepancy
- [x] single payer
- [x] multi payer
- [x] multi-payment real-time discrepancy
- [x] settlement transfers
- [x] geolocation
- [x] OSM nearby search
- [x] Google Maps link
- [x] favorites add/list/select/delete
- [x] favorites localStorage
- [x] today's records
- [x] Supabase history authentication
- [x] history search
- [x] history single-record deletion
- [x] iPhone Safari input handling
- [x] 小菜總額輸入與歷史顯示
- [x] 個別模式的小菜逐分精確分攤與自動應付金額
- [x] 每筆 transfer 的結清狀態與結清時間追蹤
- [x] 整筆紀錄的結清狀態、全部結清與歷史篩選
- [x] V3.8 舊 transfers 的 unknown 相容及首次操作升級
- [x] 付款人與用餐 participants 分離，固定 A/S/E/J/P 均可付款
- [x] 單一付款人預設為 S，且多人付款支援非 participant
- [x] 匿名補登非今日紀錄時要求登入，成功後自動續存並保留表單

## Known Risks
- OSM/Overpass is an external service and may intermittently fail.
- iOS native date/time controls require visual regression testing.
- `settlement_status` 快速篩選欄位須由管理者在 Supabase SQL Editor 執行 V3.9 migration；前端在欄位尚未建立時會退回只保存 `transfers` 並顯示警告。

## Version Sequence
明顯新功能可使用 **V4.0**；V3.9.2 的小修正可繼續使用後續 patch version。
