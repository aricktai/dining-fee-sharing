# Decisions

## D-001 Single HTML
方便 iPhone + GitHub Pages 部署。

## D-002 Supabase
提供共享資料、Auth、RLS。

## D-003 OSM / Overpass
附近餐廳搜尋目前使用 OSM / Overpass，不直接依賴 Google Places API。

## D-004 Google Maps
僅作為地圖/導航連結。

## D-005 Favorites
目前使用 localStorage，不增加 Supabase table。

## D-006 Individual Split
選擇個別金額即代表可能不平均，因此欄位保持空白。

## D-007 Real-time Difference
輸入未完成時就顯示差額，讓使用者知道還差多少。

## D-008 History Protection
今日資料方便快速使用；完整歷史需要登入。

## D-009 Versioning
V3.7 → V3.8 → V3.9；禁止多層版本號。
