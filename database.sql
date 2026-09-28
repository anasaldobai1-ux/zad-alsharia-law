-- شغّل هذا الملف في Supabase > SQL Editor
create extension if not exists pgcrypto;

create table if not exists public.categories (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  created_at timestamptz not null default now()
);

create table if not exists public.summaries (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text default '',
  content text default '',
  category_id uuid references public.categories(id) on delete restrict,
  file_url text,
  published boolean not null default true,
  created_at timestamptz not null default now()
);

alter table public.categories enable row level security;
alter table public.summaries enable row level security;

-- القراءة العامة
create policy "public read categories" on public.categories for select using (true);
create policy "public read published summaries" on public.summaries for select using (published = true);

-- الإدارة: أي مستخدم مسجل في Supabase Auth فقط
create policy "auth insert categories" on public.categories for insert to authenticated with check (true);
create policy "auth update categories" on public.categories for update to authenticated using (true) with check (true);
create policy "auth delete categories" on public.categories for delete to authenticated using (true);

create policy "auth insert summaries" on public.summaries for insert to authenticated with check (true);
create policy "auth update summaries" on public.summaries for update to authenticated using (true) with check (true);
create policy "auth delete summaries" on public.summaries for delete to authenticated using (true);

insert into public.categories(name) values ('الشريعة'),('القانون') on conflict (name) do nothing;

-- أنشئ Storage bucket باسم materials واجعله Public من لوحة Storage.
