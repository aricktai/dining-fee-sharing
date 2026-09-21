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
