# BOOK_SALE
An SQL project of BOOKS sale  with four tables of data 
# 📚 Book Sales Analysis using SQL

This project is a SQL-based analysis of a fictional online bookstore's sales data. The goal is to practice complex SQL queries using realistic datasets. It includes multi-table joins, aggregations, subqueries, CTEs, window functions, and ranking.

---

## 📁 Datasets

The project uses 4 CSV datasets:

- `customers.csv` – Customer information including ID, name, email, and country.
- `books.csv` – Book details including ID, title, author, price, and genre.
- `orders.csv` – Order records with order ID, customer ID, and date.
- `order_details.csv` – Line items for each order including book ID and quantity.

These datasets are connected through common keys:
- `customer_id` links customers and orders.
- `order_id` links orders and order_details.
- `book_id` links books and order_details.

---

## 🛠️ Tools Used

- **SQLite** (executed using DB Browser for SQLite)
- **SQL** (for all analysis)
- **Git/GitHub** (for version control and showcasing)

---

## 🎯 SQL Analysis Objectives

This project focuses on answering real-world business questions through SQL. Below are 15 SQL problems solved using the dataset:

---

## 📌 SQL Problems

1. **Find the total number of books sold.**  
   ➤ Output: `total_books_sold`

2. **Calculate the total revenue for each book.**  
   ➤ Output: `book_id`, `title`, `total_revenue`

3. **List the top 5 customers by total money spent.**  
   ➤ Output: `customer_id`, `name`, `total_spent`

4. **Identify the customer who ordered the most distinct book titles.**  
   ➤ Output: `customer_id`, `name`, `distinct_titles_ordered`

5. **Get the most frequently ordered book and how many times it was ordered.**  
   ➤ Output: `book_id`, `title`, `total_quantity`

6. **Show each customer and the list of book titles they ordered (comma-separated).**  
   ➤ Output: `customer_id`, `name`, `books_ordered` (via `GROUP_CONCAT`)

7. **For each book genre, find the total number of copies sold.**  
   ➤ Output: `genre`, `total_copies_sold`

8. **Get the revenue for each genre and rank them from highest to lowest.**  
   ➤ Output: `genre`, `total_revenue`, `genre_rank` (using `RANK()`)

9. **Calculate the percentage contribution of each book to total revenue.**  
   ➤ Output: `book_id`, `title`, `revenue`, `percent_contribution`

10. **Show the daily revenue and cumulative revenue over time.**  
   ➤ Output: `order_date`, `daily_revenue`, `cumulative_revenue`

11. **Display all orders along with the next order date by the same customer.**  
   ➤ Output: `customer_id`, `order_id`, `order_date`, `next_order_date` (using `LEAD()`)

12. **Display all orders with the revenue difference from the previous order date.**  
   ➤ Output: `order_date`, `daily_revenue`, `previous_day_revenue`, `revenue_diff` (using `LAG()`)

13. **For each customer, calculate the average number of books ordered per order.**  
   ➤ Output: `customer_id`, `name`, `average_books_per_order`

14. **Find all orders that contain more than 2 unique books.**  
   ➤ Output: `order_id`, `unique_books_count`

15. **Use a CTE to list each book along with its total quantity sold and overall rank.**  
   ➤ Output: `book_id`, `title`, `quantity_sold`, `rank`

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/book_sales_sql.git

   ## 🧠 Author

**Mushfiqe Alam Shafin**  
BBA in MIS | Aspiring Data Analyst  
[GitHub Profile](https://github.com/Mushfiqe-Alam-Shafin)

