alter table public.categories
alter column description set data type text;

do $$
begin
    if not exists (select 1 from pg_type where typname = 'category_type') then
        create type category_type as enum ('electronics', 'clothing', 'groceries', 'books', 'furniture');
    end if;
end;
$$;

alter table public.categories
    add column if not exists parent_category category_type;

-- add new value to enum type
alter type category_type add value if not exists 'stationery';


--BeginRegion: update delta_modified_dt
alter table public.orders
    add column if not exists delta_modified_dt timestamp not null default now();

alter table public.order_details
    add column if not exists delta_modified_dt timestamp not null default now();
--
create or replace function update_delta_modified_dt()
returns trigger as $$
begin
    new.delta_modified_dt := now();
    new.updated_at := now();
    new.updated_by := current_user;
    return new;
end;
$$ language plpgsql;
--
create or replace trigger trg_update_delta_modified_dt
before update on public.orders
for each row
execute function update_delta_modified_dt();

create or replace trigger trg_update_delta_modified_dt
before update on public.order_details
for each row
execute function update_delta_modified_dt();
--EndRegion: update delta_modified_dt