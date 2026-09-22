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

## Nearby Restaurant Search
搜尋期間按鈕顯示「搜尋中…」並停用，避免快速點擊產生平行查詢。Overpass fallback 過程維持 loading，不逐次顯示錯誤；所有 endpoints 都失敗後才顯示一次「附近餐廳服務目前較忙碌，請稍後再試。」，完成後按鈕必須恢復可操作。

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

## V4.0 Wallet UI
- 首頁以可換行的五人格狀 summary 一次顯示餘額；負數使用警示色但仍可操作。
- 錢包管理將「儲值」與「調整」分開，操作中停用修改按鈕；明細每人最多載入最近 50 筆。
- 歷史未結清 transfer 顯示至少 44px 的「現金」及「付款者錢包」按鈕；錢包確認顯示扣款前後餘額。
- 已結清顯示 method 與日期；變更方式必須先取消。所有 wallet 失敗均顯示資料未變更。
