
# E-Commerce Sales & Customer Analytics (SQL)

**Snapshot:** A ready-to-run MySQL dataset and SQL script modeling a simple e‑commerce system with recruiter-friendly analytical queries.

---

## 🔎 Project overview
This project demonstrates practical SQL skills by modeling an e‑commerce database and running simple, business-focused analyses. It's ideal for portfolio use and technical interviews because it shows database design, data seeding, and everyday analytical queries using `JOIN`, `GROUP BY`, `SUM`, `COUNT`, and `AVG`.

---

## 📁 What’s included
- `schema.sql` — Full MySQL script (create DB, create tables, seed data, compute totals, run basic analysis queries).
- `README.md` — This file.
- Optional: `screenshots/` (add images of query results or dashboards to improve recruiter visibility).

---

## 🗂 Database schema (brief)
- **Customers**: `customer_id, name, gender, age, city, signup_date`  
- **Products**: `product_id, category, sub_category, product_name, price`  
- **Orders**: `order_id, customer_id, order_date, order_status, payment_method`  
- **Order_Details**: `order_detail_id, order_id, product_id, quantity, discount, total_amount`  
- **Reviews**: `review_id, customer_id, product_id, rating, review_date, review_text`

Foreign keys enforce relationships (InnoDB engine).

---

## ▶️ How to run (quick)
1. Install MySQL (or use a hosted instance) and a client (MySQL Workbench, DBeaver, or CLI).  
2. Open the `schema.sql` file in your SQL client.  
3. Execute the script as a single batch (it drops and recreates the database).  
4. If you prefer step-by-step, run in this order:
   - `CREATE DATABASE` & `USE`
   - `CREATE TABLES`
   - `INSERT Customers`
   - `INSERT Products`
   - `INSERT Orders`
   - `INSERT Order_Details`
   - `UPDATE Order_Details` (computes totals)
   - `INSERT Reviews`
   - Run analysis queries at the end of the script

---

## ✅ Example queries included
- Total customers / products / orders / reviews  
- Total revenue (only completed orders)  
- Monthly revenue (`GROUP BY YEAR(order_date), MONTH(order_date)`)  
- Top 5 products by revenue  
- Average rating per product  
- Repeat customers (customers with >1 completed order)  
- Revenue by category

All queries use basic SQL constructs to keep results easy for recruiters to verify.

---

## 🛠 Suggested improvements (portfolio boosters)
- Add indexes and show query performance before/after.
- Create views like `monthly_sales` and `customer_lifetime_value`.
- Export query results to CSV and build a dashboard in Power BI / Tableau.
- Add a script (Python) to generate larger synthetic datasets for stress-testing.
- Convert script to PostgreSQL (replace `AUTO_INCREMENT` with `SERIAL`/`GENERATED`).

---

## 🧾 Troubleshooting
**Error 1452 (FK constraint):** Make sure you run `Orders` insert before `Order_Details`.  
If using the provided `schema.sql`, run it on a clean DB (script drops and recreates the DB). Diagnostics:
```sql
SELECT COUNT(*) AS orders_count, MAX(order_id) AS max_order_id FROM Orders;
SELECT DISTINCT order_id FROM Order_Details WHERE order_id NOT IN (SELECT order_id FROM Orders);
```

---

## 🎯 Tips for your GitHub repo
- Add 1–2 screenshots showing query outputs or a small dashboard.
- Add a short `notes.md` describing business insights from queries (e.g., best selling product, top city).
- Keep `schema.sql` as the single source of truth and reference it in README with sample commands.

---

## License
Use freely for learning, interviewing, or portfolio work. Add your name as the project author.

---

If you want, I can:
- attach this as a downloadable `README.md` file, or
- add badges (MySQL, dataset size), or
- generate a short `notes.md` with interpretation of the analysis results.
