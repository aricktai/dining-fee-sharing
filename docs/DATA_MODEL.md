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

## RLS Intent
anon：
- SELECT today
- INSERT today

authenticated：
- SELECT all
- INSERT / UPDATE / DELETE

前端禁止 service_role key。
