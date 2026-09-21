# Changelog

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
Next: V4.0
