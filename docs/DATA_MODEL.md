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
