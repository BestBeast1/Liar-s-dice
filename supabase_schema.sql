create table if not exists rooms (
  id text primary key,
  name text not null,
  host_id text not null,
  status text default 'waiting',
  players jsonb default '[]',
  last_bid jsonb default null,
  open_called boolean default false,
  open_called_by text default null,
  round int default 0,
  chat jsonb default '[]',
  created_at timestamptz default now()
);

alter table rooms enable row level security;
create policy "allow all" on rooms for all using (true) with check (true);
