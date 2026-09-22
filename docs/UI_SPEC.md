# UI Specification

## Target
iPhone 16 Pro + Safari 為主要驗證環境。

## Input
date/time 必須與一般 text/number input 視覺一致：
- width
- height
- padding
- border
- border-radius
- box-sizing

## Amount Input
輸入時不得重新 render active input，避免鍵盤消失與游標跳動。

總餐費與小菜在手機上使用等寬雙欄，並提示總餐費已包含小菜。個別金額模式以「人員／個人主餐／小菜/人／應付金額」四欄顯示；只有個人主餐可輸入，後兩欄即時計算。

## Compact Icons
📅 今日
🔐 歷史
📍 定位
🔎 搜尋
⭐ 常用地點
🗑️ 刪除
☁️ 儲存

## Favorites
餐廳輸入區提供 compact ⭐；OSM 每筆結果提供 ⭐。

## Settlement Tracking
- 每張今日／歷史紀錄顯示 `⚪ 未記錄`、`🔴 未結清`、`🟡 部分結清`、`🟢 已結清` 或 `⚪ 無需結清`。
- 解鎖後的歷史紀錄提供每筆 transfer 至少 44px 高的結清切換按鈕，以及仍有未完成項目時的「全部結清」。
- 歷史區提供「全部／待結清／已結清」篩選；待結清只含 unsettled/partial，已結清只含 settled/not_required。
- transfer 使用可換行排列，避免 iPhone Safari 橫向捲動；未結清摘要直接顯示付款人、收款人及金額。

## Payer Selection
- 單一付款人預設為 S，選單固定提供 A/S/E/J/P，不隨 participants 縮減。
- 多人付款固定提供 A/S/E/J/P 的付款輸入，且不影響用餐人員選擇。

## Version Title
- 「外出用餐紀錄」維持既有 24px 字級與顏色。
- 後方版本號使用較小的灰色文字，並避免在 iPhone 寬度產生不自然換行或水平捲動。

## Historical Entry Login
- 未登入時儲存非今日紀錄，自動開啟既有歷史登入 modal，說明登入後會自動儲存。
- 開啟、取消、登入失敗及重試期間保留日期、人員、金額、付款人等完整表單內容。
- 登入成功後關閉 modal 並自動儲存，不切換到歷史頁；一般「歷史紀錄」按鈕的登入成功流程仍進入歷史頁。
