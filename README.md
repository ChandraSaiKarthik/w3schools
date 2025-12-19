# W3Schools Database Scripts

This project provides scripts to set up the W3Schools sample database on Microsoft SQL Server (MSSQL) and PostgreSQL (pgsql).

## Overview

The repository contains SQL scripts organized by RDBMS to initialize the database, create the schema, and populate it with data.

## Project Structure

The project is structured as follows:

-   **`src/main/resources/database`**: Contains the core SQL scripts.
    -   **`mssql`**: Scripts for Microsoft SQL Server.
    -   **`pgsql`**: Scripts for PostgreSQL.

Each RDBMS directory is further organized into:
1.  **`0database`**: Scripts to create the database.
2.  **`1schema`**: Scripts to create tables and schema objects.
3.  **`2data`**: Scripts to populate the tables with data.

-   **Root Directory**:
    -   `w3schools_basedata.xlsx`: Source data file.
    -   `mssql - syncing data from w3schools_copy to w3schools.sql`: T-SQL script to sync data between MSSQL databases using `MERGE` statements.

## Usage

### Prerequisites
-   Microsoft SQL Server or PostgreSQL installed.
-   A database client (e.g., SSMS, DBeaver, pgAdmin).

### Installation

To set up the database, execute the scripts in the following order for your target RDBMS:

1.  Run the script in `0database` to create the database.
2.  Run the scripts in `1schema` to create the tables.
3.  Run the scripts in `2data` to populate the tables.

## Data Synchronization (MSSQL)

The script `mssql - syncing data from w3schools_copy to w3schools.sql` is provided to sync data from a `w3schools_copy` database to the main `w3schools` database. It handles dependencies by deleting from child tables first and inserting/updating parent tables first.
