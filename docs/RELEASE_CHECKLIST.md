# Release Checklist

## Version
- [ ] 目前版本確認
- [ ] 版本符合變更規模（明顯新功能使用功能版本；小修正可使用 patch version）
- [ ] patch version 依序遞增（例如 V3.9 → V3.9.1 → V3.9.2）

## Core
- [ ] A/S/E/J/P
- [ ] date/time
- [ ] restaurant
- [ ] total
- [ ] split
- [ ] payment
- [ ] settlement

## Real-time
- [ ] individual discrepancy
- [ ] multi-payment discrepancy
- [ ] individual starts blank

## Location
- [ ] geolocation
- [ ] OSM
- [ ] Google Maps
- [ ] favorites add/list/select/delete
- [ ] localStorage

## Cloud
- [ ] today
- [ ] auth history
- [ ] search
- [ ] delete
- [ ] RLS
- [ ] V4.0 wallet migration manually applied
- [ ] wallet RPC grants and RLS verified

## Wallet V4.0
- [ ] A/S/E/J/P initial balances
- [ ] topup and signed adjustment ledger
- [ ] negative balance settlement remains enabled
- [ ] cash/wallet settlement methods
- [ ] duplicate settlement and reversal idempotency
- [ ] atomic rollback on forced dining update failure
- [ ] latest-50 transaction history

## Mobile
- [ ] iPhone 16 Pro
- [ ] date/time size
- [ ] keyboard
- [ ] scrolling

## Regression
- [ ] OSM change did not break favorites
- [ ] UI change did not break input
- [ ] history change did not break today
- [ ] calculation change did not break settlement

## GitHub
- [ ] correct root `index.html` committed
- [ ] Pages deployed
- [ ] deployed smoke test
