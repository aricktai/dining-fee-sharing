# Test Plan

## Record
- 1～5 人
- average
- individual blank
- individual 100+200+blank / total 500 → 尚差 200
- exact → 已相符
- over → 超出
- average: total 1000 / side dish 200 / 4 people → each owed 250
- individual: total 1000 / side dish 200 / meals 180+220+150+250 → owed 230+270+200+300 and exact
- individual shortage: total 1000 / side dish 200 / meals total 750 → owed total 950 and 尚差 50
- no side dish: side dish blank or 0 → owed equals meals, no NaN/Infinity
- indivisible side dish: 100 / 3 people → cent allocation totals exactly 100
- participant change: side dish 200, 4 → 5 people changes share from 50 to 40 immediately

## Payment
- single payer defaults to S and can change to A/E/J/P
- single payer can be any A/S/E/J/P member not selected as a participant
- multi payer 100+200+blank / total 500 → 尚差 200
- multi payer includes all A/S/E/J/P regardless of participants
- exact
- over

## Settlement
- single payer
- multi payer
- unequal owed
- individual meals + side dish + multi payer uses calculated owed in transfers
- new transfer defaults to `settled=false`, `settled_at=null`, record `unsettled`
- toggle one transfer settled/unsettled and verify ISO time is created/cleared
- mixed transfer states derive `partial`; all true derives `settled`
- settle-all preserves an existing settled timestamp and timestamps only open items
- no transfers derives `not_required`
- legacy transfers without `settled` derive `unknown`, not `unsettled`
- first legacy toggle upgrades all transfers; selected is true and the rest false
- pending filter includes only unsettled/partial; completed includes only settled/not_required
- reload after update retains transfers, timestamps, and derived status
- participants A/E/J, total 900, S paid 900 → A/E/J each owe 300 and transfer to S
- participants A/E/J, total 900, S paid 600 + A paid 300 → only E/J transfer 300 each to S
- non-participant payer transfers can progress unsettled → partial → settled through individual toggles

## Favorites
- add from OSM
- open favorites
- select favorite
- delete favorite
- reload and verify persistence
- duplicate add behavior

## OSM
- primary success does not call a fallback
- primary HTTP 504 falls back and renders successful fallback results without an intermediate error
- primary request timeout is aborted after 12 seconds and falls back without locking the UI
- primary network error falls back
- all endpoints failing displays `附近餐廳服務目前較忙碌，請稍後再試。` once
- explicit HTTP 4xx does not retry a malformed/client request
- location remains available after all endpoints fail, so search can be retried without GPS
- rapid repeated taps do not create parallel searches, and the button always returns to its normal state
- no result
- invalid JSON
- special-character restaurant name
- invalid coordinates
- successful results still support selection, favorites and Google Maps links

## History
- anonymous today
- anonymous non-today save prompts for login before INSERT
- successful login automatically resumes the pending save
- failed or cancelled login preserves every form value
- expired token prompts for login again and resumes after success
- authenticated non-today save uses the existing RLS without schema changes
- password prompt
- authenticated history
- search
- single delete
- lock
- new record retains and displays side dish total; old record without value displays 0

## iPhone
- iPhone 16 Pro date size
- time size
- number keyboard
- cursor stability
- scrolling
- title keeps the main text style while the inline V3.9.3 is smaller and gray, without horizontal scrolling
- OSM loading, AbortController timeout and endpoint fallback work without JavaScript errors or a permanently disabled button
- all A/S/E/J/P payer controls remain touch-accessible independently of participant selection

## Release Gate
Critical regression tests must pass before release.

## V4.0 Wallet
- migration 建立 A/S/E/J/P = 0，且 schema 沒有非負餘額 constraint
- A 與 E 分別儲值 1000；transaction amount/balance_after 正確且錢包互不影響
- A 150 以 wallet 結清 200 → -50；再儲值 500 → 450，receiver 不增加
- cash settlement 不產生 wallet transaction；method/time/status 正確
- 相同 settlement reference retry 只扣一次；快速點擊期間按鈕停用
- wallet rollback 新增 +amount reversal、不刪原交易；重送只加回一次
- 模擬 dining record update 失敗時 ledger 與 balance 全部 rollback
- adjustment 正負皆可、note 必填，調整後可為負
- 舊 settled/method missing 顯示未記錄且不報錯
- history 最新在前、最多 50 筆；首頁單次 request 顯示五人餘額
- regression：V3.8 小菜/個別/平均、V3.9 五狀態、V3.9.1 payer、V3.9.2 補登入、V3.9.3 Overpass fallback/504
- iPhone 16 Pro：summary wrap、44px 操作、負餘額與 loading/error state
