-- Step 1: DW - Create star schema tables
.read table_creation.sql

-- Step 2: DW - Load data from CSV files into star schema
.read load_schema.sql

-- Step 3: Mart - Create flat mart (denormalized table)
.read create_flat_mart.sql

-- Step 4: Mart - Create skills demand mart
.read create_skills_mart.sql

-- Step 5: Mart - Create priority mart
.read create_priority_mart.sql

-- Step 6: Mart - Update priority mart
.read update_priority_mart.sql