# Changelog

## V3.9.2
- 補登非今日紀錄且尚未登入時，自動開啟歷史登入並顯示補登說明。
- 登入過程保留完整表單；成功後留在輸入頁並自動儲存，取消或失敗則不送出資料。
- 維持 anon 只可新增今日紀錄的既有 RLS，不需 Supabase schema 或 policy migration。

## V3.9.1
- 將付款人與用餐 participants 分離，單一與多人付款皆可由固定 A/S/E/J/P 中未用餐的成員付款。
- 單一付款人預設改為 S，settlement 將非 participant 付款人的 owed 視為 0 並正確產生 transfers。
- 標題版本更新為較小的灰色 V3.9.1，並保留主標題既有樣式。
- 版本規則新增 patch version，供小功能調整、UI 微調、Bug fix 與行為修正使用。

## V3.9
- 新增 transfer 層級的 `settled` 與 `settled_at`，以及集中推導的五種整筆結清狀態。
- 歷史紀錄新增個別切換、全部結清、待付款摘要與結清狀態篩選。
- 舊 transfers 保持 `unknown`，首次操作時才向後相容升級全部 transfer。
- 新增 `settlement_status` additive migration 與 migration 尚未執行時的前端降級保存。

## V3.8
- 新增已包含於總餐費的小菜總額輸入與歷史紀錄顯示。
- 個別金額模式改為輸入個人主餐，自動顯示小菜分攤與應付金額。
- 以整數分分配除不盡的小菜餘額，並讓差額、付款與 settlement 使用新的應付結果。
- 新增向後相容的 `side_dish_total` 欄位 migration 說明。

## V3.7
- 強化 OSM / Overpass 搜尋錯誤處理。
- 避免特殊餐廳名稱造成 Safari string/URL 問題。
- 保留常用地點功能。

## V3.6
- 個別金額即時差額。
- 多人付款即時差額。
- 個別金額不預填平均值。
- 歷史單筆刪除。

## V3.5
- 建立此階段 baseline。
- 修正 iPhone date/time 視覺尺寸。
- 加入常用地點。

## Version Rule
Feature versions may use V3.9 → V4.0; patch fixes may use V3.9.2 → V3.9.3.
