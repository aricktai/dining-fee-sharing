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
較明顯的新功能使用功能版本，例如 V3.8 → V3.9 → V4.0；小功能調整、UI 微調、Bug fix 或行為修正可使用 patch version，例如 V3.9 → V3.9.1 → V3.9.2。

## D-010 Side Dish Allocation
小菜總額屬於總餐費的一部分，不另外加在總餐費上。個別模式以整數分為單位分攤小菜，餘分依 A/S/E/J/P 中本次參與者的固定順序分配，確保合計一致且 settlement 沿用最終應付金額。

## D-011 Side Dish Persistence
以 `dining_records.side_dish_total numeric not null default 0` 保存小菜總額。新增欄位而不變更既有欄位；舊紀錄藉由預設值及前端 fallback 視為 0。

## D-012 Transfer-level Settlement Tracking
結清事實保存在每筆 transfer 的 `settled` 與 `settled_at`，整筆 `settlement_status` 僅作為可由 transfers 重建的查詢欄位，不提供手動修改。舊 transfers 缺少追蹤欄位時一律為 `unknown`，避免把歷史資料誤列為欠款。

## D-013 Additive Settlement Migration
新增 `settlement_status text not null default 'unknown'` 及允許值 constraint，不修改既有資料、欄位或 RLS。migration 尚未執行時，前端 retry 僅寫入擴充後的 transfers，避免整筆新增或更新失敗，同時提示管理者執行 migration。

## D-014 Participants and Payers
participants 僅表示需分攤餐費的人；付款人獨立從固定 A/S/E/J/P 選取，非 participant 的 owed 為 0，但 paid 仍納入 settlement。單一付款人預設為 S。既有 `participants`、`owed`、`paid`、`transfers` JSON 結構已可表達此狀況，因此不新增 Supabase 欄位。


## D-015 Retroactive Record Authentication
匿名使用者儲存非今日紀錄前須使用既有 Supabase password authentication 登入。登入成功後自動續存；失敗、取消及 token 過期重新登入均保留目前表單。此行為沿用既有 authenticated INSERT RLS，不新增 schema migration。

## D-016 Overpass Endpoint Fallback
附近餐廳查詢維持 OpenStreetMap / Overpass，依序使用 overpass-api.de、overpass.kumi.systems 與 overpass.private.coffee。每個 endpoint 每次搜尋只嘗試一次並受 12 秒 browser timeout 限制；可恢復的服務端／網路錯誤才 fallback，HTTP 4xx 不重試。搜尋失敗不影響 geolocation state，亦不需要 Supabase migration。

## D-017 Personal Wallet Ledger
每位固定成員使用獨立 `wallets` balance 與 append-only `wallet_transactions`。錢包代表付款者的預存／帳務額度，不是 wallet-to-wallet transfer；允許負餘額且 receiver 不入帳。

## D-018 Atomic and Idempotent Wallet Operations
錢包修改僅透過 authenticated `security definer` RPC，在單一 PostgreSQL transaction 鎖定資料列並更新 ledger、balance 與（結清時）dining record。partial unique reference 及 reversal source unique index 提供 retry/double-click 防護。

## D-019 Wallet RLS
餘額可由 anon/authenticated 讀取供首頁 summary；交易明細只可由 authenticated 讀取。兩表均不授予直接寫入，authenticated 僅獲三個受驗證 RPC 的 execute。
