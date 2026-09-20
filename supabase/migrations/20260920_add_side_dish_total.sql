alter table public.dining_records
  add column if not exists side_dish_total numeric not null default 0;

alter table public.dining_records
  drop constraint if exists dining_records_side_dish_total_nonnegative;

alter table public.dining_records
  add constraint dining_records_side_dish_total_nonnegative
  check (side_dish_total >= 0);
