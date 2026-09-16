# Test Plan

## Record
- 1～5 人
- average
- individual blank
- individual 100+200+blank / total 500 → 尚差 200
- exact → 已相符
- over → 超出

## Payment
- single payer
- multi payer 100+200+blank / total 500 → 尚差 200
- exact
- over

## Settlement
- single payer
- multi payer
- unequal owed

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

## iPhone
- iPhone 16 Pro date size
- time size
- number keyboard
- cursor stability
- scrolling

## Release Gate
Critical regression tests must pass before release.
