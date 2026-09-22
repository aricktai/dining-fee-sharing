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

## D-015 Authenticated Historical Entry
維持 anon 只能新增今日紀錄的 RLS，不開放匿名讀寫最近七天。前端偵測非今日日期且尚未登入時，保留表單並要求歷史登入；成功後在原頁自動儲存，避免向使用者顯示可預防的 RLS 錯誤。
