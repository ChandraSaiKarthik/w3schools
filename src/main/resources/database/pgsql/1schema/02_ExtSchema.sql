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

alter table public.categories
add column if not exists created_on timestamp;

alter table public.categories
add column if not exists modified_on timestamptz;