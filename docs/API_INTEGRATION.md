# API Integration

## Supabase
使用 REST API：
`/rest/v1/dining_records`

Auth 使用 Supabase password authentication。非今日紀錄的 INSERT 需要 authenticated token；若 token 過期，前端清除失效 token、重新顯示登入並在成功後續存，不變更既有 RLS。

V3.8 的新增紀錄 payload 包含 `side_dish_total`。部署 V3.8 前須先執行 `DATA_MODEL.md` 的 additive migration；查閱舊紀錄時，`null` 或缺少此欄位皆視為 0。

V3.9 的新增／結清更新 payload 包含擴充後的 `transfers` 與由其推導的 `settlement_status`。部署前須由管理者在 Supabase SQL Editor 執行 V3.9 additive migration。若 PostgREST 回報欄位不存在或 schema cache 錯誤，前端會 retry 只寫 `transfers` 並顯示警告；此降級模式可保留結清明細，但資料庫無法以欄位快速查詢狀態。既有 authenticated UPDATE policy 已足夠，不需更改 RLS。

## OpenStreetMap / Overpass
搜尋 restaurant / cafe，約 1200m 範圍。
查詢依序使用以下公開 endpoint，每個 request 最多等待 12 秒，每個 endpoint 每次搜尋只嘗試一次：
1. `https://overpass-api.de/api/interpreter`
2. `https://overpass.kumi.systems/api/interpreter`
3. `https://overpass.private.coffee/api/interpreter`

HTTP 5xx、network error、timeout 或 endpoint 回傳無法使用的資料時會自動嘗試下一個 endpoint；明確的 HTTP 4xx 不 fallback，避免對錯誤 query 重複送出。所有 endpoint 都失敗後才顯示一次使用者錯誤，完整原因只記錄於 console。搜尋期間鎖定搜尋按鈕，完成後一定恢復；搜尋失敗不清除已取得的定位。

Overpass QL 使用單一 `nwr["amenity"~"^(restaurant|cafe)$"]` selector、1200m 半徑與 server-side 10 秒 timeout，避免對相同 OSM object 類型建立重複查詢，同時維持原本範圍與餐廳／咖啡廳需求。

必須處理：
- HTTP error
- timeout
- invalid JSON
- missing name
- invalid/missing coordinates
- special characters

不得將 OSM 餐廳名稱不安全地直接插入 inline JavaScript。

## Google Maps
目前只是建立 Google Maps destination/search link，不是 Google Places API。

## Geolocation
使用 browser Geolocation API。
定位失敗不得阻止手動輸入餐廳。

## V4.0 Wallet RPC
首頁使用單次 `GET /rest/v1/wallets` 取得五人餘額；authenticated 使用者可讀取每人最近 50 筆 `wallet_transactions`。修改不直接 PATCH table，而呼叫：
- `wallet_apply_change`：topup / adjustment 與 ledger insert。
- `settle_transfer_with_wallet`：原子扣款、ledger insert、transfer method/time 與 record status。
- `reverse_wallet_settlement`：原子建立 reversal、加回餘額及重開 transfer。

所有 RPC 都要求 authenticated JWT 與唯一 reference key。V4.0 migration 需由管理者手動執行；前端不會修改 production schema。
