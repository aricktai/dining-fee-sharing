# Business Rules

BR-001：每次用餐 1～5 人。
BR-002：成員固定 A/S/E/J/P。
BR-003：平均分攤總和必須等於總餐費。
BR-004：個別分攤不預填平均值。
BR-005：個別應付 = 個人主餐 + 小菜分攤；個別應付差額 = 總餐費 - 應付合計。
BR-006：多人付款差額 = 總餐費 - 已輸入付款合計。
BR-007：不足顯示「尚差」，超出顯示「超出」，相等顯示「已相符」。
BR-008：儲存時個別應付合計必須等於總餐費。
BR-009：儲存時多人付款合計必須等於總餐費。
BR-010：single payer 支付全部總餐費。
BR-011：balance = paid - owed，再產生 from → to。
BR-012：favorites 使用 localStorage。
BR-013：history 需要 authenticated session。
BR-014：明顯新功能依功能版本推進；小功能調整、UI 微調、Bug fix 或行為修正依 patch version 順序遞增。
BR-015：小菜總額已包含於總餐費，平均分攤不得再次加上小菜。
BR-016：小菜以「分」為單位平均分配；除不盡的餘分依固定成員順序分配，使小菜分攤合計精確等於小菜總額。
BR-017：沒有參與者時不計算小菜除法；小菜空白或 0 時視為 0。
BR-018：每筆新 transfer 必須含 `settled: false` 與 `settled_at: null`；標記結清時保存 ISO datetime，取消時清空時間。
BR-019：整筆結清狀態集中由 transfers 推導：無 transfer 為 `not_required`；任一 transfer 缺少 Boolean `settled` 為 `unknown`；全 false 為 `unsettled`；真假並存為 `partial`；全 true 為 `settled`。
BR-020：舊紀錄第一次操作結清狀態時，所有舊 transfers 一併加入結清欄位，未被選取者預設未結清。
BR-021：「全部結清」只為尚未結清的 transfer 設定當下時間，不覆寫已存在的 `settled_at`。
BR-022：participants 只代表需要分攤餐費的人；付款人可為固定 A/S/E/J/P 中任一人，不要求存在於 participants。
BR-023：單一付款人預設為 S，仍可改選其他固定成員；多人付款也必須提供固定五人，並以五人的付款合計驗證總餐費。
BR-024：非 participant 的 owed 為 0，其 paid 必須納入 balance 與 transfers 計算。
BR-025：匿名只可新增今日紀錄；儲存非今日紀錄前必須取得 authenticated session，登入期間保留表單，成功後才繼續送出原紀錄。
