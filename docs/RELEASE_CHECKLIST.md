# Release Checklist

## Version
- [ ] 目前版本確認
- [ ] 下一版符合既定版本序列（目前 V3.9 → V4.0）
- [ ] 無 V3.7.1、V3.7.6.5 等多層版本號

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
