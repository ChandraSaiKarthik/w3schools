-- Script		: xCleanup_DropAllObjects {pgsql server}
-- Drop all procedures
DO $$
DECLARE 
    i_schema_name VARCHAR(128);
    i_procedure_name VARCHAR(128);
    i_arg_types TEXT;
    SQLcmd TEXT;
BEGIN
    FOR i_schema_name, i_procedure_name, i_arg_types IN 
        SELECT n.nspname, p.proname, pg_catalog.pg_get_function_identity_arguments(p.oid)
        FROM pg_catalog.pg_proc p
        JOIN pg_catalog.pg_namespace n ON n.oid = p.pronamespace
        WHERE p.prokind = 'p'  -- 'p' for procedures
        AND n.nspname NOT IN ('pg_catalog', 'information_schema')
    LOOP
        SQLcmd := 'DROP PROCEDURE IF EXISTS ' || quote_ident(i_schema_name) || '.' || quote_ident(i_procedure_name) || '(' || i_arg_types || ') CASCADE';
        EXECUTE SQLcmd;
        RAISE NOTICE 'Dropped Procedure: %.%(%s)', i_schema_name, i_procedure_name, i_arg_types;
    END LOOP;
END $$;

-- Drop all functions
DO $$
DECLARE 
    i_schema_name VARCHAR(128); i_function_name VARCHAR(128); i_arg_types TEXT;
    SQLcmd TEXT;
BEGIN
    FOR i_schema_name, i_function_name, i_arg_types IN 
        SELECT n.nspname, p.proname, pg_catalog.pg_get_function_identity_arguments(p.oid)
        FROM pg_catalog.pg_proc p
        JOIN pg_catalog.pg_namespace n ON n.oid = p.pronamespace
        WHERE p.prokind = 'f'  -- 'f' for functions
        AND n.nspname NOT IN ('pg_catalog', 'information_schema', 'pgagent')
    LOOP
        SQLcmd := 'DROP FUNCTION IF EXISTS ' || quote_ident(i_schema_name) || '.' || quote_ident(i_function_name) || '(' || i_arg_types || ') CASCADE';
        EXECUTE SQLcmd;
        RAISE NOTICE 'Dropped Function: %.%(%s)', i_schema_name, i_function_name, i_arg_types;
    END LOOP;
END $$;

-- Drop all triggers
DO $$
DECLARE
    i_schema_name TEXT; i_table_name TEXT; i_trigger_name TEXT;
    SQLcmd TEXT;
BEGIN
    FOR i_trigger_name, i_table_name, i_schema_name IN 
        SELECT trigger_name, event_object_table, event_object_schema 
        FROM information_schema.triggers
        WHERE event_object_schema NOT IN ('pg_catalog', 'information_schema', 'pgagent')
    LOOP
        SQLcmd := 'DROP TRIGGER IF EXISTS ' || quote_ident(i_trigger_name) || ' ON ' || quote_ident(i_schema_name) || '.' || quote_ident(i_table_name);
        EXECUTE SQLcmd;
        RAISE NOTICE 'Dropped Trigger: %.%', i_schema_name, i_trigger_name;
    END LOOP;
END $$;

-- Drop all indexes (excluding primary keys and unique constraints)
DO $$
DECLARE
    i_schema_name TEXT; i_table_name TEXT; i_index_name TEXT;
    SQLcmd TEXT;
BEGIN
    FOR i_schema_name, i_table_name, i_index_name IN
        SELECT schemaname, tablename, indexname 
        FROM pg_indexes
        WHERE schemaname NOT IN ('pg_catalog', 'information_schema', 'pgagent')
        AND indexdef NOT LIKE 'CREATE UNIQUE%'
    LOOP
        SQLcmd := 'DROP INDEX IF EXISTS ' || quote_ident(i_schema_name) || '.' || quote_ident(i_index_name);
        EXECUTE SQLcmd;
        RAISE NOTICE 'Dropped Index: %.%', i_schema_name, i_index_name;
    END LOOP;
END $$;

-- Drop all views
DO $$
DECLARE
    i_schema_name TEXT; i_view_name TEXT;
    SQLcmd TEXT;
BEGIN
    FOR i_schema_name, i_view_name IN
        SELECT table_schema, table_name
        FROM information_schema.views
        WHERE table_schema NOT IN ('pg_catalog', 'information_schema')
    LOOP
        SQLcmd := 'DROP VIEW IF EXISTS ' || quote_ident(i_schema_name) || '.' || quote_ident(i_view_name) || ' CASCADE';
        EXECUTE SQLcmd;
        RAISE NOTICE 'Dropped View: %.%', i_schema_name, i_view_name;
    END LOOP;
END $$;


-- Drop all tables
DO $$
DECLARE
    i_schema_name TEXT; i_table_name TEXT;
    SQLcmd TEXT;
BEGIN
    FOR i_schema_name, i_table_name IN
        SELECT table_schema, table_name
        FROM information_schema.tables
        WHERE table_schema NOT IN ('pg_catalog', 'information_schema')
        AND table_type = 'BASE TABLE'
    LOOP
        SQLcmd := 'DROP TABLE IF EXISTS ' || quote_ident(i_schema_name) || '.' || quote_ident(i_table_name) || ' CASCADE';
        EXECUTE SQLcmd;
        RAISE NOTICE 'Dropped Table: %.%', i_schema_name, i_table_name;
    END LOOP;
END $$;

-- Drop all sequences
DO $$
DECLARE    
    i_schema_name TEXT; i_sequence_name TEXT;
    SQLcmd TEXT;
BEGIN
    FOR i_sequence_name, i_schema_name IN 
        SELECT sequence_name, sequence_schema 
        FROM information_schema.sequences
        WHERE sequence_schema NOT IN ('pg_catalog', 'information_schema')
    LOOP
        SQLcmd := 'DROP SEQUENCE IF EXISTS ' || quote_ident(i_schema_name) || '.' || quote_ident(i_sequence_name);
        EXECUTE SQLcmd;
        RAISE NOTICE 'Dropped Sequence: %.%', i_schema_name, i_sequence_name;
    END LOOP;
END $$;

-- Drop all schemas (except default ones)
DO $$
DECLARE
    i_schema_name TEXT;
    SQLcmd TEXT;
BEGIN
    FOR i_schema_name IN
        SELECT schema_name
        FROM information_schema.schemata
        WHERE schema_name NOT IN ('pg_catalog', 'information_schema', 'public', 'pg_toast')
    LOOP
        SQLcmd := 'DROP SCHEMA IF EXISTS ' || quote_ident(i_schema_name) || ' CASCADE';
        EXECUTE SQLcmd;
        RAISE NOTICE 'Dropped Schema: %', i_schema_name;
    END LOOP;
END $$;