-- À exécuter dans Supabase > SQL Editor pour une base déjà créée.
-- Autorise à laisser la meilleure série vide.
alter table public.billard_games alter column s0 drop not null;
alter table public.billard_games alter column s1 drop not null;
