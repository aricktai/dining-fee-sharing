# Project Context

## 專案
Dining Record：固定五人群組的外出用餐紀錄與餐費結算 Web App。

## Current Baseline
**V3.9.3**

功能版本可依 **V3.8 → V3.9 → V4.0** 推進；小功能調整、UI 微調、Bug fix 或行為修正可依 **V3.9 → V3.9.1 → V3.9.2 → V3.9.3** 使用 patch version。

## 技術
- Single HTML
- HTML/CSS/JavaScript
- GitHub Pages
- Supabase
- OpenStreetMap / Overpass
- Google Maps link
- localStorage（常用地點）

## 固定成員
A / S / E / J / P；每次 1～5 人。

## 不可違反規則
1. 個別金額模式不得預填平均值。
2. 個別金額輸入必須即時顯示與總餐費的差額。
3. 多人付款輸入必須即時顯示與總餐費的差額。
4. 不得因每次輸入而重新建立 input，避免 iPhone Safari 鍵盤消失。
5. 常用地點可新增、查看、選取、刪除，並以 localStorage 保存。
6. OSM 搜尋不能因特殊餐廳名稱或異常資料造成整個 App 失效。
7. 今日資料可直接查看；完整歷史需要登入。
8. 歷史紀錄可搜尋與單筆刪除。
9. 前端不得放 service_role / secret key。
10. 每次修改都必須 regression test。
11. 版本規則：明顯新功能使用功能版本；小功能調整、UI 微調、Bug fix 或行為修正可使用 patch version。
12. 小菜金額包含在總餐費內；個別模式以「個人主餐 + 小菜分攤」計算應付。
13. 結清狀態以每筆 transfer 為準，整筆狀態只能由 transfers 推導；舊 transfer 缺少欄位時為 unknown。

## AI 規則
若文件與使用者最新明確需求衝突，不要自行猜測；先指出衝突。
