# Hospital Database: Advanced SQL Analytics with PostgreSQL

A hands on SQL project that turns hospital transaction records into operational insights. It uses a small hospital database in PostgreSQL to show four advanced techniques: window functions, joins, Common Table Expressions (CTEs) and subqueries.

Every example starts with a real hospital question, shows the query, and explains the expected result.

Read the full walkthrough on DEV: [Advanced SQL Analytics for Data Analysis](https://dev.to/makorinyachaki/advanced-sql-analytics-for-data-analysis-4n3m)

## The Database

The schema models a hospital with seven tables:

* `patients`
* `doctors`
* `department`
* `wards`
* `diagnosis`
* `procedures`
* `visits` (the fact table, linking everything together)

The `visits` table holds 30 visits from 1 to 15 June 2026, including admission type, triage level, insurance provider, total bill in KES and patient satisfaction score.

## Getting Started

1. Connect to your PostgreSQL database and create the schema:

   ```sql
   create schema hospital;
   ```

2. Check your current schema:

   ```sql
   show search_path;
   ```

3. If needed, switch to the `hospital` schema:

   ```sql
   set search_path to hospital;
   ```

4. Run the table creation and data insert scripts from the article, then start exploring the queries.

## What You Will Learn

### 1. Window Functions

Compute across related rows while keeping each row intact.

* `OVER`, `PARTITION BY`, `ORDER BY` and window frames
* Ranking: `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `NTILE`
* Navigation: `LAG`, `LEAD`, `FIRST_VALUE`, `LAST_VALUE`
* Aggregates: `SUM`, `AVG`, `COUNT`, `MIN`, `MAX` for running totals and moving averages

### 2. Joins

* `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`, `CROSS JOIN` and `SELF JOIN`
* Examples include visit reports, patient spending, ward coverage, doctor and ward pairings, and spotting patient readmissions

### 3. Common Table Expressions

* Simple CTEs, multiple chained CTEs and recursive CTEs
* Examples include finding costly visits, comparing department revenue with the average, and building a biweekly follow up schedule
* A short comparison of CTEs and subqueries

### 4. Subqueries

* Scalar, non-correlated, correlated and nested subqueries
* Used in `SELECT`, `FROM` and `WHERE` clauses, with `EXISTS` and `ALL`
* Examples include showing each bill beside the hospital average, finding visits above their department average, and listing doctors who admitted inpatients

## Example Questions Answered

* How can management rank inpatient visits by total bill?
* How do we track a patient's billing across several visits?
* Which departments earn above the average revenue?
* How can we keep every ward visible in admission records?
* Which visits cost more than every outpatient bill?

## Tech Used

* PostgreSQL
* SQL

## Author

Makori Nyachaki. Find more on [DEV Community](https://dev.to/makorinyachaki).

## Conclusion

Window functions, joins, CTEs and subqueries help healthcare teams review operations, improve financial efficiency and support better patient care.
