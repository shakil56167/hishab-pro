create extension if not exists pgcrypto;

create table if not exists public.transactions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  type text not null check (type in ('income', 'expense')),
  amount numeric(12,2) not null check (amount >= 0),
  category text not null,
  description text not null,
  tx_date date not null,
  created_at timestamptz not null default now()
);

create table if not exists public.notes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  content text not null,
  created_at timestamptz not null default now()
);

create table if not exists public.budgets (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  month text not null,
  amount numeric(12,2) not null check (amount >= 0),
  created_at timestamptz not null default now(),
  unique(user_id, month)
);

alter table public.transactions enable row level security;
alter table public.notes enable row level security;
alter table public.budgets enable row level security;

drop policy if exists "Users can view own transactions" on public.transactions;
drop policy if exists "Users can insert own transactions" on public.transactions;
drop policy if exists "Users can update own transactions" on public.transactions;
drop policy if exists "Users can delete own transactions" on public.transactions;

create policy "Users can view own transactions"
on public.transactions
for select
to authenticated
using (auth.uid() = user_id);

create policy "Users can insert own transactions"
on public.transactions
for insert
to authenticated
with check (auth.uid() = user_id);

create policy "Users can update own transactions"
on public.transactions
for update
to authenticated
using (auth.uid() = user_id);

create policy "Users can delete own transactions"
on public.transactions
for delete
to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users can view own notes" on public.notes;
drop policy if exists "Users can insert own notes" on public.notes;
drop policy if exists "Users can delete own notes" on public.notes;

create policy "Users can view own notes"
on public.notes
for select
to authenticated
using (auth.uid() = user_id);

create policy "Users can insert own notes"
on public.notes
for insert
to authenticated
with check (auth.uid() = user_id);

create policy "Users can delete own notes"
on public.notes
for delete
to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users can view own budgets" on public.budgets;
drop policy if exists "Users can insert own budgets" on public.budgets;
drop policy if exists "Users can update own budgets" on public.budgets;
drop policy if exists "Users can delete own budgets" on public.budgets;

create policy "Users can view own budgets"
on public.budgets
for select
to authenticated
using (auth.uid() = user_id);

create policy "Users can insert own budgets"
on public.budgets
for insert
to authenticated
with check (auth.uid() = user_id);

create policy "Users can update own budgets"
on public.budgets
for update
to authenticated
using (auth.uid() = user_id);

create policy "Users can delete own budgets"
on public.budgets
for delete
to authenticated
using (auth.uid() = user_id);