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
- single payer
- multi payer 100+200+blank / total 500 → 尚差 200
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

## Favorites
- add from OSM
- open favorites
- select favorite
- delete favorite
- reload and verify persistence
- duplicate add behavior

## OSM
- success
- no result
- HTTP failure
- invalid JSON
- special-character restaurant name
- invalid coordinates

## History
- anonymous today
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

## Release Gate
Critical regression tests must pass before release.
