ALTER TABLE public."Categories"
ALTER COLUMN "Description" SET DATA TYPE text;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'category_type') THEN
        CREATE TYPE category_type AS ENUM ('Electronics', 'Clothing', 'Groceries', 'Books', 'Furniture');
    END IF;
END;
$$;

ALTER TABLE public."Categories"
ADD COLUMN if not exists parent_category category_type;

-- Add new value to enum type
ALTER TYPE category_type ADD VALUE IF NOT EXISTS 'Stationery';

-- timestamp without time zone = timestamp
ALTER TABLE public."Categories"
ADD COLUMN if not exists created_on timestamp;

-- timestamp with time zone = timestamptz
ALTER TABLE public."Categories"
ADD COLUMN if not exists modified_on timestamptz;