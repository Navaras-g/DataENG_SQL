# 🏗️ Data Warehouse & Mart Build: Production ETL Pipeline

An end-to-end data engineering pipeline that transforms raw CSV files from Google Cloud Storage (GCS) into a normalized star schema data warehouse and analytical data marts.

---

## 🧾 Executive Summary

- **Pipeline Scope:** Built a complete ETL pipeline from raw GCS CSVs to a star schema warehouse and analytical marts using DuckDB.
- **Data Modeling:** Designed a star schema with fact, dimension, and bridge tables to handle one-to-many and many-to-many relationships.
- **ETL Development:** Implemented idempotent extract, transform, load (ETL) processes with data quality filtering and type safety.
- **Mart Architecture:** Created specialized data marts (flat, skills, priority) featuring additive measures and incremental update patterns.

---

## 🧩 Problem & Solution

**Context:** Raw job posting data arrives as flat, un-optimized CSV files in cloud storage, making complex analytical queries slow and costly. 

**Solution:** This pipeline builds a single source of truth data warehouse to enable consistent analysis, paired with specialized, pre-aggregated data marts to reduce query complexity and improve BI tool performance.

---

## 🧰 Tech Stack

- **Database:** DuckDB (OLAP database with GCS integration via `httpfs`)
- **Language:** SQL (DDL for schema design, DML for transformations)
- **Data Model:** Star schema (Fact + Dimension + Bridge tables)
- **Environment:** VS Code, DuckDB CLI, Git/GitHub
- **Storage:** Google Cloud Storage (GCS)