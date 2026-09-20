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
| latitude | double precision |
| longitude | double precision |

## JSON
participants:
`["A","S","E"]`

owed:
`{"A":200,"S":150,"E":150}`

paid:
`{"A":500}` 或 `{"A":100,"S":200,"E":200}`

transfers:
`[{"from":"S","to":"A","amount":150}]`

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
