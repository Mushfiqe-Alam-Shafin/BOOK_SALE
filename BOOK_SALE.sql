--Find the total number of books sold.

SELECT sum(quantity) as total_books_sold 
from order_details;

---Calculate the total revenue for each book.

SELECT od.book_id,b.title,sum(b.price*od.quantity) as total_revenue 
from order_details as od 
join books as b on b.book_id = od.book_id
group by od.book_id,b.title;


---List the top 5 customers by total money spent.

SELECT c.customer_id,c.name,sum(b.price*od.quantity) as total_money_spent 
from customers as c
join orders as o on o.customer_id=c.customer_id
join order_details as od on od.order_id= o.order_id
join books as b on b.book_id= od.book_id
group by  c.customer_id,c.name
order by total_money_spent desc 
limit 5;


---Identify the customer who ordered the most distinct book titles.

SELECT c.customer_id,c.name , count(distinct(b.title)) as  most_distinct_book_titles 
from customers as c
join  orders as o on o.customer_id=c.customer_id
join order_details as od on od.order_id= o.order_id
join books as b on b.book_id= od.book_id
group by  c.customer_id,c.name
order by  most_distinct_book_titles  DESC 
limit 1;



---Get the most frequently ordered book and how many times it was ordered.


SELECT b.book_id,b.title, count(od.book_id) as count_ordered 
from order_details as od
join books as b on b.book_id=od.book_id
group by b.book_id,b.title
order by count_ordered DESC
limit 1;


---Show each customer and the list of book titles they ordered (comma-separated).

SELECT c.customer_id,c.name,group_concat(distinct b.title 
order by b.title asc) as book_list 
from customers as c 
join  orders as o on o.customer_id=c.customer_id
join order_details as od on od.order_id= o.order_id
join books as b on b.book_id= od.book_id
group by c.customer_id,c.name;


---For each book genre, find the total number of copies sold.

SELECT b.genre,count(od.quantity) as total_sold 
from books as b 
join order_details as od on od.book_id=b.book_id
group by b.genre;


---Get the revenue for each genre and rank them from highest to lowest.

SELECT b.genre,sum(od.quantity * b.price) as total_revenue , 
rank() over(order by sum(od.quantity * b.price)  desc) as genre_rnk 
from books as b
join order_details as od on od.book_id= b.book_id
group by b.genre;

Calculate the percentage contribution of each book to total revenue.


SELECT b.book_id,b.title,sum(od.quantity*b.price) as revenue,
round(( sum(od.quantity*b.price) / (SELECT sum(od.quantity*b.price) 
from  books as b
join order_details as od on od.book_id= b.book_id) )*100,2) as percent_revenue from books as b
join order_details as od on od.book_id= b.book_id
group by b.book_id,b.title
order by percent_revenue desc;



---Show the daily revenue and cumulative revenue over time.


with temp_1 as (SELECT o.order_date,
sum(b.price*od.quantity) as total_revenue 
from orders as o 
join order_details as od on od.order_id=o.order_id 
join books as b on b.book_id = od.book_id
group by o.order_date)
SELECT order_date,total_revenue,sum(total_revenue) over(order by order_date) as cum_rev from temp_1 
group by order_date;

---Display all orders along with the next order date by the same customer.

SELECT customer_id,order_id,order_date,
lead(order_date) over(partition by customer_id order by order_date desc) as next_order_date 
from orders;

---Display all orders with the revenue difference from the previous order date.



with temp_1 as(SELECT o.order_date,sum(b.price*od.quantity) as daily_revenue 
from orders as o 
join order_details as od on od.order_id= o.order_id
join books as b on b.book_id = od.book_id
group by o.order_date)
SELECT order_date,daily_revenue,lag(daily_revenue) over(order by order_date) as prev_day_rev, 
(daily_revenue- lag(daily_revenue) over(order by order_date)) as rev_dif
from temp_1;

---For each customer, calculate the average number of books ordered per order.

SELECT c.customer_id,c.name,(sum(od.quantity)/ count(distinct od.order_id)) as avg_order
from customers as c 
join orders as o on o.customer_id=c.customer_id
join order_details as od on od.order_id= o.order_id
group by c.customer_id,c.name;





---Find all orders that contain more than 2 unique books.

SELECT * from 
(SELECT order_id,count(distinct book_id) as count_unique 
from order_details 
group by order_id) as t 
where count_unique>2 ;


---Use a CTE to list each book along with its total quantity sold and rank overall.


with temp_1 as (SELECT b.book_id,b.title,sum(od.quantity) as quantity_sold 
from books as b 
join order_details as od on od.book_id= b.book_id 
group by b.book_id,b.title)
SELECT book_id,title,quantity_sold,dense_rank() over(order by quantity_sold desc) as rnk 
from temp_1
group by book_id;



