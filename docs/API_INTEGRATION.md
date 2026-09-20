# API Integration

## Supabase
使用 REST API：
`/rest/v1/dining_records`

Auth 使用 Supabase password authentication。

V3.8 的新增紀錄 payload 包含 `side_dish_total`。部署 V3.8 前須先執行 `DATA_MODEL.md` 的 additive migration；查閱舊紀錄時，`null` 或缺少此欄位皆視為 0。

## OpenStreetMap / Overpass
搜尋 restaurant / cafe，約 1200m 範圍。
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
