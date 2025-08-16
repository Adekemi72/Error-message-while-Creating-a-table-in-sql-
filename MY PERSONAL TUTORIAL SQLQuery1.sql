create table salestable(
sale_id varchar,
product varchar,
region varchar,
order_date datetime,
quantity int,
unit_price int,
revenue int
);


alter table salestable
alter column product varchar (50);

alter table salestable
alter column sale_id varchar (10);

alter table salestable
alter column region varchar (25);

alter table salestable
alter column order_date date;

insert into salestable(sale_id, product, region, order_date, quantity, unit_price, revenue) values
('ab1', 'ball', 'east', 23-05-2024, 10, 100, 1000000),
('ab2', 'bag', 'west', 07-05-2023, 16, 125000, 2000000),
('ac4', 'Pencils', 'north', 02-09-2023, 20, 10000, 200000),
('ac2', 'Socks', 'south', 27-03-2024, 10, 5000, 50000),
('ac5', 'Dictionary', 'east', 15-04-2023, 16, 4000, 64000),
('ab7', 'Table', 'west', 01-08-2023, 100, 700, 70000),
('ab8', 'Chair', 'east', 05-02-2024, 20, 4000, 80000),
('ab5', 'Schoolbag', 'south', 07-08-2024, 70, 1300, 90000),
('ab6', 'Shoes', 'west', 15-02-2024, 50, 300, 15000),
('ac6', 'Book', 'north', 10-07-2023, 200, 500, 100000);

select * from salestable

----Discorvered that there is an error on the order date column

update salestable
set order_date =
case 
when sale_id  = 'ab1' then '2023-05-23'
when sale_id = 'ac4' then '2024-02-09'
when sale_id = 'ac2' then '2024-02-04'
when sale_id = 'ab2' then '2023-02-19'
when sale_id = 'ac5' then '2023-05-15'
when sale_id = 'ab7' then '2024-02-25'
when sale_id = 'ab8' then '2023-07-10'
when sale_id = 'ab5' then '2024-05-29'
when sale_id = 'ab6' then '2023-12-22'
when sale_id = 'ac6' then '2024-08-18'
else 'unkown'
End

select order_date, region, sale_id, product, quantity, unit_price, revenue from salestable union 


---MY QUESTIONS WITH THE ANSWERS
---1.	Show all sales where the region is east.

select * from salestable 
where region = 'east'


---2.	Show all sales in 2023 only.
select * from salestable where year (order_date) ='2023';

---3.	Show the total revenue per region
select region, sum(revenue)as Total_Revenue from salestable
group by region
order by Total_Revenue desc;

---4.	Show the total quantity sold per product.

select product, quantity as Total_Quantity  from salestable
order by Total_Quantity desc;

---5.	Show only the products that have sold more than 500 units in total.

select product, sum(unit_price) as total_unit from salestable
group by product
having sum(unit_price) > 500
order by total_unit desc;

---6.	From 2024 sales only, group by region and show total revenue.

select order_date, region, sum(revenue) as total_revenue from salestable
where YEAR(order_date) =2024
group by region, order_date
order by total_revenue desc;

---7.	From 2024 sales only, group by product and show only products with more than #100,000 revenue.

select order_date, product, sum(revenue) as Total_Revenue from salestable
where YEAR(order_date) = 2024
group by product, order_date
having sum(revenue) > 100000
order by Total_Revenue desc;

---8.	From all data, show the top 5 products by revenue.
select top 5 * from salestable
order by revenue desc;

---9.	Show the number of sales transactions per region

select region, count(revenue) as number_of_sales_transaction from salestable
group by region
order by number_of_sales_transaction desc

---10.	Show regions that had fewer than 100 transaction

---11.	Show products sold in the North region only, grouped by product, ordered by total quantity(largest first)
select product, sum(quantity) as total_quantity from salestable
where region = 'north'
group by product
order by total_quantity desc;

---12.	Show the average revenue per product.

select Product, avg(revenue) as average_revenue from salestable
group by product

---13.	Show only the products with an average revenue above 50000
select product, avg(revenue) as average_revenue from salestable
group by product
having avg(revenue) > 50000
order by average_revenue asc;

---14.	Show the total revenue per product in the south region only and only for 2023.
select product, sum(revenue) as total_revenue from salestable
where region = 'east' and year(order_date) = 2023
group by product
order by total_revenue desc;


---15.	Show the region with the highest total revenue in 2024.
select region, sum(revenue) as total_revenue from salestable
where region = 'south' and year(order_date) =2024
group by region
