alter table public.trade_posts
  add column if not exists want_count integer not null default 1
  check (want_count between 1 and 99);
