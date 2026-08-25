alter table public.trade_posts add column if not exists game_nickname text;
alter table public.trade_posts add column if not exists game_server text;
create index if not exists trade_posts_game_identity_idx on public.trade_posts (lower(trim(game_server)),lower(trim(game_nickname)),lower(trim(game_id)));
create unique index if not exists trade_posts_active_identity_kind_uidx on public.trade_posts (lower(trim(game_server)),lower(trim(game_nickname)),lower(trim(game_id)),want_rarity) where completed_at is null and nullif(trim(game_server),'') is not null and nullif(trim(game_nickname),'') is not null and nullif(trim(game_id),'') is not null;
