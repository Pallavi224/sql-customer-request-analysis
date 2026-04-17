# sql-customer-request-analysis
This repository contains a sanitized SQL query demonstrating how to retrieve the latest request per customer using window functions and conditional logic.  All table names, column names, and values have been modified to remove any sensitive or client-specific information.
# Sanitized SQL Reporting Example

## Overview

This repository contains a **sanitized SQL query** demonstrating how to retrieve the **latest request per customer** using window functions and conditional logic.

All table names, column names, and values have been modified to remove any sensitive or client-specific information.

---

## ✨ Key Concepts Demonstrated

* Use of `ROW_NUMBER()` for latest record selection
* Conditional data transformation using `CASE`
* Data comparison with `NVL`, `TRIM`, and `UPPER`
* Joining multiple tables for enriched reporting
* Parameterized filtering for flexible queries

---

## 🧠 Problem Statement

Retrieve the most recent request for each customer where:

* The request type matches a given parameter
* The request falls within a specific date range
* The status matches a required value
* The derived name differs from the current stored customer name

---

## 🛠️ Query Features

* Ensures only the **latest record per customer** is selected
* Handles **null and formatting inconsistencies**
* Demonstrates **real-world reporting logic** in a safe, reusable format

---

## 📂 Files

* `query.sql` → Main sanitized SQL query

---

## ⚠️ Disclaimer

This project is intended for **educational and demonstration purposes only**.

* No real client data is used
* Schema and logic have been generalized
* Any resemblance to real systems is purely coincidental

---

## 🚀 How to Use

1. Replace parameter values:

   * `:request_type_param`
   * `:start_date`
   * `:end_date`
   * `:status_param`

2. Adapt table and column names to match your database schema

3. Run in any SQL environment that supports window functions (Oracle, PostgreSQL, etc.)

---

## 📌 Notes

This example is useful for:

* SQL learners
* Data analysts
* Interview preparation
* Demonstrating real-world query patterns

---

## 👨‍💻 Author

Created as a sanitized example for safe public sharing on GitHub.

