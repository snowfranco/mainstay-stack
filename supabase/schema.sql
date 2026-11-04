-- Mainstay Stack · prototype database (Supabase)
-- Run this once in the SQL editor of project wzjgubcojszfnaxdntel.
-- One table: every finished run. The anon (publishable) key may insert and read; nothing else.

create table if not exists public.runs (
  id         bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  client_id  text not null,            -- random id per browser, so one phone's runs can be grouped
  player     text not null,            -- the name typed on the welcome screen
  cups       int  not null default 0,
  score      int  not null default 0,
  streak     int  not null default 0,
  passed     int  not null default 0,  -- players passed on the board during the run
  promo      text,                     -- pastry | matcha | plushie
  codes      text[] not null default '{}',  -- reward codes earned in the run
  week       text not null             -- Monday of the week, e.g. 2026-11-2 (matches the game's weekKey)
);

create index if not exists runs_week_cups on public.runs (week, cups desc);

alter table public.runs enable row level security;

drop policy if exists "anyone can add a run" on public.runs;
create policy "anyone can add a run" on public.runs
  for insert to anon with check (true);

drop policy if exists "anyone can read runs" on public.runs;
create policy "anyone can read runs" on public.runs
  for select to anon using (true);
