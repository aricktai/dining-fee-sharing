# Data Model

Table: `public.dining_records`

| Column | Type |
|---|---|
| id | bigint |
| created_at | timestamptz |
| record_date | date |
| meal_time | time |
| restaurant | text |
| participants | jsonb |
| total | numeric |
| side_dish_total | numeric, not null, default 0 |
| split_mode | text |
| pay_mode | text |
| owed | jsonb |
| paid | jsonb |
| transfers | jsonb |
| settlement_status | text, not null, default `unknown` |
| latitude | double precision |
| longitude | double precision |

## JSON
participants:
`["A","S","E"]`

owed:
`{"A":200,"S":150,"E":150}`

paid:
`{"A":500}` 或 `{"A":100,"S":200,"E":200}`

`paid` 的 key 不受 `participants` 限制；例如 `participants = ["A","E","J"]` 時，`paid = {"S":900}` 是合法資料。非 participant 付款人的 owed 視為 0。此規則沿用既有 JSONB 欄位，不需要 migration。

V3.9 transfers：
`[{"from":"S","to":"A","amount":150,"settled":false,"settled_at":null}]`

`settled_at` 在結清時保存完整 ISO datetime，取消結清時為 `null`。V3.8 以前的 transfer 若缺少 `settled`，前端推導為 `unknown`，不會當作尚未結清；第一次操作任一 transfer 時才將同一紀錄的全部 transfers 升級。

`settlement_status` 只保存由 transfers 推導的查詢值：`unknown`、`unsettled`、`partial`、`settled`、`not_required`。JSON transfers 是結清事實的主要來源。

`side_dish_total` 保存已包含在 `total` 內的小菜總額。舊資料與缺少該值的資料在前端一律視為 0。

## V3.8 Migration

```sql
alter table public.dining_records
  add column if not exists side_dish_total numeric not null default 0;

alter table public.dining_records
  drop constraint if exists dining_records_side_dish_total_nonnegative;

alter table public.dining_records
  add constraint dining_records_side_dish_total_nonnegative
  check (side_dish_total >= 0);
```

## RLS Intent
anon：
- SELECT today
- INSERT today

authenticated：
- SELECT all
- INSERT / UPDATE / DELETE

前端禁止 service_role key。

## V3.9 Migration

必須由管理者手動在 Supabase SQL Editor 執行；不回填或誤改舊紀錄，既有列保持預設 `unknown`。

```sql
alter table public.dining_records
  add column if not exists settlement_status text not null default 'unknown';

alter table public.dining_records
  drop constraint if exists dining_records_settlement_status_check;

alter table public.dining_records
  add constraint dining_records_settlement_status_check
  check (
    settlement_status in (
      'unknown',
      'unsettled',
      'partial',
      'settled',
      'not_required'
    )
  );
```

## V4.0 Wallet Tables and Migration
完整可執行 SQL 位於 `supabase/migrations/20260922000000_v4_wallets.sql`。

`wallets`：`person text PK`、`balance numeric(14,2)`（**允許負數，沒有 nonnegative constraint**）、`updated_at timestamptz`。

`wallet_transactions`：identity `id`、時間、person、`type`、signed `amount`、`balance_after`、可選 dining record/transfer metadata、note、唯一 `reference_key`、可選 `reverses_transaction_id`。`dining_record_id` 使用現有 bigint PK；`transfer_index` 穩定識別當下 JSON array 項目。

V4.0 transfer：
`{"from":"A","to":"S","amount":200,"settled":true,"settled_at":"...","settlement_method":"wallet","wallet_transaction_id":123,"wallet_reference_key":"..."}`。未結清 method 為 null；cash 不含 wallet metadata；舊資料缺 method 保持不變。reversal 後增加 internal `wallet_cycle`，允許未來重新結清而不重用已消耗 reference。

### RLS / Grants
`wallets` 允許 anon/authenticated SELECT；`wallet_transactions` 僅 authenticated SELECT。無 client direct write grant；authenticated 只執行 `wallet_apply_change`、`settle_transfer_with_wallet`、`reverse_wallet_settlement`。
