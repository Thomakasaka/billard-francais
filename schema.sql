-- À exécuter dans Supabase > SQL Editor > New query.
-- Les politiques RLS limitent chaque ligne à l’utilisateur connecté.
create table if not exists public.billard_games (
  owner_user_id uuid not null references auth.users(id) on delete cascade,
  id bigint not null,
  date date not null,
  r integer check (r is null or r > 0),
  r0 integer,
  r1 integer,
  pa integer not null check (pa >= 0),
  pb integer not null check (pb >= 0),
  s0 integer not null default 0 check (s0 >= 0),
  s1 integer not null default 0 check (s1 >= 0),
  max0 integer,
  max1 integer,
  note text not null default '',
  created_at timestamptz not null default now(),
  primary key (owner_user_id, id)
);

create table if not exists public.billard_settings (
  owner_user_id uuid not null references auth.users(id) on delete cascade,
  id smallint not null default 1 check (id = 1),
  names text[] not null default array['Moi','Papa']::text[],
  updated_at timestamptz not null default now(),
  primary key (owner_user_id, id)
);

alter table public.billard_games enable row level security;
alter table public.billard_settings enable row level security;

drop policy if exists "billard_games_select_own" on public.billard_games;
drop policy if exists "billard_games_insert_own" on public.billard_games;
drop policy if exists "billard_games_update_own" on public.billard_games;
drop policy if exists "billard_games_delete_own" on public.billard_games;
drop policy if exists "billard_settings_select_own" on public.billard_settings;
drop policy if exists "billard_settings_insert_own" on public.billard_settings;
drop policy if exists "billard_settings_update_own" on public.billard_settings;
drop policy if exists "billard_settings_delete_own" on public.billard_settings;

create policy "billard_games_select_own" on public.billard_games for select to authenticated using (owner_user_id = (select auth.uid()));
create policy "billard_games_insert_own" on public.billard_games for insert to authenticated with check (owner_user_id = (select auth.uid()));
create policy "billard_games_update_own" on public.billard_games for update to authenticated using (owner_user_id = (select auth.uid())) with check (owner_user_id = (select auth.uid()));
create policy "billard_games_delete_own" on public.billard_games for delete to authenticated using (owner_user_id = (select auth.uid()));

create policy "billard_settings_select_own" on public.billard_settings for select to authenticated using (owner_user_id = (select auth.uid()));
create policy "billard_settings_insert_own" on public.billard_settings for insert to authenticated with check (owner_user_id = (select auth.uid()));
create policy "billard_settings_update_own" on public.billard_settings for update to authenticated using (owner_user_id = (select auth.uid())) with check (owner_user_id = (select auth.uid()));
create policy "billard_settings_delete_own" on public.billard_settings for delete to authenticated using (owner_user_id = (select auth.uid()));

grant select, insert, update, delete on public.billard_games to authenticated;
grant select, insert, update, delete on public.billard_settings to authenticated;
