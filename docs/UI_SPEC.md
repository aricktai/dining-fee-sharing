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
