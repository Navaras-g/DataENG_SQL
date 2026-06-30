-- Step 1: DW - Create star schema tables
.read table_creation.sql

-- Step 2: DW - Load data from CSV files into star schema
.read load_schema.sql